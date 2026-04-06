#!/bin/bash
set -euo pipefail

echo "Building site with Hugo..."
hugo --minify

echo "Build complete. Output in ./public"
