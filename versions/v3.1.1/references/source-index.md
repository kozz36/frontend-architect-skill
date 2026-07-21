# Frontend Architecture Source Index

Source index for `../SKILL.md` and `technical-reference.md`.

## Verification Policy

- Do not add new version/API/security claims to `../SKILL.md` or `technical-reference.md` without checking the live source.
- Record newly verified claims with date, source URL, and what was confirmed.
- Distinguish specification existence, maturity, implementation support, and tested interoperability; `Confirmed` never implies all four.
- Prefer primary specifications for normative semantics. Use MDN and compatibility tables as secondary implementation guidance and record target-engine evidence separately.
- `Needs re-verification` below applies to inherited claims not independently recorded in the claim-level log; a later verified claim does not validate every statement associated with the same domain.

## Extracted Sources

| Source | URL | Verification Status |
|--------|-----|---------------------|
| web.dev | https://web.dev/vitals/ | Needs re-verification before new decision claims. |
| w3.org | https://www.w3.org/TR/WCAG22/ | Needs re-verification before new decision claims. |
| tanstack.com | https://tanstack.com/query | Needs re-verification before new decision claims. |
| radix-ui.com | https://www.radix-ui.com/ | Needs re-verification before new decision claims. |
| ark-ui.com | https://ark-ui.com/ | Needs re-verification before new decision claims. |
| ui.shadcn.com | https://ui.shadcn.com/ | Needs re-verification before new decision claims. |
| vitest.dev | https://vitest.dev/guide/browser/ | Needs re-verification before new decision claims. |
| docs.astro.build | https://docs.astro.build/en/concepts/islands/ | Needs re-verification before new decision claims. |
| owasp.org | https://owasp.org/www-project-top-10-client-side-security-risks/ | Needs re-verification before new decision claims. |
| commission.europa.eu | https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en | Needs re-verification before new decision claims. |
| adr.github.io | https://adr.github.io/ | Needs re-verification before new decision claims. |
| thegreenwebfoundation.org | https://www.thegreenwebfoundation.org/ | Needs re-verification before new decision claims. |

## New Verification Log

