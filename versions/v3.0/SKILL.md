---
name: frontend-architect
description: "Trigger: frontend architecture, rendering, state, design systems, performance, testing, a11y. Choose production UI architecture."
license: Apache-2.0
metadata:
  author: kozz36
  version: "3.0"
---

## Activation Contract

Use this skill for frontend architecture decisions when the agent must choose, review, or document production-ready technical direction.

- Starting or reviewing a frontend project architecture.
- Choosing framework, rendering mode, state strategy, testing baseline, or design system.
- Hardening UI delivery for performance, accessibility, security, or AI-agent maintainability.

Do not use this skill for generic explanation, copy editing, or one-off code changes that do not affect architecture or reusable implementation patterns.

## Hard Rules

- Choose rendering from product constraints, not framework marketing.
- Separate server state from client UI state; do not force one store to own both.
- Treat accessibility, Core Web Vitals, and security headers as architecture, not polish.
- Prefer local, inspectable component patterns when agents must maintain the codebase.
- Keep the main answer decision-first; move deep rationale to local references instead of long inline prose.
- Verify new version/API claims before adding them to changelogs or decision guidance.

## Decision Gates

| Need | Action |
|------|--------|
| SEO/public content | SSR, SSG, or islands. Avoid SPA-only unless intentionally gated. |
| Internal admin | SPA is usually simpler; SSR adds hydration cost without SEO value. |
| Multi-client typed boundary | tRPC or schema-generated clients when one contract serves several consumers. |
| Design system | Headless for custom control; opinionated library for delivery speed. |

## Execution Steps

1. Identify product constraints, team skill, runtime, data ownership, security boundary, and validation path.
2. Select the smallest architecture that satisfies those constraints.
3. Read `references/technical-reference.md` when detailed matrices, anti-patterns, commands, or source links are needed.
4. State the chosen pattern, rejected alternatives, and what breaks at runtime if the choice is wrong.
5. Add or update changelog entries only for verified technical changes.

## Output Contract

Return:
- Recommended decision and why.
- Alternatives rejected with concrete tradeoffs.
- Runtime risks, failure triggers, and mitigation.
- Validation steps or evidence needed before adoption.

## References

- `references/technical-reference.md` — curated technical basis for v3.0 decisions.
- `references/source-index.md` — source links and verification status for version-sensitive claims.
