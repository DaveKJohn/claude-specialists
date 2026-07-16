# Changelog

De geschiedenis van de davekjohns-workshop-marketplace: onder **Pull Requests** elke gemergde branch
met zijn PR, onder **Releases** de vastgelegde versies. Hoe het mechanisme werkt (entry-bestanden,
folden) staat in [`README.md`](README.md#bijdragen--changelog--pr-workflow).

## Pull Requests

Alles wat sinds de laatste release naar `main` is gemergd — nieuwste bovenaan, één blok per pull
request.

### #54 · Inbound-route geformaliseerd: issue met label inbound voor kern-verbeterpunten uit connectors · Docs · 2026-07-16

De vaste inbound-route vastgelegd in de connectors-doctrine én in de gedeelde kern zelf: ontdekt
een sessie in een consumerende repo kern-verbeterpunten, dan bouwt die niet zelf maar opent een
issue op deze repo met het label `inbound` (nieuw issue-sjabloon
`.github/ISSUE_TEMPLATE/inbound-verbeterpunt.md`; label aangemaakt op GitHub). De route staat nu
ook repo-neutraal in Chris' persona-body (`personas/01-01-persona.md`), zodat elke consument-sessie
hem kent zodra de persona-bodies daar ververst zijn; de workshop-eigen Chris-kopie is daarbij
volledig gelijkgetrokken met de bron (de parallel-werk-sectie ontbrak daar nog — zelf-drift die
geen check dekte). Een tijdelijke lens-notitie blijft de enige legitieme overbrugging aan
consument-zijde.

[PR #54](https://github.com/DaveKJohn/davekjohns-workshop/pull/54)

---

## Releases

De vastgelegde versies van de marketplace — nieuwste bovenaan. Elke release bumpt alle
plugin-versies in lockstep en verwijst naar de volledige notes in `releases/development/`.

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
