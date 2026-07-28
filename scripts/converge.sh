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

# Build the entry block (lines collected, then inserted at the right place).
ENTRY_LINES=()
ENTRY_LINES+=("- [${layer}] ${title:-Convergence update}")
[[ -n "$source_text" ]] && ENTRY_LINES+=("  - source: $source_text")
[[ -n "$action" ]] && ENTRY_LINES+=("  - action: $action")
[[ -n "$file" ]] && ENTRY_LINES+=("  - file: $file")
ENTRY_LINES+=("  - summary: $summary")

# Serialize the entry block into a single newline-delimited string for awk.
ENTRY_BLOCK=""
for line in "${ENTRY_LINES[@]}"; do
  ENTRY_BLOCK+="$line"$'\n'
done

TMP="$(mktemp)"

# Insert the entry so records stay grouped by date under "## Unreleased",
# instead of being appended to the end of the file. Single pass:
#   - if today's "### DATE" header exists, insert the block right after it
#   - else, create the header just below "## Unreleased" and insert there
#   - else (no Unreleased section), append header + block at the very end
#
# ENTRY_BLOCK is passed via env because awk -v cannot carry newlines.
export ENTRY_BLOCK
awk -v header="$HEADER" '
  BEGIN { done = 0; block = ENVIRON["ENTRY_BLOCK"] }
  !done && $0 == header {
    print; print ""; printf "%s", block
    done = 1
    next
  }
  !done && $0 == "## Unreleased" {
    print; print ""; print header; print ""; printf "%s", block
    done = 1
    next
  }
  { print }
  END {
    if (!done) {
      print ""; print header; print ""; printf "%s", block
    }
  }
' "$CHANGELOG" > "$TMP"

# Refuse to overwrite the changelog with an empty result — awk failure must
# not silently destroy history.
if [[ ! -s "$TMP" ]]; then
  echo "converge.sh: refusing to write empty changelog (awk failed)." >&2
  rm -f "$TMP"
  exit 1
fi

mv "$TMP" "$CHANGELOG"

echo "Recorded convergence entry under $HEADER in $CHANGELOG"

