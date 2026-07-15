### Sylvesters vakboek-les: /reload-plugins naast de herstart · Docs · 2026-07-15

Sylvesters draagbare vakboek (`05-15-manual.md`) stelde dat plugin-/subagent-wijzigingen pas bij
een herstart van Claude Code laden. In de praktijk (rooktest 15 juli 2026) blijkt `/reload-plugins`
plugins mid-sessie te herladen — subagents en skills worden direct beschikbaar, zonder herstart. De
harde regel is bijgewerkt: `/reload-plugins` als snel pad, de herstart als vertrouwde terugvaloptie,
met de kanttekening dat `CLAUDE.md`-imports en settings wél een herstart blijven vragen.