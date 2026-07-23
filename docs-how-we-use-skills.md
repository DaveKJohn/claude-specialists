### Record how this repo uses Skills (and what it deliberately does not) · Docs · 2026-07-23

Adds a compact `### How we use Skills — and what we deliberately don't` subsection to `README.md`,
right after "Where this runs: Chat, Cowork, and Claude Code" and before "## Consumption", recording
as durable knowledge a reflection that otherwise only lived in a conversation. Notes: today every
skill (`fold-changelog`, `open-pr`, `new-branch`, `specialists-init`, `sync-roster`, `start-task`) is
a thin wrapper around a script — procedural mechanism, not craft, which lives in the persona/manual
context instead; Anthropic's Agent Skills model supports a third, unused level (bundled reference
material via progressive disclosure) that a future knowledge-skill could use; the discipline stays
"only where it's worth the maintenance cost," pointing at `cut-release` staying deliberately
skill-less (`scripts/sync/check-script-contract.ps1`) as the living example; and Cowork's non-code
positioning is why this code-maintenance repo rightly stays Claude-Code-centric.