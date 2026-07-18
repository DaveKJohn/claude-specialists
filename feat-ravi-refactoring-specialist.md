### Ravi (refactoring-specialist / DRY-bewaker) toegevoegd aan het team · Feat · 2026-07-18

Een nieuw teamlid in de `specialists`-plugin (groep 06, de vóór-de-merge-bewakers): **Ravi ♻️
#06-24**, de refactoring-specialist. Zijn vak is *single source of truth*: hij is de staande
verantwoordelijke voor duplicatie van **gedragsregels** (grenzen/werkwijzen) over agent-defs en
persona's. Zodra dezelfde regel op ≥2 plekken staat, slaat hij alarm en promoveert die tot één
gedeelde bron — beschikbaar voor de kring die de regel deelt, **niet** automatisch voor iedereen.

- **`specialists/agents/06-24-agent.md`** — de subagent-def (`@specialists:ravi`), die zelf het
  gedeelde `grens-inbound`-blok via sentinels gebruikt (dogfooding).
- **`specialists/manuals/06-24-manual.md`** — het draagbare vakboek, met "globaal = beschikbaar voor
  een deel, niet automatisch voor iedereen" als harde regel.
- **`.claude/extensions/06-24-extension.md`** — de repo-lens: wat Ravi hier bewaakt (de agent-defs +
  persona's van deze marketplace) en het `agent-shared/`-build-en-lint-mechanisme dat hij bedient.
- **Roster ingehaakt** in `CLAUDE.md`, Chris' routingtabel + twee ketens (parallelle
  kwaliteitscheck vóór PR én een eigen "duplicatie globaliseren"-keten), en het
  specialisten-handboek (`.claude/README.md`) + de root-README.

Ravi's eerste openstaande klussen: het gedeelde-blok-mechanisme uitbreiden naar de persona-sjablonen,
de Tier 2-sweep (eindbericht/gespreksgeschiedenis/branch), en een detectie-lint als
alarmbel-automatisering. Doel: het project zo klein en efficiënt mogelijk houden.
