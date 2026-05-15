# Frontend Architecture Source Index

Source index for `../SKILL.md` and `technical-reference.md`.

## Verification Policy

- Do not add new version/API/security claims to `../SKILL.md`, `technical-reference.md`, or `../../../docs/CHANGELOG.md` without checking the live source.
- Record newly verified claims with date, source URL, and what was confirmed.
- Existing URLs below were extracted from the pre-v3 lite material and should be re-checked when used for new claims.

## Extracted Sources

| Source | URL | Verification Status |
|--------|-----|---------------------|
| web.dev | https://web.dev/vitals/ | Needs re-verification before new changelog claims. |
| w3.org | https://www.w3.org/TR/WCAG22/ | Needs re-verification before new changelog claims. |
| tanstack.com | https://tanstack.com/query | Needs re-verification before new changelog claims. |
| radix-ui.com | https://www.radix-ui.com/ | Needs re-verification before new changelog claims. |
| ark-ui.com | https://ark-ui.com/ | Needs re-verification before new changelog claims. |
| ui.shadcn.com | https://ui.shadcn.com/ | Needs re-verification before new changelog claims. |
| vitest.dev | https://vitest.dev/guide/browser/ | Needs re-verification before new changelog claims. |
| docs.astro.build | https://docs.astro.build/en/concepts/islands/ | Needs re-verification before new changelog claims. |
| owasp.org | https://owasp.org/www-project-top-10-client-side-security-risks/ | Needs re-verification before new changelog claims. |
| commission.europa.eu | https://commission.europa.eu/strategy-and-policy/policies/justice-and-fundamental-rights/disability/european-accessibility-act-eaa_en | Needs re-verification before new changelog claims. |
| adr.github.io | https://adr.github.io/ | Needs re-verification before new changelog claims. |
| thegreenwebfoundation.org | https://www.thegreenwebfoundation.org/ | Needs re-verification before new changelog claims. |

## New Verification Log

| Date | Claim | Source | Result |
|------|-------|--------|--------|
| 2026-05-15 | Next.js 16.2.x is current docs line; Node.js 20.9+ required by v16 upgrade guide. | https://nextjs.org/docs and https://nextjs.org/docs/app/guides/upgrading/version-16 | Confirmed. |
| 2026-05-15 | Nuxt 4.4.x is current Nuxt 4 line; Nuxt 5 is still future compatibility/testing path. | https://nuxt.com/docs/4.x and https://github.com/nuxt/nuxt/releases/tag/v4.4.5 | Confirmed. |
| 2026-05-15 | Vue stable is 3.5.34 and Vue 3.6/Vapor is beta prerelease. | https://vuejs.org/about/releases and https://github.com/vuejs/core/releases/tag/v3.6.0-beta.12 | Confirmed. |
| 2026-05-15 | Vite 8 is current supported major; Vite 6 only receives security backports. | https://vite.dev/releases and https://vite.dev/blog/announcing-vite8 | Updated guidance from Vite 6 to Vite 8. |
| 2026-05-15 | Angular active version is 21.2.x; Angular 19 is LTS, not current active. | https://angular.dev/reference/releases and https://github.com/angular/angular/releases/tag/v21.2.12 | Updated guidance from Angular 19 to Angular 21. |
| 2026-05-15 | Vitest visual regression uses toMatchScreenshot; do not document toMatchImageSnapshot as Vitest Browser Mode API. | https://vitest.dev/guide/browser/visual-regression-testing and https://vitest.dev/config/browser/expect | Corrected. |
| 2026-05-15 | v3.0 restructuring only; no new technical/version claims added. | Local migration from `versions/v2.0-lite/SKILL.md` | Structural change only. |
