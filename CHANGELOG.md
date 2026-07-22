# Changelog

The history of the davekjohns-workshop marketplace: under **Pull Requests** every merged branch
with its PR, under **Releases** the recorded versions. How the mechanism works (entry files,
folding) is described in [`README.md`](README.md#contributing--changelog--pr-workflow).

## Pull Requests

Everything merged to `main` since the last release — newest at the top, one block per pull
request.

### #146 · Rename-proof lens scaffold (nameless header + propose-only reconcile) · Feat · 2026-07-22

Made a persona rename stop forcing manual header fixes in every consumer (inbound #145).

- **Nameless generated lens header.** Both scaffold generators (`sync-roster.ps1`'s `New-LensScaffold`
  and `specialists-init`'s `bootstrap.ps1`) now write the stable `# <group>-<id> · repo-lens` slug
  instead of baking the persona's first name into the header + intro. The name now lives in exactly
  one place — the agent-def's `name:` frontmatter — so a later rename can never drift a generated
  header again.
- **Propose-only header reconcile.** `check-roster-sync.ps1` detects an existing lens whose header
  still carries a stale scaffold name (`# Sean · repo-lens` after the agent became Sebastian) and
  reports it as a non-blocking `[INFO]` (silent at session start, shown on a deliberate run). The
  `sync-roster` skill parses that and prints the rename-proof, nameless replacement header to paste —
  it never rewrites the lens file, matching its propose-only stance for roster rows. Hand-customized
  headers (no `· repo-lens` tail) are never touched.
- **`Get-DisplayName` centralized** into the shared `check-report-lib.ps1` (was duplicated across
  `sync-roster.ps1` and `bootstrap.ps1`), now the single source for both the roster-row proposal and
  the header-drift comparison.
- Tests extended: nameless-scaffold assertions + stale-header detection/reconcile coverage across
  `roster-sync`, `sync-roster`, and `bootstrap-drift`.

Out of scope (noted): the persona-lens title copy in `bootstrap.ps1` (which snapshots the plugin
persona's canonical heading) still carries a name; the roster table + routing rule in a consumer's
`CLAUDE.md` remain repo-owned governance.

Plugins: specialists

[PR #146](https://github.com/DaveKJohn/davekjohns-workshop/pull/146)

---

## Releases

The recorded versions of the marketplace — newest at the top. Each release bumps all plugin
versions in lockstep and references the full notes in `releases/development/`.

### [v1.17.0] - 2026-07-22 — Minor

See [releases/development/1.17/1.17.0.md](releases/development/1.17/1.17.0.md) for the full release notes.

---

### [v1.16.0] - 2026-07-22 — Minor

See [releases/development/1.16/1.16.0.md](releases/development/1.16/1.16.0.md) for the full release notes.

---

### [v1.15.1] - 2026-07-22 — Patch

See [releases/development/1.15/1.15.1.md](releases/development/1.15/1.15.1.md) for the full release notes.

---

### [v1.15.0] - 2026-07-21 — Minor

See [releases/development/1.15/1.15.0.md](releases/development/1.15/1.15.0.md) for the full release notes.

---

### [v1.14.0] - 2026-07-21 — Minor

See [releases/development/1.14/1.14.0.md](releases/development/1.14/1.14.0.md) for the full release notes.

---

### [v1.13.0] - 2026-07-21 — Minor

See [releases/development/1.13/1.13.0.md](releases/development/1.13/1.13.0.md) for the full release notes.

---

### [v1.12.1] - 2026-07-20 — Patch

See [releases/development/1.12/1.12.1.md](releases/development/1.12/1.12.1.md) for the full release notes.

---

### [v1.12.0] - 2026-07-20 — Minor

See [releases/development/1.12/1.12.0.md](releases/development/1.12/1.12.0.md) for the full release notes.

---

### [v1.11.0] - 2026-07-20 — Minor

See [releases/development/1.11/1.11.0.md](releases/development/1.11/1.11.0.md) for the full release notes.

---

### [v1.10.0] - 2026-07-19 — Minor

See [releases/development/1.10/1.10.0.md](releases/development/1.10/1.10.0.md) for the full release notes.

---

### [v1.9.2] - 2026-07-19 — Patch

See [releases/development/1.9/1.9.2.md](releases/development/1.9/1.9.2.md) for the full release notes.

---

### [v1.9.1] - 2026-07-19 — Patch

See [releases/development/1.9/1.9.1.md](releases/development/1.9/1.9.1.md) for the full release notes.

---

### [v1.9.0] - 2026-07-19 — Minor

See [releases/development/1.9/1.9.0.md](releases/development/1.9/1.9.0.md) for the full release notes.

---

### [v1.8.0] - 2026-07-18 — Minor

See [releases/development/1.8/1.8.0.md](releases/development/1.8/1.8.0.md) for the full release notes.

---

### [v1.7.0] - 2026-07-18 — Minor

See [releases/development/1.7/1.7.0.md](releases/development/1.7/1.7.0.md) for the full release notes.

---

### [v1.6.0] - 2026-07-18 — Minor

See [releases/development/1.6/1.6.0.md](releases/development/1.6/1.6.0.md) for the full release notes.

---

### [v1.5.2] - 2026-07-18 — Patch

See [releases/development/1.5/1.5.2.md](releases/development/1.5/1.5.2.md) for the full release notes.

---

### [v1.5.1] - 2026-07-18 — Patch

See [releases/development/1.5/1.5.1.md](releases/development/1.5/1.5.1.md) for the full release notes.

---

### [v1.5.0] - 2026-07-17 — Minor

See [releases/development/1.5/1.5.0.md](releases/development/1.5/1.5.0.md) for the full release notes.

---

### [v1.4.1] - 2026-07-16 — Patch

See [releases/development/1.4/1.4.1.md](releases/development/1.4/1.4.1.md) for the full release notes.

---

### [v1.4.0] - 2026-07-16 — Minor

See [releases/development/1.4/1.4.0.md](releases/development/1.4/1.4.0.md) for the full release notes.

---

### [v1.3.0] - 2026-07-16 — Minor

See [releases/development/1.3/1.3.0.md](releases/development/1.3/1.3.0.md) for the full release notes.

---

### [v1.2.0] - 2026-07-16 — Minor

See [releases/development/1.2/1.2.0.md](releases/development/1.2/1.2.0.md) for the full release notes.

---

### [v1.1.1] - 2026-07-15 — Patch

See [releases/development/1.1/1.1.1.md](releases/development/1.1/1.1.1.md) for the full release notes.

---

### [v1.1.0] - 2026-07-15 — Minor

See [releases/development/1.1/1.1.0.md](releases/development/1.1/1.1.0.md) for the full release notes.

---

### [v1.0.0] - 2026-07-14 — Major

See [releases/development/1.0/1.0.0.md](releases/development/1.0/1.0.0.md) for the full release notes.
