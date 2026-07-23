### Record the close/reopen CI retrigger lesson (Derek lens) · Docs · 2026-07-23

Records an operational lesson in Derek #05's repo lens
(`.claude/plugins/claude-specialists/specialists/05-05-extension.md`), in the "Merging to main"
section: when the required CI check `lint-en-tests` never shows up after opening a PR (no rollup,
`mergeStateStatus` stuck at `UNKNOWN`, minutes with no workflow run — a GitHub-side hiccup firing no
run on the `pull_request opened` event), close and immediately reopen the PR
(`gh pr close` → `gh pr reopen`) to fire a fresh `reopened` run. Notes the lighter empty-commit
alternative and why close/reopen is preferred (no branch-history noise). Surfaced during PR #152.
Doc-only.