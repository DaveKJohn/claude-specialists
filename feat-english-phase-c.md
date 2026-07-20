### Workshop to English — phase C: machine markers, bilingual · Feat · 2026-07-20

The final English-switch phase: the machine-coupled Dutch markers and the consumer-facing output of
the connector tooling are now English, with **bilingual back-compat** so consumers still carrying
the Dutch markers keep working across a plugin-version skew.

- **Slot marker `## Eigen aan deze repo` → `## Specific to this repo`.** `bootstrap.ps1` now writes
  the English scaffold heading; `check-consumer-drift.ps1` splits the portable body on **either**
  language (a legacy Dutch consumer still splits correctly). Docs (root README, connectors README,
  `specialists-init` skill, Chris's lens) follow the English canonical name.
- **Signal token `[FOUT]` → `[ERROR]`.** `check-connectors.ps1` emits `[ERROR]`; the SessionStart
  hook's blocking-signal filter recognizes **both** `[FOUT]` and `[ERROR]` (the plugin cache and the
  workshop checkout can be on different versions).
- **Consumer-facing output is English.** The connector check/drift-check messages and the hook's own
  session-start lines (`no errors`, `signals found …`) — surfaced into every consumer session — are
  translated.
- **PR template → English, `open-pr.ps1` matches both languages.** The three auto-fill strings are
  English in the template; the script still recognizes the Dutch strings so a consumer whose template
  is still Dutch keeps its auto-fill.
- **Tests:** bilingual back-compat is proven — the drift split is tested with both the legacy Dutch
  and the new English slot fixture; the hook test surfaces both a `[FOUT]` and an `[ERROR]` line.
  All seven suites green.

**Deferred to a later phase (D):** the purely internal, non-consumer-facing Dutch code-comments in
the scripts (and old research docs under `research/`). They ship in no consumer-visible surface, so
they carry no urgency; the English switch of everything consumer-facing is complete with this phase.
