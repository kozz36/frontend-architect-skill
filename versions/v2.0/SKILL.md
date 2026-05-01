---
name: frontend-architect
description: >
  Strategic frontend architecture decisions for any project: framework selection,
  rendering strategy, state management, design systems, testing, performance, accessibility,
  AI-Ready governance, client-side security (OWASP), ADR traceability, and green web.
  Trigger: When choosing a frontend framework, setting up a new frontend project,
  deciding on a component library, making architectural decisions, integrating AI agent workflows,
  establishing security hardening, or ensuring accessibility/sustainability compliance.
license: Apache-2.0
metadata:
  author: kozz36
  version: "2.0"
---

## When to Use

- Starting a new frontend project and need framework/stack selection
- Evaluating frameworks for a team or organization
- Designing the component and state management architecture
- Setting up a design system or choosing a UI library
- Optimizing for performance, SEO, or mobile
- Establishing testing strategy for a frontend codebase
- Making accessibility compliance decisions
- Structuring code for AI agent consumption (Cursor, Claude Code)
- Establishing Architecture Decision Records (ADRs)
- Implementing client-side security hardening (OWASP)
- Measuring and reducing carbon footprint (Green Web)

---

## 1. Framework Selection

### Market Reality (2025-2026)

| Framework | Market Share | Bundle Size | DX | Best For |
|-----------|-------------|-------------|-----|----------|
| React 19 | ~44% | Medium | Medium | Ecosystem, talent pool, enterprise |
| Vue 3.5+ | ~18% | Small | High | Full-stack teams, backend devs, pragmatic apps |
| Angular 19 | Stable (enterprise) | Large | Medium | Large teams, strict structure, enterprise |
| Svelte 5 | ~7% | Smallest | High | Performance-critical, content sites |
| SolidJS | Niche | Very small | Medium | Performance-first SPAs |
| Qwik | Niche | Near-zero hydration | Medium | E-commerce, content, lazy hydration |

**Key 2026 fact**: Frameworks are converging — fine-grained reactivity, compiler-driven optimization, and server-first rendering are no longer differentiators. Vue 3.6 Vapor Mode (beta) achieves performance parity with Svelte 5. React 19 ships with native concurrent features.

### When to Recommend Each

```
React    → Large team, diverse hire pool needed, existing React ecosystem, Next.js required
Vue 3    → Small/mid team, backend devs onboarding to frontend, pragmatic admin panels
Angular  → Enterprise, strict typing mandated, large distributed teams, opinionated structure
Svelte 5 → Performance is #1 priority, content-heavy, smaller teams, greenfield projects
SolidJS  → Maximum runtime performance, small bundle critical, team accepts niche ecosystem
Qwik     → E-commerce, content platforms, resumability over hydration needed
```

---

## 2. Rendering Strategy & Meta-Frameworks

### Decision Tree

```
Has SEO requirements?
  YES → SSR or SSG
    Mostly static content? → SSG (Astro, Next.js static)
    Dynamic personalized content? → SSR (Next.js, Nuxt, SvelteKit)
    Mix of static + dynamic? → Islands Architecture (Astro) or Hybrid (Next.js PPR)
  NO → SPA is fine
    Vue team? → Nuxt or Vite SPA
    React team? → Next.js or Vite SPA
    Svelte team? → SvelteKit

Is it an admin panel / internal tool?
  → SPA (no SEO needed, auth-gated, complex interactivity)
  → Recommended: Vite + Vue 3 or Vite + React
```

### Meta-Framework Quick Guide

| Framework | Best For | Avoid When |
|-----------|----------|-----------|
| Next.js 16 | React + SSR/SSG, Vercel deploy, large ecosystem, Server Actions | Vercel lock-in concerns, complexity overhead |
| Nuxt 4 | Vue + SSR/SSG, full-stack Vue apps, Layers for monorepo, Nitro engine | Team has no Vue experience |
| SvelteKit | Svelte apps, 50-70% less JS than React equivalents | Team not familiar with Svelte |
| Astro 5 | Content-heavy, marketing, blogs, minimal JS (now Cloudflare-backed) | Highly interactive SPAs |
| Remix / React Router v7 | Form-heavy apps, web-standards-first, progressive enhancement | Static content, simple SPAs |

