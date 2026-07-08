# Documentation

## 2026-07-08 Initial Repository Prep

Status: published

What changed:

- Created a new local repository for `select-photos-skill`.
- Copied the repo-local `select-photos` skill into an installable
  `select-photos/` directory.
- Added README, MIT license, CI, install/package scripts, and helper tests.
- Updated `SKILL.md` to avoid project-local `.agents/skills/...` command paths.
- Created the public GitHub repository:
  `https://github.com/mocchalera/select-photos-skill`.

Validation:

- Passed: `make ci-check`
- Passed: temp install with `CODEX_SKILLS_DIR=<tmp>`
- Passed: public GitHub repo creation and push

Next:

- Add synthetic example materials and a changelog/release workflow.
