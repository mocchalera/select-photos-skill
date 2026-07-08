# AGENTS.md

## Project

`select-photos-skill` packages and maintains the `select-photos` Codex skill.
The skill selects still photos for event albums and digest/highlight sets while
preserving original media.

## Rules

- Do not commit real event photos, source footage, generated selections, or ZIP
  outputs except the small skill package generated under `dist/` when explicitly
  intended for release.
- Preserve the installable shape: `select-photos/SKILL.md` plus
  `select-photos/scripts/`.
- Keep helper scripts runnable directly with Python; avoid hidden repo-local
  assumptions.
- Keep OpenCV optional. Pillow is required; OpenCV should improve face review
  when installed and fail open when absent.
- Use `functions.update_plan` for short-running implementation steps.
- Keep longer-term handoff state in `docs/project-memory/CONTINUITY.md`.

## Commands

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements-dev.txt
make ci-check
```

## Release Checklist

- Run `make ci-check`.
- Inspect `dist/select-photos-skill.zip`.
- Confirm no local paths, private photo names, or generated customer artifacts
  are tracked.
- Tag releases only after the installable `select-photos/` directory is tested.
