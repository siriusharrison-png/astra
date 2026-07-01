#!/usr/bin/env bash
set -euo pipefail

REPO_URL="${ASTRA_REPO_URL:-https://github.com/siriusharrison-png/astra.git}"
TARGET_DIR="${ASTRA_TARGET_DIR:-$HOME/astra}"

if [[ -d "$TARGET_DIR/.git" ]]; then
  echo "Astra already exists at $TARGET_DIR"
  exec bash "$TARGET_DIR/scripts/sync.sh"
fi

if [[ -d "$TARGET_DIR" && -n "$(find "$TARGET_DIR" -mindepth 1 -maxdepth 1 2>/dev/null | head -n 1)" ]]; then
  echo "Target directory exists and is not empty: $TARGET_DIR"
  echo "Set ASTRA_TARGET_DIR to a new or empty path and try again."
  exit 1
fi

git clone "$REPO_URL" "$TARGET_DIR"

echo "Astra installed at $TARGET_DIR"
echo "Next:"
echo "1. Point your agent config at $TARGET_DIR/README.md"
echo "2. Run: bash $TARGET_DIR/scripts/sync.sh before each session"
echo "3. Run: bash $TARGET_DIR/scripts/converge.sh --layer evolving --summary \"...\" after reusable work"
