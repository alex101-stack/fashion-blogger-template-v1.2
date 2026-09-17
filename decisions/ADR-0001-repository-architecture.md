# ADR-0001: Repository Architecture

- **Status:** Accepted
- **Date:** 2026-09-17
- **Decision:** Separate editable source from generated Blogger production artifacts.

## Context

Fashion Blogger Template v1.2 combines Blogger XML/SSR with Alpine.js and GSAP client behavior.

The repository therefore requires a source tree that can be validated, tested, verified, baselined, built, and released without making generated Blogger XML the primary development source.

## Decision

The authoritative implementation source is `src/` together with the repository architecture, content, configuration, testing, validation, verification, and governance artifacts.

The production Blogger artifact belongs to `dist/production/` and is generated.

## Consequence

Production XML can be regenerated, source remains reviewable, and production artifacts can be associated with build and baseline metadata.