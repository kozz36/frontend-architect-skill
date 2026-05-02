---
name: frontend-architect
description: >
  General-purpose frontend architecture skill for stack definition at project start.
  Guides framework selection (React/Vue/Svelte/Angular/Next/Nuxt/etc.), rendering strategy,
  state management, design systems, testing, performance, and accessibility.
  Trigger: When starting a new frontend project and need to define the stack,
  choosing between frameworks, evaluating options for a team, or making cross-framework
  architectural decisions.
license: Apache-2.0
metadata:
  author: kozz36
  version: "1.0"
---

## When to Use

- Starting a new frontend project and need framework/stack selection
- Evaluating frameworks for a team or organization
- Designing the component and state management architecture
- Setting up a design system or choosing a UI library
- Optimizing for performance, SEO, or mobile
- Establishing testing strategy for a frontend codebase
- Making accessibility compliance decisions

---

## 1. Framework Selection

### Market Reality (2025-2026)

| Framework | Market Share | Bundle Size | DX | Best For |
|-----------|-------------|-------------|-----|----------|
| React 19 | ~44% | Medium | Medium | Ecosystem, talent pool, enterprise |
| Vue 3 | ~18% | Small | High | Full-stack teams, backend devs, pragmatic apps |
| Angular 19 | Stable (enterprise) | Large | Medium | Large teams, strict structure, enterprise |
| Svelte 5 | ~7% | Smallest | High | Performance-critical, content sites |
| SolidJS | Niche | Very small | Medium | Performance-first SPAs |
| Qwik | Niche | Near-zero hydration | Medium | E-commerce, content, lazy hydration |

**Key 2026 fact**: Frameworks are converging — fine-grained reactivity, compiler-driven optimization, and server-first rendering are no longer differentiators. Vue 3.6 Vapor Mode achieves performance parity with Svelte 5 (still beta). React 19 ships with native concurrent features.

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
| Next.js 16 | React + SSR/SSG, Vercel deploy, large ecosystem | Vercel lock-in concerns, complexity overhead |
| Nuxt 3 | Vue + SSR/SSG, full-stack Vue apps | Team has no Vue experience |
| SvelteKit | Svelte apps, 50-70% less JS than React equivalents | Team not familiar with Svelte |
| Astro 5 | Content-heavy, marketing, blogs, minimal JS (now Cloudflare-backed) | Highly interactive SPAs |
| Remix / React Router v7 | Form-heavy apps, web-standards-first, progressive enhancement | Static content, simple SPAs |

**Astro note**: Cloudflare acquired Astro in January 2026 — strong infrastructure backing, Islands Architecture is production-proven.

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

**When to use shadcn/ui**: React projects needing custom brand + accessible primitives + fast start.

**Vue equivalent**: PrimeVue 4 with Aura theme (same philosophy: composable, themeable).

### Styling Strategy

| Approach | Verdict 2025-2026 | Use When |
|----------|-------------------|----------|
| Tailwind CSS v4 | Dominant — utility-first, CSS-native config | New projects, design systems, component libraries |
| CSS Modules | Still valid — scoped, no runtime | Legacy projects, teams preferring explicit CSS |
| CSS-in-JS (Styled, Emotion) | Declining — runtime cost, SSR complexity | Avoid for new projects unless heavy theming required |
| Panda CSS | Rising — zero-runtime CSS-in-JS | TypeScript-first design systems, Ark UI pairing |

**Dark mode pattern**: CSS variables + Tailwind `dark:` classes or `class="dark"` strategy. Avoid runtime theme switching with JS — use CSS custom properties.

### Design Tokens

Use CSS custom properties for all design tokens. Map them to Tailwind via `tailwind.config` or the new CSS-native config in Tailwind v4. Tokens: `--color-primary`, `--radius-md`, `--spacing-base`. Never hardcode values in components.

---

## 4. State Management

### The Core Principle (2025)

