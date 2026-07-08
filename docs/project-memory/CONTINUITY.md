# CONTINUITY

Goal:

Create a public repository for distributing and developing the `select-photos`
Codex skill.

Constraints/Assumptions:

- Public repository contents must avoid private event photos and local paths.
- The installable skill payload is `select-photos/`.
- OpenCV remains optional.
- MIT license is used for the initial public release.

Key decisions:

- Repository name: `select-photos-skill`.
- Keep helper scripts inside the skill payload so a ZIP install is self-contained.
- Ignore generated photo outputs and package artifacts by default.

State:

- Local repo initialized on `main`.
- Public remote: `https://github.com/mocchalera/select-photos-skill`.
- Skill payload copied and made portable.
- Tests, CI, install script, and package script added.
- `make ci-check` passes locally.
- Temp install under `CODEX_SKILLS_DIR=<tmp>` copies only the installable skill files.

Done:

- Initial public-ready repo structure.
- Helper-script regression tests.
- Local package generation.

Now:

- Public repo is created and `main` is pushed.

Next:

- Add a changelog and synthetic example materials.

Open questions:

- Whether to publish formal versioned releases after the initial push.

Working set:

- `select-photos/SKILL.md`
- `select-photos/scripts/`
- `tests/`
- `scripts/`
- `.github/workflows/ci.yml`
