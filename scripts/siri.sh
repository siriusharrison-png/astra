#!/usr/bin/env bash
# siri.sh — Claude 侧飞书触发脚本，跨项目可调用
#
# 用途：读写共享任务台账（飞书多维表格）、发消息触发 Siri。
# 凭证独立存放于 ~/.config/siri/.env（不在任何 git 仓库内），与本脚本(可跨设备同步)分离。
#
# 用法：
#   siri.sh token                                    获取 access token（内部用，一般不单独调）
#   siri.sh list [page_size]                          列出台账记录（默认 20 条）
#   siri.sh archive <需求名> [字段=值 ...]             新增一条归档记录
#   siri.sh update <record_id> <字段=值 ...>           更新已有记录
#   siri.sh delete <record_id>                        删除记录（谨慎使用）
#   siri.sh fields                                    查看表格字段结构
#   siri.sh chats                                     列出机器人可见的群（用于查 chat_id）
#   siri.sh send <chat_id> <文本>                      发一条文本消息到指定群/人
#
# 字段=值 示例（archive/update 共用）：
#   来源=主动发起  Linear issue=https://...  Figma=https://...  PR=https://...
#   代码分支=feat/xxx  Vercel=https://...  状态=需求澄清  优先级=高  设计文档=https://...
#
# 支持的单选字段与合法取值（写入前请遵守，否则飞书会报错）：
#   来源：产品PRD / 主动发起 / issue / 群消息
#   状态：需求澄清 / 立项评审 / 设计 / 设计评审 / 待验收 / 完成
#   优先级：高 / 中 / 低

set -euo pipefail

ENV_FILE="${SIRI_ENV_FILE:-$HOME/.config/siri/.env}"

if [ ! -f "$ENV_FILE" ]; then
  echo "错误：找不到凭证文件 $ENV_FILE" >&2
  echo "请先按 spec 第 9 节配置好凭证。" >&2
  exit 1
fi

set -a
# shellcheck disable=SC1090
source "$ENV_FILE"
set +a

: "${FEISHU_CLAUDE_APP_ID:?缺少 FEISHU_CLAUDE_APP_ID}"
: "${FEISHU_CLAUDE_APP_SECRET:?缺少 FEISHU_CLAUDE_APP_SECRET}"
: "${FEISHU_BITABLE_APP_TOKEN:?缺少 FEISHU_BITABLE_APP_TOKEN}"
: "${FEISHU_BITABLE_TABLE_ID:?缺少 FEISHU_BITABLE_TABLE_ID}"

BASE="https://open.feishu.cn/open-apis"

get_token() {
  local resp code token
  resp=$(curl -s -X POST "$BASE/auth/v3/tenant_access_token/internal" \
    -H "Content-Type: application/json" \
    -d "{\"app_id\":\"${FEISHU_CLAUDE_APP_ID}\",\"app_secret\":\"${FEISHU_CLAUDE_APP_SECRET}\"}")
  code=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin).get('code','?'))" 2>/dev/null || echo "?")
  if [ "$code" != "0" ]; then
    echo "获取 token 失败: $resp" >&2
    exit 1
  fi
  token=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin)['tenant_access_token'])")
  echo "$token"
}

# 链接类型字段（type=15），飞书要求写入 {"link":..,"text":..} 对象而非纯字符串
LINK_FIELDS="Linear issue,Figma,PR,Vercel,设计文档"

# 将 "字段=值" 形式的参数数组转换为 JSON fields 对象
# 链接类字段自动包成 {"link": v, "text": v}；其余字段原样写入字符串
build_fields_json() {
  python3 -c "
import json, sys
link_fields = set('$LINK_FIELDS'.split(','))
fields = {}
for arg in sys.argv[1:]:
    if '=' not in arg:
        continue
    k, v = arg.split('=', 1)
    if k in link_fields:
        fields[k] = {'link': v, 'text': v}
    else:
        fields[k] = v
print(json.dumps(fields, ensure_ascii=False))
" "$@"
}

cmd_token() {
  get_token
}

cmd_fields() {
  local token
  token=$(get_token)
  curl -s -X GET "$BASE/bitable/v1/apps/${FEISHU_BITABLE_APP_TOKEN}/tables/${FEISHU_BITABLE_TABLE_ID}/fields" \
    -H "Authorization: Bearer ${token}" | python3 -c "
import json, sys
d = json.load(sys.stdin)
for f in d.get('data', {}).get('items', []):
    line = f\"{f['field_name']} (type={f['type']}, id={f['field_id']})\"
    if f['type'] == 3:
        opts = [o['name'] for o in f.get('property', {}).get('options', [])]
        line += f' 选项={opts}'
    print(line)
"
}

