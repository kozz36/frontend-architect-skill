# Changelog

## [v3.1.2] - 2026-08-24

### Fixed
- Removed the mandatory `docs/product-charter.md` prerequisite. Stack selection now discovers repository-native authoritative product and constraint sources and blocks only when material constraints remain insufficient.
- Replaced fixed ADR storage and PR-only review instructions with repository-native convention discovery and conventional fallbacks only when no convention exists.
- Refreshed volatile release evidence: Angular 22, Astro 7, Vue 3.6 status handling, Next.js 16.3.2, Nuxt 4.5.2, Pinia 4, and the current Vitest patch. Repaired the retired Astro reference URL.
- Scoped EAA/legal, browser-storage/SameSite, and dependency-audit guidance to their governing jurisdiction, product, threat-model, data-classification, reachability, severity, and policy conditions.

### Added
- Added canonical installable `skills/frontend-architect` and `skills/frontend-architect-lite` catalogs.
- Added the machine-readable full-to-lite derivation manifest and PR validation script for version, frozen-input hash, mapped-anchor, archive, discoverability, and prior-lite-input checks.

### Changed
- Made `skills/` the sole authoritative, current, and installable skills.sh surface: both canonical skills release as v3.1.2. `versions/` is immutable archive-only history, not a parity, default-listing, supported full-depth discovery, or installation surface.
- Renamed the seven archived `versions/**/SKILL.md` snapshots to byte-preserved `versions/**/ARCHIVE.md` files so historical content remains available without exposing an installable skill surface.
- Regenerated `frontend-architect-lite` from the frozen canonical full runtime, technical reference, and source index; the v3.1.2 lite archive is byte-identical and non-discoverable.

### Verification
- Official URLs and observed release/status snapshots are recorded with 2026-08-24 verification dates in the canonical source index.
- `scripts/validate-derived-lite.sh` verifies machine-checkable derivation integrity; independent review remains responsible for semantic-strength assessment.

## [v3.1.1] - 2026-07-20

### Fixed
- Separated CI laboratory budgets from production Core Web Vitals and RUM/CrUX validation.
- Corrected WCAG 2.5.8, EAA scope, MPA View Transitions eligibility, browser storage, cookie, and dependency-audit guidance.
- Replaced stale or categorical framework, rendering, tRPC, TypeScript, ADR, visual-regression, and sustainability heuristics with constraint-based gates.
- Added primary-specification maturity and claim-level source traceability for the corrected guidance.

### Verification
- Independent read-only audit result: 0 BLOCKER, 0 HIGH, 0 MEDIUM findings.

## [v3.1] - 2026-07-20

### Added
- Added native-platform decision guidance for Popover API, CSS Anchor Positioning, `@starting-style`, scroll-driven animations, and View Transition API.
- Added defensive progressive-enhancement rules, reduced-motion handling, and deterministic SSR boundaries.
- Added verified July 2026 source records for Core Web Vitals, WCAG 2.2, and the European Accessibility Act.

### Changed
- Prioritized INP as the field interactivity outcome while retaining TBT as a lab proxy.
- Expanded accessibility guidance for target size and focus not obscured without presenting WCAG as automatic legal compliance.
- Kept native APIs conditional on semantics, browser support, and tested fallbacks instead of treating them as universal replacements.

## [v3.0] - 2026-05-15

### Added
- Added `versions/v3.0/SKILL.md` using the skill-creator compact runtime contract.
- Added `versions/v3.0/references/technical-reference.md` as the curated v3.0 technical basis.
- Added `versions/v3.0/references/source-index.md` for source links and verification status.

### Changed
- Validated v3.0 technical reference against current May 2026 sources and corrected stale or over-strong claims.
- Curated v3.0 references so they are robust local technical bases rather than historical lite dumps.
- Preserved existing lite versions for backward compatibility; v3.0 is the new references-based skill version.

## [v2.0] & [v2.0-lite] - 2026-05-01

### Added
- **AI-Ready Architecture** — 5 concrete rules for structuring codebases consumed by AI agents (Cursor, Claude Code). `strict: true` as anti-hallucination contract, source ownership, predictable naming.
- **Client-Side Security (OWASP)** — actionable hardening table covering Broken Access Control, Cryptographic Failures, Vulnerable Components, XSS. Includes 6-point Security Checklist.
- **Governance: ADRs** — Architecture Decision Records template with lifecycle rules (Proposed → Accepted → Deprecated → Obsolete). Designed for RAG ingestion by AI assistants.
- **Green Web** — carbon budget targets (0.36g CO2/view), optimization techniques, auditing tools (CO2.js, Digital Beacon, Lighthouse).
- **Server Actions vs. tRPC** — detailed comparison table for mutation strategies in 2026.
- **Vitest 4 Browser Mode** — documented native browser testing with Playwright provider, ARIA snapshots, visual regression built-in.
- **Next.js 16** — Cache Components, `updateTag`, `refresh()`, `proxy.ts` (ex-middleware), Turbopack stable.
- **Nuxt 4** — Layers for modular monorepo, Nitro engine, `useFetch` v2.

### Changed
- **Vue entry** — Vue 3.6/Vapor Mode explicitly marked as beta/experimental. Production recommendation remains Vue 3.5+.
- **Framework table** — Updated market share data for 2025-2026.
- **Red Flags** — Expanded from 5 to 9 rules, adding security and governance prohibitions.
- **Decision Framework** — Quick Stack Selector updated with Next.js 16 and Nuxt 4 recommendations.

### Removed / Deprecations
- No removals. v1 content preserved under `versions/v1.0/`.

### Verifications
All version claims validated via Playwright and delegations against live sources (May 2026):
- ✅ nextjs.org/blog/next-16 — confirmed real
- ✅ nuxt.com/docs/4.x — confirmed real
- ✅ vitest.dev (v4.1.5) — confirmed real
- ✅ owasp.org Top 10 Client-Side — confirmed real
- ✅ commission.europa.eu EAA — confirmed real
- ⚠️ vuejs.org (v3.6.0-beta.10) — confirmed beta, NOT production-ready
