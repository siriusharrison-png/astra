# 在你的项目中使用 /astra-quickstart 指令

## 快速安装（1 分钟）

### 方式 A：添加到项目 CLAUDE.md（推荐）

在你的项目根目录的 `CLAUDE.md` 中添加这一行：

```markdown
## Astra Quick Commands

- `/astra-quickstart` — Load Astra fast guidance

Skill path: /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md
```

### 方式 B：创建项目级 .claude/settings.json

在你的项目目录创建 `.claude/settings.json`：

```json
{
  "skills": [
    {
      "name": "astra-quickstart",
      "description": "Astra fast guidance — templates, decision trees, checklists",
      "path": "/Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md"
    }
  ]
}
```

### 方式 C：全局 Skill 安装

```bash
# 创建全局 skills 目录（如果不存在）
mkdir -p ~/.claude/skills

# 复制 astra-quickstart skill
cp /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md ~/.claude/skills/astra-quickstart.md

# 现在在任何项目中都可以用：
/astra-quickstart
```

## 使用方式

### 在 Claude Code 中
```
/astra-quickstart
```

会显示：
- 快速情境地图
- 路径决策树
- 所有模板
- 质量维度
- 常见错误修复

### 选择一个部分
```
我需要框架化这个任务

/astra-quickstart
# 然后复制"任务框架模板"部分
```

## 完整的指令生态（推荐配置）

如果你想要更细粒度的指令，创建 `~/.claude/skills/` 下的这些文件：

### 1. astra-quickstart.md（已有）
全功能快速指令

### 2. astra-frame.md
```markdown
---
name: astra-frame
description: Frame your task in 3 minutes — what, known, unknown, path, success
---

## Frame This Task

Quick fill-in template:

**What:** [One sentence]
**Known:** [3-5 things that are certain]
**Unknown:** [2-3 things uncertain]
**Path:** [Exploratory|Judgment|Execution|Hybrid]
**Success:** [What done looks like]

Then choose path using: /astra-path
```

### 3. astra-path.md
```markdown
---
name: astra-path
description: Choose your path in 2 minutes — Exploratory/Judgment/Execution/Hybrid
---

## Path Decision Tree

Q1: Is the goal clear?
├─ NO → Q2
└─ YES → Q3

Q2: Explore broadly or narrowly?
├─ Broadly → EXPLORATORY
└─ Narrowly → HYBRID

Q3: Is approach decided?
├─ NO → JUDGMENT
└─ YES → EXECUTION
```

### 4. astra-decide.md
```markdown
---
name: astra-decide
description: Decide between options — structure the choice in 3 minutes
---

## Decision Template

Question: [What am I choosing?]

Options:
1. [Option A]
   - Pros: [benefits]
   - Cons: [costs]

2. [Option B]
   - Pros: [benefits]
   - Cons: [costs]

Decision Criteria:
- [Most important]
- [Second most important]

Choice: [Which, why]
```

### 5. astra-converge.md
```markdown
---
name: astra-converge
description: Capture learnings after task — 5 minutes to record what matters
---

## Convergence Template

Task: [What did you build/decide?]

What Worked: [What was effective]
What Didn't: [What failed]

Reusable Insight: [One sentence for future work]

Confidence: [Low|Medium|High]

Belongs in Astra? [yes/no]
```

## 现在可以用什么

**立即可用（无需安装）：**
```
/astra-quickstart
```

**安装后可用（全局）：**
```
/astra-quickstart  # 全部指令
/astra-frame       # 只框架化
/astra-path        # 只选路径
/astra-decide      # 只决策
/astra-converge    # 只收敛
```

## 最简单的开始方式

```bash
# 复制一行到 ~/.claude/skills/
mkdir -p ~/.claude/skills
cp /Users/ppio-dn-275/Desktop/astra/skills/astra-quickstart.md ~/.claude/skills/

# 在任何项目中
/astra-quickstart
```

**完成。30 秒搞定。**

