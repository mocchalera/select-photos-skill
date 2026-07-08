# Architecture

## Shape

The installable unit is:

```text
select-photos/
├── SKILL.md
└── scripts/
```

The repository adds development scaffolding around that unit, but the skill
must continue to work when only the `select-photos/` directory is copied into a
Codex skills directory.

## Runtime Assumptions

- Python and Pillow are required.
- OpenCV is optional and must fail open.
- Scripts read source images and write derived review/delivery artifacts.
- Scripts must not mutate original source photos.

## Boundaries

- Do not add real event material to tests.
- Use synthetic images for test fixtures.
- Keep commands free of machine-specific absolute paths.
