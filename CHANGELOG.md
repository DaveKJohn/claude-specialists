# Changelog

De geschiedenis van de davekjohns-workshop-marketplace: onder **Pull Requests** elke gemergde branch
met zijn PR, onder **Releases** de vastgelegde versies. Hoe het mechanisme werkt (entry-bestanden,
folden) staat in [`README.md`](README.md#contributing--changelog--pr-workflow).

## Pull Requests

Alles wat sinds de laatste release naar `main` is gemergd — nieuwste bovenaan, één blok per pull
request.

### #113 · Sweep: the git/gh stderr-under-Stop pitfall across the release scripts · Fix · 2026-07-20

Cutting v1.12.0 exposed that the #107 fix (open-pr's push) only patched one spot: the same
`$ErrorActionPreference = 'Stop'` + native-stderr-as-terminating-error pitfall lived on in the other
release scripts. `cut-release.ps1` died on `git add -A` (the autocrlf LF↔CRLF warning goes to
stderr), before its `$LASTEXITCODE` check — the release had to be finished by hand. This sweeps the
whole class.

- **`cut-release.ps1`:** the commit/tag/push block now runs under `EAP=Continue` (with a `git add`
  exit-code check that was missing), so git's chatter can't abort the release before the checks.
- **`fold-changelog-entry.ps1`** (+ mirror): the two `gh pr list`/`gh pr view --json` calls run under
  `EAP=Continue` with `2>$null`, so a `gh` notice can't terminate the fold before its graceful
  `$LASTEXITCODE` handling (and can't pollute the captured JSON). On a non-zero `gh` exit it now
  prints a one-line notice that the PR-number / Plugins-line enrichment was skipped (restoring the
  operator-visibility the raw stderr used to give — review point Victor/Sean).
- **`open-pr.ps1`** (+ mirror): the `gh pr create` call gets the same `EAP=Continue` + capture guard
  the push already had (#107).
- **Query commands left as-is:** `git rev-parse`/`git status`/`git tag --list` write results to
  stdout and only real errors to stderr, so `Stop` is correct there — deliberately not wrapped.
- **Tests:** `shared-scripts.tests.ps1` gains static regression guards that cut-release runs its
  git-mutation block under `Continue`, fold discards `gh` stderr, and open-pr guards `gh pr create`.
- **`05-15-extension.md`** (Sylvester's lens): the #107 lesson now names `git add` and the query-vs-
  mutation distinction, and records the sweep.

The live release/push/gh paths against a real remote stay an honest test-gap (not unit-testable
without a remote); the guards assert the safe shape.

Plugins: specialists

[PR #113](https://github.com/DaveKJohn/davekjohns-workshop/pull/113)

---

## Releases

De vastgelegde versies van de marketplace — nieuwste bovenaan. Elke release bumpt alle
plugin-versies in lockstep en verwijst naar de volledige notes in `releases/development/`.

### [v1.12.0] - 2026-07-20 — Minor

Zie [releases/development/1.12/1.12.0.md](releases/development/1.12/1.12.0.md) voor de volledige release-notes.

---

### [v1.11.0] - 2026-07-20 — Minor

Zie [releases/development/1.11/1.11.0.md](releases/development/1.11/1.11.0.md) voor de volledige release-notes.

---

### [v1.10.0] - 2026-07-19 — Minor

Zie [releases/development/1.10/1.10.0.md](releases/development/1.10/1.10.0.md) voor de volledige release-notes.

---

### [v1.9.2] - 2026-07-19 — Patch

Zie [releases/development/1.9/1.9.2.md](releases/development/1.9/1.9.2.md) voor de volledige release-notes.

---

### [v1.9.1] - 2026-07-19 — Patch

Zie [releases/development/1.9/1.9.1.md](releases/development/1.9/1.9.1.md) voor de volledige release-notes.

---

### [v1.9.0] - 2026-07-19 — Minor

Zie [releases/development/1.9/1.9.0.md](releases/development/1.9/1.9.0.md) voor de volledige release-notes.

---

### [v1.8.0] - 2026-07-18 — Minor

Zie [releases/development/1.8/1.8.0.md](releases/development/1.8/1.8.0.md) voor de volledige release-notes.

---

### [v1.7.0] - 2026-07-18 — Minor

Zie [releases/development/1.7/1.7.0.md](releases/development/1.7/1.7.0.md) voor de volledige release-notes.

---

### [v1.6.0] - 2026-07-18 — Minor

Zie [releases/development/1.6/1.6.0.md](releases/development/1.6/1.6.0.md) voor de volledige release-notes.

---

### [v1.5.2] - 2026-07-18 — Patch

Zie [releases/development/1.5/1.5.2.md](releases/development/1.5/1.5.2.md) voor de volledige release-notes.

---

### [v1.5.1] - 2026-07-18 — Patch

Zie [releases/development/1.5/1.5.1.md](releases/development/1.5/1.5.1.md) voor de volledige release-notes.

---

### [v1.5.0] - 2026-07-17 — Minor

Zie [releases/development/1.5/1.5.0.md](releases/development/1.5/1.5.0.md) voor de volledige release-notes.

---

### [v1.4.1] - 2026-07-16 — Patch

Zie [releases/development/1.4/1.4.1.md](releases/development/1.4/1.4.1.md) voor de volledige release-notes.

---

### [v1.4.0] - 2026-07-16 — Minor

Zie [releases/development/1.4/1.4.0.md](releases/development/1.4/1.4.0.md) voor de volledige release-notes.

---

### [v1.3.0] - 2026-07-16 — Minor

Zie [releases/development/1.3/1.3.0.md](releases/development/1.3/1.3.0.md) voor de volledige release-notes.

---

### [v1.2.0] - 2026-07-16 — Minor

Zie [releases/development/1.2/1.2.0.md](releases/development/1.2/1.2.0.md) voor de volledige release-notes.

---

### [v1.1.1] - 2026-07-15 — Patch

Zie [releases/development/1.1/1.1.1.md](releases/development/1.1/1.1.1.md) voor de volledige release-notes.

---

### [v1.1.0] - 2026-07-15 — Minor

Zie [releases/development/1.1/1.1.0.md](releases/development/1.1/1.1.0.md) voor de volledige release-notes.

---

### [v1.0.0] - 2026-07-14 — Major

Zie [releases/development/1.0/1.0.0.md](releases/development/1.0/1.0.0.md) voor de volledige release-notes.
