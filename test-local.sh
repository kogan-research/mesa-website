#!/bin/bash
# Quick script to test the site locally

echo "Building site..."
hugo --quiet

echo ""
echo "Starting local web server..."
echo "Open your browser to: http://localhost:8000"
echo "Press Ctrl+C to stop the server"
echo ""

cd public
python3 -m http.server 8000
