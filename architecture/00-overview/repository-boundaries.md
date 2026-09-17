# BAF Repository Boundaries

## Source

```text
architecture/
src/
content/
config/
tests/
scripts/
verification/
baselines/
docs/
decisions/
```

These directories contain authoritative engineering source, contracts, controls, evidence, or documentation.

## Generated

```text
dist/development/
dist/staging/
dist/production/
```

These directories contain generated artifacts.

## Prohibited

Do not use `dist/production/` as the normal source-development location.

The correct direction is:

```text
src
 -> validate
 -> test
 -> verify
 -> baseline
 -> build
 -> dist/production
```