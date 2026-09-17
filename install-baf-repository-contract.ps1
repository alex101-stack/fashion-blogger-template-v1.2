# ============================================================
# BAF REPOSITORY CONTRACT v1.0
# FASHION BLOGGER TEMPLATE v1.2
# INSTALLER
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " BAF REPOSITORY CONTRACT v1.0" -ForegroundColor Cyan
Write-Host " FASHION BLOGGER TEMPLATE v1.2" -ForegroundColor Cyan
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

$Root = (Get-Location).Path

Write-Host "[BOOT] Repository:" -ForegroundColor Yellow
Write-Host "       $Root" -ForegroundColor White
Write-Host ""

# ------------------------------------------------------------
# STEP 1
# ------------------------------------------------------------

Write-Host "[1/5] Checking repository..." -ForegroundColor Yellow

if (-not (Test-Path ".git")) {
    throw "This directory is not a Git repository."
}

if (-not (Test-Path "package.json")) {
    throw "package.json was not found."
}

if (-not (Test-Path "architecture")) {
    throw "architecture directory was not found."
}

if (-not (Test-Path "config")) {
    throw "config directory was not found."
}

if (-not (Test-Path "scripts")) {
    throw "scripts directory was not found."
}

Write-Host "      Repository structure OK" -ForegroundColor Green
Write-Host ""

# ------------------------------------------------------------
# STEP 2
# ------------------------------------------------------------

Write-Host "[2/5] Creating contract directories..." -ForegroundColor Yellow

$Directories = @(
    "architecture/00-overview",
    "config",
    "scripts/validation",
    "decisions"
)

foreach ($Directory in $Directories) {

    $Path = Join-Path $Root $Directory

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
        Write-Host "      CREATED  $Directory" -ForegroundColor Green
    }
    else {
        Write-Host "      EXISTS   $Directory" -ForegroundColor DarkGray
    }
}

Write-Host ""

# ------------------------------------------------------------
# STEP 3
# ------------------------------------------------------------

Write-Host "[3/5] Creating machine-readable contract..." -ForegroundColor Yellow

$ContractJson = @(
    '{'
    '  "contractId": "BAF-REPOSITORY-CONTRACT",'
    '  "version": "1.0.0",'
    '  "repository": {'
    '    "name": "fashion-blogger-template-v1.2",'
    '    "packageVersion": "1.2.0"'
    '  },'
    '  "sourceOfTruth": ['
    '    "architecture/",'
    '    "src/",'
    '    "content/",'
    '    "config/",'
    '    "tests/",'
    '    "scripts/",'
    '    "verification/",'
    '    "baselines/",'
    '    "docs/",'
    '    "decisions/"'
    '  ],'
    '  "generatedArtifacts": ['
    '    "dist/development/",'
    '    "dist/staging/",'
    '    "dist/production/"'
    '  ],'
    '  "requiredCommands": ['
    '    "validate",'
    '    "validate:xml",'
    '    "validate:blogger",'
    '    "test",'
    '    "test:dom",'
    '    "build",'
    '    "release"'
    '  ],'
    '  "baseline": {'
    '    "current": "BL-000",'
    '    "initialStatus": "DRAFT"'
    '  },'
    '  "invariants": ['
    '    "INV-001",'
    '    "INV-002",'
    '    "INV-003",'
    '    "INV-004",'
    '    "INV-005",'
    '    "INV-006",'
    '    "INV-007",'
    '    "INV-008",'
    '    "INV-009",'
    '    "INV-010",'
    '    "INV-011",'
    '    "INV-012",'
    '    "INV-013",'
    '    "INV-014",'
    '    "INV-015"'
    '  ]'
    '}'
) -join [Environment]::NewLine

