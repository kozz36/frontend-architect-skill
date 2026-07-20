# Frontend Architecture Technical Reference

This is the curated v3.1 technical basis for architecture decisions. It contains the detailed matrices, decision trees, anti-patterns, commands, and operational guidance that are intentionally too large for `../SKILL.md`.

## How to Use This Reference

- Read `../SKILL.md` first for activation, hard rules, and output contract.
- Use this file only when a decision needs deeper technical detail.
- Treat every named technology and stack below as a candidate baseline, not a default. Adopt it only when a cited constraint or quality attribute from `docs/product-charter.md` satisfies its stated criteria.
- Treat version-sensitive claims as requiring verification through `source-index.md` before making new recommendations.

## Reference Scope

Framework, rendering, design system, state, performance, testing, accessibility, security, and governance decisions.

## Provenance

This reference was curated upstream for v3.0 from a prior lite edition. This project-local import contains only the v3.0 runtime skill and its required references.

---

## 1. Framework Selection

### Framework Reality (validated May 2026)

| Framework | Share | Bundle | Best For |
|-----------|-------|--------|----------|
| React 19.2.x | Stable | Medium | Talent pool, enterprise, Next.js ecosystem |
| Vue 3.5+ | ~18% | Small | Full-stack teams, pragmatic apps |
| Angular 21 | Active (v21.2.x) | Large | Strict structure, large distributed teams |
| Svelte 5.55.x | Stable | Tiny | Performance-first, content sites |
| Qwik | Niche | ~0 hydration | E-commerce, content |

**Vue 3.6 Vapor Mode is still beta** as of May 2026; Vue 3.5.x remains the stable production baseline.

```
React    → Large team, existing ecosystem, Next.js
Vue 3    → Small/mid team, backend devs, admin panels
Angular  → Enterprise, strict typing mandated
Svelte 5 → Performance #1 priority, greenfield
Qwik     → E-commerce, resumability needed
```

---

## 2. Rendering Strategy & Meta-Frameworks

### Decision Tree

```
SEO required?
  YES → SSR/SSG
    Static content?     → SSG (Astro, Next.js static)
    Dynamic content?  → SSR (Next.js, Nuxt, SvelteKit)
    Mix?              → Islands (Astro) or Hybrid (Next.js PPR)
  NO → SPA (admin panels, internal tools)

Admin panel?
  → Vite + Vue/React SPA (no SEO, auth-gated)
```

### Meta-Frameworks

| Framework | Best For | Caveat |
|-----------|----------|--------|
| Next.js 16.2.x | React SSR/SSG, Server Actions, Turbopack | Some advanced paths are Vercel-optimized; self-hosting is supported |
| Nuxt 4.4.x | Vue full-stack, Layers monorepo | No Vue exp? skip |
| Astro 5 | Content, minimal JS (Cloudflare-backed) | Not for SPAs |
| SvelteKit | Svelte, low-JS app architecture | Svelte learning curve |
| Remix | Forms, progressive enhancement, standards-first | Not for static |

**Next.js 16 (Oct 2025)**: `Cache Components`, `updateTag` for read-your-writes,
`proxy.ts` (ex-middleware), Turbopack stable.

**Nuxt 4.4.x (May 2026)**: Vue full-stack framework with Vite default, Nitro engine, and Layers.

### Mutations: Server Actions vs. tRPC

| | Server Actions (Next.js) | tRPC v11+ |
|---|---|---|
| **Best for** | Forms, e-commerce, single-client | Multi-client (web+mobile+CLI), SaaS dashboards |
| **Progressive Enhancement** | ✅ Works without JS | ❌ Needs JS |
| **Type safety** | Good | End-to-end |
| **Batching** | Sequential | Parallel |

```tsx
// Server Actions: mutation + instant revalidation
'use server'
import { updateTag } from 'next/cache'
export async function saveProfile(userId: string, data: Profile) {
  await db.users.update(userId, data)
  updateTag(`user-${userId}`) // Fresh data in same request
}
```

---

## 3. Design Systems & Styling

### Headless vs Opinionated

```
Full design control? → Radix UI / Ark UI / Headless UI + Tailwind CSS
Fast delivery?       → PrimeVue 4 (Vue) / MUI (React) / Ant Design
Admin panels?
  Vue  → PrimeVue 4 (DataTable, native dark mode)
  React → shadcn/ui + TanStack Table
```

**shadcn/ui** = component generator (copies source into your repo). Not an NPM dependency.
- AI-ready: LLMs infer patterns from owned source code
- Built on Radix (a11y) + Tailwind (styling)
- Vue equivalent: PrimeVue 4 with Aura theme

### Conditional Styling Baselines

