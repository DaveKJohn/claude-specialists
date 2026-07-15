### cut-release vindt plugin-manifesten weer na de familie-herstructurering · Fix · 2026-07-15

`cut-release.ps1` zocht plugin-manifesten alleen in top-level-mappen
(`<repo>/<map>/.claude-plugin/plugin.json`) en vond er sinds de familie-herstructurering
(`claude-code-plugins/<familie>/<plugin>/`) nul — waardoor het snijden van v1.1.0 strandde op
"Geen plugin-manifesten gevonden". `Get-PluginManifests` zoekt nu recursief, met dezelfde
detectie als de lint-poort (`\.claude-plugin\plugin.json`-match). Bekende test-gap: deze functie
woont in het script zelf en valt buiten de release-lib-tests.