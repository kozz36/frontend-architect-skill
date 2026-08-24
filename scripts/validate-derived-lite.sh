#!/usr/bin/env bash
# Validates derivation integrity; semantic coverage remains an independent-review responsibility.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly ROOT
MANIFEST="$ROOT/derivations/frontend-architect-lite-v3.1.2.json"
readonly MANIFEST

python3 - "$ROOT" "$MANIFEST" <<'PY'
import hashlib
import json
import re
import sys
from pathlib import Path

root = Path(sys.argv[1])
manifest_path = Path(sys.argv[2])
expected_version = "3.1.2"
expected_sources = [
    "skills/frontend-architect/SKILL.md",
    "skills/frontend-architect/references/technical-reference.md",
    "skills/frontend-architect/references/source-index.md",
]
full_archive_pairs = [
    ("skills/frontend-architect/SKILL.md", "versions/v3.1.2/ARCHIVE.md"),
    ("skills/frontend-architect/references/technical-reference.md", "versions/v3.1.2/references/technical-reference.md"),
    ("skills/frontend-architect/references/source-index.md", "versions/v3.1.2/references/source-index.md"),
]


def fail(message):
    print(f"FAIL: {message}", file=sys.stderr)
    raise SystemExit(1)


def read_bytes(relative):
    path = root / relative
    if not path.is_file():
        fail(f"missing required file: {relative}")
    return path.read_bytes()


def sha256(relative):
    return hashlib.sha256(read_bytes(relative)).hexdigest()


def skill_version(relative):
    text = read_bytes(relative).decode("utf-8")
    match = re.search(r'^  version: "([^"]+)"$', text, re.MULTILINE)
    if not match:
        fail(f"missing metadata version: {relative}")
    return match.group(1)

try:
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
except FileNotFoundError:
    fail("missing derivation manifest")
except json.JSONDecodeError as error:
    fail(f"invalid derivation manifest JSON: {error}")

if manifest.get("schemaVersion") != "frontend-architect-lite-derivation/v1":
    fail("unexpected derivation manifest schema")
if manifest.get("fullVersion") != expected_version or manifest.get("liteVersion") != expected_version:
    fail("full/lite manifest version mismatch")

for relative in (
    "skills/frontend-architect/SKILL.md",
    "skills/frontend-architect-lite/SKILL.md",
    "versions/v3.1.2/ARCHIVE.md",
    "versions/v3.1.2-lite/ARCHIVE.md",
):
    if skill_version(relative) != expected_version:
        fail(f"metadata version mismatch: {relative}")

source_inputs = manifest.get("sourceInputs")
if not isinstance(source_inputs, list):
    fail("sourceInputs must be a list")
source_paths = [item.get("path") for item in source_inputs if isinstance(item, dict)]
if source_paths != expected_sources:
    fail("sourceInputs must be exactly the canonical full runtime and local references")
for item in source_inputs:
    relative = item["path"]
    if "lite" in relative.lower():
        fail(f"forbidden prior-lite source path: {relative}")
    if item.get("sha256") != sha256(relative):
        fail(f"source hash drift: {relative}")

forbidden = manifest.get("forbiddenPriorLiteInputs")
if not isinstance(forbidden, list) or not forbidden:
    fail("missing forbidden prior-lite input inventory")
if set(source_paths) & set(forbidden):
    fail("manifest sourceInputs includes a forbidden prior-lite input")

for canonical, archive in full_archive_pairs:
    if read_bytes(canonical) != read_bytes(archive):
        fail(f"full archive mismatch: {archive}")

generated_lite = manifest.get("generatedLite", {})
lite_path = generated_lite.get("path")
if lite_path != "skills/frontend-architect-lite/SKILL.md":
    fail("generatedLite path mismatch")
if generated_lite.get("sha256") != sha256(lite_path):
    fail("generated lite hash drift")