| Date | Claim | Source | Result |
|------|-------|--------|--------|
| 2026-05-15 | Next.js 16.2.x is current docs line; Node.js 20.9+ required by v16 upgrade guide. | https://nextjs.org/docs and https://nextjs.org/docs/app/guides/upgrading/version-16 | Confirmed. |
| 2026-05-15 | Nuxt 4.4.x is current Nuxt 4 line; Nuxt 5 is still future compatibility/testing path. | https://nuxt.com/docs/4.x and https://github.com/nuxt/nuxt/releases/tag/v4.4.5 | Confirmed. |
| 2026-05-15 | Vue stable is 3.5.34 and Vue 3.6/Vapor is beta prerelease. | https://vuejs.org/about/releases and https://github.com/vuejs/core/releases/tag/v3.6.0-beta.12 | Confirmed. |
| 2026-05-15 | Vite 8 is current supported major; Vite 6 only receives security backports. | https://vite.dev/releases and https://vite.dev/blog/announcing-vite8 | Updated guidance from Vite 6 to Vite 8. |
| 2026-05-15 | Angular active version is 21.2.x; Angular 19 is LTS, not current active. | https://angular.dev/reference/releases and https://github.com/angular/angular/releases/tag/v21.2.12 | Updated guidance from Angular 19 to Angular 21. |
| 2026-05-15 | Vitest visual regression uses toMatchScreenshot; do not document toMatchImageSnapshot as Vitest Browser Mode API. | https://vitest.dev/guide/browser/visual-regression-testing and https://vitest.dev/config/browser/expect | Corrected. |
| 2026-05-15 | v3.0 restructuring only; no new technical/version claims added. | Upstream migration record. | Structural change only. |
| 2026-07-20 | Popover provides non-modal top-layer UI, declarative controls, and `auto`, `hint`, and `manual` states; modal interaction remains a `<dialog>` use case. | https://html.spec.whatwg.org/multipage/popover.html and https://developer.mozilla.org/en-US/docs/Web/API/Popover_API | Semantics confirmed in the HTML Living Standard; MDN is secondary implementation guidance. Target-browser support still requires verification. |
| 2026-07-20 | CSS Anchor Positioning defines anchor association, anchor-relative sizing/positioning, and overflow fallback mechanisms. | https://drafts.csswg.org/css-anchor-position-1/ and https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_anchor_positioning | Semantics confirmed; Level 1 is a Working Draft. Use only as progressive enhancement with target-browser evidence. |
| 2026-07-20 | `@starting-style` enables first-style transitions; top-layer exit transitions may require discrete `display` and `overlay` handling. | https://drafts.csswg.org/css-transitions-2/ and https://developer.mozilla.org/en-US/docs/Web/CSS/@starting-style | Semantics confirmed in CSS Transitions Level 2 Editor's Draft; fallback and target-browser verification remain required. |
| 2026-07-20 | Scroll-driven animations expose scroll and view timelines; unsupported enhancement must not hide essential content. | https://www.w3.org/TR/scroll-animations-1/ and https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_scroll-driven_animations | Semantics confirmed; specification is a Working Draft and interoperability must be checked per target engine. |
| 2026-07-20 | View Transitions support same-document and eligible same-origin cross-document transitions with opt-in and navigation constraints. | https://www.w3.org/TR/css-view-transitions-2/ and https://developer.mozilla.org/en-US/docs/Web/API/View_Transition_API | Semantics confirmed; Level 2 is a Working Draft. MPA eligibility and target-browser support require explicit verification. |
| 2026-07-20 | Current Core Web Vitals are LCP, INP, and CLS; good INP is <=200ms at the 75th percentile, while TBT is a lab proxy rather than a Core Web Vital. | https://web.dev/articles/vitals | Confirmed. |
| 2026-07-20 | WCAG 2.2 is a W3C Recommendation and adds AA criteria including Focus Not Obscured (Minimum) and Target Size (Minimum). | https://www.w3.org/TR/WCAG22/ | Confirmed; no claim that WCAG alone establishes legal compliance. |
| 2026-07-20 | The EAA covers defined products and services including e-commerce and banking; Member States transpose and implement the directive. | https://eur-lex.europa.eu/eli/dir/2019/882/oj/eng and https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en | Scope confirmed from the Directive; Commission guidance is secondary. Legal obligations must be mapped by product, operator, jurisdiction, exemptions, and transition. |
| 2026-07-20 | WCAG 2.2 SC 2.5.8 allows 24×24 CSS px targets, sufficient spacing, or defined exceptions. | https://www.w3.org/TR/WCAG22/#target-size-minimum | Confirmed; 44×44 remains a product baseline, not a WCAG AA requirement. |
| 2026-07-20 | INP is field-measured; Lighthouse uses TBT as a laboratory proxy and cannot prove production INP. | https://web.dev/articles/vitals | Confirmed; CI and production performance gates are separated. |
| 2026-07-20 | Astro's current documentation and release policy must be checked before pinning a major; React Router framework mode supports SSR and prerendering and is the migration path from Remix v2. | https://docs.astro.build/en/reference/ and https://reactrouter.com/upgrading/remix | Confirmed; references use capability gates instead of stale Astro/Remix scenario claims. |
| 2026-07-20 | shadcn/ui supports selectable primitive bases including Radix and Base UI. | https://ui.shadcn.com/docs/installation | Confirmed; the reference no longer treats Radix as the only base. |
| 2026-07-20 | Playwright screenshot baselines must be compared in a consistent environment and may be named by platform or browser. | https://playwright.dev/docs/test-snapshots | Confirmed; visual regression is not restricted to Linux. |
| 2026-07-20 | npm audit supports configurable severity thresholds; blocking policy remains an organizational risk decision. | https://docs.npmjs.com/cli/v11/commands/npm-audit/ | Confirmed; dependency gates use one documented threshold and exception process. |
| 2026-07-20 | Green Web verification may rely on evidence for avoiding, reducing, or compensating emissions rather than only a 100% renewable-energy claim. | https://www.thegreenwebfoundation.org/green-web-check/ | Confirmed; hosting guidance no longer mandates one evidence route. |
