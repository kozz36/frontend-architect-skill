# Frontend Architecture Source Index

Source index for `../SKILL.md` and `technical-reference.md`.

## Verification Policy

- Do not add new version/API/security claims to `../SKILL.md` or `technical-reference.md` without checking the live source.
- Record newly verified claims with date, source URL, and what was confirmed.
- Existing URLs below were extracted from the pre-v3 lite material and should be re-checked when used for new claims.

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
| 2026-07-20 | Popover API provides non-modal top-layer UI, declarative controls, and `auto`, `hint`, and `manual` states; modal interaction remains a `<dialog>` use case. | https://developer.mozilla.org/en-US/docs/Web/API/Popover_API | Confirmed; documented with behavioral and support-matrix gates. |
| 2026-07-20 | CSS Anchor Positioning defines anchor association, anchor-relative sizing/positioning, and overflow fallback mechanisms. | https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_anchor_positioning | Confirmed; documented as progressive enhancement rather than a universal replacement. |
| 2026-07-20 | `@starting-style` enables first-style transitions; top-layer exit transitions may require discrete `display` and `overlay` handling. | https://developer.mozilla.org/en-US/docs/Web/CSS/@starting-style | Confirmed; fallback and reduced-motion requirements retained. |
| 2026-07-20 | Scroll-driven animations expose scroll and view timelines; unsupported enhancement must not hide essential content. | https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_scroll-driven_animations | API confirmed; cross-browser use remains feature-gated. |
| 2026-07-20 | View Transition API supports same-document and cross-document transitions, with `@view-transition` used to opt in cross-document navigation. | https://developer.mozilla.org/en-US/docs/Web/API/View_Transition_API | Confirmed; adoption remains conditional on product value and browser support. |
| 2026-07-20 | Current Core Web Vitals are LCP, INP, and CLS; good INP is <=200ms at the 75th percentile, while TBT is a lab proxy rather than a Core Web Vital. | https://web.dev/articles/vitals | Confirmed. |
| 2026-07-20 | WCAG 2.2 is a W3C Recommendation and adds AA criteria including Focus Not Obscured (Minimum) and Target Size (Minimum). | https://www.w3.org/TR/WCAG22/ | Confirmed; no claim that WCAG alone establishes legal compliance. |
| 2026-07-20 | The EAA covers defined products and services including e-commerce and banking; Member States transpose and implement the directive. | https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en | Confirmed; legal obligations must be mapped by product scope and jurisdiction. |