if read_bytes(lite_path) != read_bytes("versions/v3.1.2-lite/ARCHIVE.md"):
    fail("lite archive mismatch")

if "v2.0" in read_bytes(lite_path).decode("utf-8"):
    fail("lite contains a v2 fingerprint")
archive_skills = sorted(path.relative_to(root).as_posix() for path in (root / "versions").rglob("SKILL.md"))
if archive_skills:
    fail(f"discoverable archive SKILL.md: {', '.join(archive_skills)}")

def normalize_full_heading(heading):
    return re.sub(r"^\d+\.\s+", "", heading).strip()


full_headings = set()
for source_path in expected_sources:
    source_text = read_bytes(source_path).decode("utf-8")
    full_headings.update(
        normalize_full_heading(match.group(1))
        for match in re.finditer(r"^#{1,3}\s+(.+?)\s*$", source_text, re.MULTILINE)
    )
lite_text = read_bytes(lite_path).decode("utf-8")
lite_headings = {
    match.group(1).strip()
    for match in re.finditer(r"^##\s+(.+?)\s*$", lite_text, re.MULTILINE)
}
expected_invariant_ids = (
    "accessibility-legal-scope",
    "activation-scope",
    "conditional-stack-rendering",
    "constraint-stop",
    "design-css-tool-choices",
    "performance-testing",
    "progressive-enhancement",
    "repository-discovery",
    "risks-fallback-output",
    "security-privacy-threat-model",
    "ssr-runtime-boundaries",
    "state-boundaries",
    "version-live-evidence",
)
expected_invariant_count = 13
invariants = manifest.get("invariantInventory")
if not isinstance(invariants, list) or not invariants:
    fail("missing invariant inventory")
if len(invariants) != expected_invariant_count:
    fail(f"invariant inventory count must be exactly {expected_invariant_count}, got {len(invariants)}")
if len(expected_invariant_ids) != expected_invariant_count:
    fail("validator expected invariant inventory is inconsistent")
seen_ids = set()
for invariant in invariants:
    if not isinstance(invariant, dict):
        fail("invariant inventory entry must be an object")
    invariant_id = invariant.get("id")
    category = invariant.get("category")
    full_anchors = invariant.get("fullAnchors")
    lite_anchors = invariant.get("liteAnchors")
    if not isinstance(invariant_id, str) or invariant_id in seen_ids:
        fail("invariant inventory contains a missing or duplicate id")
    seen_ids.add(invariant_id)
    if not isinstance(category, str) or not category:
        fail(f"invariant missing category: {invariant_id}")
    if not isinstance(full_anchors, list) or not full_anchors:
        fail(f"invariant missing full anchors: {invariant_id}")
    if not isinstance(lite_anchors, list) or not lite_anchors:
        fail(f"invariant missing lite anchors: {invariant_id}")
    for anchor in full_anchors:
        if anchor not in full_headings:
            fail(f"missing mapped full invariant anchor: {invariant_id} -> {anchor}")
    for anchor in lite_anchors:
        if anchor not in lite_headings:
            fail(f"missing mapped lite invariant anchor: {invariant_id} -> {anchor}")

if tuple(sorted(seen_ids)) != expected_invariant_ids:
    missing_ids = sorted(set(expected_invariant_ids) - seen_ids)
    unexpected_ids = sorted(seen_ids - set(expected_invariant_ids))
    fail(
        "invariant inventory IDs must exactly match the pinned inventory; "
        f"missing: {', '.join(missing_ids) or 'none'}; "
        f"unexpected or renamed: {', '.join(unexpected_ids) or 'none'}"
    )

omissions = manifest.get("nonNormativeOmissions")
if not isinstance(omissions, list) or not omissions:
    fail("missing justified non-normative omissions")
for omission in omissions:
    if not isinstance(omission, dict) or not omission.get("category") or not omission.get("justification"):
        fail("invalid non-normative omission")

print("PASS: derived lite integrity checks passed")
PY
