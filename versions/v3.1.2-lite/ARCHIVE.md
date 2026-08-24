---
name: frontend-architect-lite
description: "Trigger: frontend architecture, rendering, state, design systems, performance, testing, a11y. Compact production decision runtime."
license: Apache-2.0
metadata:
  author: kozz36
  version: "3.1.2"
---

## Activation and exclusions

Use for production frontend architecture choices: framework, rendering, state, design system, testing, performance, accessibility, security, privacy, or AI-maintainability.

Do not use for generic explanation, copy editing, or isolated code changes with no reusable architectural effect.

## Evidence and stop gates

1. Discover repository-native authoritative sources for product goals, constraints, quality attributes, runtime/deployment, data ownership, security/privacy boundaries, team capability, governance, and validation paths. `docs/product-charter.md` is only an example.
2. If material facts cannot discriminate between options, return the missing decisions as questions and stop. Do not recommend a stack.
3. For every release-, API-, browser-, security-, accessibility-, or legal-sensitive claim, check a live official source immediately before use. Record URL, date, exact result, and scope. A URL, specification, or past verification does not prove target support, interoperability, policy, or legal applicability.

## Decision sequence

1. Select the smallest architecture justified by named SoT constraints and quality attributes.
2. Select rendering before framework marketing: public/indexable or no-JavaScript content evaluates SSG, SSR, islands, or hybrid; non-public UI still compares SPA, SSR, and hybrid for startup, caching, security, hosting, and operations.
3. State the chosen pattern, rejected alternatives and tradeoffs, runtime failure trigger, mitigation/fallback, and validation evidence.
4. Record consequential, irreversible, cross-team, security, or operational decisions in the repository-native ADR convention; if absent, recommend a conventional location before creating one.

## Selection gates

| Need | Conditional choice and guard |
|---|---|
| Framework | Compare React, Vue, Angular, Svelte, Qwik, or an existing ecosystem by team capability, rendering, a11y, dependencies, budgets, hosting, support, lifetime, and exit cost; never choose by team size or scenario label. Angular 22, Astro 7, Next 16.3.2, Nuxt 4.5.2, Pinia 4, and Vitest patches are dated evidence only: re-check official releases before pinning. Treat a proposed Vue 3.6/Vapor status as unverified until its exact official release channel is checked. |
| Content/static | Evaluate SSG or islands; hydrate only measured interactive boundaries. |
| Dynamic/fresh | Evaluate SSR or streaming; keep server output deterministic. |
| Authenticated interaction-heavy UI | SPA is a candidate, not an automatic decision. |
| Mutations | Use progressive server form handling when behavior must work before JavaScript; use tRPC only for controlled compatible TypeScript releases; use a versioned schema contract for heterogeneous or independently released clients. |
| Design system | Use headless/owned primitives for custom behavior; use an opinionated library for delivery speed only after accessibility, bundle, customization, and upgrade checks. |
| CSS | Prefer variables, native selectors, CSS Modules, utilities, or extracted styles as constraints fit. Use CSS-in-JS only when runtime theming pays for SSR, hydration, caching, and runtime cost. Use nesting, container queries, and OKLCH only with scope, ownership, support, and fallback evidence. |
| State | Separate server query/cache state from client UI state. Start local; add a minimal shared store only for proven coordination. Do not use a client store for server authority, authorization, or durable business rules. Escalate to Redux-like state only for replay, deterministic transitions, advanced debugging, or migration needs. |

## Runtime boundaries and progressive enhancement

- SSR, streaming, Server Components, and islands require deterministic, serializable first render. Do not read `window`, `document`, `navigator`, storage, or layout APIs during server/initial render; isolate browser-only work to explicit client or post-mount boundaries and validate untrusted runtime input.
- Preserve functional, visible, keyboard-operable content before optional Popover, `<dialog>`, anchor positioning, View Transitions, `@starting-style`, discrete transitions, or scroll-driven animation. PREFER native HTML and CSS primitives when their semantics, specification maturity, and verified target-browser support fit; MUST NOT replace proven accessible behavior merely to remove JavaScript.
- Use `<dialog>` for compatible modal behavior; PREFER the Popover API for non-modal UI when its semantics and verified target-browser support fit. Gate optional behavior with feature support and test focus, dismissal, collision, BFCache/navigation, target engines, and reduced-motion fallbacks. Keep portals or accessible libraries when they solve requirements native primitives do not.
- Prefer owned, inspectable, declarative components, strict typed contracts when selected, predictable exports/names, and explicit token semantics; do not depend on tribal knowledge.

## Quality and safety gates

- **Performance:** measure budgets. In CI use reproducible LCP, CLS, TBT, and regression budgets; in production verify 75th-percentile LCP <=2.5 s, INP <=200 ms, and CLS <=0.1 through RUM/CrUX. TBT is a lab diagnostic, not production INP proof. Split/defer measured non-urgent work, reserve images, and profile interaction-heavy paths.
- **Testing:** use unit/component, browser-boundary, end-to-end, and visual tests as the risk requires. Isolate browser contexts; use role selectors and no fixed sleeps. Compare screenshots in a fixed browser, OS, font, viewport, and rendering environment; deliberately separate platform baselines.
- **Accessibility and legal:** use WCAG 2.2 AA as engineering baseline, not automatic legal compliance. Test keyboard operation, visible/unobscured focus, contrast, target size, automated checks, and assistive technology. A 24 x 24 CSS-pixel target has WCAG conditions; 44 x 44 is a stronger product baseline, not an AA rule. Before legal claims map product/service, operator, jurisdiction, applicable standard, exemption, national transposition, transition, and qualified legal review.
- **Security and privacy:** MUST treat security headers as architecture, not polish. Assume a compromised client. Enforce authorization server-side; do not trust routes or flags. Classify data, minimize retention, protect offline/local data by sensitivity, and do not expose server secrets or reusable bearer credentials in JavaScript-accessible storage without an explicit threat model and compensating controls. Use `HttpOnly; Secure` cookies when appropriate; choose and test SameSite from navigation, cross-site, CSRF, and identity-flow risk. Set dependency-audit thresholds from severity, exploitability, reachability, asset sensitivity, policy, and expiring owned exceptions. Avoid unsafe HTML sinks, sanitize only required untrusted markup, use threat-modelled CSP, and keep sensitive data out of URLs.
- **Sustainability and tooling:** select workspace, package manager, monorepo, and build tooling from deployment and measured output constraints; preserve compatible existing tooling unless migration benefit is demonstrated. Treat carbon only as an explicit SoT quality attribute with a measurement baseline, traffic model, and improvement budget.

## Evidence, risks, and output

Reject or escalate CSS-in-JS without its runtime justification, global state for server data, custom ARIA without automated and assistive-technology validation, build migration without measured benefit, unsupported essential enhancement, browser globals in initial render, credential leakage, undocumented consequential decisions, and legal claims without scope evidence.

Return:
- exact SoT constraint or quality attribute for every recommendation;
- chosen architecture and rejected alternatives with concrete tradeoffs;
- runtime/security/accessibility/legal failure triggers, impact, mitigation, fallback, and owner where relevant;
- live-source/version evidence plus validation steps; and
- blocking missing decisions when selection cannot be justified.
