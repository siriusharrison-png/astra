#!/usr/bin/env bash
# Silent background sync for Astra, triggered from the SessionStart hook.
#
# Design contract: this must NEVER interrupt or slow down a session.
#   - runs in the background (the hook backgrounds it with &)
#   - fast-forward only: never creates merge commits, never rewrites history
#   - if the working tree is dirty, or there is no network, or the pull is
#     not a clean fast-forward, it skips silently and leaves the repo untouched
#   - all output goes to a log file, never to the session
#
# It only PULLS. It never commits or pushes. Convergence stays deliberate.

set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LOG="$HOME/.claude/logs/astra-sync.log"
mkdir -p "$(dirname "$LOG")"

log() { echo "$(date '+%F %T') $1" >> "$LOG"; }

# Must be a git repo with an origin remote.
if [[ ! -d "$ROOT/.git" ]]; then
  log "skip: $ROOT is not a git repo"
  exit 0
fi
if ! git -C "$ROOT" remote get-url origin >/dev/null 2>&1; then
  log "skip: no origin remote"
  exit 0
fi

BRANCH="$(git -C "$ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || echo main)"
[[ -z "$BRANCH" || "$BRANCH" == "HEAD" ]] && BRANCH="main"

# Never touch a dirty tree — local edits (like an in-progress converge) win.
if [[ -n "$(git -C "$ROOT" status --porcelain 2>/dev/null)" ]]; then
  log "skip: working tree dirty, leaving local changes untouched"
  exit 0
fi

# Fetch quietly; bail on network failure without noise.
if ! git -C "$ROOT" fetch origin "$BRANCH" --quiet 2>>"$LOG"; then
  log "skip: fetch failed (offline?)"
  exit 0
fi

LOCAL="$(git -C "$ROOT" rev-parse "$BRANCH" 2>/dev/null)"
REMOTE="$(git -C "$ROOT" rev-parse "origin/$BRANCH" 2>/dev/null)"

if [[ "$LOCAL" == "$REMOTE" ]]; then
  log "up to date ($BRANCH @ ${LOCAL:0:7})"
  exit 0
fi

# Only fast-forward. If local has diverged, do nothing — the human decides.
if git -C "$ROOT" merge-base --is-ancestor "$LOCAL" "$REMOTE" 2>/dev/null; then
  if git -C "$ROOT" merge --ff-only "origin/$BRANCH" --quiet 2>>"$LOG"; then
    log "fast-forwarded $BRANCH ${LOCAL:0:7} -> ${REMOTE:0:7}"
  else
    log "skip: ff-only merge failed"
  fi
else
  log "skip: local diverged from origin/$BRANCH, manual sync needed"
fi

exit 0
