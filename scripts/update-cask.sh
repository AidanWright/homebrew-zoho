#!/usr/bin/env bash
# Usage:
#   scripts/update-cask.sh <tap/cask> --check   # detect only; writes GITHUB_OUTPUT
#   scripts/update-cask.sh <tap/cask>           # apply the bump in place
set -euo pipefail

log() { echo "[update-cask] $*" >&2; }
die() { echo "[update-cask] error: $*" >&2; exit 2; }

CASK="${1:?usage: update-cask.sh <tap/cask> [--check]}"
MODE="${2:-apply}"

command -v brew >/dev/null 2>&1 || die "brew not found"
command -v jq   >/dev/null 2>&1 || die "jq not found"

version_gt() {
  [ "$1" != "$2" ] &&
    [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | tail -1)" = "$1" ]
}

emit() { [ -n "${GITHUB_OUTPUT:-}" ] && echo "$1=$2" >> "$GITHUB_OUTPUT"; return 0; }

json="$(brew livecheck --cask "$CASK" --newer-only --json 2>/dev/null || true)"
json="${json:-[]}"
count="$(jq 'length' <<<"$json")"

if [ "$count" -eq 0 ]; then
  log "$CASK: up to date"
  emit update_needed false
  exit 0
fi

current="$(jq -r '.[0].version.current' <<<"$json")"
latest="$(jq -r '.[0].version.latest'  <<<"$json")"
[ -n "$latest" ] && [ "$latest" != "null" ] || die "could not resolve latest version for $CASK"

if ! version_gt "$latest" "$current"; then
  log "$CASK: latest ($latest) is not newer than current ($current); skipping"
  emit update_needed false
  exit 0
fi

log "$CASK: update available $current -> $latest"
emit update_needed true
emit version "$latest"

[ "$MODE" = "--check" ] && exit 0

log "$CASK: applying bump to $latest"
brew bump-cask-pr --write-only --no-audit --no-style --version="$latest" "$CASK"
log "$CASK: bumped $current -> $latest"
