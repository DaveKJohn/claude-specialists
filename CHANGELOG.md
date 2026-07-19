# Changelog

De geschiedenis van de davekjohns-workshop-marketplace: onder **Pull Requests** elke gemergde branch
met zijn PR, onder **Releases** de vastgelegde versies. Hoe het mechanisme werkt (entry-bestanden,
folden) staat in [`README.md`](README.md#bijdragen--changelog--pr-workflow).

## Pull Requests

Alles wat sinds de laatste release naar `main` is gemergd — nieuwste bovenaan, één blok per pull
request.

### #91 · Bootstrap leidt RepoName automatisch af uit de git-remote · Feat · 2026-07-19

Ergonomie-verbetering aan het `specialists-init`-bootstrap-adoptiepad (Gat B): een verse consument
hoeft de repo-naam niet langer met de hand in te vullen.

- **`bootstrap.ps1` (sectie 1c)**: nieuwe `Get-DerivedRepoName` leidt `owner/repo` af uit
  `git remote get-url origin` van de consument en vult daarmee `$script:RepoName` in de neergezette
  `scripts/repo-config.ps1`-scaffold, in plaats van de `VUL-IN/repo`-placeholder. Ondersteunt de
  HTTPS- én SSH-vorm en stript het `.git`-suffix.
- **Guardrails (advies Sean)**: de remote-URL is externe input die in een geschreven `.ps1` én in
  `gh --repo` belandt — daarom een verankerde regex, owner/repo beperkt tot een strikte slug, alleen
  `github.com`, en bij elke twijfel (niet-github host, geen remote, git niet beschikbaar) terugval op
  de `VUL-IN`-placeholder. De git-aanroep zit in een `try/catch` + `2>$null`/`$LASTEXITCODE` en laat
  de bootstrap nooit crashen (blijft additief, exit 0). `Get-LintScript` en de branch-prefix-tabel
  blijven bewust VUL-IN — die zijn niet af te leiden.
- **Schonere scaffold-kop + slotrapport**: de kop van de repo-config-scaffold en stap 2 van het
  bootstrap-rapport melden nu wat er nog handmatig moet als RepoName al is afgeleid.
- **`bootstrap-drift.tests.ps1`**: cases toegevoegd voor de afleiding (HTTPS + SSH → afgeleid, geen
  VUL-IN op de RepoName-regel) en de terugval (niet-github host + geen remote → `VUL-IN/repo`).

Plugins: specialists

[PR #91](https://github.com/DaveKJohn/davekjohns-workshop/pull/91)

---

### #90 · Onregistreerde consument krijgt niet-geregistreerd-signaal in de connectors-sessiecheck · Fix · 2026-07-19

Dicht een kern-gat in de connectors-sessiecheck dat aan het licht kwam toen een verse consument
(djcylow-react) de specialists-plugin adopteerde: een consument die **niet** in het connectors-register
staat kreeg toch de geruststellende melding "alle connectors in sync met de workshop-bron" — het
tegenovergestelde signaal van de bedoeling.

- **`scripts/sync/check-connectors.ps1`**: de `-OnlyConsumer`-zonder-match-tak gebruikte een kale
  `Write-Host` die niet als info-signaal telde (`$script:infos` bleef 0), waardoor de SessionStart-hook
  in de "in sync"-tak viel. Vervangen door `Write-Info`, zodat de regel `[INFO]` tagt en meetelt. Een
  onregistreerde consument toont nu "niet-geregistreerd: geen manifest voor deze consument in het
  register." — één info-signaal, exit 0 (de sessiestart blijft zacht, nooit een blokkade).
- **`scripts/tests/connectors.tests.ps1`**: testcase (5c) toegevoegd die de `-OnlyConsumer`-zonder-manifest-tak
  dekt — assert op het `[INFO]`-signaal, "1 info-signaal" en exit 0.

[PR #90](https://github.com/DaveKJohn/davekjohns-workshop/pull/90)

---

### #89 · connector-register bijgewerkt voor v1.9.2 (workshop gesynct, consumenten op attentie) · Chore · 2026-07-19

Werkt het connectors-register bij na de v1.9.1/v1.9.2-releases.

- **davekjohns-workshop** (consumeert zichzelf, cache op v1.9.2): `syncedVersion` `1.4.1` → `1.9.2`,
  en `06-24` (Ravi) toegevoegd aan de extension-inventaris (bestond wel, stond niet in het register).
- **life-hub** en **smartwatchbanden**: `status` → `attentie` met een gedateerde notitie dat de bron
  op v1.9.2 staat en zij nog niet gepulld hebben. `syncedVersion` **bewust ongewijzigd** — die wordt
  per doctrine pas gebumpt wanneer de consument daadwerkelijk synct (`claude plugin update` in de
  eigen sessie); het register schrijft nooit cross-repo.

[PR #89](https://github.com/DaveKJohn/davekjohns-workshop/pull/89)

---

## Releases

De vastgelegde versies van de marketplace — nieuwste bovenaan. Elke release bumpt alle
plugin-versies in lockstep en verwijst naar de volledige notes in `releases/development/`.

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
