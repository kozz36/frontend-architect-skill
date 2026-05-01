# Contributing to frontend-architect-skill

This skill is a **living document**. The frontend ecosystem mutates quarterly. Stale information is worse than no information.

## What We Accept

| Change Type | Example | Likelihood of Merge |
|-------------|---------|---------------------|
| **New framework release** | "Next.js 17 shipped with X" | High (with verification) |
| **Security advisory** | "OWASP added new client-side category" | High (with source link) |
| **Correction** | "Vue 3.6 is now stable" | High (with proof) |
| **New domain** | "Edge computing patterns" | Medium (needs rationale) |
| **Rewrite for readability** | "Section X is unclear" | Medium (must keep tables) |
| **Style-only** | "Better wording" | Low (unless ambiguous) |

## What We Reject

- ❌ Unverified version claims ("I heard Nuxt 5 is coming")
- ❌ Narrative-heavy additions ("The landscape has shifted dramatically...")
- ❌ Vendor marketing copy ("Revolutionary breakthrough...")
- ❌ Breaking structural changes without discussion first

## Style Guide

This is a skill for **AI agents**, not a blog post.

### Format Rules

1. **Tables > bullet lists** for comparisons
2. **Decision trees (`if X then Y`)** over paragraphs
3. **Prohibitions (`Do NOT`, `Red Flags`)** must be explicit
4. **One concept per section** — no digressions
5. **Links to live sources** for every version claim

### Tone

- Direct. Technical. Zero marketing.
- "Avoid" → say why (memory, bundle size, hydration penalty)
- "Prefer" → say when the exception applies

## Verification Requirements

Every claim about a **version number, feature, or security status** must include one of:

- Playwright snapshot of official docs page
- Link to GitHub release/tag
- Link to CVE or security advisory
- Link to official RFC or specification

## How to Submit

1. Fork the repo
2. Edit the relevant `SKILL.md` (or create new version directory)
3. Update `docs/CHANGELOG.md` with your changes
4. Open a PR referencing the verification source

## Version Policy

- **Patch (x.x.1)** — Corrections, clarifications, link fixes
- **Minor (x.1.0)** — New sections, updated framework versions, new tools
- **Major (2.0.0 → 3.0.0)** — Structural rewrites, new paradigms, breaking recommendations

## Topics for Future Exploration

- Edge-first rendering patterns (Cloudflare Workers, Deno Deploy)
- WebAssembly integration strategies
- Micro-frontend orchestration (Module Federation 2.0)
- AI-generated component testing

If you have validated research on any of these, open an issue first to discuss scope.
