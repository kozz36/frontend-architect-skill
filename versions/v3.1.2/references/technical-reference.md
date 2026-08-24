# Frontend Architecture Technical Reference

This is the canonical full v3.1.2 technical basis for architecture decisions. It contains the detail intentionally kept out of `../SKILL.md`.

## How to Use This Reference

- Read `../SKILL.md` first for activation, hard rules, stop gates, and output contract.
- Treat every stack and tool as a candidate, never a default. Select it only when a repository-native authoritative source states a matching constraint or quality attribute.
- Check `source-index.md` and then live official documentation before repeating a version- or API-sensitive claim. A recorded verification date is evidence of a past check, not a substitute for a current check.
- Separate specification semantics, implementation support, target-browser support, and tested interoperability. Do not infer one from another.

## Reference Scope and Basis

This full release is the authoritative basis for v3.1.2. It was refreshed on 2026-08-24 from official source evidence recorded in `source-index.md`. The current lite runtime is a derived compaction of this full runtime and its local references; it is not a source for this document.

## 1. Framework Selection

| Candidate | Select only when verified SoT constraints show | Verify before selection |
|---|---|---|
| React ecosystem | Existing component, staffing, or compatible application constraints | Rendering model, dependency coupling, interaction and bundle budgets |
| Vue ecosystem | Progressive adoption and team capability fit the product | Release channel, meta-framework, state, component-library, and hiring constraints |
| Angular 22 active line | Integrated tooling and standardized application structure are material requirements | Upgrade cadence, runtime/bundle budgets, and team proficiency |
| Svelte ecosystem | Compiler-led UI and lower client runtime solve a measured need | Ecosystem coverage, SSR platform, and operational ownership |
| Qwik | Resumability improves a measured delivery constraint | Hosting compatibility, ecosystem maturity, and support ownership |

The latest official Vue tag observed on 2026-08-24 was `v3.5.41`; Vue's release policy describes pre-releases as unstable. Do not describe Vue 3.6 or Vapor as stable, beta, or production-ready without a fresh official-release check for the exact channel being proposed.

Do not choose from organization-size or scenario labels. Compare team capability, rendering constraints, accessibility support, ecosystem dependencies, performance budgets, hosting, upgrade policy, expected lifetime, and exit cost.

## 2. Rendering and Meta-Frameworks

### Rendering decision tree

```text
Indexable or no-JavaScript content required?
  Yes -> compare SSG, SSR, islands, and hybrid rendering by freshness and interaction needs.
  No  -> compare SPA, SSR, and hybrid delivery by startup latency, caching, hosting, security, and operations.

Mostly static content -> evaluate SSG or islands.
Per-request dynamic content -> evaluate SSR or streaming.
Interaction-heavy authenticated UI -> SPA is a candidate, not an automatic result.
```

| Candidate | Select only when | Do not assume |
|---|---|---|
| Next.js 16.3.2 release line | React SSR/SSG and its server/runtime model match the deployment constraints | Vercel-specific optimized paths are portable without verification |
| Nuxt 4.5.2 release line | Vue full-stack delivery, Nitro, or Layers solve stated needs | Existing Vue familiarity alone decides the stack |
| Astro 7 | Content-first islands and selective hydration meet the interaction budget | An adapter, application mode, or upgrade path fits without a live check |
| SvelteKit | Svelte and low-JavaScript delivery fit verified constraints | A lower client runtime removes accessibility or operations work |
| React Router framework mode | Standards-oriented routing, data loading, actions, SSR, or prerendering are required | A Remix migration is mechanically compatible |

The exact Next.js and Nuxt release tags above are evidence snapshots, not permanent recommendations. Astro 7 is the official current-major evidence snapshot; use the repaired Astro 7 release or upgrade documentation in `source-index.md`, not the retired `/en/reference/` URL.

### Mutation boundary

| Need | Candidate | Constraint |
|---|---|---|
| Framework-owned forms and mutations that must work before JavaScript | Server Action or equivalent server form handler | Preserve progressive enhancement, authorization, validation, and revalidation semantics |
| One team controls compatible TypeScript client and server releases | tRPC | Confirm release coordination and browser/runtime requirements |
| Heterogeneous or independently released clients | Versioned schema-generated contract | Do not trade external compatibility for local type convenience |

## 3. Design Systems, CSS, and Native Platform

