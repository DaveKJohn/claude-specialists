# Changelog

De geschiedenis van de claude-specialists-marketplace: onder **Pull Requests** elke gemergde branch
met zijn PR, onder **Releases** de vastgelegde versies. Hoe het mechanisme werkt (entry-bestanden,
folden) staat in [`README.md`](README.md#bijdragen--changelog--pr-workflow).

## Pull Requests

Alles wat sinds de laatste release naar `master` is gemergd — nieuwste bovenaan, één blok per pull
request.

## Releases

De vastgelegde versies van de marketplace — nieuwste bovenaan. Elke release bumpt alle
plugin-versies in lockstep, bundelt de sinds de vorige release gemergde pull requests en
tagt de staat als `vX.Y.Z`.

### v1.0.0 · 2026-07-14

14 pull requests in deze release:

- #14 · Release rechtstreeks op master (geen branch/PR): cut-release.ps1 herzien · Chore · 2026-07-14 — [PR #14](https://github.com/DaveKJohn/claude-specialists/pull/14)
- #13 · cut-release.ps1 parse-fout gefixt + parse-check aan de lint-poort toegevoegd · Fix · 2026-07-14 — [PR #13](https://github.com/DaveKJohn/claude-specialists/pull/13)
- #12 · Repo-brede release-pijplijn: cut-release.ps1 (lockstep-versiebump, git-tag, CHANGELOG-Releases) · Feat · 2026-07-14 — [PR #12](https://github.com/DaveKJohn/claude-specialists/pull/12)
- #11 · LICENSE (MIT) en .gitignore toegevoegd · Chore · 2026-07-14 — [PR #11](https://github.com/DaveKJohn/claude-specialists/pull/11)
- #10 · README-migratiestatus geactualiseerd: alle drie de groepen gemigreerd · Docs · 2026-07-14 — [PR #10](https://github.com/DaveKJohn/claude-specialists/pull/10)
- #9 · Shopify-domeingroep: 3 manuals naar specialists-shopify/manuals/, agent-defs naar plugin + repo-extensie · Feat · 2026-07-14 — [PR #9](https://github.com/DaveKJohn/claude-specialists/pull/9)
- #8 · Repo consumeert nu zelf het specialisten-team (groep 1) + volwaardige CLAUDE.md · Feat · 2026-07-14 — [PR #8](https://github.com/DaveKJohn/claude-specialists/pull/8)
- #7 · groep-1 (gedeelde kern): 10 manuals gereconcilieerd naar specialists/manuals/, agent-defs naar plugin + repo-extensie · Feat · 2026-07-14 — [PR #7](https://github.com/DaveKJohn/claude-specialists/pull/7)
- #6 · life-hub-domeingroep: draagbaar vakboek naar specialists-lifehub/manuals/, agent-defs verwijzen nu naar plugin + repo-extensie · Feat · 2026-07-14 — [PR #6](https://github.com/DaveKJohn/claude-specialists/pull/6)
- #5 · changelog + PR-workflow geport vanuit life-hub (branch-lib, scripts, plugin-lint, PR-template, CHANGELOG-backfill) · Feat · 2026-07-14 — [PR #5](https://github.com/DaveKJohn/claude-specialists/pull/5)
- #4 · start-task-skill toegevoegd aan specialists-shopify · Feat · 2026-07-14 — [PR #4](https://github.com/DaveKJohn/claude-specialists/pull/4)
- #3 · marketplace opgesplitst in drie plugin-groepen (core + lifehub + shopify) · Feat · 2026-07-14 — [PR #3](https://github.com/DaveKJohn/claude-specialists/pull/3)
- #2 · Consumptie-sectie bijwerken naar github-source · Docs · 2026-07-14 — [PR #2](https://github.com/DaveKJohn/claude-specialists/pull/2)
- #1 · drift-lint voor gedeelde agent-defs (optie e) · Feat · 2026-07-14 — [PR #1](https://github.com/DaveKJohn/claude-specialists/pull/1)
