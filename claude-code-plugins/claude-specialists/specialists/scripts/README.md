# `specialists/scripts/` — het gedeelde thuis van de workflow-scripts (in opbouw)

Deze map is het toekomstige **single source of truth**-thuis van de repo-agnostische workflow-scripts,
zodat consumenten (life-hub, smartwatchbanden, de workshop zelf) ze niet langer per repo dupliceren.
De aanleiding staat in [issue #81](https://github.com/DaveKJohn/davekjohns-workshop/issues/81).

> **Status: alleen de structuur staat er.** In deze fase is bewust nog géén script verplaatst — de
> map + de lint-bewaking zijn het fundament. De daadwerkelijke verhuizing volgt in een latere stap,
> zodra de aanroep-mechaniek gekozen is (zie hieronder).

## Wat hier straks woont — en wat niet

Een script hoort hier alleen als het **repo-agnostisch** is (geen repo-naam, geen CI-afhankelijkheid).
Repo-eigen data blijft in de consument, in `scripts/repo-config.ps1` (repo-naam, blob-URL, e.d.), en
wordt door het gecentraliseerde script ingelezen via `${CLAUDE_PROJECT_DIR}` — dat pad resolvet altijd,
ook in plugin-context.

**Blijft bewust in de root van de consument** (kan hier dus níét heen):

- Alles wat **CI** aanroept vanaf een kale checkout zónder plugin-cache (de lint-poort, de testsuites
  en hun libs). CI ziet de plugin-cache niet.
- Scripts waarvan een **root-aanroeper** afhankelijk is en die zelf nog niet is verhuisd:
  `${CLAUDE_PLUGIN_ROOT}` resolvet alléén binnen plugin-eigen componenten, niet in een root-script.
  Daarom kan `branch-info.ps1` pas mee zodra ook `open-pr.ps1` meeverhuist.

## Open ontwerpkeuze vóór de eerste verhuizing

Een script dat een mens/agent direct aanroept (zoals `new-changelog-entry.ps1`) moet vanuit de plugin
bereikbaar blijven. De weg daarvoor is een **`bin/`-wrapper op PATH** (met een `.cmd`-wrapper voor
Windows PowerShell) — het patroon dat [issue #81](https://github.com/DaveKJohn/davekjohns-workshop/issues/81)
voorstelt. Zolang die keuze niet is uitgewerkt, blijft de verhuizing bewust uitgesteld.

## Precedent

De plugin draait al `hooks/connector-sessioncheck.ps1` via `hooks/hooks.json` met `${CLAUDE_PLUGIN_ROOT}`
in élke consument, zónder registratie in het consument-`settings.json`. Datzelfde mechanisme (plus een
`bin/`-map voor los aan te roepen scripts) draagt de scripts die hierheen verhuizen.
