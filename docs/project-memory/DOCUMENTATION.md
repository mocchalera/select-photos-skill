# Documentation

## 2026-07-08 Initial Repository Prep

Status: ready for first public push

What changed:

- Created a new local repository for `select-photos-skill`.
- Copied the repo-local `select-photos` skill into an installable
  `select-photos/` directory.
- Added README, MIT license, CI, install/package scripts, and helper tests.
- Updated `SKILL.md` to avoid project-local `.agents/skills/...` command paths.

Validation:

- Passed: `make ci-check`
- Passed: temp install with `CODEX_SKILLS_DIR=<tmp>`
- Pending: public GitHub repo creation and push

Next:

- Commit and publish the public repository.
