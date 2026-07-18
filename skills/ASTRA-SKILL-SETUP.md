# Astra Quickstart Skill Configuration

这个文件解释如何在不同系统中注册 `/astra-quickstart` 指令。

## 方式 1：在 Claude Code 中注册（推荐）

### 路径 1a：作为本地 Skill
复制到你的 Claude Code skills 目录：
```bash
cp /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md \
   ~/.claude/skills/astra-quickstart.md
```

然后在任何项目中：
```
/astra-quickstart
```

### 路径 1b：作为 MCP Resource
在你的 `.claude/config.json` 或 `settings.json` 中添加：

```json
{
  "mcp_servers": {
    "astra": {
      "command": "echo",
      "args": ["/Users/ppio-dn-275/Desktop/astra"]
    }
  },
  "skills": {
    "astra-quickstart": {
      "resource": "astra://skills/astra-quickstart.md"
    }
  }
}
```

## 方式 2：在项目中集成

### 在项目的 CLAUDE.md 中
```markdown
## Quick Commands

Use these Astra quick commands:

- `/astra-quickstart` — Fast guidance (templates, decision trees, checklists)
- `/astra-frame` — Frame a task (10 questions)
- `/astra-decide` — Help me decide between options
- `/astra-converge` — Capture learnings after task

Load: /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
```

### 在项目的 .claude/settings.json 中
```json
{
  "mcp_servers": {
    "astra": {
      "command": "cat",
      "args": ["/Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md"]
    }
  }
}
```

## 方式 3：在命令行中快速使用

### 创建别名
```bash
# 在你的 ~/.zshrc 或 ~/.bashrc 中添加
alias astra="echo 'Load: /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md' && cat /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md"
```

然后：
```bash
astra  # 显示完整指令
```

## 方式 4：创建 Shell Script 快速访问

创建 `/usr/local/bin/astra-quick` (需要 chmod +x)：

```bash
#!/bin/bash
# Quick access to Astra guidance

case "$1" in
  frame)
    echo "=== Task Frame Template ==="
    grep -A 10 "Task Frame Template" /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
    ;;
  decide)
    echo "=== Decision Template ==="
    grep -A 10 "Decision Template" /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
    ;;
  path)
    echo "=== Path Decision Tree ==="
    grep -A 10 "Path Decision Tree" /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
    ;;
  *)
    echo "Usage: astra-quick [frame|decide|path]"
    ;;
esac
```

## 方式 5：在 VS Code 中集成

在 VS Code Claude extension settings 中配置：

```json
{
  "claude.skills": [
    {
      "name": "astra-quickstart",
      "description": "Fast Astra guidance",
      "path": "/Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md",
      "trigger": "/astra"
    }
  ]
}
```

---

## 快速使用

### 立即使用（无需配置）
```bash
# 方式 A：加载完整 QUICKSTART
Load /Users/ppio-dn-275/Desktop/astra/QUICKSTART.md

# 方式 B：加载 Skill 版本
Load /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
```

### 配置后使用
```bash
# 如果已注册为 Skill
/astra-quickstart

# 选择你需要的部分：
- Path Decision Tree
- Task Frame Template
- Decision Template
- Handoff Checklist
- Reference Analysis
- Convergence Template
- Quality Dimensions
- Common Mistakes
```

---

## 建议的安装步骤

### 第 1 步：注册 Skill（一次性）
```bash
# 复制到 Claude Code 的 skills 目录
mkdir -p ~/.claude/skills
cp /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md ~/.claude/skills/
```

### 第 2 步：在项目中使用
在任何项目中：
```
/astra-quickstart
```

### 第 3 步（可选）：加入 CLAUDE.md
在项目的 CLAUDE.md 中添加：
```markdown
## Astra Guidance

Quick commands:
- `/astra-quickstart` — Fast templates and decision trees
```

---

## 验证安装

### 检查文件是否存在
```bash
ls -la /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
```

### 检查内容是否可读
```bash
cat /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md | head -20
```

### 在 Claude Code 中测试
```
/astra-quickstart
```

如果显示快速指令内容，说明配置成功。

---

## 完整的指令生态

建议创建这些额外的指令（未来工作）：

| 指令 | 用途 | 时间 |
|------|------|------|
| `/astra-quickstart` | 所有快速指令（当前）| 5 min |
| `/astra-frame` | 只框架化任务 | 3 min |
| `/astra-decide` | 只帮助决策 | 3 min |
| `/astra-converge` | 只捕捉学习 | 5 min |
| `/astra-path` | 只选择路径 | 2 min |
| `/astra-handoff` | 只交接检查 | 5 min |

---

## 现在开始

**最快方式：**
```bash
# 1. 复制 Skill
mkdir -p ~/.claude/skills
cp /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md ~/.claude/skills/

# 2. 在任何项目中使用
/astra-quickstart

# 3. 选择你需要的模板
```

**30 秒即可开始。**

