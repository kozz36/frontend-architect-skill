# 🏗️ frontend-architect-skill

> **General-purpose** frontend architecture skill for **stack definition at project start**.
> Guides framework selection (React, Vue, Svelte, Angular, Next, Nuxt, etc.), rendering
> strategy, state management, design systems, testing, performance, accessibility, AI-Ready
> governance, client-side security (OWASP), ADR traceability, and Green Web sustainability.
> Uses a canonical full runtime with official-source evidence refreshed on 2026-08-24; release-sensitive guidance requires a fresh live check before use.

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Why This Exists

AI agents (Cursor, Claude Code, Copilot) now consume our codebases directly. A poorly structured `SKILL.md` causes agents to hallucinate patterns, propose deprecated stacks, or omit security hardening entirely.

This skill is a **validated, opinionated reference** for frontend architectural decisions — covering framework selection, rendering strategy, state management, testing, accessibility, **OWASP client-side security**, **AI-ready governance**, and **Green Web sustainability**.

The canonical full runtime is the release basis. The lite runtime is a compact derivation from that full runtime, its local technical reference, and its source index.

---

## 📦 Current Skills and Release Archives

`skills/` is the sole authoritative, current, and installable skills.sh surface. Both canonical skills release as v3.1.2. `versions/` contains immutable historical release archives only: it contains no `SKILL.md`, is not a parity source or installation path, and is excluded from default and supported full-depth discovery.

| Release | File | Size | When to Use |
|---------|------|------|-------------|
| **v3.1.2** (Current full) | [`skills/frontend-architect/SKILL.md`](skills/frontend-architect/SKILL.md) | Compact runtime + references | Canonical full skill; a clean install includes its references |
| **v3.1.2** (Current lite) | [`skills/frontend-architect-lite/SKILL.md`](skills/frontend-architect-lite/SKILL.md) | Compact runtime | Derived from the frozen canonical full runtime; canonical lite skill for rapid decisions |
| **v3.1.2** (Full archive) | [`versions/v3.1.2/ARCHIVE.md`](versions/v3.1.2/ARCHIVE.md) | Compact runtime + references | Immutable byte-preserved historical snapshot; not an installation source |
| **v3.1.2** (Lite archive) | [`versions/v3.1.2-lite/ARCHIVE.md`](versions/v3.1.2-lite/ARCHIVE.md) | Compact runtime | Byte-identical lite archive; not an installation source |
| **v3.1.1** (Historical) | [`versions/v3.1.1/ARCHIVE.md`](versions/v3.1.1/ARCHIVE.md) | Compact runtime + references | Independently verified precision patch for normative claims, compatibility gates, security, and source traceability |
| **v3.1** (Historical) | [`versions/v3.1/ARCHIVE.md`](versions/v3.1/ARCHIVE.md) | Compact runtime + references | July 2026 native-platform and architecture update |
| **v3.0** (Historical) | [`versions/v3.0/ARCHIVE.md`](versions/v3.0/ARCHIVE.md) | ~55 lines + references | May 2026 references-based runtime skill |
| **v2.0** (Historical) | [`versions/v2.0/ARCHIVE.md`](versions/v2.0/ARCHIVE.md) | ~556 lines | Preserved for backward compatibility; verify claims against v3 before reuse |
| **v2.0-lite** (Historical) | [`versions/v2.0-lite/ARCHIVE.md`](versions/v2.0-lite/ARCHIVE.md) | ~385 lines | Immutable historical lite archive; not an installation source |
| **v1.0** (Original) | [`versions/v1.0/ARCHIVE.md`](versions/v1.0/ARCHIVE.md) | ~367 lines | Pre-2026 reference. Preserved for backward compatibility |

### What's New in v3.1.2 (August 2026)

- Removes the mandatory `docs/product-charter.md` path dependency while preserving constraint-based stack selection.
- Requires repository-native product, constraint, ADR, and review conventions when available; conventional defaults are recommendations only when those conventions are absent.
- Requires live verification before version-sensitive guidance, changelog claims, or release-note claims.
- Adds a canonical `skills/` catalog for full and lite installation while preserving `versions/` as historical archives.
- Refreshes release-sensitive evidence for Angular 22, Astro 7, Vue 3.6 status handling, Next.js 16.3.2, Nuxt 4.5.2, Pinia 4, and Vitest; retained release data is dated evidence, not a default pin.
- Regenerates the lite runtime from frozen full inputs with a checked derivation manifest and a byte-identical non-discoverable archive.