cmd_list() {
  local page_size="${1:-20}"
  local token
  token=$(get_token)
  curl -s -X GET "$BASE/bitable/v1/apps/${FEISHU_BITABLE_APP_TOKEN}/tables/${FEISHU_BITABLE_TABLE_ID}/records?page_size=${page_size}" \
    -H "Authorization: Bearer ${token}" | python3 -c "
import json, sys
d = json.load(sys.stdin)
if d.get('code') != 0:
    print('查询失败:', d.get('msg'), file=sys.stderr)
    sys.exit(1)
items = d.get('data', {}).get('items', [])
print(f\"共 {len(items)} 条记录\")
for r in items:
    f = r.get('fields', {})
    name = f.get('需求名', '(无标题)')
    status = f.get('状态', '?')
    print(f\"  [{r['record_id']}] {name} — {status}\")
"
}

cmd_archive() {
  local name="$1"; shift
  local token fields_json body resp code
  token=$(get_token)
  fields_json=$(build_fields_json "$@")
  body=$(python3 -c "
import json, sys
extra = json.loads(sys.argv[1])
fields = {'需求名': sys.argv[2]}
fields.update(extra)
print(json.dumps({'fields': fields}, ensure_ascii=False))
" "$fields_json" "$name")

  resp=$(curl -s -X POST "$BASE/bitable/v1/apps/${FEISHU_BITABLE_APP_TOKEN}/tables/${FEISHU_BITABLE_TABLE_ID}/records" \
    -H "Authorization: Bearer ${token}" \
    -H "Content-Type: application/json" \
    -d "$body")
  code=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin).get('code','?'))" 2>/dev/null || echo "?")
  if [ "$code" != "0" ]; then
    echo "归档失败: $resp" >&2
    exit 1
  fi
  echo "$resp" | python3 -c "
import json, sys
d = json.load(sys.stdin)
r = d['data']['record']
print(f\"✓ 归档成功: {r['record_id']}\")
print(json.dumps(r['fields'], ensure_ascii=False, indent=2))
"
}

cmd_update() {
  local record_id="$1"; shift
  local token fields_json body resp code
  token=$(get_token)
  fields_json=$(build_fields_json "$@")
  body=$(python3 -c "
import json, sys
fields = json.loads(sys.argv[1])
print(json.dumps({'fields': fields}, ensure_ascii=False))
" "$fields_json")

  resp=$(curl -s -X PUT "$BASE/bitable/v1/apps/${FEISHU_BITABLE_APP_TOKEN}/tables/${FEISHU_BITABLE_TABLE_ID}/records/${record_id}" \
    -H "Authorization: Bearer ${token}" \
    -H "Content-Type: application/json" \
    -d "$body")
  code=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin).get('code','?'))" 2>/dev/null || echo "?")
  if [ "$code" != "0" ]; then
    echo "更新失败: $resp" >&2
    exit 1
  fi
  echo "✓ 更新成功: $record_id"
}

cmd_delete() {
  local record_id="$1"
  local token resp code
  token=$(get_token)
  resp=$(curl -s -X DELETE "$BASE/bitable/v1/apps/${FEISHU_BITABLE_APP_TOKEN}/tables/${FEISHU_BITABLE_TABLE_ID}/records/${record_id}" \
    -H "Authorization: Bearer ${token}")
  code=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin).get('code','?'))" 2>/dev/null || echo "?")
  if [ "$code" != "0" ]; then
    echo "删除失败: $resp" >&2
    exit 1
  fi
  echo "✓ 已删除: $record_id"
}

cmd_chats() {
  local token
  token=$(get_token)
  curl -s -X GET "$BASE/im/v1/chats?page_size=20" \
    -H "Authorization: Bearer ${token}" | python3 -c "
import json, sys
d = json.load(sys.stdin)
if d.get('code') != 0:
    print('查询失败:', d.get('msg'), file=sys.stderr)
    sys.exit(1)
for c in d.get('data', {}).get('items', []):
    print(f\"{c['chat_id']}  {c.get('name','(无名)')}\")
"
}

cmd_send() {
  local chat_id="$1" text="$2"
  local token body resp code
  token=$(get_token)
  body=$(python3 -c "
import json, sys
content = json.dumps({'text': sys.argv[1]}, ensure_ascii=False)
print(json.dumps({'receive_id': sys.argv[2], 'msg_type': 'text', 'content': content}, ensure_ascii=False))
" "$text" "$chat_id")

  resp=$(curl -s -X POST "$BASE/im/v1/messages?receive_id_type=chat_id" \
    -H "Authorization: Bearer ${token}" \
    -H "Content-Type: application/json" \
    -d "$body")
  code=$(echo "$resp" | python3 -c "import json,sys;print(json.load(sys.stdin).get('code','?'))" 2>/dev/null || echo "?")
  if [ "$code" != "0" ]; then
    echo "发送失败: $resp" >&2
    exit 1
  fi
  echo "✓ 已发送到 $chat_id"
}

main() {
  local cmd="${1:-}"
  [ -n "$cmd" ] && shift || true
  case "$cmd" in
    token)   cmd_token "$@" ;;
    fields)  cmd_fields "$@" ;;
    list)    cmd_list "$@" ;;
    archive) cmd_archive "$@" ;;
    update)  cmd_update "$@" ;;
    delete)  cmd_delete "$@" ;;
    chats)   cmd_chats "$@" ;;
    send)    cmd_send "$@" ;;
    *)
      echo "用法: siri.sh <token|fields|list|archive|update|delete|chats|send> [参数...]" >&2
      exit 1
      ;;
  esac
}

main "$@"
