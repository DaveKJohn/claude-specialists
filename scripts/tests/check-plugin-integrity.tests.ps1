<#
.SYNOPSIS
    Regression test for check 4 (dead-link/anchor scan) of scripts/lint/check-plugin-integrity.ps1:
    guards that root CONTRIBUTING.md and claude-code-plugins/claude-specialists/connectors/README.md
    stay part of the scanned file set.

.DESCRIPTION
    Context: both files used to be silently SKIPPED by check 4's file list -- a coverage gap nobody
    noticed until it was found by inspection and fixed (CONTRIBUTING.md alongside the original set;
    the connectors README as a follow-up spotted by Edith, #159 follow-up). The risk this test
    guards against is not "does the link scanner work" (that engine is exercised implicitly by every
    other suite's lint-gate smoke check, e.g. agent-shared.tests.ps1 / bootstrap-drift.tests.ps1) but
    the narrower, easy-to-silently-regress thing: if someone later refactors the $linkFiles list in
    check-plugin-integrity.ps1 and drops one of these two files again, that must fail loudly here
    instead of the gap reappearing unnoticed.

    Mechanism (grounded in the REAL script, not a re-implementation of its logic -- same idea as
    script-contract.tests.ps1's "copy the real dependency" pattern): a throwaway fixture repo root
    gets a copy of the real check-plugin-integrity.ps1 plus its two dot-sourced dependencies
    (agent-shared-lib.ps1, shared-scripts-lib.ps1) at the same relative paths, so the script runs
    for real as a child process against the fixture. The fixture is deliberately otherwise empty
    (no marketplace.json, no plugins, no agent defs) -- checks 1/2/3/3b/3c/6/7 simply find nothing to
    check, and check 8 always reports its 8 shared-script pairs as "missing" against this minimal
    fixture (expected noise, asserted on nowhere below). Only check 4's per-file link errors are
    asserted on, so that noise does not affect the outcome.

    Scenario A: a deliberately dead relative link is placed inside BOTH CONTRIBUTING.md and the
    connectors README, plus a THIRD markdown file at the fixture root that is NOT in check 4's file
    list (a decoy, proving the scan is scope-limited by design, not "catches everything by
    accident"). Asserts: both target files' dead links are reported, the decoy's is not.
    Scenario B: the dead links in CONTRIBUTING.md / the connectors README are fixed (removed) --
    asserts the two specific findings disappear, proving the failure in scenario A was genuinely
    driven by that file's content (not a false positive / accidental match).

    Test gap (honest): this does not re-exercise the anchor-slug logic (GitHub heading-slug rules)
    or the full scan engine end-to-end -- that is already covered elsewhere (Get-HeadingSlugs is
    exercised implicitly by the repo-wide lint-gate smoke checks in agent-shared.tests.ps1 and
    bootstrap-drift.tests.ps1). This suite narrowly guards file-set COVERAGE for these two files.

        powershell -NoProfile -ExecutionPolicy Bypass -File scripts/tests/check-plugin-integrity.tests.ps1

    Pure ASCII (repo convention for .ps1).
#>
$ErrorActionPreference = 'Stop'

$RepoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$IntegritySrc      = Join-Path $RepoRoot 'scripts\lint\check-plugin-integrity.ps1'
$AgentSharedLibSrc = Join-Path $RepoRoot 'scripts\lib\agent-shared-lib.ps1'
$SharedScriptsLibSrc = Join-Path $RepoRoot 'scripts\lib\shared-scripts-lib.ps1'
$Fixture = Join-Path ([System.IO.Path]::GetTempPath()) ("check-plugin-integrity-test-$PID")

$script:pass = 0
$script:fail = 0

function Assert-Equal {
    param($Expected, $Actual, [string]$Name)
    if ($Expected -eq $Actual) {
        $script:pass++; Write-Host "  [PASS] $Name" -ForegroundColor Green
    } else {
        $script:fail++; Write-Host "  [FAIL] $Name`n         expected: '$Expected'`n         got:      '$Actual'" -ForegroundColor Red
    }
}

function Assert-True {
    param([bool]$Condition, [string]$Name)
    if ($Condition) {
        $script:pass++; Write-Host "  [PASS] $Name" -ForegroundColor Green
    } else {
        $script:fail++; Write-Host "  [FAIL] $Name" -ForegroundColor Red
    }
}

function Invoke-Integrity {
    param([string]$FixtureRoot)
    $scriptPath = Join-Path $FixtureRoot 'scripts\lint\check-plugin-integrity.ps1'
    $out = & powershell -NoProfile -ExecutionPolicy Bypass -File $scriptPath 2>&1
    return [pscustomobject]@{ Code = $LASTEXITCODE; Out = ($out -join "`n") }
}

$Utf8NoBom = New-Object System.Text.UTF8Encoding $false
$deadLink = './this-file-does-not-exist-xyz.md'

try {
    if (Test-Path -LiteralPath $Fixture) { Remove-Item -Recurse -Force -LiteralPath $Fixture }
    New-Item -ItemType Directory -Path (Join-Path $Fixture 'scripts\lint') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $Fixture 'scripts\lib') -Force | Out-Null
    New-Item -ItemType Directory -Path (Join-Path $Fixture 'claude-code-plugins\claude-specialists\connectors') -Force | Out-Null

    Copy-Item -Path $IntegritySrc -Destination (Join-Path $Fixture 'scripts\lint\check-plugin-integrity.ps1') -Force
    Copy-Item -Path $AgentSharedLibSrc -Destination (Join-Path $Fixture 'scripts\lib\agent-shared-lib.ps1') -Force
    Copy-Item -Path $SharedScriptsLibSrc -Destination (Join-Path $Fixture 'scripts\lib\shared-scripts-lib.ps1') -Force

    # --- Scenario A: dead links in the two target files + a decoy outside the scan set --------------
    Write-Host "check 4 coverage -- CONTRIBUTING.md + connectors README are IN the scan set" -ForegroundColor Cyan
    $contributingBroken = "# Contributing`n`nSee [nope]($deadLink) for details.`n"
    [System.IO.File]::WriteAllText((Join-Path $Fixture 'CONTRIBUTING.md'), $contributingBroken, $Utf8NoBom)
    $connectorsBroken = "# Connectors`n`nSee [nope]($deadLink) for details.`n"
    [System.IO.File]::WriteAllText((Join-Path $Fixture 'claude-code-plugins\claude-specialists\connectors\README.md'), $connectorsBroken, $Utf8NoBom)
    # Decoy: same dead link, but in a file that check 4 does NOT scan -- proves the two hits below
    # are due to CONTRIBUTING.md / the connectors README specifically being in the file list, not
    # some accidental blanket scan of every .md file in the fixture.
    $decoyBroken = "# Decoy`n`nSee [nope]($deadLink) for details.`n"
    [System.IO.File]::WriteAllText((Join-Path $Fixture 'NOTES.md'), $decoyBroken, $Utf8NoBom)

    $a = Invoke-Integrity -FixtureRoot $Fixture
    Assert-Equal 1 $a.Code 'scenario A: exit 1 (findings present)'
    Assert-True ($a.Out -match [regex]::Escape('.\CONTRIBUTING.md') -and $a.Out -match '\[link\]') 'CONTRIBUTING.md dead link is reported'
    Assert-True ($a.Out -match [regex]::Escape('.\claude-code-plugins\claude-specialists\connectors\README.md')) 'connectors README dead link is reported'
    Assert-True (-not ($a.Out -match [regex]::Escape('NOTES.md'))) 'decoy NOTES.md (outside the scan set) is NOT reported -- proves the scan is scope-limited, not accidental'

    # --- Scenario B: fix both dead links -- the two specific findings disappear ----------------------
    Write-Host "check 4 coverage -- fixing the dead links removes exactly those findings" -ForegroundColor Cyan
    $contributingFixed = "# Contributing`n`nNothing to link to here.`n"
    [System.IO.File]::WriteAllText((Join-Path $Fixture 'CONTRIBUTING.md'), $contributingFixed, $Utf8NoBom)
    $connectorsFixed = "# Connectors`n`nNothing to link to here.`n"
    [System.IO.File]::WriteAllText((Join-Path $Fixture 'claude-code-plugins\claude-specialists\connectors\README.md'), $connectorsFixed, $Utf8NoBom)

    $b = Invoke-Integrity -FixtureRoot $Fixture
    Assert-True (-not ($b.Out -match [regex]::Escape('.\CONTRIBUTING.md') + '.*dead link')) 'CONTRIBUTING.md dead-link finding is gone once fixed'
    Assert-True (-not ($b.Out -match [regex]::Escape('.\claude-code-plugins\claude-specialists\connectors\README.md') + '.*dead link')) 'connectors README dead-link finding is gone once fixed'
} finally {
    if (Test-Path -LiteralPath $Fixture) { Remove-Item -Recurse -Force -LiteralPath $Fixture -ErrorAction SilentlyContinue }
}

Write-Host ""
if ($script:fail -gt 0) {
    Write-Host "FAILS: $($script:fail) failed, $($script:pass) passed." -ForegroundColor Red
    exit 1
}
Write-Host "OK: all $($script:pass) asserts passed." -ForegroundColor Green
exit 0
