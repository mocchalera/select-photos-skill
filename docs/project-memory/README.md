# Project Memory Guide

## File roles

- `PROMPT.md`: 目的・範囲・成果物の定義
- `PLANS.md`: 現在の実行計画（短期）
- `ARCHITECTURE.md`: 設計原則と制約
- `IMPLEMENT.md`: 今回セッションの実行指示
- `CONTINUITY.md`: セッション跨ぎの継続台帳（長期）
- `DOCUMENTATION.md`: 進捗履歴と引き継ぎ
- `DECISIONS.md`: 重要判断ログ
- `BUGS.md`: 不具合と再発防止
- `progress/YYYY-MM-DD.md`: 日次の実行ログ

## No-overlap rule

- `functions.update_plan`: 実行中の短期ステップ管理
- `CONTINUITY.md`: 長期継続の状態管理
- 両者は整合させるが、`CONTINUITY.md` は意図/進捗レベルのみ更新する
