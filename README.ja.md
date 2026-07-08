# select-photos-skill

[![CI](https://github.com/mocchalera/select-photos-skill/actions/workflows/ci.yml/badge.svg)](https://github.com/mocchalera/select-photos-skill/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**イベント撮影の「その後」を少しでも楽にするための Codex スキルです。**

イベント当日、がんばって撮る。

登壇者の表情、会場の空気、参加者の反応、質疑応答、交流、集合写真。
あとで見返したときに「この場がちゃんと熱を持っていた」と伝わるように、
シャッターを切り続ける。

でも、本当に大変なのはイベントが終わったあとです。

「今日中に共有したい」

「SNS に早く出したい」

「レポートの先頭に使える写真が欲しい」

「アルバム用に良い写真だけまとめてほしい」

その一方で、フォルダには何百枚もの写真があります。

似たような連写、半目、微妙なブレ、資料だけのカット、集合写真の別テイク、
誰かの背中が大きく入った写真、どれを残すべきか迷う参加者リアクション。

`select-photos-skill` は、この「選定が大変すぎる」時間を Codex に手伝わせる
ためのスキルです。

写真を加工するものではありません。

**良い写真を選ぶための流れ、確認シート、判断基準、成果物を揃える**ための
スキルです。

English: [README.md](README.md)

## 何がつらいのか

イベントスナップの選定には、地味で重い作業がたくさんあります。

- ほぼ同じ写真の中から、表情が一番良い1枚を探す
- イベント全体の流れが分かるように残す
- でも重複しすぎないように減らす
- 登壇者の目つぶりや半目を確認する
- 集合写真で全員の表情を比べる
- 「記録として必要な写真」と「見栄えの良い写真」を分ける
- 早く共有したいのに、選定だけで夜が溶ける

このスキルは、その編集前の「選ぶ」工程に集中します。

## 何を作るか

標準では次のような成果物を作る想定です。

```text
projects/<project>/
├── 02_media/
│   └── originals/
├── 03_analysis/
│   ├── contact_sheets/
│   ├── photo_metrics.json
│   ├── low_sharpness_review.jpg
│   ├── eye_review/
│   ├── album_select_contact_sheet.jpg
│   └── digest_highlights_contact_sheet.jpg
├── 04_plan/
│   ├── photo_selection_manifest.json
│   └── photo_selection_report.md
└── 05_delivery/
    ├── album_select/
    ├── digest_highlights/
    ├── album_select_<count>.zip
    └── digest_highlights_<count>.zip
```

元写真は変更しません。納品フォルダには無加工コピーを置きます。

## 2種類のセレクト

### album_select

広めのアルバム用セレクトです。

イベント全体の流れ、参加者の多様性、会場の雰囲気、登壇、質疑応答、交流、
集合写真などを残します。

### digest_highlights

さらに絞った代表カットです。

告知、SNS、イベントレポートの冒頭、共有用ダイジェストに使いやすい写真を
優先します。

## Codex が手伝うこと

- 元フォルダを触らずに作業コピーを作る
- 撮影順の contact sheet を作る
- sharpness / brightness / contrast などの簡易指標を出す
- 低 sharpness 候補の確認シートを作る
- 顔・目元確認用の eye review シートを作る
- 連写や近似構図を減らす
- 表情、視線、手の動き、会話感を優先して残す
- `album_select` と `digest_highlights` に分ける
- manifest と report で選定理由を残す
- delivery フォルダと ZIP を作る

## 選定基準

優先順位は次の通りです。

1. **場面 coverage**: 受付、会場、導入、登壇、参加者反応、質疑、交流、集合写真
2. **表情**: 笑顔、集中、反応、会話の温度
3. **構図**: 主役が分かる、手前の遮蔽が少ない、背景が説明になる
4. **技術品質**: ピント、ブレ、露出、目つぶり
5. **重複排除**: 同じ人物・同じ構図・同じ瞬間を残しすぎない

sharpness score だけで機械的に落とさないのが重要です。

会場の引き絵、登壇スライド前の写真、質疑応答の記録カットは、数値が弱くても
イベントを説明するために必要なことがあります。

## インストール

このリポジトリを clone して、次を実行します。

```bash
bash scripts/install_local.sh
```

次のスキル一式が:

```text
select-photos/
├── SKILL.md
└── scripts/
```

ここへコピーされます。

```text
~/.codex/skills/select-photos
```

## ZIP パッケージ作成

```bash
make package
```

`dist/select-photos-skill.zip` が作られます。

ZIP にはインストール可能な `select-photos/` ツリーだけが入ります。

## 依存関係

必須:

- Python
- Pillow

任意:

- OpenCV

OpenCV がある場合は顔検出に使います。無い場合でも中央クロップで eye review を
作るため、ワークフロー自体は止まりません。

## 開発

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements-dev.txt
make ci-check
```

`make ci-check` では次を確認します。

- Python 構文チェック
- 補助スクリプトのテスト
- ZIP パッケージ生成
- repo 構造チェック
- 公開 repo に入れるべきでないローカルパスの検出

## プライバシー

このリポジトリには実イベント写真を含めません。

実際のイベント写真を公開する前には、必要に応じて人間が privacy review を
行ってください。

- 参加者の顔
- 名札
- 機密情報を含むスライド
- ホワイトボード
- 顔出し許諾が不明な参加者

スキルは選定作業を整理できますが、公開判断は人間の責任です。

## Star してほしい人

イベントを撮り終えたあとに、こんな経験がある人に向けた repo です。

- 似たような写真が700枚あって途方に暮れた
- 集合写真で誰かが目をつぶっていて全部見直した
- 早く共有したいのに選定だけで何時間もかかった
- 「良いやつだけ送ってください」に毎回苦しんでいる

その痛みを少しでも減らしたいなら、Star してもらえると嬉しいです。