| Approach | Adopt When |
|----------|------------|
| Tailwind CSS v4 | Utility-first delivery, token conventions, and team capability are explicit SoT constraints. |
| CSS Modules | Explicit CSS ownership, component isolation, or migration compatibility outweigh utility-class velocity. |
| CSS-in-JS (Styled, Emotion) | Runtime theming requirements justify its SSR and hydration cost. |
| Panda CSS | Typed styling is required while zero-runtime extraction is a verified build constraint. |

**Dark mode baseline**: prefer CSS variables and framework-native selectors when the SoT requires theming; use runtime switching only when user-specific dynamic behavior cannot be expressed in CSS.

### Native Platform Baseline

- Use native CSS nesting where it improves locality, but do not treat it as a replacement for naming, scope, cascade layers, or component ownership.
- Use container queries for component-local adaptation and media queries for viewport, input, motion, contrast, print, and other environment-level concerns.
- Prefer OKLCH for authored design tokens and perceptual transformations when the supported browser matrix permits it; preserve tested fallbacks when required by the product charter.
- Progressive enhancement is mandatory: unsupported optional CSS must leave content visible, operable, and correctly positioned.

### Overlays and Floating UI

| Need | Baseline |
|------|----------|
| Modal interaction | Native `<dialog>` with `showModal()` when its behavior fits; verify focus, dismissal, and screen-reader behavior. |
| Non-modal menu, picker, teaching UI, or toast | Evaluate Popover API. Prefer declarative `popovertarget` and `popovertargetaction` when no application state synchronization is required. |
| Light-dismiss interactive overlay | `popover="auto"`; verify focus order and keyboard behavior. |
| Independently controlled persistent overlay | `popover="manual"`; provide an explicit accessible close action when users must dismiss it. |

Popover is not a universal tooltip primitive and does not provide modal behavior. Do not ban portals or accessible component libraries categorically: retain them when the support matrix, framework lifecycle, collision handling, focus model, or product behavior exceeds native primitives.

Use CSS Anchor Positioning to tether floating UI when supported and when a static fallback remains usable. Prefer `anchor-name`, `position-anchor`, logical inset properties, `anchor()`, `anchor-size()`, and position-try fallbacks over continuous `getBoundingClientRect()` or `ResizeObserver` orchestration. Gate the enhancement with an appropriate `@supports` query and test viewport-edge collisions in every supported engine.

### Entry, Exit, and Route Transitions

- For transitioned top-layer or `display: none` elements, model open, closed, and entry states explicitly. Use `@starting-style` for entry transitions and `allow-discrete` for `display` or `overlay` only when support is verified.
- Keep the unenhanced state visible and usable. Do not require an animation event or timer to expose essential content.
- Evaluate View Transition API for SPA state changes and cross-document navigation. Opt in to MPA transitions with `@view-transition { navigation: auto; }` only when both documents and the browser matrix support the behavior.
- Assign stable, unique `view-transition-name` values only to elements whose visual continuity improves comprehension.
- Disable non-essential spatial motion under `@media (prefers-reduced-motion: reduce)`; do not assume a fade is always acceptable when no transition is safer.
- Keep scroll-driven animation declarations inside `@supports` and render the default state fully visible. Use JavaScript scroll orchestration only when the product behavior is essential, a tested fallback is required, and the INP budget permits it.

---

## 4. AI-Ready Architecture

AI agents (Cursor, Claude Code) consume your code. Structure it so they don't hallucinate.

1. **`strict: true` baseline** — adopt when TypeScript and agent-maintained code are selected; document any interoperability-driven exception
2. **Declarative > Imperative** — schemas, configs, data-driven UIs
3. **Source ownership** — use shadcn/ui or own-components; avoid black-box NPM imports
4. **Predictable naming** — `kebab-case.ts`, typed exports, directory depth limits
5. **Zero tribal knowledge** — no implicit assumptions AI can misinterpret
6. **Semantic token metadata** — document token purpose, constraints, and contrast intent where generated code or agents consume exported tokens; avoid comments that merely restate values

---

## 5. State Management

**Separate server state from client state.**

```
Server state (API, caching, background sync)
  → TanStack Query v5  (React/Vue/Svelte)
  → SWR              (React, lighter)
  → Patterns: stale-while-revalidate, exponential retries, optimistic updates

Client state (UI: toggles, tabs, theme)
  → React: Zustand (simple) / Jotai (atomic)
  → Vue:  Pinia (official, DevTools)
  → Start with useState/ref — escalate only when needed

Form state
  → React: React Hook Form (uncontrolled, performant)
  → Vue:   VeeValidate + Zod (schema)
  → Avoid: Formik, fully controlled large forms
```

**Conditional baseline**: start without Redux when local UI state and a server-state library satisfy the SoT. Evaluate Redux when the charter requires event replay, deterministic cross-feature transitions, advanced debugging, or migration compatibility.

---