[System.IO.File]::WriteAllText(
    (Join-Path $Root "config/repository-contract.json"),
    $ContractJson,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host "      CREATED  config/repository-contract.json" -ForegroundColor Green
Write-Host ""

# ------------------------------------------------------------
# STEP 4
# ------------------------------------------------------------

Write-Host "[4/5] Creating repository contract documents..." -ForegroundColor Yellow

$ContractDocument = @(
    '# BAF Repository Contract v1.0'
    ''
    '**Repository:** `fashion-blogger-template-v1.2`'
    ''
    '**Contract:** `BAF-REPOSITORY-CONTRACT`'
    ''
    '**Version:** `1.0.0`'
    ''
    '**Baseline:** `BL-000`'
    ''
    '**Baseline Status:** `DRAFT`'
    ''
    '---'
    ''
    '## 1. Purpose'
    ''
    'This contract defines the structural, ownership, artifact-flow, validation, testing, verification, baseline, and change-control rules for the repository.'
    ''
    'The repository is the engineering workspace for Fashion Blogger Template v1.2.'
    ''
    'The runtime architecture separates Blogger XML as platform/data provider and SSR, Alpine.js as client-side reactive state and interaction, GSAP as animation, and CSS as presentation.'
    ''
    '---'
    ''
    '## 2. Source of Truth'
    ''
    'The authoritative editable implementation lives under:'
    ''
    '```text'
    'architecture/'
    'src/'
    'content/'
    'config/'
    'tests/'
    'scripts/'
    'verification/'
    'baselines/'
    'docs/'
    'decisions/'
    '```'
    ''
    '`dist/production/` is a generated derivative artifact.'
    ''
    'Production output MUST NOT become the source of truth.'
    ''
    '---'
    ''
    '## 3. Repository Responsibilities'
    ''
    '| Directory | Responsibility |'
    '|---|---|'
    '| `architecture/` | Architecture contracts, models, rules, governance |'
    '| `src/` | Editable implementation source |'
    '| `content/` | Product/page/content fixtures |'
    '| `config/` | Machine-readable configuration and contracts |'
    '| `tests/` | Automated tests |'
    '| `scripts/` | Build, validation, testing, release automation |'
    '| `verification/` | Evidence and execution records |'
    '| `baselines/` | Baseline identity and architectural state |'
    '| `dist/` | Generated artifacts |'
    '| `docs/` | Engineering documentation |'
    '| `decisions/` | Architecture Decision Records |'
    ''
    '---'
    ''
    '## 4. Canonical Artifact Flow'
    ''
    '```text'
    'Architecture'
    '     |'
    '     v'
    'Source'
    '     |'
    '     v'
    'Validation'
    '     |'
    '     v'
    'Testing'
    '     |'
    '     v'
    'Verification'
    '     |'
    '     v'
    'Baseline'
    '     |'
    '     v'
    'Build'
    '     |'
    '     v'
    'dist/production/'
    '     |'
    '     v'
    'Blogger Deployment'
    '```'
    ''
    'The reverse flow from production artifact back into source is prohibited as a normal development workflow.'
    ''
    '---'
    ''
    '## 5. Validation Commands'
    ''
    '```text'
    'npm run validate'
    'npm run validate:xml'
    'npm run validate:blogger'
    'npm test'
    'npm run test:dom'
    'npm run build'
    'npm run release'
    '```'
    ''
    'A command is a meaningful gate only when its implementation performs the intended check.'
    ''
    '---'
    ''
    '## 6. Runtime Contract'
    ''
    '```text'
    'Blogger'
    '  -> data provider / SSR / platform runtime'
    ''
    'Alpine.js'
    '  -> reactive state / interaction'
    ''
    'GSAP'
    '  -> animation'
    ''
    'CSS'
    '  -> presentation'
    '```'
    ''
    'Client-side behavior MUST account for Blogger SSR and route/view context.'
    ''
    '---'
    ''
    '## 7. Product Content Contract'
    ''
    'Supported product marker conventions include:'
    ''
    '```text'
    '[PRICE:275000]'
    '[PRICE:275000,350000]'
    '[BADGE:NEW]'
    '[BADGE:SALE]'
    '[BADGE:HOT]'
    '```'
    ''
    'Marker parsing belongs to the data/content layer and MUST remain independently testable.'
    ''
    '---'
    ''
    '## 8. Verification Boundary'
    ''
    '`tests/` determines whether implementation behavior meets test assertions.'
    ''
    '`verification/` records evidence that platform/runtime requirements were actually executed and satisfied.'
    ''
    'A planned test MUST NOT be recorded as executed evidence.'
    ''
    '---'
    ''
    '## 9. Baseline Boundary'
    ''
    '`BL-000` starts as `DRAFT`.'
    ''
    'It MUST NOT become `ACTIVE` merely because the project builds.'
    ''
    'Promotion requires the applicable validation, testing, verification, evidence, and manifest chain.'
    ''
    '---'
    ''
    '## 10. Repository Invariants'
    ''
    '1. `src/` remains the editable implementation source.'
    '2. `dist/production/` remains generated.'
    '3. Production output is generated by the build pipeline.'
    '4. Testing and verification remain separate.'
    '5. Evidence resides under `verification/`.'
    '6. Baseline state resides under `baselines/`.'
    '7. BL-000 cannot become ACTIVE solely because a build succeeds.'
    '8. Product marker parsing remains testable.'
    '9. Secrets MUST NOT be committed.'
    '10. PASS requires a real check.'
    '11. Architecture boundary changes require controlled review.'
    '12. Generated output must be reproducible.'
    '13. Development/staging output remains disposable.'
    '14. Production artifacts must remain traceable.'
    '15. Evidence must represent actual execution.'
    ''
    '---'
    ''
    '## 11. Status'
    ''
    '```text'
    'BAF Repository Contract v1.0'
    'Status: INSTALLED'
    'Baseline: BL-000'
    'Baseline Status: DRAFT'
    ''
    'Next Stage: BAF Architecture Contract'
    '```'
) -join [Environment]::NewLine

[System.IO.File]::WriteAllText(
    (Join-Path $Root "architecture/00-overview/BAF-Repository-Contract-v1.0.md"),
    $ContractDocument,
    (New-Object System.Text.UTF8Encoding($false))
)

$Boundaries = @(
    '# BAF Repository Boundaries'
    ''
    '## Source'
    ''
    '```text'
    'architecture/'
    'src/'
    'content/'
    'config/'
    'tests/'
    'scripts/'
    'verification/'
    'baselines/'
    'docs/'
    'decisions/'
    '```'
    ''
    'These directories contain authoritative engineering source, contracts, controls, evidence, or documentation.'
    ''
    '## Generated'
    ''
    '```text'
    'dist/development/'
    'dist/staging/'
    'dist/production/'
    '```'
    ''
    'These directories contain generated artifacts.'
    ''
    '## Prohibited'
    ''
    'Do not use `dist/production/` as the normal source-development location.'
    ''
    'The correct direction is:'
    ''
    '```text'
    'src'
    ' -> validate'
    ' -> test'
    ' -> verify'
    ' -> baseline'
    ' -> build'
    ' -> dist/production'
    '```'
) -join [Environment]::NewLine

$ArtifactFlow = @(
    '# BAF Artifact Flow'
    ''
    '## Canonical Flow'
    ''
    '```text'
    'Architecture'
    '    |'
    '    v'
    'Source'
    '    |'
    '    v'
    'Validation'
    '    |'
    '    v'
    'Testing'
    '    |'
    '    v'
    'Verification'
    '    |'
    '    v'
    'Baseline'
    '    |'
    '    v'
    'Build'
    '    |'
    '    v'
    'dist/production/'
    '```'
    ''
    'Every production derivative should be traceable to repository source, baseline identity, and build execution.'
) -join [Environment]::NewLine

$Invariants = @(
    '# BAF Repository Invariants'
    ''
    '| ID | Invariant |'
    '|---|---|'
    '| INV-001 | `src/` is source of truth |'
    '| INV-002 | `dist/production/` is derivative |'
    '| INV-003 | Production output is generated |'
    '| INV-004 | Tests and verification are separate |'
    '| INV-005 | Evidence resides under `verification/` |'
    '| INV-006 | Baseline state resides under `baselines/` |'
    '| INV-007 | BL-000 starts as DRAFT |'
    '| INV-008 | Product markers remain testable |'
    '| INV-009 | Secrets are excluded |'
    '| INV-010 | PASS requires a real check |'
    '| INV-011 | Architecture changes require controlled review |'
    '| INV-012 | Build output is reproducible |'
    '| INV-013 | Generated output is disposable |'
    '| INV-014 | Production artifacts are traceable |'
    '| INV-015 | Evidence records actual execution |'
) -join [Environment]::NewLine

[System.IO.File]::WriteAllText(
    (Join-Path $Root "architecture/00-overview/repository-boundaries.md"),
    $Boundaries,
    (New-Object System.Text.UTF8Encoding($false))
)

[System.IO.File]::WriteAllText(
    (Join-Path $Root "architecture/00-overview/artifact-flow.md"),
    $ArtifactFlow,
    (New-Object System.Text.UTF8Encoding($false))
)

[System.IO.File]::WriteAllText(
    (Join-Path $Root "architecture/00-overview/repository-invariants.md"),
    $Invariants,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host "      CREATED  repository contract documents" -ForegroundColor Green
Write-Host ""

# ------------------------------------------------------------
# STEP 5
# ------------------------------------------------------------

Write-Host "[5/5] Creating architecture decision record..." -ForegroundColor Yellow

$ADR = @(
    '# ADR-0001: Repository Architecture'
    ''
    '- **Status:** Accepted'
    '- **Date:** 2026-09-17'
    '- **Decision:** Separate editable source from generated Blogger production artifacts.'
    ''
    '## Context'
    ''
    'Fashion Blogger Template v1.2 combines Blogger XML/SSR with Alpine.js and GSAP client behavior.'
    ''
    'The repository therefore requires a source tree that can be validated, tested, verified, baselined, built, and released without making generated Blogger XML the primary development source.'
    ''
    '## Decision'
    ''
    'The authoritative implementation source is `src/` together with the repository architecture, content, configuration, testing, validation, verification, and governance artifacts.'
    ''
    'The production Blogger artifact belongs to `dist/production/` and is generated.'
    ''
    '## Consequence'
    ''
    'Production XML can be regenerated, source remains reviewable, and production artifacts can be associated with build and baseline metadata.'
) -join [Environment]::NewLine

[System.IO.File]::WriteAllText(
    (Join-Path $Root "decisions/ADR-0001-repository-architecture.md"),
    $ADR,
    (New-Object System.Text.UTF8Encoding($false))
)

Write-Host "      CREATED  decisions/ADR-0001-repository-architecture.md" -ForegroundColor Green
Write-Host ""

Write-Host "==================================================" -ForegroundColor Cyan
Write-Host " BAF REPOSITORY CONTRACT INSTALLED" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next:" -ForegroundColor Yellow
Write-Host "  npm run validate"
Write-Host ""