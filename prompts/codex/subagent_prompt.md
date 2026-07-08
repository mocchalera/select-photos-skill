# Subagent Orchestration Prompt

Act as an orchestrator and run parallel subagents.

Subagent A (Code Archaeology):
- Find existing patterns and prior implementations.
- Return file references and minimal diffs.

Subagent B (Risk Review):
- Identify regression risks and missing tests.
- Propose guards and validation commands.

Subagent C (Implementation):
- Apply the smallest safe change set.
- Keep commits and notes structured for review.

Converge outputs into:
1. Final implementation plan
2. Applied changes
3. Validation results
