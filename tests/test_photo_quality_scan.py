from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path

from PIL import Image


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "select-photos" / "scripts" / "photo_quality_scan.py"


def test_photo_quality_scan_writes_metrics_and_review_sheet(tmp_path: Path) -> None:
    source = tmp_path / "photos"
    review = tmp_path / "review"
    output = tmp_path / "photo_metrics.json"
    source.mkdir()

    Image.new("RGB", (32, 24), (250, 250, 250)).save(source / "bright.jpg")
    Image.new("RGB", (32, 24), (30, 60, 90)).save(source / "dark.jpg")

    subprocess.run(
        [
            sys.executable,
            str(SCRIPT),
            "--input",
            str(source),
            "--output",
            str(output),
            "--review-dir",
            str(review),
            "--low-sharpness-count",
            "2",
        ],
        check=True,
    )

    data = json.loads(output.read_text(encoding="utf-8"))
    assert data["count"] == 2
    assert {item["file"] for item in data["items"]} == {"bright.jpg", "dark.jpg"}
    assert (review / "low_sharpness_review.jpg").exists()
