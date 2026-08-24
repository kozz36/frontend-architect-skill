---
name: frontend-architect
description: "Trigger: frontend architecture, rendering, state, design systems, performance, testing, a11y. Choose production UI architecture."
license: Apache-2.0
metadata:
  author: kozz36
  version: "3.1.2"
---

## Activation Contract

Use this skill for frontend architecture decisions when the agent must choose, review, or document production-ready technical direction.

- Starting or reviewing a frontend project architecture.
- Choosing framework, rendering mode, state strategy, testing baseline, or design system.
- Hardening UI delivery for performance, accessibility, security, or AI-agent maintainability.

Do not use this skill for generic explanation, copy editing, or one-off code changes that do not affect architecture or reusable implementation patterns.

## Hard Rules

- Discover repository-native authoritative sources for product constraints and quality attributes before selecting a stack. Treat `docs/product-charter.md` only as a non-mandatory example. If material constraints remain insufficient, return the missing decisions as questions and stop selection.
- Choose rendering from product constraints, not framework marketing.
- Separate server state from client UI state; do not force one store to own both.
- Treat accessibility, Core Web Vitals, and security headers as architecture, not polish.
- Keep content and core interactions functional before enabling optional platform animation, anchoring, or transition features.
- Prefer native HTML and CSS primitives when their semantics, specification maturity, and verified target-browser support fit; do not replace proven accessible behavior merely to remove JavaScript.
- Keep server-rendered output deterministic: do not read `window`, `document`, or `navigator` during server rendering or initial render evaluation.
- Prefer local, inspectable component patterns when agents must maintain the codebase.
- Keep the main answer decision-first; move deep rationale to local references instead of long inline prose.
- Verify version- or API-sensitive claims against live official sources before using them in decision guidance or presenting them in a changelog or release note.

## Decision Gates

| Need | Action |
|------|--------|
| Missing or insufficient material constraints | Return the unresolved constraints and quality-attribute questions; do not recommend a stack. |
| SEO/public content | SSR, SSG, or islands. Avoid SPA-only unless intentionally gated. |
| Internal admin | Compare SPA, SSR, and hybrid delivery by startup latency, JavaScript dependency, caching, security, hosting, and operational uniformity; lack of SEO alone does not decide rendering. |
| Controlled TypeScript boundary | Evaluate tRPC when one team controls compatible TypeScript consumers; use a versionable schema-generated contract for heterogeneous or independently released clients. |
| Design system | Headless for custom control; opinionated library for delivery speed. |
| Non-modal overlay | Prefer Popover API when its semantics and verified target-browser support fit; use `<dialog>` for modal interaction. |
| Optional modern CSS/API | Start from a complete static experience, then gate enhancement by feature support and reduced-motion preferences. |
| SSR, streaming, or islands | Require deterministic server output and isolate browser-only behavior behind client lifecycle boundaries. |

## Execution Steps

1. Discover and read repository-native authoritative sources for product constraints and quality attributes (for example, a product charter, requirements, ADRs, delivery documentation, or an existing architecture record). Extract explicit constraints, quality attributes, team capabilities, runtime, data ownership, security boundaries, and validation paths.
2. If those inputs are insufficient to discriminate between options, return the missing decisions as questions and stop.
3. Select the smallest architecture that satisfies the verified SoT inputs.
4. Read `references/technical-reference.md` when detailed matrices, native-platform patterns, anti-patterns, commands, or source links are needed.
5. State the chosen pattern, rejected alternatives, and what breaks at runtime if the choice is wrong.
6. Verify version- or API-sensitive claims against live official sources before using them in decision guidance or presenting them in a changelog or release note.

## Output Contract

Return:
- For every recommendation, the exact SoT constraint or quality attribute that justifies it.
- Alternatives rejected with concrete tradeoffs.
- Runtime risks, failure triggers, and mitigation.
- Validation steps or evidence needed before adoption.
- Missing SoT decisions as blocking questions when selection cannot be justified.

## References

- `references/technical-reference.md` — canonical full v3.1.2 technical basis for detailed decisions.
- `references/source-index.md` — official source evidence and verification dates for retained volatile claims.
