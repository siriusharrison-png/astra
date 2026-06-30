#!/usr/bin/env bash
set -euo pipefail

REPO_URL=""
TARGET_DIR=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --repo)
      REPO_URL="${2:-}"
      shift 2
      ;;
    --target)
      TARGET_DIR="${2:-}"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$TARGET_DIR" ]]; then
  echo "Usage: scripts/bootstrap.sh --target <path> [--repo <git-url>]"
  exit 1
fi

if [[ -d "$TARGET_DIR/.git" ]]; then
  echo "Astra already exists at $TARGET_DIR"
  exec bash "$TARGET_DIR/scripts/sync.sh"
fi

if [[ -d "$TARGET_DIR" && -n "$(find "$TARGET_DIR" -mindepth 1 -maxdepth 1 2>/dev/null | head -n 1)" ]]; then
  echo "Target directory exists and is not empty: $TARGET_DIR"
  echo "Choose an empty directory or point --target to a new path."
  exit 1
fi

if [[ -z "$REPO_URL" ]]; then
  echo "A repository URL is required for first-time setup."
  echo "Usage: scripts/bootstrap.sh --target <path> --repo <git-url>"
  exit 1
fi

git clone "$REPO_URL" "$TARGET_DIR"

echo "Astra installed at $TARGET_DIR"
echo "Next:"
echo "1. Point your agent config at $TARGET_DIR"
echo "2. Run: bash $TARGET_DIR/scripts/sync.sh"
echo "3. After each task, run: bash $TARGET_DIR/scripts/converge.sh --layer evolving --summary \"...\""