## 6. Performance & Core Web Vitals

### Targets (Google ranking factor)

| Metric | Good | Needs Work | Poor |
|--------|------|-----------|------|
| LCP | ≤ 2.5s | 2.5-4.0s | > 4.0s |
| INP | ≤ 200ms | 200-500ms | > 500ms |
| CLS | ≤ 0.1 | 0.1-0.25 | > 0.25 |

### Checklist

- Route-based code splitting (auto in Next.js/Nuxt/SvelteKit)
- Lazy load: `defineAsyncComponent` (Vue), `React.lazy`
- Images: `next/image`, `nuxt/image`, WebP/AVIF
- Tree shaking: named imports, no barrel files with side effects
- Audit: `vite-bundle-visualizer`, `@next/bundle-analyzer`
- Treat INP as the field interactivity outcome; use TBT only as a lab diagnostic proxy. Validate INP at the 75th percentile, segmented by mobile and desktop.
- Profile event handlers for forms, filtering, navigation, and large DOM updates; split or defer non-urgent work when interactions risk exceeding 200ms.

---

## 7. Testing Strategy

| Layer | Tool | Notes |
|-------|------|-------|
| Unit + Component | **Vitest 4** | Browser Mode for real-browser execution |
| E2E | **Playwright** | Cross-browser, multi-platform |
| Visual regression | **Vitest 4** | `toMatchScreenshot`; comparator configurable, current docs no longer require pixelmatch as the only path |
| E2E Visual | **Playwright** | Full-page diffs |

**Vitest 4**: Browser Mode and visual regression are first-class docs paths; verify exact latest patch before pinning.
- Real DOM, not jsdom
- Playwright/WebdriverIO providers
- Component testing: `vitest-browser-vue`, `vitest-browser-react`

**Playwright best practices**:
- No global state — isolated browser contexts per test
- `getByRole` selectors, smart waits — never fixed `setTimeout`
- Visual regression: Linux CI only (font subpixel differences across OS)

---

## 8. Accessibility (WCAG 2.2 AA)

**EU EAA enforcement applies from 28 June 2025.** Penalties and market actions are implemented by Member States, so verify the target jurisdiction.

- Focus visible: `:focus-visible` on all interactives
- Target size: WCAG 2.2 AA minimum is 24×24 CSS px; use 44×44 px as a stronger touch-friendly product baseline when feasible.
- Keyboard operable: all functionality
- Contrast: 4.5:1 normal, 3:1 large text
- Focus not obscured: verify keyboard focus is not hidden by sticky headers, cookie banners, or overlays. Use layout spacing and `scroll-padding`/`scroll-margin` where appropriate, then test real focus navigation rather than assuming CSS alone proves conformance.
- Prefer proven headless primitives when the SoT prioritizes delivery speed and accessibility risk reduction; build custom modals/dropdowns only when differentiated behavior is required and keyboard/screen-reader tests are funded.
- **Testing**: axe-core (CI), NVDA, VoiceOver

WCAG 2.2 AA is the engineering baseline, not a universal legal-conformance claim. For products in regulated markets, map the product and service scope to applicable law and standards, including the EAA and relevant national transposition in the EU. Record the target jurisdictions and obtain qualified legal review rather than asserting that WCAG alone proves compliance.

---

## 9. Client-Side Security (OWASP)

Design with **"client is compromised"** as baseline.

| Risk | Hardening Rule |
|------|---------------|
| Broken Access Control | UI routing = UX only. All authz validated server-side. Never trust localStorage feature flags for admin gating. |
| Cryptographic Failures | **Zero tolerance** for PII/API keys/JWT in `localStorage`/`sessionStorage`/`IndexedDB`. Use `HttpOnly; Secure; SameSite=Strict` cookies only. |
| Vulnerable Components | CI/CD blocks deployments with known NPM vulns. Enforce strict CSP. |
| XSS | Sanitize untrusted input. No `innerHTML`. DOMPurify if necessary. |

### Security Checklist

```
□ No secrets in localStorage/sessionStorage/IndexedDB
□ Cookies: HttpOnly + Secure + SameSite=Strict
□ CSP header configured
□ npm audit in CI/CD (blocks on critical vulns)
□ Admin routes server-gated (not client-side flags)
□ No sensitive data in URL params
```

---

## 10. Governance: ADRs

Every architectural turn documented immutably.

### ADR Template

```markdown
# ADR-XXX: Title

## Status
Proposed | Accepted | Deprecated | Superseded by ADR-YYY

## Context
What problem forces this decision?

## Decision Drivers
- [Team familiarity, perf budget, AI compatibility, ...]

## Decision
The chosen approach (one paragraph)

## Alternatives
| Option | Pros | Cons |
|--------|------|------|
| A | ... | ... |
| B | ... | ... |

## Consequences
**Positive:** ...
**Risks:** ...
```

