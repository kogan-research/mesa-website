#!/usr/bin/env bash
# Quick script to test a production-style build locally
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HUGO="$("${ROOT}/scripts/ensure-hugo.sh")"

echo "Building site..."
"${HUGO}" --quiet

echo ""
echo "Starting local web server..."
echo "Open your browser to: http://localhost:8000"
echo "Press Ctrl+C to stop the server"
echo ""

cd "${ROOT}/public"
python3 -m http.server 8000