**Nuxt 4 note**: Released July 2025. Nuxt Layers solve micro-frontend overhead by enabling "monorepo modular" — a base layer with shared components, composables, and design system, extended by multiple apps with Giget (`github:my-org/shared-config`).

**Astro note**: Cloudflare acquired Astro in January 2026 — strong infrastructure backing, Islands Architecture is production-proven.

### Server-First Rendering Patterns (2026)

| Pattern | When to Use | Key API |
|---------|-------------|---------|
| SSR | Dynamic content, auth-gated, SEO critical | Server Components (React) / SSR (Nuxt) |
| SSG | Static content, marketing, docs, blogs | `generate: { routes }` (Nuxt) / `output: 'export'` (Next) |
| ISR | Massive read-heavy static with occasional updates | `revalidateTag()` with `cacheLife` profile |
| PPR | Highly personalized with static shell | `Cache Components` (Next.js 16) |
| Islands | Minimal JS, content-heavy with localized interactivity | Astro Islands Architecture |

### Mutations: Server Actions vs. tRPC

**Use Next.js Server Actions (React ecosystem)** when:
- Application is form-centric (e-commerce, dashboards, settings)
- Progressive enhancement needed (forms work with JS disabled)
- Single-codebase, not multi-client

```tsx
// Server Actions: mutation with read-your-writes
'use server'
import { updateTag } from 'next/cache'
export async function updateUser(userId: string, profile: Profile) {
  await db.users.update(userId, profile)
  updateTag(`user-${userId}`) // Revalidates and serves fresh data in same request
}
```

**Use tRPC v11+ when**:
- Multi-client ecosystem (web + mobile + CLI sharing same backend)
- Complex data-intensive dashboards requiring request batching
- End-to-end type safety is non-negotiable across teams

| Aspect | Server Actions | tRPC |
|--------|---------------|------|
| Progressive Enhancement | ✅ Native (works without JS) | ❌ Requires JS |
| Multi-client | ⚠️ Single codebase | ✅ Shared types across clients |
| Batching | ❌ Sequential | ✅ Parallel request batching |
| Setup | Minimal | Moderate boilerplate |

---

## 3. Design Systems & Component Libraries

### Headless vs Opinionated

```
Need full design control + custom brand?
  → Headless: Radix UI (React), Ark UI (React/Vue/Svelte), Headless UI (Tailwind team)
  → Pair with: Tailwind CSS + CSS variables for tokens

Need fast delivery + consistent look?
  → Opinionated: PrimeVue 4 (Vue), MUI (React), Ant Design (React, enterprise)
  → Accept vendor look unless heavy theming

Building admin panels specifically?
  → Vue: PrimeVue 4 (DataTable, DatePicker, Charts — native dark mode)
  → React: shadcn/ui + TanStack Table or MUI DataGrid
```

### The shadcn/ui Model (Copy-Paste Components)

shadcn/ui is NOT a library — it's a component generator. Components are copied into your codebase as source code. Key properties:
- Full ownership: you own the code, no library breaking changes
- Built on Radix UI (accessibility) + Tailwind CSS (styling)
- CSS variables for design tokens — dark mode works natively
- Bundle includes only what you use

**Why AI-ready**: When source code lives in your repo (not imported as black box), LLMs (Cursor, Claude Code) can infer structural patterns and generate interfaces consistent with your design system.

**When to use shadcn/ui**: React projects needing custom brand + accessible primitives + fast start.

**Vue equivalent**: PrimeVue 4 with Aura theme (same philosophy: composable, themeable).

### Styling Strategy

| Approach | Verdict 2025-2026 | Use When |
|----------|-------------------|----------|
| Tailwind CSS v4 | Dominant — utility-first, CSS-native config | New projects, design systems, component libraries |
| CSS Modules | Still valid — scoped, no runtime | Legacy projects, teams preferring explicit CSS |
| CSS-in-JS (Styled, Emotion) | **Strongly discouraged** — runtime cost, SSR hydration penalty | Avoid for new projects |
| Panda CSS | Acceptable — zero-runtime CSS-in-JS | TypeScript-first design systems, Ark UI pairing |

