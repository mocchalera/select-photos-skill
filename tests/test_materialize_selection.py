from __future__ import annotations

import json
import subprocess
import sys
import zipfile
from pathlib import Path

from PIL import Image


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "select-photos" / "scripts" / "materialize_selection.py"


def write_image(path: Path, color: tuple[int, int, int]) -> None:
    image = Image.new("RGB", (24, 16), color)
    image.save(path)


def test_materialize_selection_copies_and_zips(tmp_path: Path) -> None:
    project = tmp_path / "project"
    source = project / "02_media" / "originals"
    plan = project / "04_plan"
    source.mkdir(parents=True)
    plan.mkdir(parents=True)

    write_image(source / "A.jpg", (255, 0, 0))
    write_image(source / "B.jpg", (0, 255, 0))
    write_image(source / "C.jpg", (0, 0, 255))

    manifest = {
        "album_select": ["A.jpg", "B.jpg"],
        "digest_highlights": ["B.jpg"],
    }
    manifest_path = plan / "photo_selection_manifest.json"
    manifest_path.write_text(json.dumps(manifest), encoding="utf-8")

    subprocess.run(
        [sys.executable, str(SCRIPT), "--project", str(project), "--manifest", str(manifest_path)],
        check=True,
    )

    album_files = sorted((project / "05_delivery" / "album_select").iterdir())
    digest_files = sorted((project / "05_delivery" / "digest_highlights").iterdir())

    assert [path.name for path in album_files] == ["001_A.jpg", "002_B.jpg"]
    assert [path.name for path in digest_files] == ["001_B.jpg"]

    with zipfile.ZipFile(project / "05_delivery" / "album_select_2.zip") as zf:
        assert sorted(zf.namelist()) == [
            "album_select/001_A.jpg",
            "album_select/002_B.jpg",
        ]
