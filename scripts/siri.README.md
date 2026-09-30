# siri.sh — Siri 共享表格触发脚本

Claude 侧读写共享任务台账（飞书多维表格）、发消息触发 Siri 的可复用脚本。任意项目里的 Claude 会话都能调用。

**设计文档**：`~/Desktop/SIRIUS-ATEAM/docs/superpowers/specs/2026-09-29-siri-design-delivery-workflow-design.md`

## 凭证

存于 `~/.config/siri/.env`（本机专属路径，不在任何 git 仓库内，权限 600）。字段：

```
FEISHU_CLAUDE_APP_ID=
FEISHU_CLAUDE_APP_SECRET=
FEISHU_BITABLE_APP_TOKEN=
FEISHU_BITABLE_TABLE_ID=
FEISHU_CHAT_HAMSTER_WHEEL=   # 转转的个人群"仓鼠跑轮"，仅用于验收类推送
```

## 用法

```bash
~/Desktop/astra/scripts/siri.sh <子命令> [参数...]
```

| 子命令 | 参数 | 说明 |
|---|---|---|
| `fields` | — | 查看表格字段结构与单选选项 |
| `list` | `[page_size]` | 列出台账记录（默认20条） |
| `archive` | `<需求名> [字段=值 ...]` | 新增一条归档记录 |
| `update` | `<record_id> <字段=值 ...>` | 更新已有记录 |
| `delete` | `<record_id>` | 删除记录（谨慎） |
| `chats` | — | 列出机器人可见的群，查 chat_id |
| `send` | `<chat_id> <文本>` | 发文本消息到指定群/人 |
| `token` | — | 仅获取 access token（调试用） |

### 字段=值 写法

```bash
siri.sh archive "价格改造" 来源=主动发起 PR=https://github.com/... 状态=需求澄清
```

**单选字段合法取值**（写别的值飞书会报错）：
- 来源：`产品PRD` / `主动发起` / `issue` / `群消息`
- 状态：`需求澄清` / `立项评审` / `设计` / `设计评审` / `待验收` / `完成`
- 优先级：`高` / `中` / `低`

**链接字段**（`Linear issue` `Figma` `PR` `Vercel` `设计文档`）：直接传纯 URL 字符串即可，脚本会自动转换成飞书要求的 `{"link":..,"text":..}` 格式，调用者不用关心这个细节。

## 已知踩坑

- 飞书链接类型字段（type=15）**不能直接写字符串**，必须是 `{"link": v, "text": v}` 对象，否则报 `URLFieldConvFail`。脚本已在 `build_fields_json` 里自动处理。
- 多维表格权限有两层：① 应用的 API scope（`bitable:app` 等，在开发者后台权限管理里申请+发布）；② 表格本身要把这个应用**添加为协作者**（在表格分享设置里）。两者缺一都会报 403/权限错误，且报错信息不总能一眼看出是哪一层。
- `send` 发消息前务必确认 chat_id 对应的群是不是你想要的——发错群是真实副作用，不可静默撤回（消息可以手动删，但对方已经看到推送）。

## 验证记录（2026-09-30）

`token` `fields` `list` `archive` `update` `delete` `chats` `send` 全部实测通过。
