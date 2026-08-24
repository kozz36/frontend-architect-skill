---
name: frontend-architect
description: "Trigger: frontend architecture, rendering, state, design systems, performance, testing, a11y. Choose production UI architecture."
license: Apache-2.0
metadata:
  author: kozz36
  version: "3.1"
---

## Activation Contract

Use this skill for frontend architecture decisions when the agent must choose, review, or document production-ready technical direction.

- Starting or reviewing a frontend project architecture.
- Choosing framework, rendering mode, state strategy, testing baseline, or design system.
- Hardening UI delivery for performance, accessibility, security, or AI-agent maintainability.

Do not use this skill for generic explanation, copy editing, or one-off code changes that do not affect architecture or reusable implementation patterns.

## Hard Rules

- Read `docs/product-charter.md` before selecting a stack. If it is missing or lacks sufficient product constraints and quality attributes, return the missing decisions as questions and stop selection.
- Choose rendering from product constraints, not framework marketing.
- Separate server state from client UI state; do not force one store to own both.
- Treat accessibility, Core Web Vitals, and security headers as architecture, not polish.
- Keep content and core interactions functional before enabling optional platform animation, anchoring, or transition features.
- Prefer native HTML and CSS primitives for semantics, overlays, positioning, and motion when they satisfy the verified browser matrix; do not replace proven accessible behavior merely to remove JavaScript.
- Keep server-rendered output deterministic: do not read `window`, `document`, or `navigator` during server rendering or initial render evaluation.
- Prefer local, inspectable component patterns when agents must maintain the codebase.
- Keep the main answer decision-first; move deep rationale to local references instead of long inline prose.
- Verify version- or API-sensitive claims against live sources before using them in decision guidance.

## Decision Gates

| Need | Action |
|------|--------|
| Missing or insufficient product charter | Return the unresolved constraints and quality-attribute questions; do not recommend a stack. |
| SEO/public content | SSR, SSG, or islands. Avoid SPA-only unless intentionally gated. |
| Internal admin | SPA is usually simpler; SSR adds hydration cost without SEO value. |
| Multi-client typed boundary | tRPC or schema-generated clients when one contract serves several consumers. |
| Design system | Headless for custom control; opinionated library for delivery speed. |
| Non-modal overlay | Prefer Popover API when its semantics and browser matrix fit; use `<dialog>` for modal interaction. |
| Optional modern CSS/API | Start from a complete static experience, then gate enhancement by feature support and reduced-motion preferences. |
| SSR, streaming, or islands | Require deterministic server output and isolate browser-only behavior behind client lifecycle boundaries. |

## Execution Steps

1. Read `docs/product-charter.md` and extract explicit constraints, quality attributes, team capabilities, runtime, data ownership, security boundaries, and validation paths.
2. If those inputs are insufficient to discriminate between options, return the missing decisions as questions and stop.
3. Select the smallest architecture that satisfies the verified SoT inputs.
4. Read `references/technical-reference.md` when detailed matrices, native-platform patterns, anti-patterns, commands, or source links are needed.
5. State the chosen pattern, rejected alternatives, and what breaks at runtime if the choice is wrong.
6. Record version-sensitive decisions only after live-source verification.

## Output Contract

Return:
- For every recommendation, the exact SoT constraint or quality attribute that justifies it.
- Alternatives rejected with concrete tradeoffs.
- Runtime risks, failure triggers, and mitigation.
- Validation steps or evidence needed before adoption.
- Missing SoT decisions as blocking questions when selection cannot be justified.

## References

- `references/technical-reference.md` — curated technical basis for v3.1 decisions.
- `references/source-index.md` — source links and verification status for version-sensitive claims.
