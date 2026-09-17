# ============================================================
# FASHION BLOGGER TEMPLATE v1.2
# BAF Repository Scaffolding
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host " FASHION BLOGGER TEMPLATE v1.2" -ForegroundColor Cyan
Write-Host " BAF Repository Scaffolding" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# ------------------------------------------------------------
# ROOT
# ------------------------------------------------------------

$Root = Get-Location

# ------------------------------------------------------------
# DIRECTORIES
# ------------------------------------------------------------

$Directories = @(
    ".github",
    ".github/workflows",
    ".github/ISSUE_TEMPLATE",

    ".vscode",
    ".vscode/snippets",

    "architecture",
    "architecture/00-overview",
    "architecture/01-foundation",
    "architecture/02-data",
    "architecture/03-presentation",
    "architecture/04-state",
    "architecture/05-interaction",
    "architecture/06-animation",
    "architecture/07-content",
    "architecture/08-seo",
    "architecture/09-performance",
    "architecture/10-security",
    "architecture/11-testing",
    "architecture/12-verification",
    "architecture/13-governance",
    "architecture/14-intelligence-automation",

    "src",
    "src/blogger",
    "src/blogger/namespaces",
    "src/blogger/head",
    "src/blogger/body",
    "src/blogger/widgets",

    "src/components",
    "src/components/navbar",
    "src/components/mobile-menu",
    "src/components/hero",
    "src/components/product-card",
    "src/components/product-filter",
    "src/components/cart",
    "src/components/wishlist",
    "src/components/featured",
    "src/components/footer",

    "src/styles",

    "src/javascript",
    "src/javascript/core",
    "src/javascript/data",
    "src/javascript/state",
    "src/javascript/integrations",
    "src/javascript/services",

    "src/assets",
    "src/assets/images",
    "src/assets/icons",
    "src/assets/fonts",

    "content",
    "content/products",
    "content/products/dress",
    "content/products/tops",
    "content/products/bottoms",
    "content/products/accessories",
    "content/products/outerwear",
    "content/pages",
    "content/fixtures",
    "content/fixtures/blogger-post-fixtures",

    "config",

    "tests",
    "tests/unit",
    "tests/integration",
    "tests/browser",
    "tests/browser/chrome",
    "tests/browser/firefox",
    "tests/browser/brave",
    "tests/fixtures",

    "scripts",
    "scripts/build",
    "scripts/validation",
    "scripts/testing",
    "scripts/release",

    "verification",
    "verification/runbooks",
    "verification/evidence",
    "verification/evidence/platform",
    "verification/evidence/browser",
    "verification/evidence/runtime",
    "verification/evidence/screenshots",
    "verification/execution",

    "baselines",
    "baselines/current",
    "baselines/BL-000",
    "baselines/archive",

    "dist",
    "dist/development",
    "dist/staging",
    "dist/production",

    "docs",
    "decisions"
)

# ------------------------------------------------------------
# CREATE DIRECTORIES
# ------------------------------------------------------------

Write-Host "[1/4] Creating directory structure..." -ForegroundColor Yellow

foreach ($Directory in $Directories) {

    $Path = Join-Path $Root $Directory

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
        Write-Host "  + $Directory" -ForegroundColor Green
    }
    else {
        Write-Host "  = $Directory" -ForegroundColor DarkGray
    }
}

# ------------------------------------------------------------
# FILES
# ------------------------------------------------------------