---

## 🚀 Quick Start

### For AI Agents (Cursor, Claude Code, etc.)

```bash
# Default listing: frontend-architect and frontend-architect-lite only
npx skills add kozz36/frontend-architect-skill --list

# Clean install: full v3.1.2, including references
npx skills add kozz36/frontend-architect-skill@frontend-architect

# Clean install: lite v3.1.2
npx skills add kozz36/frontend-architect-skill@frontend-architect-lite
```

Browse the canonical catalog on [skills.sh](https://skills.sh/kozz36/frontend-architect-skill). The default listing, supported full-depth discovery, and clean installs resolve only the two `skills/*/SKILL.md` files; they never select a `versions/` archive.

### Lite derivation policy

Each lite release follows one direction: **full X first -> freeze inputs -> inventory invariants -> compact -> validate -> archive**. The frozen sources are the canonical full runtime, technical reference, and source index; prior lite files and archives are prohibited inputs. `derivations/frontend-architect-lite-v3.1.2.json` records input hashes, invariant-to-lite mappings, justified non-normative omissions, and the generated lite hash. Run `scripts/validate-derived-lite.sh` for machine-checkable integrity; independent review evaluates semantic coverage.

### For Human Architects

Open `skills/frontend-architect/SKILL.md` for the current full runtime contract, then use `skills/frontend-architect/references/technical-reference.md` for detailed matrices. `versions/v3.1.2/ARCHIVE.md` is a byte-preserved archive-only snapshot, not a current installation path. Key reference areas:
- **Section 13** — Quick Stack Selector (decision tree)
- **Section 9** — Security hardening checklist
- **Section 10** — ADR template for your next RFC

---

## 📁 Structure

```
skills/                         # Sole authoritative/current/installable skills.sh surface
├── frontend-architect/          # Current full release v3.1.2
│   ├── SKILL.md
│   └── references/
│       ├── technical-reference.md
│       └── source-index.md
└── frontend-architect-lite/     # Current lite release v3.1.2
    └── SKILL.md
versions/                       # Immutable historical archives only; never an install path
├── v1.0/                         # ARCHIVE.md
├── v2.0/                         # ARCHIVE.md
├── v2.0-lite/                    # ARCHIVE.md
├── v3.0/                         # ARCHIVE.md + references/
├── v3.1/                         # ARCHIVE.md + references/
├── v3.1.1/                       # ARCHIVE.md + references/
├── v3.1.2/
│   ├── ARCHIVE.md
│   └── references/
│       ├── technical-reference.md
│       └── source-index.md
└── v3.1.2-lite/
    └── ARCHIVE.md
scripts/
└── validate-derived-lite.sh         # Machine-checkable derivation integrity
derivations/
└── frontend-architect-lite-v3.1.2.json
docs/
├── CHANGELOG.md                # Verified version history
└── CONTRIBUTING.md             # How to contribute improvements
```

---

## 🔍 Verification Methodology

The canonical source index records official URLs, claim scope, observed result, and date. On 2026-08-24, the audited evidence covered Angular 22, Astro 7 and its repaired upgrade URL, the Vue release channel, Next.js 16.3.2, Nuxt 4.5.2, Pinia 4.0.3, and Vitest 4.1.11. These snapshots are not permanent pins: agents must live-check the official source before using a volatile claim in a decision, changelog, or release note.

Run the repository-native derivation check before submitting a lite update:

```bash
scripts/validate-derived-lite.sh
```

It fails on version or frozen-source-hash drift, missing invariant anchors, full/lite archive mismatch, discoverable archive `SKILL.md`, or a prior-lite source input. It intentionally does not claim to prove semantic strength.

---

## 🤝 Contributing

This skill is maintained as a living document. See [`docs/CONTRIBUTING.md`](docs/CONTRIBUTING.md) for:
- How to propose additions (new frameworks, updated versions)
- Verification requirements before merging
- Style guide (tables > narrative, decision trees > lists)

---

## 📝 License

Apache-2.0

---

**Maintained by:** [@kozz36](https://github.com/kozz36)  
**Research base:** "Evaluación y Mejora de Skill" (688-line ecosystem analysis, 2026)
