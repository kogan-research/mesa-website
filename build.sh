#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO="$("${ROOT}/scripts/ensure-hugo.sh")"

echo "Building site with Hugo..."
"${HUGO}" --minify

echo "Build complete. Output in ./public"
