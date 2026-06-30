#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ ! -d "$ROOT/.git" ]]; then
  echo "Astra is not a git repository yet."
  echo "Clone or initialize it first, then rerun this script."
  exit 1
fi

CURRENT_BRANCH="$(git -C "$ROOT" rev-parse --abbrev-ref HEAD 2>/dev/null || true)"

if [[ -z "$CURRENT_BRANCH" || "$CURRENT_BRANCH" == "HEAD" ]]; then
  CURRENT_BRANCH="main"
fi

if ! git -C "$ROOT" remote get-url origin >/dev/null 2>&1; then
  echo "No origin remote is configured for Astra."
  echo "Add a remote first, then rerun this script."
  exit 1
fi

git -C "$ROOT" fetch origin --prune
git -C "$ROOT" pull --ff-only origin "$CURRENT_BRANCH"

echo "Astra synced from origin/$CURRENT_BRANCH."

