# Plans

## Milestones

1. [x] Split the repo-local `select-photos` skill into a public, installable repository.
2. [x] Add helper-script tests, CI, local install, and ZIP packaging.
3. [ ] Add example fixture documentation with synthetic public-domain images.
4. [ ] Add release tagging and changelog workflow.

## Validation Gates

- `make ci-check`
- Inspect `dist/select-photos-skill.zip`
- Scan for local/private paths before public push
