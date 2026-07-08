# Codex Workflow Checklist

## Before work
- Clarify goal, constraints, and deadline.
- Read durable memory files:
  - `docs/project-memory/PROMPT.md`
  - `docs/project-memory/PLANS.md`
  - `docs/project-memory/ARCHITECTURE.md`
  - `docs/project-memory/IMPLEMENT.md`
  - `docs/project-memory/CONTINUITY.md`
- Ask Codex to read `.codex/knowledge/workflow-notes.md`.
- Ask Codex to propose 2-3 approaches with tradeoffs.

## During work
- Keep short-term execution in `functions.update_plan` (3-7 steps).
- Keep long-term continuity in `docs/project-memory/CONTINUITY.md`.
- Update `CONTINUITY.md` only when intent/progress materially changes.
- Log key findings and evidence links in `.codex/research/`.
- Update `PLANS.md` and `DECISIONS.md` for major changes.

## After work
- Append durable notes to `.codex/knowledge/workflow-notes.md`.
- Promote repeated commands into `.codex/helpers/`.
- Update `DOCUMENTATION.md` and `progress/YYYY-MM-DD.md`.
