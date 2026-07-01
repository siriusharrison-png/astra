# Astra Installation

## What You Install

Astra is installed as a local git clone.

The clone is the working copy that your agent reads during tasks.

## Installation Model

### For developers

Maintain the canonical Astra repository.

### For users

Clone the repository locally and point your agent config at the clone path.

## Quickstart

Preferred one-line install command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/siriusharrison-png/astra/main/scripts/install.sh)
```

```bash
git clone <astra-repo-url> ~/astra
cd ~/astra
bash scripts/sync.sh
```

If you prefer a single setup command:

```bash
bash scripts/bootstrap.sh --repo <astra-repo-url> --target ~/astra
```

## Update

Before starting a session, sync Astra:

```bash
bash scripts/sync.sh
```

## Convergence

After finishing a task, record reusable lessons:

```bash
bash scripts/converge.sh \
  --layer evolving \
  --title "path selection clarified" \
  --source "task review" \
  --action "add" \
  --file "/Users/ppio-dn-275/Desktop/astra/memory.md" \
  --summary "Use the judgment path when the goal is already framed."
```

## Agent Connection

Point the agent to the local clone path.

Do not point agents at the remote repository URL directly.

### Example: Codex

Add the Astra path to your global or project agent instructions:

```text
Astra path: /Users/your-name/astra/README.md
```

### Example: Claude Code

Add the Astra path to your Claude instructions file:

```text
Load Astra first:
- /Users/your-name/astra/README.md
- /Users/your-name/astra/principles.md
- /Users/your-name/astra/standards.md
- /Users/your-name/astra/patterns.md
- /Users/your-name/astra/workflow.md
- /Users/your-name/astra/memory.md
- /Users/your-name/astra/convergence.md
- /Users/your-name/astra/templates.md
```

## Rules

- Sync before work
- Converge after work
- Keep English as the first language
- Write reusable lessons to `CHANGELOG.md`
