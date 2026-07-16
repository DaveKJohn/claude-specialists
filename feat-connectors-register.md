### Connectors-register: per plugin een sync-administratie van aangesloten repo's · Feat · 2026-07-16

Elke plugin draagt nu een `connectors/`-map: het register van welke repo's de plugin
geïnstalleerd hebben en of ze in sync zijn met deze repo als source of truth (CDP-model). Vijf
manifesten (metadata-only: repo, plugin, versies, extension-inventaris — nooit lens-inhoud of
absolute paden), een doctrine-README in de kern-plugin, het nieuwe
`scripts/sync/check-connectors.ps1` (two-way: enabled-check, extension-inventaris outbound én
inbound, versies tegen bron en machine-administratie, plus de bestaande drift-check per
consument) en een dependency-vrije testsuite (22 asserts). Na de reviews van Sean, Edith en
Victor gehard en aangescherpt: manifestvelden worden gevalideerd vóór gebruik (geen absolute
paden, geen pad-traversal buiten de scope-root, plugin-veld alleen als bestaande slug), de
StrictMode-crash bij een stale machine-record is gefixt en afgedekt, en de dode links in het
doctrine-README zijn hersteld. Live-run: alle vijf connectors groen.