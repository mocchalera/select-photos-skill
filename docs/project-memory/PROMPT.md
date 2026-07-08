# Prompt

## Mission

Maintain a portable Codex skill for event photo selection.

The skill should help agents turn a still-photo source folder or ZIP into:

- contact sheets for review
- lightweight quality metrics
- face/eye review sheets
- a broad album selection
- tighter digest highlights
- an auditable manifest and report
- unedited delivery copies and ZIPs

## Scope

In scope:

- Skill instructions in `select-photos/SKILL.md`
- Helper scripts in `select-photos/scripts/`
- Local install and packaging scripts
- Tests that keep helper scripts safe to refactor

Out of scope:

- Storing real event photos in the repository
- Color correction, retouching, or destructive edits
- A full photo management application
- Mandatory cloud services or paid APIs

## Success Criteria

- `make ci-check` passes from a clean checkout.
- `scripts/package_skill.sh` creates an installable ZIP.
- `scripts/install_local.sh` installs the skill under the expected Codex skills directory.
- OpenCV remains optional.
