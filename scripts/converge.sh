#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHANGELOG="$ROOT/CHANGELOG.md"

if [[ ! -f "$CHANGELOG" ]]; then
  echo "CHANGELOG.md not found."
  exit 1
fi

layer=""
summary=""
source_text=""
action=""
file=""
title=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --layer)
      layer="${2:-}"
      shift 2
      ;;
    --summary)
      summary="${2:-}"
      shift 2
      ;;
    --source)
      source_text="${2:-}"
      shift 2
      ;;
    --action)
      action="${2:-}"
      shift 2
      ;;
    --file)
      file="${2:-}"
      shift 2
      ;;
    --title)
      title="${2:-}"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$layer" || -z "$summary" ]]; then
  echo "Usage: scripts/converge.sh --layer <stable|evolving|working|archive|ignore> --summary <text> [--source <text>] [--action <text>] [--file <path>] [--title <text>]"
  exit 1
fi

TODAY="$(date +%F)"
HEADER="### $TODAY"

if ! grep -qF "$HEADER" "$CHANGELOG"; then
  printf '\n%s\n\n' "$HEADER" >> "$CHANGELOG"
fi

ENTRY_LINES=()
ENTRY_LINES+=("- [${layer}] ${title:-Convergence update}")
[[ -n "$source_text" ]] && ENTRY_LINES+=("  - source: $source_text")
[[ -n "$action" ]] && ENTRY_LINES+=("  - action: $action")
[[ -n "$file" ]] && ENTRY_LINES+=("  - file: $file")
ENTRY_LINES+=("  - summary: $summary")

for line in "${ENTRY_LINES[@]}"; do
  printf '%s\n' "$line" >> "$CHANGELOG"
done

printf '\n'
echo "Recorded convergence entry in $CHANGELOG"

