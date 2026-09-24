# Astra Skills

Agent-loadable skills that live in this repo and install into `~/.claude/skills/`.

| Skill | Invoke | Does |
|---|---|---|
| `astra` | `/astra` | Fast Astra guidance — templates, decision trees, checklists — without loading full docs |
| `gsap` | describe a web animation/transition | Maps a plain-language motion description to a copy-paste GSAP recipe with the right easing, timing, and reduced-motion guard |

Sources live at `skills/<name>/SKILL.md`.

## Install (Claude Code)

Claude Code discovers skills as **directories** under `~/.claude/skills/`, each
containing a `SKILL.md`. A flat `.md` file is NOT recognized — the directory
form is required.

```bash
for s in astra gsap; do
  mkdir -p ~/.claude/skills/"$s"
  cp ~/astra/skills/"$s"/SKILL.md ~/.claude/skills/"$s"/SKILL.md
done
```

Then start a **new** Claude Code session (skills load at session start). Run
`/astra` for the quick reference, or just describe a web animation to trigger `gsap`.

## Keep it in sync

The copies under `~/.claude/skills/` are snapshots. When a source in this repo
changes, re-run the install loop above to re-copy.

## Notes

- `~/astra` is a symlink to the real repo (`~/Desktop/astra` on the maintainer's
  machine). On a fresh clone, point it at wherever you cloned Astra.
- The full reference (not the skill) is `QUICKSTART.md` and `README.md` at the
  repo root — load those directly when you want everything.
