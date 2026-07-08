#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd -P)"
DIST="$ROOT/dist"
ZIP_PATH="$DIST/select-photos-skill.zip"

mkdir -p "$DIST"
rm -f "$ZIP_PATH"

ROOT="$ROOT" ZIP_PATH="$ZIP_PATH" python3 - <<'PY'
from pathlib import Path
import os
import zipfile

root = Path(os.environ["ROOT"])
zip_path = Path(os.environ["ZIP_PATH"])
skill_root = root / "select-photos"

with zipfile.ZipFile(zip_path, "w", compression=zipfile.ZIP_DEFLATED) as zf:
    for path in sorted(skill_root.rglob("*")):
        if path.is_file():
            if "__pycache__" in path.parts or path.suffix in {".pyc", ".pyo"}:
                continue
            zf.write(path, path.relative_to(root))

print(zip_path)
PY
