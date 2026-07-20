# Changelog

De geschiedenis van de davekjohns-workshop-marketplace: onder **Pull Requests** elke gemergde branch
met zijn PR, onder **Releases** de vastgelegde versies. Hoe het mechanisme werkt (entry-bestanden,
folden) staat in [`README.md`](README.md#contributing--changelog--pr-workflow).

## Pull Requests

Alles wat sinds de laatste release naar `main` is gemergd — nieuwste bovenaan, één blok per pull
request.

### #105 · Workshop switched to English — phase A: foundation docs · Feat · 2026-07-20

Dave is sharing the plugin worldwide, so everything living in this repo switches to English
(decision 2026-07-20). History (folded changelog entries, `releases/`) stays as written. In
sessions, specialists reply in the language the user writes in — that policy now lives in
`CLAUDE.md` under "### Language" (replacing "### Taal"). Note: that section is **new policy**
(decided today), not a translation of the old one-line rule.

- **Translated in this phase:** `CLAUDE.md` (the constitution, rules preserved verbatim in
  meaning), the root `README.md`, the family README, `QUICKSTART.md`, the connectors README,
  the `notes` fields of the three connector manifests, both GitHub templates, the specialists
  handbook and all twelve repo lenses.
- **Deliberately left for phase B** (coupled to scripts/tests): the plugin content itself
  (agent defs, manuals, personas, skills, `agent-shared/`), machine-recognized markers
  (`VUL-IN`, the lens-only blockquote, `[FOUT]`/`[DRIFTED]` tokens, the literal
  `## Eigen aan deze repo` slot marker where quoted), script output and the CHANGELOG/releases
  intro texts that the fold/release scripts parse. Same for three literal strings in
  `.github/pull_request_template.md` that `open-pr.ps1` matches for its PR-body auto-fill
  (the description placeholder comment, "Changelog entry-bestand aangemaakt", "Aangevraagd
  door Dave") — caught in security review; in phase B the script learns both languages before
  the template fully switches.
- All internal links and anchors were reconciled after translation; the lint gate (link + anchor
  scan) and all seven test suites pass.

[PR #105](https://github.com/DaveKJohn/davekjohns-workshop/pull/105)

---

## Releases

De vastgelegde versies van de marketplace — nieuwste bovenaan. Elke release bumpt alle
plugin-versies in lockstep en verwijst naar de volledige notes in `releases/development/`.

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
