### Worktree parallel-PR pattern for Derek · Feat · 2026-07-24

Document in Derek's portable persona (`personas/05-05-persona.md`) the pattern for running a second
branch's full PR movement (open → merge → fold → cleanup) in an isolated `git worktree` while a
subagent is still editing the primary working tree — instead of switching the busy tree's branch out
from under it. Captures the two gotchas found in practice: keep the worktree path short (Windows
`MAX_PATH`), and fall back to `git branch -D` after verifying the merge with `git merge-base
--is-ancestor` when a pruned upstream makes `branch -d` refuse. From inbound issue #171 (source:
DaveKJohn/life-hub).
