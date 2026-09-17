# BAF Repository Invariants

| ID | Invariant |
|---|---|
| INV-001 | `src/` is source of truth |
| INV-002 | `dist/production/` is derivative |
| INV-003 | Production output is generated |
| INV-004 | Tests and verification are separate |
| INV-005 | Evidence resides under `verification/` |
| INV-006 | Baseline state resides under `baselines/` |
| INV-007 | BL-000 starts as DRAFT |
| INV-008 | Product markers remain testable |
| INV-009 | Secrets are excluded |
| INV-010 | PASS requires a real check |
| INV-011 | Architecture changes require controlled review |
| INV-012 | Build output is reproducible |
| INV-013 | Generated output is disposable |
| INV-014 | Production artifacts are traceable |
| INV-015 | Evidence records actual execution |