**Dark mode pattern**: CSS variables + Tailwind `dark:` classes or `class="dark"` strategy. Avoid runtime theme switching with JS — use CSS custom properties.

### Design Tokens

Use CSS custom properties for all design tokens. Map them to Tailwind via CSS-native config in v4. Tokens: `--color-primary`, `--radius-md`, `--spacing-base`. Never hardcode values in components.

---

## 4. AI-Ready Architecture

The frontend is now consumed by AI agents (Cursor, Claude Code, Copilot). Poorly structured code accelerates AI hallucinations. Well-structured code becomes a force multiplier.

### AI-Agent Rules

1. **Strict TypeScript (`strict: true`) is mandatory**: It becomes the lexical contract preventing AI agents from inventing non-existent properties or mutating data structures unpredictably.
2. **Declarative > Imperative**: Prefer configuration over logic. Use schema-driven forms, data-driven UIs, and clear directory boundaries.
3. **Component source ownership**: Use shadcn/ui or own-component libraries where source lives in repo. Black-box npm imports (`import { Dialog } from 'ui-lib'`) prevent AI inference.
4. **Predictable naming conventions**: Consistent file naming (`kebab-case.ts`), directory depth limits, and typed exports (`export type`, not inline exports) help AI navigate.
5. **No tribal knowledge**: Avoid implicit assumptions, magic strings, or undocumented patterns. AI will hallucinate based on noise.

---

## 5. State Management

### The Core Principle (2025-2026)

**Separate server state from client state.** Most "global state" is actually server data.

```
Server state (API data, caching, background sync)
  → TanStack Query v5 (React/Vue/Svelte/Angular)
  → SWR (React, lighter alternative)
  → Patterns: stale-while-revalidate, exponential retries, optimistic UI updates

Client state (UI: open/closed, selected tab, theme)
  → React: Zustand (simple) or Jotai (atomic, fine-grained)
  → Vue: Pinia (official, DevTools support, Composition API native)
  → Start with useState/ref — escalate only when needed

Form state
  → React: React Hook Form (performance-first, uncontrolled)
  → Vue: VeeValidate + Zod (schema validation)
  → Avoid: Formik, overly controlled form state for large forms
```

### Decision Rules

```
Do you need global state?
  Is it server data? → TanStack Query. Period.
  Is it UI state shared across 3+ components? → Zustand (React) / Pinia (Vue)
  Is it UI state in one component? → useState / ref
  Is it form state? → React Hook Form / VeeValidate

Do NOT reach for Redux in new projects. Only justify it if:
  - Migrating from existing Redux codebase
  - Need Redux DevTools time-travel debugging specifically
  - Team has deep Redux expertise and complex state machines
```

---

## 6. Performance & Core Web Vitals

### 2025-2026 Targets (Google Search ranking factor)

| Metric | Good | Needs Work | Poor |
|--------|------|-----------|------|
| LCP (Largest Contentful Paint) | ≤ 2.5s | 2.5-4.0s | > 4.0s |
| INP (Interaction to Next Paint) | ≤ 200ms | 200-500ms | > 500ms |
| CLS (Cumulative Layout Shift) | ≤ 0.1 | 0.1-0.25 | > 0.25 |

Only 48% of mobile pages pass all three (2025 Web Almanac). LCP fails most often.

### Bundle Optimization Checklist

- Route-based code splitting (automatic in Next.js/Nuxt/SvelteKit)
- Lazy load non-critical components: `defineAsyncComponent` (Vue), `React.lazy`
- Image optimization: `next/image`, `nuxt/image`, `vite-imagetools`, WebP/AVIF
- Tree shaking: use named imports, avoid barrel files with side effects
- Analyze bundle: `vite-bundle-visualizer` or `@next/bundle-analyzer`

### PWA in 2026

