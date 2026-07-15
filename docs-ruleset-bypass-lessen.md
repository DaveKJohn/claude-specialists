### Ruleset-lessen geborgd: bypass-zichtbaarheid en de Write-bypass van main-ci-poort · Docs · 2026-07-15

Twee lessen uit het instellen van de repo-ruleset `main-ci-poort` (de CI-check `lint-en-tests` als
required status check op `main`) geborgd in `research/plugin-sharing/vervolgstappen.md`: de
**ruleset-verificatie-les** (het `bypass_actors`-veld is alleen zichtbaar voor repo-admins — een
niet-admin-account ziet een gevulde bypass-list als leeg; verifieer daarom als het account dat gaat
pushen, via `current_user_can_bypass`) en de **Write-bypass-kanttekening** (de Write-rol staat bewust
in de bypass-list omdat werk-account `davekokbwj` op een persoonlijke repo geen admin kan zijn;
veilig zolang er geen externe collaborators zijn, daarna herzien). Daarnaast is de ruleset zelf als
blijvende staat vastgelegd in Sylvesters repo-lens (`.claude/extensions/05-15-extension.md`), bij de
CI-poort-beschrijving.