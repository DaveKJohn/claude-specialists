### Test-poort in open-pr.ps1: alle suites draaien voor elke PR · Feat · 2026-07-16

De les van PR #54 (een rode testsuite viel pas op CI op) geborgd volgens de automation-first-regel:
`open-pr.ps1` draait na de lint-poort nu ook een **test-poort** — alle `scripts/tests/*.tests.ps1`,
exact zoals CI — en blokkeert de push + PR bij een falende suite (`-SkipTests` is de noodklep).
Dereks lens en de safety-invulling in `CLAUDE.md` beschrijven de dubbele poort.