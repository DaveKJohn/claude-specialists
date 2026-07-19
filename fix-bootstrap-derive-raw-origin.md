### Bootstrap leest de origin rauw via git config (immuun voor insteadOf, CI stabiel) · Fix · 2026-07-19

Verhelpt de kern-oorzaak van de flaky RepoName-afleiding-test (opvolger van #94): de bootstrap las de
origin via `git remote get-url`, dat **`insteadOf`-herschrijvingen toepast**. CI-runners (en sommige
dev-machines) zetten zulke regels globaal, en welke vorm ze produceren (kale https, token-https,
`ssh://`) verschilt per run — waardoor de afleiding intermittent op VUL-IN terugviel en de test soms
faalde. De brede regex (#94) verzachtte dat maar nam de onvoorspelbaarheid niet weg.

- **`bootstrap.ps1`**: leest de origin nu via `git config --get remote.origin.url`, dat de **rauwe**
  opgeslagen URL teruggeeft en `insteadOf` volledig negeert — exact wat de consument configureerde,
  immuun voor de git-config van de machine.
- **`bootstrap-drift.tests.ps1`**: de flaky git-config-isolatie (lege global/system) is verwijderd
  (niet meer nodig); de zes afleiding-cases blijven. Bewezen: de suite slaagt nu ook onder een actief
  vijandige `insteadOf` die `git@github.com:`/`ssh://` naar een token-https herschrijft.

Geen gedragswijziging voor consumenten met een gewone origin; puur een deterministische, machine-
onafhankelijke afleiding.