$Files = @(
    ".gitignore",
    ".gitattributes",
    ".editorconfig",

    "README.md",
    "CHANGELOG.md",

    "package.json",

    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/CODEOWNERS",

    ".github/ISSUE_TEMPLATE/bug-report.md",
    ".github/ISSUE_TEMPLATE/feature-request.md",
    ".github/ISSUE_TEMPLATE/architecture-change.md",
    ".github/ISSUE_TEMPLATE/verification-failure.md",

    ".github/workflows/validate.yml",
    ".github/workflows/test.yml",
    ".github/workflows/build.yml",
    ".github/workflows/release.yml",

    ".vscode/settings.json",
    ".vscode/extensions.json",
    ".vscode/tasks.json",
    ".vscode/launch.json",

    ".vscode/snippets/blogger-xml.code-snippets",
    ".vscode/snippets/javascript.code-snippets",
    ".vscode/snippets/css.code-snippets",

    "architecture/00-overview/architecture-overview.md",
    "architecture/00-overview/system-context.md",
    "architecture/00-overview/architecture-principles.md",

    "architecture/01-foundation/blogger-runtime.md",
    "architecture/01-foundation/namespace-contract.md",
    "architecture/01-foundation/theme-runtime-model.md",

    "architecture/02-data/blogger-data-model.md",
    "architecture/02-data/product-data-contract.md",
    "architecture/02-data/content-metadata-contract.md",

    "architecture/03-presentation/layout-model.md",
    "architecture/03-presentation/component-model.md",
    "architecture/03-presentation/responsive-model.md",

    "architecture/04-state/alpine-state-model.md",
    "architecture/04-state/cart-state-model.md",
    "architecture/04-state/wishlist-state-model.md",

    "architecture/05-interaction/navigation-contract.md",
    "architecture/05-interaction/filter-contract.md",
    "architecture/05-interaction/checkout-contract.md",

    "architecture/06-animation/gsap-model.md",
    "architecture/06-animation/animation-contract.md",

    "architecture/07-content/blogger-content-schema.md",
    "architecture/07-content/product-post-standard.md",
    "architecture/07-content/label-taxonomy.md",

    "architecture/08-seo/metadata-model.md",
    "architecture/08-seo/open-graph-model.md",
    "architecture/08-seo/structured-data.md",

    "architecture/09-performance/performance-budget.md",
    "architecture/09-performance/loading-strategy.md",
    "architecture/09-performance/runtime-performance.md",

    "architecture/10-security/security-model.md",

    "architecture/11-testing/testing-strategy.md",
    "architecture/11-testing/test-assertions.md",
    "architecture/11-testing/browser-matrix.md",

    "architecture/12-verification/verification-matrix.md",
    "architecture/12-verification/verification-gates.md",
    "architecture/12-verification/evidence-model.md",

    "architecture/13-governance/architecture-governance.md",
    "architecture/13-governance/change-control.md",
    "architecture/13-governance/decision-records.md",

    "architecture/14-intelligence-automation/automation-model.md",
    "architecture/14-intelligence-automation/compliance-checker.md",
    "architecture/14-intelligence-automation/build-intelligence.md",

    "src/blogger/namespaces/namespaces.xml",
    "src/blogger/head/metadata.xml",
    "src/blogger/head/assets.xml",
    "src/blogger/head/libraries.xml",

    "src/blogger/body/navigation.xml",
    "src/blogger/body/hero.xml",
    "src/blogger/body/shop.xml",
    "src/blogger/body/featured.xml",
    "src/blogger/body/footer.xml",

    "src/blogger/widgets/blog.xml",
    "src/blogger/widgets/comments.xml",
    "src/blogger/widgets/sections.xml",

    "src/styles/tokens.css",
    "src/styles/reset.css",
    "src/styles/typography.css",
    "src/styles/layout.css",
    "src/styles/responsive.css",
    "src/styles/utilities.css",

    "src/javascript/core/bootstrap.js",
    "src/javascript/core/runtime.js",
    "src/javascript/core/error-handler.js",

    "src/javascript/data/product-parser.js",
    "src/javascript/data/price-parser.js",
    "src/javascript/data/badge-parser.js",

    "src/javascript/state/shop-store.js",
    "src/javascript/state/cart-store.js",
    "src/javascript/state/wishlist-store.js",

    "src/javascript/integrations/alpine.js",
    "src/javascript/integrations/gsap.js",

    "src/javascript/services/storage-service.js",
    "src/javascript/services/checkout-service.js",
    "src/javascript/services/whatsapp-service.js",

    "src/components/navbar/navbar.xml",
    "src/components/navbar/navbar.css",
    "src/components/navbar/navbar.js",

    "src/components/mobile-menu/mobile-menu.xml",
    "src/components/mobile-menu/mobile-menu.css",
    "src/components/mobile-menu/mobile-menu.js",

    "src/components/hero/hero.xml",
    "src/components/hero/hero.css",
    "src/components/hero/hero.js",

    "src/components/product-card/product-card.xml",
    "src/components/product-card/product-card.css",
    "src/components/product-card/product-card.js",

    "src/components/product-filter/product-filter.xml",
    "src/components/product-filter/product-filter.css",
    "src/components/product-filter/product-filter.js",

    "src/components/cart/cart.xml",
    "src/components/cart/cart.css",
    "src/components/cart/cart.js",

    "src/components/wishlist/wishlist.xml",
    "src/components/wishlist/wishlist.css",
    "src/components/wishlist/wishlist.js",

    "src/components/featured/featured.xml",
    "src/components/featured/featured.css",

    "src/components/footer/footer.xml",
    "src/components/footer/footer.css",

    "content/pages/about.md",
    "content/pages/lookbook.md",
    "content/pages/size-guide.md",
    "content/pages/shipping.md",
    "content/pages/returns.md",
    "content/pages/contact.md",

    "content/fixtures/products.json",

    "config/development.json",
    "config/staging.json",
    "config/production.json",
    "config/categories.json",

    "tests/unit/price-parser.test.js",
    "tests/unit/badge-parser.test.js",
    "tests/unit/cart-store.test.js",
    "tests/unit/product-parser.test.js",

    "tests/integration/product-card.test.js",
    "tests/integration/product-filter.test.js",
    "tests/integration/cart-flow.test.js",

    "tests/fixtures/index.html",
    "tests/fixtures/post.html",
    "tests/fixtures/static-page.html",

    "scripts/build/build-theme.js",
    "scripts/build/assemble.js",
    "scripts/build/minify.js",

    "scripts/validation/validate-xml.js",
    "scripts/validation/validate-namespace.js",
    "scripts/validation/validate-blogger.js",
    "scripts/validation/validate-contract.js",

    "scripts/testing/run-tests.js",
    "scripts/testing/dom-compliance-checker.js",

    "scripts/release/create-release.js",
    "scripts/release/generate-manifest.js",

    "verification/runbooks/BL-000-assembly.md",
    "verification/runbooks/PR-G1-blogger-acceptance.md",
    "verification/runbooks/PR-G2-ssr.md",
    "verification/runbooks/PR-G3-client-runtime.md",
    "verification/runbooks/PR-G4-cross-browser.md",
    "verification/runbooks/PR-G5-performance.md",
    "verification/runbooks/PR-G6-release.md",

    "verification/evidence/platform/platform-evidence-index.json",
    "verification/execution/BL-000-verification-report.md",
    "verification/execution/verification-log.json",

    "baselines/current/baseline-pointer.json",
    "baselines/BL-000/manifest.json",
    "baselines/BL-000/architecture-hash.json",
    "baselines/BL-000/verification-summary.json",

    "docs/DEVELOPMENT.md",
    "docs/CONTRIBUTING.md",
    "docs/RELEASE.md",
    "docs/TROUBLESHOOTING.md",

    "decisions/ADR-0001-repository-architecture.md",
    "decisions/ADR-0002-blogger-data-provider.md",
    "decisions/ADR-0003-alpine-state-management.md",
    "decisions/ADR-0004-theme-build-strategy.md"
)

# ------------------------------------------------------------
# CREATE FILES
# ------------------------------------------------------------

Write-Host ""
Write-Host "[2/4] Creating repository files..." -ForegroundColor Yellow

foreach ($File in $Files) {

    $Path = Join-Path $Root $File

    if (-not (Test-Path $Path)) {

        $Parent = Split-Path $Path -Parent

        if (-not (Test-Path $Parent)) {
            New-Item -ItemType Directory -Path $Parent -Force | Out-Null
        }

        New-Item -ItemType File -Path $Path -Force | Out-Null

        Write-Host "  + $File" -ForegroundColor Green
    }
    else {
        Write-Host "  = $File" -ForegroundColor DarkGray
    }
}

# ------------------------------------------------------------
# BASIC FILE CONTENT
# ------------------------------------------------------------

Write-Host ""
Write-Host "[3/4] Writing base configuration..." -ForegroundColor Yellow

@"
# FASHION BLOGGER TEMPLATE v1.2

BAF-based Blogger theme development repository.

## Architecture

Blogger XML + Alpine.js + GSAP + Custom CSS.

## Development

``````text
Source
  ↓
Validation
  ↓
Testing
  ↓
Verification
  ↓
Baseline
  ↓
Build
  ↓
Production Artifact
"@