PWA is still relevant but narrowed use cases:
- **Recommended**: Offline-capable tools, field apps with poor connectivity, mobile-first B2B
- **Skip**: Standard SaaS dashboards, content sites with good CDN
- **Tooling**: Vite PWA plugin (`vite-plugin-pwa`), Workbox for service workers

---

## 7. Testing Strategy

### Tool Assignment

| Layer | Tool | When |
|-------|------|------|
| Unit + Component | **Vitest 4** | Logic, hooks, component rendering — fast, Vite-native |
| E2E | **Playwright** | Critical user paths, cross-browser, multi-platform |
| E2E (alternative) | **Cypress** | SPA-only, JS team, exceptional DX, simpler setup |
| Visual regression | **Vitest 4 Browser Mode** | Component snapshots, pixelmatch built-in |
| Visual regression (E2E) | **Playwright snapshots** | Full-page visual diffs |

**Vitest 4 (2026)**: Browser Mode is now stable. Built-in visual regression via `toMatchImageSnapshot`. ARIA snapshots. Trace View integration. Use Vitest for unit + component, Playwright for E2E — this is the 2026 standard setup.

**Playwright best practices (avoiding flaky tests)**:
- Prohibit global state variables — use isolated browser contexts per test
- Use Page Object Model (POM) for reusable selectors
- Prefer `getByRole` and smart waits over fixed `setTimeout`
- Visual regression: capture component-level over full-page, enforce deterministic rendering, run on Linux CI only (font subpixel rendering differs across OS)

### Admin Panel Testing Priorities

```
1. Data tables: filtering, sorting, pagination (Vitest component tests)
2. Forms: validation, submission, error states (Vitest + React Hook Form / VeeValidate)
3. Auth flows: login, redirect, token expiry (Playwright E2E)
4. Critical CRUD paths: create/edit/delete entities (Playwright E2E)
5. Visual regression: dashboard layout, chart rendering (Vitest Browser Mode)
```

---

## 8. Accessibility (a11y)

### Compliance Target

**WCAG 2.2 AA** — mandatory since EU European Accessibility Act (EAA) enforcement (June 2025). Non-compliance carries substantial fines and legal product withdrawal in the EU.

### Key WCAG 2.2 Requirements

- **Focus visible**: All interactive elements must have visible focus indicators (`:focus-visible`)
- **Target size**: Clickable elements ≥ 44×44px
- **Keyboard navigation**: All functionality operable via keyboard
- **Color contrast**: 4.5:1 for normal text, 3:1 for large text
- **ARIA live regions**: Dynamic content updates announced to screen readers

### ARIA Patterns for Admin Panels

```
Tables          → role="grid", aria-sort, aria-rowcount, aria-colcount
Modals/Dialogs  → role="dialog", aria-modal="true", aria-labelledby, focus trap
Forms           → aria-required, aria-invalid, aria-describedby for errors
Tabs            → role="tablist", role="tab", aria-selected, aria-controls
Dropdowns       → role="combobox" or role="listbox", aria-expanded, aria-activedescendant
Alerts/Toasts   → role="alert" or aria-live="polite"
Loading states  → aria-busy="true", aria-live="polite"
```

**Use headless libraries**: Radix UI, Ark UI, and Headless UI handle ARIA patterns correctly out of the box. Do NOT implement custom modal/dropdown without them.

**Testing tools**: axe-core (automated, integrates with Vitest/Playwright), NVDA, VoiceOver.

---

## 9. Client-Side Security (OWASP)

The browser is a hostile environment. Design with **"client is compromised"** as the baseline assumption.

### OWASP Client-Side Top 10 — Actionable Hardening

| Risk | Rule |
|------|------|
| **Broken Access Control** | UI routing manages UX only. All auth/authz must be validated server-side, cryptographically. Never trust feature flags in localStorage for admin gating. |
| **Cryptographic Failures** | **Zero tolerance** for storing PII, API keys, or JWT tokens in `localStorage`, `sessionStorage`, or IndexedDB. Use `HttpOnly; Secure; SameSite=Strict` cookies only. |
| **Vulnerable Components** | CI/CD must block deployments with known NPM vulnerabilities. Enforce strict CSP policies. |
| **XSS** | Sanitize user input. No `innerHTML` with untrusted data. Use DOMPurify if absolutely necessary. |
| **Insecure Storage** | Do not use `localStorage` for anything sensitive. If you need client persistence for non-sensitive data, use `sessionStorage` or `IndexedDB` with encryption at rest. |

