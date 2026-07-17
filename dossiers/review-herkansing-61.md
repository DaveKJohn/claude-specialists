# Dossier — Review-herkansing op de gemergde #61-diff

> Werkbriefing voor deze branch. Opgesteld 2026-07-17 (Tessa #16, op aanwijzing van Dave).
> Dit dossier verdwijnt weer zodra het werk is afgerond en gemergd.

## Wat moet er gebeuren

[Victor #19](../.claude/extensions/06-19-extension.md) (code-review) en
[Edith #17](../.claude/extensions/06-17-extension.md) (eindredactie) draaien **parallel** een
volledige review op de gemergde diff van **PR #61** (per-plugin CHANGELOGs, commit `0c86b42` op
`main`). Concreet te reviewen oppervlak:

- de vier nieuwe pure functies in `scripts/lib/release-lib.ps1` + de twaalf nieuwe asserts in
  `scripts/tests/release-lib.tests.ps1`;
- de `Plugins:`-regel-afleiding in `scripts/release/fold-changelog-entry.ps1`;
- de per-plugin-CHANGELOG-stap in `scripts/release/cut-release.ps1` (incl. het herschrijven van
  root-relatieve links naar absolute GitHub-URLs);
- de drie seed-CHANGELOGs in `claude-code-plugins/claude-specialists/<plugin>/`;
- de doc-updates: Rendalls lens ([`05-06-extension.md`](../.claude/extensions/05-06-extension.md))
  en het root-`README.md`.

Vondsten worden op deze branch verwerkt als ze klein zijn; grote vondsten krijgen een eigen
`fix/`-branch. Geen vondsten → dan meldt de keten dat expliciet en wordt dit dossier opgeruimd.

## Waarom

- De onafhankelijke review-stap (Victor + Edith parallel op de diff) is een vaste schakel in de
  kwaliteitsketen van deze repo, maar is bij PR #61 **nooit afgerond**: de reviews liepen destijds
  vast op een agent-storing en de PR is zonder die blik gemergd.
- Sean's security-punt uit diezelfde review is wél verwerkt (de `-cmatch`-fix, PR #62); het
  code- en redactie-deel staat dus als enige nog open.
- #61 raakt het hart van het release-mechaniek (`release-lib.ps1`, fold, `cut-release.ps1`) én de
  consument-gerichte geschiedenis (per-plugin CHANGELOGs). Fouten hier propageren bij de
  eerstvolgende release naar álle consumenten — daarom hoort deze review afgerond te zijn vóór die
  release (zie het [release-dossier](release-voorbereiding.md)).

## Klaar wanneer

- [ ] Victor heeft de #61-diff gereviewd (correctheid, eenvoud, herbruik, efficiëntie).
- [ ] Edith heeft de #61-diff geredigeerd (taal, consistentie, dode links).
- [ ] Elke vondst is verwerkt (hier of op een eigen `fix/`-branch) of beargumenteerd afgewezen.
- [ ] De geheugen-notitie `openstaand-review-herkansing` kan weg; dit dossier ook.
