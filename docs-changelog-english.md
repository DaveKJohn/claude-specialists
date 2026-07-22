### translate remaining Dutch in CHANGELOG.md to English · Docs · 2026-07-22

Translated the last Dutch text in `CHANGELOG.md` to English (Dave's decision): the three intro
paragraphs (top, Pull Requests, Releases) and every `## Releases` reference line ("Zie ... voor de
volledige release-notes." -> "See ... for the full release notes.") -- v1.15.0 was already English
because release-lib.ps1's templates were translated earlier. Extended to `releases/README.md`: its
intro, the `## Overview` heading, the `Version | Date | Type | Title` table header, and the Dutch
title rows for v1.11.0 down to v1.0.0 (the newer rows were already English). The coupled header
regex + comment in `cut-release.ps1` moved along to the English header, so new release rows keep
inserting correctly. The CLAUDE.md language slot's "history exception" was narrowed accordingly:
`CHANGELOG.md` and `releases/README.md` are now fully English; only the archived
`releases/development/*.md` notes stay in their original language. Tessa's portable manual keeps the
generic history-exception unchanged (it is a permissive allowance, not a mandate).