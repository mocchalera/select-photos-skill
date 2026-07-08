from __future__ import annotations

import subprocess
import zipfile
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def test_package_contains_installable_skill_tree() -> None:
    subprocess.run(["bash", str(ROOT / "scripts" / "package_skill.sh")], cwd=ROOT, check=True)

    package = ROOT / "dist" / "select-photos-skill.zip"
    assert package.exists()

    with zipfile.ZipFile(package) as zf:
        names = set(zf.namelist())

    assert "select-photos/SKILL.md" in names
    assert "select-photos/scripts/photo_quality_scan.py" in names
    assert "select-photos/scripts/materialize_selection.py" in names
    assert not any("__pycache__" in name or name.endswith((".pyc", ".pyo")) for name in names)
