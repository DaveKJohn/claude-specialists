# Release v1.14.0

**Date:** 2026-07-21  
**Type:** Minor

Cross-browser and automation-first shared rules, and a leaner, plugin-independent CLAUDE.md

You are on this release.

## v1.14.0 — 2026-07-21

### #121 · Make the automation-first (lazy) rule a plugin-owned shared block, like inbound-behaviour · Feat · 2026-07-21

The automation-first ("stay lazy") behavioral rule is now plugin-owned via a new shared block,
`claude-code-plugins/claude-specialists/agent-shared/laziness-automation.md`, wired into the
subagent agent-defs via `<!-- BEGIN/END shared:... -->` sentinels — the same circle as
`shared:inbound-behaviour` — so the rule travels along to consuming repos instead of living only
in this repo's own `CLAUDE.md`. The per-specialist "X is lazy" examples in the manuals stay in
place as elaboration; `CLAUDE.md`'s own "Shared trait — all of them incredibly lazy" paragraph
remains as the governance narrative for the main loop (Chris and the main-loop personas, who carry
no agent-shared blocks), with a light note added that it is the same rule carried by every
specialist's shared playbook, not a second canonical copy.

[PR #121](https://github.com/DaveKJohn/davekjohns-workshop/pull/121)

---

Full workshop notes: [releases/development/1.14/1.14.0.md](https://github.com/DaveKJohn/davekjohns-workshop/blob/main/releases/development/1.14/1.14.0.md)
Cumulative plugin history: [CHANGELOG.md](CHANGELOG.md)
