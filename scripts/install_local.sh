#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
TARGET="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}/select-photos"

rm -rf "$TARGET"
mkdir -p "$(dirname "$TARGET")"
cp -R "$ROOT/select-photos" "$TARGET"
find "$TARGET" -type d -name "__pycache__" -prune -exec rm -rf {} +
find "$TARGET" -type f \( -name "*.pyc" -o -name "*.pyo" \) -delete

echo "Installed select-photos skill to $TARGET"