### Security Checklist for New Projects

```
□ No secrets in localStorage/sessionStorage/IndexedDB
□ Cookies: HttpOnly + Secure + SameSite=Strict
□ CSP header configured (restrict scripts, styles, images sources)
□ npm audit integrated in CI/CD (blocks deployment on critical vulns)
□ All admin routes server-gated (not client-side feature flags)
□ No sensitive data in URL params (leaks in browser history, logs, referrer)
```

---

## 10. Governance: Architecture Decision Records (ADRs)

Every significant architectural turn must be documented immutably to prevent knowledge loss and AI semantic drift.

### ADR Template

```markdown
# ADR-042: [Title]

## Status
Proposed | Accepted | Deprecated | Superseded by ADR-XXX

## Context
[What problem forces this decision? What are the technical, business, and team constraints?]

## Decision Drivers
- [Factor 1: e.g. team familiarity with X]
- [Factor 2: e.g. performance budget < 200ms INP]
- [Factor 3: e.g. AI agent compatibility]

## Decision
[The chosen approach — one paragraph]

## Alternatives Considered
| Option | Pros | Cons |
|--------|------|------|
| Option A | ... | ... |
| Option B | ... | ... |

## Consequences
### Positive
- [Benefit 1]
- [Benefit 2]

### Negative / Risks
- [Trade-off 1]
- [Trade-off 2]
```

### ADR Rules

1. **One ADR per architectural decision**: Framework choice, state management strategy, rendering approach, security boundary.
2. **Status lifecycle**: Proposed → Accepted → Deprecated (with superseding ADR reference) → Obsolete.
3. **Store in `/docs/adr/`** (or equivalent) as Markdown — ingestible by RAG pipelines for AI context.
4. **Review in PRs**: Every PR that changes architecture must reference the relevant ADR.
5. **Do not delete**: ADRs are immutable. Update status, don't overwrite.

---

## 11. Green Web & Sustainability

Carbon footprint of web applications is a measurable KPI. Global tech infrastructure consumed ~460 TWh in 2022, projected 1050 TWh by 2026.

### Carbon Budget Targets

- **Target**: ≤ 0.36g CO2/page view (global average). Lower is better.
- **For high-traffic platforms**: Every 0.01g reduction = metric tons of CO2 saved monthly.

### Optimization Checklist (overlaps with performance)

| Technique | Impact |
|-----------|--------|
| WebP/AVIF images | Up to 70% reduction in visual asset weight |
| Font subsetting | Load only glyphs used in your language/content |
| Route-based code splitting | Conditional module loading |
| WebAssembly for heavy compute | Offload crypto, video processing, simulations from JS main thread |
| Green hosting audit | Verify data center runs on 100% renewable (Green Web Foundation API) |

### Tools

```bash
# CO2.js for CI pipeline
npm install @greenweb/co2.js
# Block commits exceeding carbon budget
```

| Tool | Purpose |
|------|---------|
| CO2.js (Green Web Foundation) | CI-integrated carbon estimation for build weight |
| Digital Beacon | Differential analysis: first visit vs. repeat visit carbon footprint |
| Lighthouse | Aggregate efficiency, discoverability, bloat audit |

---

## 12. Developer Experience

### TypeScript — When to Enforce

```
Enforce strict TypeScript when:
  - Team > 3 developers
  - Project lifespan > 6 months
  - API contracts between frontend/backend need type safety
  - Component library / design system being built
  - AI agents will be used for code generation (strict: true is non-negotiable)

Skip or use loose TypeScript when:
  - Rapid prototype / MVP (add later)
  - Solo project with short lifespan
  - Team has no TypeScript experience and deadline is tight
```

