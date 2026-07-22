### group per-plugin CHANGELOG + RELEASE.md by category, short labels · Feat · 2026-07-22

The consumer-facing release output now groups entries by category, matching the full release notes.
Previously only `Build-ReleaseNotes` (the `releases/development/*.md` notes) grouped by type; the
per-plugin `CHANGELOG.md` sections and `RELEASE.md` cards listed entries flat. Introduced a single
source for the category order + labels (`Get-ReleaseCategories`) and a shared renderer
(`Format-CategorizedEntries`), used by all three generators. Labels shortened to `Features`,
`Fixes`, `Documentation`, `Maintenance`, `Other` (Dave's decision), applied everywhere including the
full notes. Heading nesting follows the container: single-release views (full notes + `RELEASE.md`
card) use `## <Category>` -> `### <entry>`; the stacked per-plugin `CHANGELOG.md` uses
`## v<X.Y.Z>` -> `### <Category>` -> `#### <entry>`. The `RELEASE.md` card also drops its redundant
inner `## v<X.Y.Z>` line (the `# Release v<X.Y.Z>` header already states the version). Takes effect
from the next release; the already-cut v1.15.1 artifacts are unchanged. Tests extended (release-lib
108 asserts): updated category-label + nesting assertions plus new coverage for the shared helpers.