| Need | Baseline | Guard |
|---|---|---|
| Custom visual/interaction control | Headless primitives plus owned styles | Fund keyboard, focus, screen-reader, collision, and lifecycle testing |
| Delivery speed with conventional controls | Opinionated component library | Verify accessibility behavior, bundle cost, customization, and upgrade ownership |
| Utility-first delivery | Tailwind CSS or equivalent | Adopt only with explicit token and team conventions |
| Explicit component CSS ownership or migration compatibility | CSS Modules | Keep cascade and token conventions deliberate |
| Runtime theming | CSS-in-JS only when dynamic requirements justify SSR, hydration, caching, and runtime cost | Prefer extracted CSS, variables, utilities, or zero-runtime styling otherwise |
| Typed zero-runtime extraction | Panda CSS or equivalent | Verify the build constraint rather than assuming it |

Prefer CSS variables and framework-native selectors for theming when possible. Use native CSS nesting for locality, not as a substitute for ownership, naming, cascade layers, or scope. Use container queries for component-local adaptation and media queries for environment concerns. Use OKLCH only when the target browser matrix and fallbacks are verified.

### Overlay and enhancement rules

- Use native `<dialog>` for modal interaction only when its focus, dismissal, and assistive-technology behavior fit.
- Evaluate the Popover API for non-modal menus, pickers, teaching UI, or toasts; it is not a universal tooltip or modal primitive. Prefer declarative controls when no application-state synchronization is required.
- Use anchor positioning only as progressive enhancement with static fallback, `@supports`, and viewport-edge collision tests across supported engines.
- Model open, closed, and entry states explicitly for top-layer and `display` transitions. Use `@starting-style`, discrete transitions, View Transitions, or scroll-driven animations only behind tested support gates.
- Essential content must be visible and operable without animation events, timers, anchor support, or scroll timelines. Honor reduced-motion preferences; non-essential spatial motion is optional.
- Retain portals or accessible libraries when native semantics, browser support, framework lifecycle, collision behavior, focus model, or product behavior exceed native primitives.

## 4. AI-Maintainable Architecture

When TypeScript and agent-maintained code are selected, use a strict baseline unless an interoperability exception is documented. Prefer declarative schemas/configuration, owned source, predictable names and exports, bounded directory depth, and explicit token purpose/contrast metadata. Do not rely on tribal knowledge or comments that merely restate values.

## 5. State and Forms

Keep state boundaries explicit:

- **Server state:** use a query/cache approach when APIs, caching, background synchronization, retries, or optimistic updates are required.
- **Client UI state:** begin with local component state; introduce a minimal store such as Zustand, Jotai, or Pinia only when shared UI coordination requires it. Pinia 4.0.3 was the official npm release observed on 2026-08-24; re-check the release before pinning.
- **Forms:** use validated schemas and a form strategy appropriate to the framework; avoid making large forms fully controlled by default.
- **Redux or equivalent:** evaluate only when verified SoT requirements include event replay, deterministic cross-feature transitions, advanced debugging, or migration compatibility.

Never make a client store the authority for server data, authorization, or durable business rules.

## 6. Performance and Core Web Vitals

Use measured budgets, not generic claims. The current web.dev thresholds for the 75th-percentile field assessment are LCP <= 2.5 s, INP <= 200 ms, and CLS <= 0.1; treat TBT as a laboratory diagnostic proxy, not a production INP proof.

- Split routes and defer non-urgent code; use framework facilities only after measuring their output.
- Size and reserve images; choose responsive formats and loading priority from content criticality.
- Avoid side-effectful barrels and measure tree-shaking rather than assuming it.
- In CI, enforce reproducible laboratory budgets for LCP, CLS, TBT, and regressions.
- In production, validate LCP, INP, and CLS through RUM or CrUX at the 75th percentile, segmented by relevant device classes.
- Profile forms, filters, navigation, and large DOM updates; split or defer work that threatens the interaction budget.

## 7. Testing Strategy

| Layer | Baseline | Evidence required |
|---|---|---|
| Unit and component | Vitest, with Browser Mode where a real browser boundary matters | Match the exact supported patch and provider through live docs before pinning |
| End-to-end | Playwright | Cross-browser critical paths, isolated contexts, role-based selectors, and no fixed sleeps |
| Visual regression | Vitest and/or Playwright screenshot facilities | Fixed browser, OS, fonts, viewport, and rendering environment; intentionally separate platform baselines |

The official latest Vitest release redirect observed on 2026-08-24 was `v4.1.11`. The patch is volatile; verify it again before naming it in an adoption decision. Browser and visual test APIs do not remove the need to test accessible behavior and production rendering conditions.

## 8. Accessibility and Legal Scope

Use WCAG 2.2 AA as an engineering baseline, not a universal legal-conformance statement.

- Keep every function keyboard operable, provide visible focus, preserve contrast, and test that sticky UI, consent banners, and overlays do not obscure focus.
- WCAG 2.2 SC 2.5.8 permits a 24 x 24 CSS-pixel target, sufficient spacing, or specified exceptions. A 44 x 44 target is a stronger product baseline when feasible, not an AA requirement.
- Use automated checks such as axe-core plus manual keyboard and assistive-technology testing, including relevant screen-reader combinations.
- For regulated products, map product/service type, operator, target jurisdiction, applicable standard, exemption, national transposition, and transition provision. Obtain qualified legal review; WCAG evidence alone does not prove EAA or other legal compliance.

