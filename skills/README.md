# Astra Skill — Install `/astra`

`/astra` gives fast Astra guidance (templates, decision trees, checklists) in any project, without loading the full docs.

The skill source lives in this repo at `skills/astra/SKILL.md`.

## Install (Claude Code)

Claude Code discovers skills as **directories** under `~/.claude/skills/`, each
containing a `SKILL.md`. A flat `astra.md` file is NOT recognized — the directory
form is required.

```bash
mkdir -p ~/.claude/skills/astra
cp ~/astra/skills/astra/SKILL.md ~/.claude/skills/astra/SKILL.md
```

Then start a **new** Claude Code session (skills load at session start) and run:

```
/astra
```

If it prints the quick reference, it works.

## Keep it in sync

The copy under `~/.claude/skills/astra/` is a snapshot. When the source in this
repo changes, re-copy:

```bash
cp ~/astra/skills/astra/SKILL.md ~/.claude/skills/astra/SKILL.md
```

## Notes

- `~/astra` is a symlink to the real repo (`~/Desktop/astra` on the maintainer's
  machine). On a fresh clone, point it at wherever you cloned Astra.
- The full reference (not the skill) is `QUICKSTART.md` and `README.md` at the
  repo root — load those directly when you want everything.