Use `strict: true` in `tsconfig.json`. Add `@typescript-eslint` + `eslint-plugin-vue` or React equivalent.

### Monorepo — When and Which Tool

```
Use monorepo when:
  - Shared component library + 2+ apps
  - Design system + consumer apps
  - Frontend + backend in same repo with shared types

Tool decision:
  Turborepo  → Simple setup, fast builds via Go-based cache, Vercel ecosystem
                Best for: small-mid teams, existing pnpm/yarn workspace
  Nx         → Full ecosystem, code generators, module federation
                Best for: large orgs, multiple products, dedicated infra team

Always use pnpm workspaces as the package manager layer.
```

### HMR / Fast Refresh State (2026)

- **Vite**: Sub-50ms HMR, production standard for Vue/React/Svelte non-Next.js projects
- **Turbopack**: Next.js 16 graduates it to stable for production builds — significant improvement over Webpack
- **Rspack**: Webpack-compatible Rust bundler, viable drop-in for large Webpack projects

---

## 13. Decision Framework

### Quick Stack Selector

```
Given:
  Team size:     S (1-3) | M (4-10) | L (10+)
  Project type:  Admin | SaaS | Content | E-commerce | Marketing
  Mobile needs:  Low | Medium | High (PWA/native-like)
  SEO required:  Yes | No
  Performance:   Standard | Critical

Recommendations:

Admin panel, any team size, no SEO:
  → Vue 3 + Vite + PrimeVue 4 + Pinia + TanStack Query + Vitest + Playwright
  → React + Vite + shadcn/ui + Zustand + TanStack Query + Vitest + Playwright

SaaS app, M/L team, mixed SEO:
  → Next.js 16 + shadcn/ui + TanStack Query + Zustand + Vitest + Playwright
  → Nuxt 4 + PrimeVue/Headless + TanStack Query + Pinia + Vitest + Playwright

Content/Marketing site, SEO critical:
  → Astro 5 (minimal JS, Islands for interactive parts)
  → Next.js 16 with SSG + ISR for dynamic sections

E-commerce, high performance, SEO critical:
  → Next.js 16 (Cache Components / PPR for personalized sections) or Qwik (near-zero hydration)
  → Core Web Vitals must be green — test in CI

Mobile-first PWA:
  → SvelteKit + vite-plugin-pwa (smallest bundle)
  → Next.js + next-pwa if React ecosystem required

Enterprise, large team, strict structure:
  → Angular 19 + Angular Material or PrimeNG
  → Nx monorepo for multi-app management

Greenfield, performance #1, small team:
  → Svelte 5 + SvelteKit + Tailwind CSS
```

### Red Flags to Avoid

- CSS-in-JS with SSR (runtime cost + hydration complexity) — use Tailwind or Panda CSS
- Global state for server data (use TanStack Query instead)
- Custom ARIA implementations without headless library (accessibility bugs guaranteed)
- Skipping TypeScript on team projects > 3 months
- Webpack in new projects (use Vite or Turbopack)
- Redux in new greenfield projects (Zustand/Pinia are sufficient 95% of the time)
- Storing JWT/API keys in localStorage (security breach waiting to happen)
- No ADRs on projects with >2 developers (knowledge loss guarantee)
- Omitting accessibility testing in CI (EAA legal risk in EU markets)

---

## Resources

- **Core Web Vitals**: https://web.dev/vitals/
- **WCAG 2.2**: https://www.w3.org/TR/WCAG22/
- **TanStack Query docs**: https://tanstack.com/query
- **Radix UI**: https://www.radix-ui.com/
- **Ark UI** (Vue/React/Svelte): https://ark-ui.com/
- **shadcn/ui**: https://ui.shadcn.com/
- **Vitest Browser Mode**: https://vitest.dev/guide/browser/
- **Astro Islands**: https://docs.astro.build/en/concepts/islands/
- **OWASP Client-Side Top 10**: https://owasp.org/www-project-top-10-client-side-security-risks/
- **European Accessibility Act**: https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en
- **ADR Templates**: https://adr.github.io/
- **Green Web Foundation**: https://www.thegreenwebfoundation.org/
