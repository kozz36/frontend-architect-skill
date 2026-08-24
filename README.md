# 🏗️ frontend-architect-skill

> **General-purpose** frontend architecture skill for **stack definition at project start**.
> Guides framework selection (React, Vue, Svelte, Angular, Next, Nuxt, etc.), rendering
> strategy, state management, design systems, testing, performance, accessibility, AI-Ready
> governance, client-side security (OWASP), ADR traceability, and Green Web sustainability.
> Based on real ecosystem research validated against live sources (July 2026).

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Why This Exists

AI agents (Cursor, Claude Code, Copilot) now consume our codebases directly. A poorly structured `SKILL.md` causes agents to hallucinate patterns, propose deprecated stacks, or omit security hardening entirely.

This skill is a **validated, opinionated reference** for frontend architectural decisions — covering framework selection, rendering strategy, state management, testing, accessibility, **OWASP client-side security**, **AI-ready governance**, and **Green Web sustainability**.

Built from a 688-line research document analyzing the 2025-2026 frontend ecosystem, then cross-checked against live sources (Playwright + arXiv verification).

---

## 📦 Current Skills and Release Archives

`skills/` is the sole authoritative, current, and installable skills.sh surface. Both canonical skills release as v3.1.2. `versions/` contains immutable historical release archives only: it is not a parity source, default selection surface, or current installation path.

| Release | File | Size | When to Use |
|---------|------|------|-------------|
| **v3.1.2** (Current full) | [`skills/frontend-architect/SKILL.md`](skills/frontend-architect/SKILL.md) | Compact runtime + references | Canonical full skill; a clean install includes its references |
| **v3.1.2** (Current lite) | [`skills/frontend-architect-lite/SKILL.md`](skills/frontend-architect-lite/SKILL.md) | ~385 lines | Canonical lite skill for rapid stack selection |
| **v3.1.2** (Archive) | [`versions/v3.1.2/SKILL.md`](versions/v3.1.2/SKILL.md) | Compact runtime + references | Immutable archived snapshot; not an installation source |
| **v3.1.1** (Historical) | [`versions/v3.1.1/SKILL.md`](versions/v3.1.1/SKILL.md) | Compact runtime + references | Independently verified precision patch for normative claims, compatibility gates, security, and source traceability |
| **v3.1** (Historical) | [`versions/v3.1/SKILL.md`](versions/v3.1/SKILL.md) | Compact runtime + references | July 2026 native-platform and architecture update |
| **v3.0** (Historical) | [`versions/v3.0/SKILL.md`](versions/v3.0/SKILL.md) | ~55 lines + references | May 2026 references-based runtime skill |
| **v2.0** (Historical) | [`versions/v2.0/SKILL.md`](versions/v2.0/SKILL.md) | ~556 lines | Preserved for backward compatibility; verify claims against v3 before reuse |
| **v2.0-lite** (Historical) | [`versions/v2.0-lite/SKILL.md`](versions/v2.0-lite/SKILL.md) | ~385 lines | Immutable historical lite archive; not an installation source |
| **v1.0** (Original) | [`versions/v1.0/SKILL.md`](versions/v1.0/SKILL.md) | ~367 lines | Pre-2026 reference. Preserved for backward compatibility |

### What's New in v3.1.2 (August 2026)

- Removes the mandatory `docs/product-charter.md` path dependency while preserving constraint-based stack selection.
- Requires repository-native product, constraint, ADR, and review conventions when available; conventional defaults are recommendations only when those conventions are absent.
- Requires live verification before version-sensitive guidance, changelog claims, or release-note claims.
- Adds a canonical `skills/` catalog for full and lite installation while preserving `versions/` as historical archives.

---

## 🚀 Quick Start

### For AI Agents (Cursor, Claude Code, etc.)

```bash
# Default listing: frontend-architect and frontend-architect-lite only
npx skills add --list

# Clean install: full v3.1.2, including references
npx skills add kozz36/frontend-architect-skill@frontend-architect

# Clean install: lite v3.1.2
npx skills add kozz36/frontend-architect-skill@frontend-architect-lite
```

Browse the canonical catalog on [skills.sh](https://skills.sh/kozz36/frontend-architect-skill). The default listing and clean installs resolve only `skills/`: they never select v1.0, v2.0-lite, or any `versions/` archive.

### For Human Architects

Open `skills/frontend-architect/SKILL.md` for the current full runtime contract, then use `skills/frontend-architect/references/technical-reference.md` for detailed matrices. `versions/v3.1.2/` is an archive-only snapshot, not a current installation path. Key reference areas:
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
versions/                       # Immutable historical archives only; never a default install path
├── v1.0/
├── v2.0/
├── v2.0-lite/
├── v3.0/
├── v3.1/
├── v3.1.1/
└── v3.1.2/
    ├── SKILL.md
    └── references/
        ├── technical-reference.md
        └── source-index.md
docs/
├── CHANGELOG.md                # Verified version history
└── CONTRIBUTING.md             # How to contribute improvements
```

---

## 🔍 Verification Methodology

Every version claim was validated against live sources:

| Source | Verification Method | Status |
|--------|---------------------|--------|
| Next.js 16 | Playwright navigation nextjs.org/blog/next-16 | ✅ Real (Oct 2025) |
| Nuxt 4 | Delegated agent → nuxt.com/docs/4.x | ✅ Real (Jul 2025) |
| Vitest 4.1.5 | Playwright navigation vitest.dev | ✅ Real (Apr 2026) |
| Vue 3.6 | Delegated agent → vuejs.org + GitHub PRs | ⚠️ Beta only |
| OWASP Client-Side | Delegated agent → owasp.org | ✅ Real, active |
| EAA Directive | Delegated agent → commission.europa.eu | ✅ Real, enforced |
| Workstream paper | Playwright → arxiv.org/abs/2604.17055 | ✅ Real |

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
