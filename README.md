# 🏗️ frontend-architect-skill

> Strategic frontend architecture decisions for AI agents and engineering teams. Based on real ecosystem research validated against live sources (May 2026).

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Why This Exists

AI agents (Cursor, Claude Code, Copilot) now consume our codebases directly. A poorly structured `SKILL.md` causes agents to hallucinate patterns, propose deprecated stacks, or omit security hardening entirely.

This skill is a **validated, opinionated reference** for frontend architectural decisions — covering framework selection, rendering strategy, state management, testing, accessibility, **OWASP client-side security**, **AI-ready governance**, and **Green Web sustainability**.

Built from a 688-line research document analyzing the 2025-2026 frontend ecosystem, then cross-checked against live sources (Playwright + arXiv verification).

---

## 📦 Versions

| Version | File | Size | When to Use |
|---------|------|------|-------------|
| **v2.0** (Full) | [`versions/v2.0/SKILL.md`](versions/v2.0/SKILL.md) | ~556 lines | Senior architects, detailed decision-making, multiple patterns per section |
| **v2.0-lite** | [`versions/v2.0-lite/SKILL.md`](versions/v2.0-lite/SKILL.md) | ~385 lines | Rapid kickoffs, MVP decisions, CI/CD ingestion, under time pressure |
| **v1.0** (Original) | [`versions/v1.0/SKILL.md`](versions/v1.0/SKILL.md) | ~367 lines | Pre-2026 reference. Preserved for backward compatibility |

### What's New in v2.0 (May 2026)

Validated against real ecosystem state:
- ✅ **Next.js 16** — Cache Components, `updateTag`, `proxy.ts`, Turbopack stable
- ✅ **Nuxt 4** — Layers for modular monorepo, Nitro engine
- ✅ **Vitest 4.1.5** — Native Browser Mode with Playwright, ARIA snapshots, visual regression
- ⚠️ **Vue 3.6 / Vapor Mode** — Explicitly marked as beta. Production recommendation stays on 3.5+
- ✅ **OWASP Client-Side Top 10** — Real, active hardening reference
- ✅ **European Accessibility Act** — Enforcement active since June 2025

**New domains not in v1:**
- 🤖 **AI-Ready Architecture** — 5 rules preventing AI agent hallucinations when consuming your codebase
- 🔐 **Client-Side Security (OWASP)** — Actionable hardening table + 6-point checklist
- 📋 **Governance: ADRs** — Architecture Decision Records template with lifecycle rules (RAG-ingestible)
- 🌱 **Green Web** — Carbon budget targets, optimization techniques, auditing tools

---

## 🚀 Quick Start

### For AI Agents (Cursor, Claude Code, etc.)

```bash
# Clone into your skills directory
git clone https://github.com/kozz36/frontend-architect-skill.git

# Use the version that matches your need:
# - Full → detailed architectural planning
# - Lite → rapid stack selection under constraints
```

### For Human Architects

Open `versions/v2.0/SKILL.md` and jump to:
- **Section 13** — Quick Stack Selector (decision tree)
- **Section 9** — Security hardening checklist
- **Section 10** — ADR template for your next RFC

---

## 📁 Structure

```
versions/
├── v1.0/
│   └── SKILL.md              # Original (pre-2026)
├── v2.0/
│   └── SKILL.md              # Full reference (2026)
└── v2.0-lite/
    └── SKILL.md              # Condensed for rapid decisions
docs/
├── CHANGELOG.md              # Verified version history
└── CONTRIBUTING.md           # How to contribute improvements
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
