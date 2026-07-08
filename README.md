# select-photos-skill

Codex skill for selecting event photos from a folder or ZIP of still images.

The skill helps an agent create contact sheets, scan basic image quality, review
faces/eyes, choose a broader `album_select`, choose tighter
`digest_highlights`, and deliver unedited image copies with a manifest and
report.

## Repository Layout

- `select-photos/SKILL.md`: skill instructions
- `select-photos/scripts/`: helper scripts used by the skill
- `scripts/install_local.sh`: install this skill into `~/.codex/skills`
- `scripts/package_skill.sh`: create a distributable ZIP
- `tests/`: lightweight regression tests for helper scripts
- `docs/project-memory/`: durable planning and handoff notes for repo work

## Install Locally

```bash
bash scripts/install_local.sh
```

This copies `select-photos/` to `~/.codex/skills/select-photos`.

## Package

```bash
make package
```

The ZIP is written to `dist/select-photos-skill.zip`.

## Development

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements-dev.txt
make ci-check
```

OpenCV is optional. The skill uses it when available for face detection; without
OpenCV, the review script falls back to center crops.
