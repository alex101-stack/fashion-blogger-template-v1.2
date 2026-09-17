# BAF Artifact Flow

## Canonical Flow

```text
Architecture
    |
    v
Source
    |
    v
Validation
    |
    v
Testing
    |
    v
Verification
    |
    v
Baseline
    |
    v
Build
    |
    v
dist/production/
```

Every production derivative should be traceable to repository source, baseline identity, and build execution.