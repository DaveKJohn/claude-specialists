# Dossier — Persona-drift: uitzoeken en een doctrine vastleggen

> Werkbriefing voor deze branch. Opgesteld 2026-07-17 (Tessa #16, op aanwijzing van Dave).
> Dit dossier verdwijnt weer zodra het werk is afgerond en gemergd.

## Wat moet er gebeuren

**Stap 1 — uitzoeken ([Rebecca #07](../.claude/extensions/03-07-extension.md)).** De
connectors-check (`scripts/sync/check-connectors.ps1`) meldt persona-drift bij beide consumenten:

| Consument | Drifted persona's |
|---|---|
| `DaveKJohn/life-hub` | `01-01` (Chris), `03-02`, `05-05` (Derek), `05-06` (Rendall) |
| `davekokbwj/smartwatchbanden` | `01-01` (Chris), `05-05` (Derek), `05-06` (Rendall) |

Per drifted persona vaststellen: is de afwijking **bewuste repo-eigen aanpassing** (de consument
heeft zijn lens/persona doelbewust anders ingericht) of **achterstand** (de canonieke bron in de
plugin is doorontwikkeld en de kopie is blijven staan)? Concreet: de body-diff per bestand
bekijken en de aard van de afwijking benoemen. Let op: life-hub-werk gebeurt op Dave's andere
machine — hier alleen lezen, niets in de consument-repo's wijzigen.

**Stap 2 — doctrine vastleggen ([Tessa #16](../.claude/extensions/06-16-extension.md)).** Op basis
van de bevindingen een regel formuleren en documenteren (in het
[connectors-README](../claude-code-plugins/claude-specialists/connectors/README.md) en/of de
persona-sjablonen): hoe markeert een consument een **bewust afwijkende** persona zodat de check die
niet elke sessie opnieuw als ruis meldt, en hoe blijft **echte achterstand** wél zichtbaar?
Mogelijke richtingen (keuze bij uitvoering, met Dave): een marker in de persona-frontmatter, een
veld in het connector-manifest, of een uitgebreidere check-uitvoer. Raakt de oplossing
`check-consumer-drift.ps1`/`check-connectors.ps1`, dan schuift dat deel naar
[Sylvester #15](../.claude/extensions/05-15-extension.md) + [Tycho #18](../.claude/extensions/04-18-extension.md)
(script + tests) en wordt deze branch mogelijk geherclassificeerd.

## Waarom

- De drift-melding is nu **informatief** (telt niet mee in de exit-code) en verschijnt bij elke
  sessiestart. Zonder doctrine went het team aan de ruis — en precies dan wordt échte achterstand
  (een persona die een belangrijke bron-update mist) onzichtbaar.
- Het onderscheid bewust/achterstand is nooit vastgesteld; de melding is daardoor nu niet
  actionable.
- Dit wordt urgenter zodra **collega's als consument aansluiten**: die hebben de context van "dit
  is waarschijnlijk bewust" niet en moeten op de check kunnen vertrouwen.

## Klaar wanneer

- [ ] Per drifted persona is vastgesteld: bewust of achterstand (bevindingen in dit dossier of in
      het uitvoerings-PR beschreven).
- [ ] Achterstand is gemeld als werkpunt (sync in de betreffende consument-repo, op de juiste
      machine).
- [ ] De doctrine staat in de docs (connectors-README en/of persona-sjablonen) en de check gedraagt
      zich ernaar.
- [ ] Dit dossier is opgeruimd.
