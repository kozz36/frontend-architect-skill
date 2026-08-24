# Frontend Architecture Source Index

Official-source evidence for `../SKILL.md` and `technical-reference.md`.

## Verification Policy

- Do not use a new version, release channel, API, security, accessibility, or legal-status claim in decision guidance, a changelog, or a release note without a live official-source check.
- Record the exact claim, source URL, verification date, and observed result. A successful URL request proves reachability, not support in every target runtime.
- Separate specification semantics, implementation support, target-browser support, tested interoperability, policy, and legal applicability.
- Prefer primary specifications and release owners for normative semantics and releases. Use secondary compatibility material only for implementation guidance and record target-engine evidence separately.
- Re-verify every volatile release/status claim immediately before using it in a recommendation. The 2026-08-24 entries below are an audit snapshot, not a permanent pin.

## Official Sources

| Domain | Official source | Verified 2026-08-24 | Use |
|---|---|---|---|
| Angular release support | https://angular.dev/reference/releases | HTTP 200; current documentation served the v22 release site | Verify active/support status before adopting Angular |
| Angular release tag | https://github.com/angular/angular/releases/tag/v22.1.3 | HTTP 200 | Evidence for the audited Angular 22 release-line snapshot |
| Astro 7 announcement | https://astro.build/blog/astro-7/ | HTTP 200; official Astro 7.0 announcement | Current-major snapshot; replaces the retired Astro reference endpoint |
| Astro 7 upgrade guide | https://docs.astro.build/en/guides/upgrade-to/v7/ | HTTP 200 | Verify upgrade and migration conditions |
| Astro islands | https://docs.astro.build/en/concepts/islands/ | HTTP 200 | Islands capability reference |
| Vue release policy | https://vuejs.org/about/releases | HTTP 200 | Release-channel and pre-release stability policy |
| Vue latest release | https://github.com/vuejs/core/releases/latest | HTTP 200; redirected to `v3.5.41` | Latest-tag snapshot; do not infer a Vue 3.6 status |
| Next.js release | https://github.com/vercel/next.js/releases/tag/v16.3.2 | HTTP 200 | Exact audited release tag |
| Nuxt release | https://github.com/nuxt/nuxt/releases/tag/v4.5.2 | HTTP 200 | Exact audited release tag |
| Pinia release | https://github.com/vuejs/pinia/releases/tag/v4.0.0 | HTTP 200 | Pinia 4 release-line evidence |
| Pinia package metadata | https://registry.npmjs.org/pinia/latest | HTTP 200; latest `version` field was `4.0.3` | Exact package-patch snapshot; re-check before pinning |
| Vitest release | https://github.com/vitest-dev/vitest/releases/latest | HTTP 200; redirected to `v4.1.11` | Latest-patch snapshot; re-check before pinning |
| Core Web Vitals | https://web.dev/articles/vitals | HTTP 200 | Metric definitions and field/lab distinction; live-check before a new metric claim |
| WCAG 2.2 | https://www.w3.org/TR/WCAG22/ | HTTP 200 | Normative accessibility semantics; live-check before a conformance claim |
| EAA Directive | https://eur-lex.europa.eu/eli/dir/2019/882/oj/eng | HTTP 200 | Product/service, jurisdiction, exemption, and transition analysis; live-check before a legal claim |
| OWASP client-side risks | https://owasp.org/www-project-top-10-client-side-security-risks/ | HTTP 200 | Threat-model guidance; live-check before a new security-status claim |
| npm audit | https://docs.npmjs.com/cli/v11/commands/npm-audit/ | HTTP 200 | Audit command behavior; policy remains organizational |
| HTML Popover | https://html.spec.whatwg.org/multipage/popover.html | HTTP 200 | Normative semantics; support and fallback remain separate |
| CSS Anchor Positioning | https://drafts.csswg.org/css-anchor-position-1/ | HTTP 200 | Draft semantics; target support remains separate |
| CSS Transitions | https://drafts.csswg.org/css-transitions-2/ | HTTP 200 | `@starting-style` and discrete-transition semantics |
| View Transitions | https://www.w3.org/TR/css-view-transitions-2/ | HTTP 200 | Same- and cross-document semantics |

## Retained Volatile Claim Log

| Date | Claim | Official source evidence | Result and required use |
|---|---|---|---|
| 2026-08-24 | Angular's active release documentation was on the v22 site; the latest official tag resolved to `v22.1.3`. | Angular support page and release tag above | Keep `Angular 22 active line` only as a dated snapshot; live-check support state before selection. |
| 2026-08-24 | Astro 7 is the current-major release evidence used by this reference; the Astro 7 announcement and v7 upgrade guide are reachable. | Astro URLs above | Use Astro 7 only after validating adapter, application mode, and upgrade constraints. Do not restore the retired Astro reference endpoint. |
| 2026-08-24 | The latest official Vue release redirect resolved to `v3.5.41`; Vue's official policy says pre-releases are unstable. | Vue URLs above | Vue 3.6/Vapor status is unconfirmed by this snapshot and must be checked live for the exact release channel before a production claim. |
| 2026-08-24 | `v16.3.2` was the audited Next.js release tag. | Next.js release tag above | Treat it as evidence, not a durable default or feature guarantee. |
| 2026-08-24 | `v4.5.2` was the audited Nuxt release tag. | Nuxt release tag above | Treat it as evidence, not a durable default or feature guarantee. |
| 2026-08-24 | Pinia 4 release evidence was reachable; the official npm registry latest metadata reported `4.0.3`. | Pinia URLs above | Re-check exact package and framework compatibility before pinning. |
| 2026-08-24 | The official Vitest latest-release redirect resolved to `v4.1.11`. | Vitest release URL above | Re-check the patch and Browser Mode/provider API before pinning or publishing a test recommendation. |

## Durable Claim Records

| Date | Claim | Source | Result |
|---|---|---|---|
| 2026-07-20 | Core Web Vitals are LCP, INP, and CLS; good INP is <=200 ms at the 75th percentile, while TBT is a laboratory proxy. | https://web.dev/articles/vitals | Use field and laboratory evidence separately. Re-check the live page before introducing a new metric claim. |
| 2026-07-20 | WCAG 2.2 SC 2.5.8 permits 24 x 24 CSS-pixel targets, spacing, or defined exceptions. | https://www.w3.org/TR/WCAG22/#target-size-minimum | A 44 x 44 target remains a product baseline, not a WCAG AA requirement. |
| 2026-07-20 | EAA applicability depends on covered product/service, operator, Member State implementation, exemptions, and transitions. | https://eur-lex.europa.eu/eli/dir/2019/882/oj/eng | Do not assert legal compliance without jurisdictional mapping and qualified legal review. |
| 2026-07-20 | Cookie storage, SameSite choice, and dependency-audit blocking policy require threat-model and policy context. | https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie and https://docs.npmjs.com/cli/v11/commands/npm-audit/ | Select controls from data classification, navigation/CSRF model, severity, exploitability, reachability, asset sensitivity, and owned exceptions. |
| 2026-07-20 | Popover, anchor positioning, `@starting-style`, scroll-driven animation, and View Transitions require separate semantics, support, and fallback checks. | URLs in the official-source table | Preserve a fully usable unenhanced state and test target engines. |