## 9. Client-Side Security and Privacy

Assume a compromised client. UI routing is user experience, not authorization; enforce all access control server-side.

| Risk | Required control | Scope condition |
|---|---|---|
| Authorization | Server-side authorization for every protected action and object | Never trust UI flags or client routes as a boundary |
| Secrets and credentials | Do not store server secrets or reusable bearer credentials in JavaScript-accessible storage without an explicit threat model and compensating controls | Classify PII and offline/local-first data, minimize retention, and protect by sensitivity |
| Cookies and CSRF | Prefer `HttpOnly; Secure` session cookies; select `SameSite=Strict`, `Lax`, or `None; Secure` from the navigation, cross-site, CSRF, and identity-flow model | Test the selected flow, not a generic cookie rule |
| Dependencies | Set CI blocking thresholds by severity, exploitability, reachability, asset sensitivity, and policy; require owned expiring exceptions | An audit finding alone does not identify impact |
| XSS | Avoid unsafe HTML sinks; sanitize untrusted markup only when markup is a verified requirement | Apply CSP appropriate to the application threat model |

Do not place sensitive data in URL parameters. Define privacy retention, deletion, and observability requirements in the repository-native product or security sources.

## 10. Governance and ADRs

Create an ADR for consequential decisions whose impact, irreversibility, coordination, security boundary, or operational cost needs durable rationale. Store it in the repository-native governance location; if none exists, recommend a conventional location before creating one. Preserve history by changing ADR status rather than rewriting accepted rationale. Record context, decision drivers, decision, alternatives, consequences, owner, evidence, and review trigger.

## 11. Sustainability

Treat carbon as a measurable product quality attribute only when the SoT requires it. Establish a baseline, measurement method, traffic model, and improvement budget. Measure image and font changes, route splitting, and hosting evidence; do not claim a universal grams-per-view target or equate one energy-source claim with complete impact evidence.

## 12. Runtime, Types, and Workspace Boundaries

For SSR, streaming, Server Components, and islands, keep the first render deterministic and serializable. Access `window`, `document`, `navigator`, storage, layout APIs, and browser-only adapters only in explicit client boundaries or post-mount lifecycle code. Use narrow types, but add runtime validation at trust boundaries.

Select monorepo and build tooling from workspace, deployment, package-manager, policy, and operational constraints. Preserve an existing compatible package manager unless a measured benefit justifies migration. Do not select a bundler from popularity; measure migration cost, build behavior, support policy, and output budgets.

## 13. Constraint-Matched Candidates and Red Flags

After the material-constraints gate passes, compare candidates rather than adopting a scenario label:

| Verified constraint | Candidates to compare |
|---|---|
| Admin UI with no public-content requirement | SPA, SSR, and hybrid delivery using a framework already supported by the team; include startup, caching, security, and operations tradeoffs |
| Mixed public and authenticated content | Next.js, Nuxt, Astro, or equivalent SSR/SSG/island path that meets freshness and interaction needs |
| Content-first site | Astro 7 or an SSG path with islands only for measured interaction needs |
| Performance-critical commerce | SSR/streaming or resumability candidates with laboratory budgets and production RUM/CrUX SLOs |
| Strongly standardized application structure | Angular 22 active line or a comparable platform, with upgrade and runtime budgets |
| Small team with measured client-runtime constraint | Svelte and SvelteKit or an equivalent path, subject to ecosystem and ownership evidence |

Reject or escalate these conditions:

- CSS-in-JS with SSR when runtime theming does not justify runtime, streaming, caching, and hydration cost.
- Global client state used as a cache or authority for server data.
- Custom ARIA without explicit behavior requirements and automated plus assistive-technology validation.
- TypeScript chosen or rejected from team size rather than coordination and maintenance risk.
- A build-tool migration without measured compatibility and output benefits.
- A large global store without a verified workflow, replay, debugging, or migration need.
- Reusable credentials or secrets in JavaScript-accessible storage without a threat model.
- A consequential decision without owner, durable rationale, evidence, and review trigger.
- A legal conformance assertion without product, jurisdiction, exemption, transition, and legal-review evidence.
- Essential content hidden behind unsupported enhancement or an SSR render that reads browser globals.
- Popover, anchor positioning, View Transitions, or scroll-driven animation without fallback and cross-browser tests.

## Resources

Use the official URLs and verification records in `source-index.md`. For future work, re-check official framework, tool, specification, accessibility, security, and legal sources before treating any volatile claim as current.
