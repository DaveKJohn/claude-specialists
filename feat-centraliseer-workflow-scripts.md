### Centraliseer workflow-scripts (SSOT): repo-config + type-bron + plugin-scripts-fundament · Feat · 2026-07-18

Eerste stappen op het SSOT-pad uit [issue #81](https://github.com/DaveKJohn/davekjohns-workshop/issues/81) (inbound van life-hub), zonder big-bang:

**Fase 0 (repo-lokaal, CI-veilig):**
- Nieuw `scripts/repo-config.ps1` als enige bron voor repo-data (`Get-RepoName`, `Get-RepoBlobUrl`). De repo-naam-hardcode is weg uit `open-pr.ps1` (1x), `fold-changelog-entry.ps1` (2x) en `cut-release.ps1` (blob-URL geinjecteerd i.p.v. de literal-default in `release-lib.ps1`).
- DRY-lek gedicht: de branch-typen (Feat/Fix/Docs/Chore) hebben nu een enige bron in `branch-info.ps1` via `Get-BranchTypes`; `release-lib.ps1` leest die i.p.v. een eigen `$catOrder`-kopie.

**Fase 1 (alleen structuur):**
- Nieuwe map `claude-code-plugins/claude-specialists/specialists/scripts/` met een README als toekomstig SSOT-thuis; de lint-parse-scan (`check-plugin-integrity.ps1`) bewaakt die map nu mee. Er is bewust nog geen script verhuisd (aanroep-mechaniek volgt later).

**Tests:** nieuwe suites `branch-info.tests.ps1` (incl. het type-SSOT-contract) en `repo-config.tests.ps1`.