**Rules**:
- One ADR per decision (framework, state strategy, rendering approach, security boundary)
- Store in `/docs/adr/` — ingestible by AI RAG pipelines
- Immutable: update status, don't overwrite
- Review in PRs

---

## 11. Green Web

Carbon footprint is a measurable KPI.

**Target**: ≤ 0.36g CO2/page view.

| Technique | Impact |
|-----------|--------|
| WebP/AVIF images | Up to 70% asset weight reduction |
| Font subsetting | Load only glyphs used |
| Route code splitting | Conditional module loading |
| Green hosting | Verify 100% renewable (Green Web Foundation API) |

**Tools**: CO2.js (Green Web Foundation), Digital Beacon, Lighthouse.

---

## 12. Developer Experience

### TypeScript (`strict: true`)

Enforce when: team > 3, project > 6 months, API contracts, design systems, **AI agents in use**.

For SSR, streaming, Server Components, and islands, keep the initial render deterministic and serializable. Access `window`, `document`, `navigator`, storage, and layout APIs only in explicit client boundaries or post-mount lifecycle code. Type browser-only adapters and component variants narrowly; do not use TypeScript types as a substitute for runtime validation at trust boundaries.

### Monorepo

| Tool | Best For |
|------|----------|
| Turborepo | Small-mid teams, Vercel ecosystem |
| Nx | Large orgs, multi-products, dedicated infra |

Use pnpm workspaces as a candidate baseline when the SoT requires a JavaScript monorepo and the deployment/toolchain supports pnpm. Preserve an existing package manager or choose another when compatibility, hosting, or team constraints justify it.

### Bundlers (validated May 2026)

| Tool | Use When |
|------|----------|
| Vite 8 | Vue/React/Svelte non-Next.js; current supported major with Rolldown pipeline |
| Turbopack | Next.js 16 production bundler path |
| Rspack | Large Webpack migration (drop-in) |

---

## 13. Decision Framework

### Constraint-Matched Candidate Stacks

Use these combinations only as comparison candidates after the charter gate passes. Cite the matching SoT constraint for every selected component; do not adopt a complete row by scenario label alone.

```
Admin panel, no SEO:
  → Vue 3.5+ + Vite 8 + PrimeVue 4 + Pinia 3 + TanStack Query + Vitest + Playwright
  → React 19.2+ + Vite 8 + shadcn/ui + Zustand + TanStack Query + Vitest + Playwright

SaaS, mixed SEO:
  → Next.js 16 + shadcn/ui + TanStack Query + Zustand + Vitest + Playwright
  → Nuxt 4 + PrimeVue + TanStack Query + Pinia + Vitest + Playwright

Content/Marketing, SEO critical:
  → Astro 5 (Islands for interactive parts)
  → Next.js 16 SSG + ISR

E-commerce, perf critical:
  → Next.js 16 (Cache Components / PPR) or Qwik
  → Core Web Vitals must be green in CI

Enterprise, strict structure:
  → Angular 21 + Angular Material / PrimeNG
  → Nx monorepo

Greenfield, perf #1, small team:
  → Svelte 5 + SvelteKit + Tailwind CSS
```

### Red Flags

- CSS-in-JS with SSR (runtime + hydration penalty) → Tailwind or Panda CSS
- Global state for server data → TanStack Query instead
- Custom ARIA without explicit behavior requirements and automated plus assistive-technology validation
- Skipping TypeScript on team projects > 3 months
- Webpack in new projects → Vite or Turbopack
- Redux without event-replay, deterministic workflow, debugging, or migration requirements → begin with local state or a smaller client store
- **JWT/API keys in localStorage** (security breach)
- **No ADRs on >2 dev projects** (knowledge loss)
- **No accessibility testing in CI** (EAA legal risk in EU)
- Essential content starts hidden and depends on unsupported scroll or transition features to appear
- Browser globals read during server or initial render, causing hydration divergence
- Popover, anchor positioning, or view transitions adopted without fallback and cross-browser behavior tests

---

## Resources

- Core Web Vitals: https://web.dev/vitals/
- WCAG 2.2: https://www.w3.org/TR/WCAG22/
- TanStack Query: https://tanstack.com/query
- Radix UI: https://www.radix-ui.com/
- Ark UI: https://ark-ui.com/
- shadcn/ui: https://ui.shadcn.com/
- Vitest Browser Mode: https://vitest.dev/guide/browser/
- Astro Islands: https://docs.astro.build/en/concepts/islands/
- OWASP Client-Side Top 10: https://owasp.org/www-project-top-10-client-side-security-risks/
- European Accessibility Act: https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en
- ADR Templates: https://adr.github.io/
- Green Web Foundation: https://www.thegreenwebfoundation.org/
