# select-photos-skill

[![CI](https://github.com/mocchalera/select-photos-skill/actions/workflows/ci.yml/badge.svg)](https://github.com/mocchalera/select-photos-skill/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**A Codex skill for the painful hour after a great event.**

You worked hard to capture the room: speakers, reactions, hand gestures,
conversations, group photos, the little moments that prove the event had a
pulse.

Then the event ends.

Everyone wants photos now. The organizer wants a recap. The team wants a quick
post. Social media should go out while the energy is still fresh. But you are
staring at hundreds of near-duplicates, half-blinks, soft focus shots, slide
photos, and group-photo variations.

`select-photos-skill` gives Codex a repeatable workflow for turning that pile
of event snapshots into two practical sets:

- `album_select`: a broader album-ready selection that preserves the event flow
- `digest_highlights`: a tighter set for recaps, social posts, reports, and
  quick sharing

It does not edit your photos. It helps select them.

日本語版: [README.ja.md](README.ja.md)

## Why This Exists

Event photography is not only about taking good photos. The hidden labor comes
afterward:

- finding the one good frame in a burst of similar shots
- keeping enough coverage without drowning people in duplicates
- checking if the main speaker blinked
- checking if the group photo has enough open eyes
- preserving the story: venue, opening, talk, reactions, dialogue, Q&A,
  networking, closing
- shipping something quickly before the event becomes yesterday's news

Most photo tools focus on editing, albums, or storage. This skill focuses on
the messy editorial middle: **selection with evidence**.

## What It Produces

The recommended output structure is:

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

The original photos are preserved. Delivery folders contain unedited copies.

## What The Skill Helps Codex Do

- Copy source photos into a working project without touching the originals.
- Build labeled contact sheets so the event flow is visible.
- Generate lightweight quality metrics:
  - dimensions
  - brightness
  - contrast
  - edge/sharpness proxy
  - file size
- Build low-sharpness review sheets.
- Build face/eye review sheets.
- Remove obvious near-duplicates.
- Keep coverage across event moments.
- Separate broad album photos from tighter digest highlights.
- Write a manifest that records the selection.
- Write a report that explains the policy and review status.
- Materialize delivery folders and ZIP files.

## Selection Priorities

The skill pushes the agent to choose photos in this order:

1. **Coverage**: the event should still make sense as a story.
2. **Expression**: smiles, concentration, reactions, dialogue, warmth.
3. **Composition**: clear subject, low obstruction, useful background context.
4. **Technical quality**: focus, motion blur, exposure, eye status.
5. **Deduplication**: fewer repeated frames, stronger individual choices.

The point is not to maximize a sharpness score. Some wide room shots, slide
context shots, and documentary moments are worth keeping even when metrics are
not impressive.

## Install Locally

Clone this repository, then run:

```bash
bash scripts/install_local.sh
```

This copies the installable skill payload:

```text
select-photos/
├── SKILL.md
└── scripts/
```

to:

```text
~/.codex/skills/select-photos
```

## Package As A ZIP

```bash
make package
```

The package is written to:

```text
dist/select-photos-skill.zip
```

The ZIP contains only the installable `select-photos/` skill tree.

## Dependencies

Required:

- Python
- Pillow

Optional:

- OpenCV, for better face detection in eye-review sheets

OpenCV is intentionally optional. If it is not installed, the helper script
falls back to center crops so the workflow still runs.

## Development

```bash
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements-dev.txt
make ci-check
```

`make ci-check` runs:

- Python syntax checks
- helper-script tests
- package generation
- repository structure checks
- public-repo path scan

## Repository Layout

- `select-photos/SKILL.md`: the actual Codex skill instructions
- `select-photos/scripts/`: helper scripts used by the skill
- `scripts/install_local.sh`: local installer
- `scripts/package_skill.sh`: ZIP packager
- `tests/`: regression tests for helper scripts
- `docs/project-memory/`: durable planning and handoff notes

## Privacy And Safety

This repository intentionally does **not** include real event photos.

When using the skill on real material, consider an additional privacy review
before publishing:

- participant faces
- name tags
- slides with confidential information
- whiteboards
- audience members who may not have opted in

The skill can help organize selection work, but publication judgment remains a
human responsibility.

## Star This If

Star this repo if you have ever finished shooting an event and then lost your
evening to:

- 700 photos that all look almost the same
- group photos where one person blinked
- the pressure to publish while the event is still warm
- the question, "Can you send us just the good ones?"

That exact pain is what this skill is for.
