### Slim down CLAUDE.md: system description moves to plugin READMEs, CLAUDE.md references them · Docs · 2026-07-21

`CLAUDE.md` is made plugin-independent where the described content already lives elsewhere: the
special-case blockquote, the "who does what" intro, the loading-strategy paragraph, the workshop
identity paragraph, and the full repo-layout bullet list are shortened to a sentence or two with a
pointer to the root `README.md` (new `### Repo layout` subsection, merged into "What lives here and
what doesn't") or the family README. The "lazy" trait paragraph is shortened and now points to the
`README.md` "Shared agent-def blocks" section instead of repeating the mechanism inline. All Safety
rules, General working practices, the safety implementation, the header rule, the roster/routing
table, the "repo consumes itself" caveat, and the `@`-imports are untouched. The `## The Claude
Specialists — who does what` heading text and its "Loading strategy" sentence that Nolan's lens
(`06-25-extension.md`) cites are kept verbatim so that citation and anchor stay intact.