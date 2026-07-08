# AGENTS.md Add-on: Continual Learning Loop

この内容をリポジトリの `AGENTS.md` に追記すると、長時間実行時の一貫性を維持できます。

## Roles (No Overlap)

- `functions.update_plan`: 実行中の短期ステップ管理（3-7 steps, pending/in_progress/completed）。
- `docs/project-memory/CONTINUITY.md`: 圧縮やセッション跨ぎで使う長期継続台帳（what/why/current state）。
- `docs/project-memory/PLANS.md`: 現在マイルストーンの実行計画。
- `docs/project-memory/DOCUMENTATION.md`: 履歴・成果・引き継ぎ記録。

## Working Loop

- Task start:
  - Read `PROMPT.md`, `PLANS.md`, `ARCHITECTURE.md`, `IMPLEMENT.md`, `CONTINUITY.md`.
  - Read `.codex/knowledge/workflow-notes.md` and related `.codex/research/` logs.
- During task:
  - Maintain `functions.update_plan` as short-term execution scaffold.
  - Update `CONTINUITY.md` only at intent/progress level when plan/state materially changes.
  - Save evidence links and confidence in research notes.
- Task end:
  - Update `DOCUMENTATION.md`, `DECISIONS.md`, and `progress/YYYY-MM-DD.md`.
  - Append reusable patterns to `.codex/knowledge/workflow-notes.md`.
  - Promote repeated work into `.codex/helpers/`.

## Reply Protocol

- Start user-facing replies with a brief `Ledger Snapshot`:
  - Goal
  - Now/Next
  - Open Questions
- Print full `CONTINUITY.md` only when materially changed or explicitly requested.
- Communicate with user in Japanese.

## CONTINUITY Format

- Goal (incl. success criteria):
- Constraints/Assumptions:
- Key decisions:
- State:
- Done:
- Now:
- Next:
- Open questions (UNCONFIRMED if needed):
- Working set (files/ids/commands):

## Web Search Rules

- 不確実または更新頻度の高い情報は推測しない。必要時はWeb確認し、根拠を明記する。
- 重要点は複数ソースでクロスチェックし、矛盾があれば整理して結論を示す。
- 調査価値が逓減するまで掘るが、脱線はしない。
- API仕様、ライブラリ版、料金、アクセシビリティ、法規、デザインシステム、ブラウザ対応は最新確認を優先する。

## Advisor Stance

- 同意より本質的助言を優先する。
- 前提・盲点・リスクを具体的に指摘する。
- 根拠と検証方法を示し、目的・価値・制約に照らして優先順位付きで提案する。
