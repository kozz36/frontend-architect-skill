# frontend-architect-skill

Frontend architecture skill definitions for AI agents (Cursor, Claude Code, Copilot). Provides strategic decisions for framework selection, rendering, state management, security (OWASP), AI-ready patterns, and Green Web sustainability.

## Versions

| Version | File | Lines | Use Case |
|---------|------|-------|----------|
| **v2.0** (Full) | [`versions/v2.0/SKILL.md`](versions/v2.0/SKILL.md) | ~556 | Complete reference for senior architects — detailed explanations, multiple patterns per section |
| **v2.0-lite** | [`versions/v2.0-lite/SKILL.md`](versions/v2.0-lite/SKILL.md) | ~385 | Rapid decisions under time constraints — tables, quick selectors, minimal narrative |
| **v1.0** | [`versions/v1.0/SKILL.md`](versions/v1.0/SKILL.md) | ~367 | Original version (pre-2026) |

## What's New in v2.0 (May 2026)

Validated against real ecosystem state (May 2026):
- ✅ **Next.js 16** (Oct 2025) — Cache Components, `updateTag`, `proxy.ts`, Turbopack stable
- ✅ **Nuxt 4** (Jul 2025) — Layers, Nitro, `useFetch` v2
- ✅ **Vitest 4** (v4.1.5) — Browser Mode native with Playwright, ARIA snapshots, visual regression
- ⚠️ **Vue 3.6 / Vapor Mode** — Beta experimental (treated accordingly)
- ✅ **OWASP Client-Side Top 10** — Real, active project
- ✅ **European Accessibility Act** — Enforcement active since June 2025

### New Domains (not in v1)
- **AI-Ready Architecture** — 5 rules so AI agents don't hallucinate when consuming your codebase
- **Client-Side Security (OWASP)** — actionable hardening table + 6-point checklist
- **Governance (ADRs)** — template + lifecycle rules for architectural traceability
- **Green Web** — carbon budget targets and optimization techniques

## Structure

```
versions/
├── v1.0/
│   └── SKILL.md          # Original version
├── v2.0/
│   └── SKILL.md          # Full version (2026)
└── v2.0-lite/
    └── SKILL.md          # Condensed version
docs/
└── CHANGELOG.md          # Version history
```

## License

Apache-2.0
