### open-pr/fold consumer-fit: configurable PR markers, optional assignee/milestone, fold -RepoRoot (#101) · Feat · 2026-07-21

Three consumer-fit gaps in the shared `open-pr.ps1` / `fold-changelog-entry.ps1` scripts,
surfaced by smartwatchbanden (inbound #101). All three are backward-compatible: a repo whose
`scripts/repo-config.ps1` does not define the new optional functions, and every existing
`fold-changelog-entry.ps1` call site, keep today's exact behavior.

1. **PR auto-fill markers are now configurable.** `open-pr.ps1` matched its description
   placeholder and its "Requested by Dave" approval checkbox against this repo's own
   (bilingual) template text. Two optional repo-config functions,
   `Get-PrDescriptionPlaceholder` and `Get-PrApprovalPattern`, let a consumer point at its own
   template markers; when absent (guarded via `Get-Command ... -ErrorAction SilentlyContinue`),
   the script falls back to this repo's current markers unchanged.
2. **Optional PR assignee/milestone.** Two more optional repo-config functions,
   `Get-PrAssignee` and `Get-PrMilestone`, are passed to `gh pr create` as `--assignee` /
   `--milestone` only when they return a non-empty value; not defined (or empty) means the
   flags are simply omitted, exactly as before. This repo defines neither.
3. **`fold-changelog-entry.ps1` gained an explicit `-RepoRoot` parameter.** Default (omitted):
   unchanged dual-context resolution (`CLAUDE_PROJECT_DIR`, else the git root). When supplied,
   it wins outright -- letting a consumer that runs the fold from a temporary/detached worktree
   (e.g. smartwatchbanden's `ship-pr.ps1`) write to that tree directly, without the
   env-var workaround.

`open-pr.ps1` and `fold-changelog-entry.ps1` are the mirrored shared scripts (source of truth
here, regenerated into the plugin mirror via `build-shared-scripts.ps1`); `scripts/repo-config.ps1`
is this repo's own file and is unchanged (the workshop keeps the built-in defaults on all four
functions).