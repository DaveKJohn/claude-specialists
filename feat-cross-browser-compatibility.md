### Cross-browser compatibility as a standard rule for the browser-facing builders · Feat · 2026-07-21

New shared behavioral rule for the browser-facing builders: what they build must work in all major
browsers (Chrome, Firefox, Safari, Edge), not only the one they happened to preview in. Landed as a
new canonical source block, `claude-code-plugins/claude-specialists/agent-shared/browser-compatibility.md`,
carried into the agent defs of the four specialists who share it — Gwen #12 (Front-End Designer),
Liam #20 (Liquid Developer), Cody #13 (App Developer), Vera #11 (Data Analyst) — via the existing
`agent-shared/` sentinel mechanism, plus a matching prose paragraph in each of their portable
manuals (`04-12-manual.md`, `specialists-shopify/manuals/04-20-manual.md`, `04-13-manual.md`,
`04-11-manual.md`) describing the cross-browser check in that specialist's own context.