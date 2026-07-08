#!/usr/bin/env bash
set -euo pipefail

MODE="${1:-all}"

required_memory=(
  "docs/project-memory/PROMPT.md"
  "docs/project-memory/PLANS.md"
  "docs/project-memory/ARCHITECTURE.md"
  "docs/project-memory/IMPLEMENT.md"
  "docs/project-memory/CONTINUITY.md"
  "docs/project-memory/DOCUMENTATION.md"
)

required_common=(
  "README.md"
  "README.ja.md"
  "AGENTS.md"
  "LICENSE"
  "Makefile"
  "pyproject.toml"
  "requirements-dev.txt"
  "select-photos/SKILL.md"
  "select-photos/scripts/make_contact_sheets.py"
  "select-photos/scripts/photo_quality_scan.py"
  "select-photos/scripts/make_swap_candidates.py"
  "select-photos/scripts/materialize_selection.py"
  "scripts/install_local.sh"
  "scripts/package_skill.sh"
)

missing=0

check_paths() {
  local path
  for path in "$@"; do
    if [[ ! -f "$path" ]]; then
      echo "missing required file: $path" >&2
      missing=1
    fi
  done
}

if [[ "$MODE" == "--memory-only" || "$MODE" == "all" ]]; then
  check_paths "${required_memory[@]}"
fi

if [[ "$MODE" == "--structure-only" || "$MODE" == "all" ]]; then
  check_paths "${required_common[@]}"

  if [[ -f "AGENTS.md" ]]; then
    grep -q "functions.update_plan" "AGENTS.md" || {
      echo "AGENTS.md must define functions.update_plan role." >&2
      missing=1
    }
    grep -q "CONTINUITY.md" "AGENTS.md" || {
      echo "AGENTS.md must define CONTINUITY.md role." >&2
      missing=1
    }
  fi

  if rg -n "video-os-v2-spec|/Users/|Downloads/写真" README.md README.ja.md select-photos tests docs .github >/tmp/select-photos-private-scan.txt 2>/dev/null; then
    echo "public repo scan found local/private path references:" >&2
    cat /tmp/select-photos-private-scan.txt >&2
    missing=1
  fi
fi

if [[ "$missing" -ne 0 ]]; then
  exit 1
fi

echo "check_repo.sh: OK"
