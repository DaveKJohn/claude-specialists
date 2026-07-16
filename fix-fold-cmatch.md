### Fold-plugindetectie hoofdlettergevoelig gemaakt (advies Sean) · Fix · 2026-07-16

Sean's advies uit de review van #61 verwerkt: de plugin-detectie in `fold-changelog-entry.ps1`
gebruikt nu `-cmatch` in plaats van het case-insensitieve `-match`, zodat de
kleine-letters-tekenklasse doet wat hij belooft en een vreemd-gecapitaliseerd pad geen ruis in de
`Plugins:`-regel kan zetten. Cosmetisch/defensief; het schrijfpad was al veilig.