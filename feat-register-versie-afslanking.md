### Connectors-register afgeslankt: versie-boekhouding eruit · Feat · 2026-07-20

Vervolg op de stillere sessiestart (#99): de `syncedVersion`-boekhouding in het
connectors-register dupliceerde cijfers die de check al uit het machine-record
(`installed_plugins.json`) leest, en leverde daardoor louter administratieve onderhouds-PR's op
(zoals #98) zonder dat iemand de bijbehorende signalen nog zag. Besluit Dave: het register
beperkt zich tot wat de checks daadwerkelijk consumeren.

- **`connectors/*.json` (alle drie):** de velden `syncedVersion`, `lastChecked` en `status` zijn
  verwijderd. Wat blijft: `repo`, `visibility`, `localCheckout`, de `extensions`-inventaris per
  plugin en `notes` als menselijke toelichting.
- **`check-connectors.ps1`:** stap 4 (manifest-versie vs. bron, een `[INFO]`) is vervallen; de
  machine-record-check — die de échte geïnstalleerde versie tegen de bron legt en bij achterstand
  een `[FOUT]` geeft — blijft ongewijzigd, net als de extension- en drift-checks.
- **`connectors.tests.ps1`:** het fixture-manifest volgt het afgeslankte schema.
- **`connectors/README.md`:** manifest-format en doctrine bijgewerkt, met de expliciete regel
  dat het manifest bewust geen versie-boekhouding kent.

Wat je hieraan merkt: syncen van een consument vraagt geen register-PR meer; alleen een
inhoudelijke wijziging (een lens erbij/eraf, een nieuwe consument, een notitie) raakt het
register nog.
