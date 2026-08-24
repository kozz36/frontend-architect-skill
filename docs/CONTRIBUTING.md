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

1. Fork the repo.
2. Edit the canonical full runtime and its local references first; never use a prior lite file or archive as a source.
3. For a lite release, follow the full-to-lite derivation process below.
4. Update `docs/CHANGELOG.md` with verified changes.
5. Open a PR referencing the official verification source.

## Full-to-Lite Release Derivation

A lite release is a compact runtime derived from the exact canonical full release, not an independently authored tutorial.

1. **Full first** — finish and verify canonical full `X` plus every local reference and source-index record.
2. **Freeze inputs** — record canonical full paths and SHA-256 values. Prior lite files and archives are prohibited inputs.
3. **Inventory** — enumerate the full runtime's normative invariants, categories, and required lite anchors.
4. **Compact** — remove only duplicated rationale, long examples, exhaustive tables, and repeated links; preserve activation/exclusions, stop gates, conditional decisions, runtime boundaries, safety/legal/privacy rules, evidence handling, risks/fallbacks, and output contract.
5. **Validate** — run `scripts/validate-derived-lite.sh` and perform independent semantic coverage review; the script verifies derivation integrity, not semantic strength.
6. **Archive** — write the matching current lite archive as byte-identical `ARCHIVE.md`, outside discoverable skill surfaces.

Keep full and lite metadata at the same unpublished version. Update the derivation manifest whenever a frozen full input or generated lite byte changes.

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