**Separate server state from client state.** Most "global state" is actually server data.

```
Server state (API data, caching, background sync)
  → TanStack Query v5 (React/Vue/Svelte/Angular)
  → SWR (React, lighter alternative)

Client state (UI: open/closed, selected tab, theme)
  → React: Zustand (simple) or Jotai (atomic, fine-grained)
  → Vue: Pinia (official, DevTools support, Composition API native)
  → Start with useState/ref — escalate only when needed

Form state
  → React: React Hook Form (performance-first, uncontrolled)
  → Vue: VeeValidate + Zod (schema validation)
  → Avoid: Formik (deprecated pattern), controlled form state for large forms
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

## 5. Performance & Core Web Vitals

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
- Image optimization: `next/image`, `nuxt/image`, or `vite-imagetools`
- Tree shaking: use named imports, avoid barrel files with side effects
- Analyze bundle: `vite-bundle-visualizer` or `@next/bundle-analyzer`

### PWA in 2026

PWA is still relevant but narrowed use cases:
- **Recommended**: Offline-capable tools, field apps with poor connectivity, mobile-first B2B
- **Skip**: Standard SaaS dashboards, content sites with good CDN
- **Tooling**: Vite PWA plugin (`vite-plugin-pwa`), Workbox for service workers

---

## 6. Testing Strategy

### Tool Assignment

| Layer | Tool | When |
|-------|------|------|
| Unit + Component | **Vitest 4** | Logic, hooks, component rendering — fast, Vite-native |
| E2E | **Playwright** | Critical user paths, cross-browser, multi-platform |
| E2E (alternative) | **Cypress** | SPA-only, JS team, exceptional DX, simpler setup |
| Visual regression | **Vitest 4 Browser Mode** | Component snapshots (built-in since Vitest 4) |
| Visual regression (E2E) | **Playwright snapshots** | Full-page visual diffs |

**Vitest 4 (Oct 2025)**: Browser Mode is now stable. Built-in visual regression. Playwright trace integration. Use Vitest for unit + component, Playwright for E2E — this is the 2026 standard setup.

### Admin Panel Testing Priorities

```
1. Data tables: filtering, sorting, pagination (Vitest component tests)
2. Forms: validation, submission, error states (Vitest + React Hook Form / VeeValidate)
3. Auth flows: login, redirect, token expiry (Playwright E2E)
4. Critical CRUD paths: create/edit/delete entities (Playwright E2E)
5. Visual regression: dashboard layout, chart rendering (Vitest Browser Mode)
```

---

## 7. Accessibility (a11y)

### Compliance Target

**WCAG 2.2 AA** — mandatory since EU EAA enforcement (June 2025). Target this as baseline for all new projects.

### Key WCAG 2.2 Requirements

- **Focus visible**: All interactive elements must have visible focus indicators
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

**Use headless libraries**: Radix UI, Ark UI, and Headless UI handle ARIA patterns correctly out of the box. Do NOT implement custom modal/dropdown without them — keyboard traps and ARIA attributes are easy to get wrong.

**Testing tools**: axe-core (automated, integrates with Vitest/Playwright), NVDA (Windows screen reader), VoiceOver (macOS/iOS).

---

## 8. Developer Experience

### TypeScript — When to Enforce

```
Enforce strict TypeScript when:
  - Team > 3 developers
  - Project lifespan > 6 months
  - API contracts between frontend/backend need type safety
  - Component library / design system being built

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

## 9. Decision Framework

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
  → Nuxt 3 + PrimeVue/Headless + TanStack Query + Pinia + Vitest + Playwright

Content/Marketing site, SEO critical:
  → Astro 5 (minimal JS, Islands for interactive parts)
  → Next.js 16 with SSG + ISR for dynamic sections

E-commerce, high performance, SEO critical:
  → Next.js 16 (PPR for personalized sections) or Qwik (near-zero hydration)
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
