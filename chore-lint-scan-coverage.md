### Extend dead-link scan to cover CONTRIBUTING.md and connectors/README.md · Chore · 2026-07-23

The dead-link/anchor scan in `scripts/lint/check-plugin-integrity.ps1` (check 4) had an explicit
list of scanned files that had not been updated to include two files added by the docs
redistribution in PR #159: the root `CONTRIBUTING.md` and
`claude-code-plugins/claude-specialists/connectors/README.md`. Link/anchor changes in those two
files therefore silently escaped the automatic gate — spotted by Edith during copy edit.

`CONTRIBUTING.md` now joins the existing root loop (README.md/CHANGELOG.md/CLAUDE.md); the
connectors README is added as a single, targeted addition (it is not covered by any existing glob,
since the CHANGELOG.md glob under `claude-code-plugins/claude-specialists/**` explicitly excludes
`\connectors\`, and the family README/QUICKSTART loop only targets the family root, not the
`connectors/` subfolder). The scan docstring and the check-4 comment block were updated to match.

Verified: the lint gate still passes green (0 errors) after the change, and a temporary fake dead
link + broken anchor introduced in both files was correctly reported by the gate, then reverted.