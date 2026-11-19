#!/usr/bin/env python3
"""Fresh isolated checks for scalar rows and balanced graph partitions."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import verify_frankl_graph_helpers as helpers
import verify_frankl_graph_pilot as pilot
import verify_frankl_orbit_batches as orbit


ROOT = Path(__file__).resolve().parents[1]
INVENTORY_PATH = "docs/frankl-graph-integration-sources.json"
GATE_INPUTS = (
    "scripts/verify_frankl_graph_integration_helpers.py",
    "scripts/verify_frankl_graph_pilot.py",
    "scripts/verify_frankl_graph_helpers.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-graph-integration-helpers.yml",
    INVENTORY_PATH,
    "docs/frankl-graph-helpers-sources.json",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)


def specification(inventory, name):
    if name != "graph-integration-helpers":
        raise ValueError("Unknown graph integration group")
    if inventory["schema"] != "frankl-span-four-graph-integration-helpers-v1":
        raise ValueError("Unexpected graph integration inventory schema")
    helpers.preflight_sources()
    modules = orbit.dependency_order([inventory["root"]])
    if set(modules) != set(inventory["source_sha256"]):
        raise ValueError("Source inventory differs from the exact import closure")
    for module in modules:
        if orbit.digest(orbit.source(module)) != inventory["source_sha256"][module]:
            raise ValueError("Pinned source changed: " + module)
    for path, expected in inventory["engine_sha256"].items():
        if orbit.digest(ROOT / path) != expected:
            raise ValueError("Reviewed engine changed: " + path)
    private_by_module = helpers.explicit_private_proofs(modules)
    private = sorted(name for names in private_by_module.values() for name in names)
    if private != inventory["required_explicit_private_proofs"]:
        raise ValueError("Explicit private-proof inventory differs")
    required = sorted(set(inventory["required_theorems"] +
                          helpers.INVENTORY["required_theorems"]))
    if any("Vaughan" in module or "Matching" in module for module in modules):
        raise ValueError("Generic graph bridges must not import heavy arithmetic data")
    return ({"id": name, "roots": [inventory["root"]], "rows": 0,
             "private_chunks": len(private), "scope": inventory["scope"]},
            modules, required, private)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, default=4, choices=range(1, 5))
    parser.add_argument("--runtime", type=Path)
    parser.add_argument("--artifact-dir", type=Path)
    args = parser.parse_args()
    args.group = "graph-integration-helpers"
    inventory = json.loads((ROOT / INVENTORY_PATH).read_text())
    group, modules, required, private = specification(inventory, args.group)
    if args.plan:
        print(json.dumps({"group": group, "modules": modules,
                          "required": required, "private": private}, indent=2))
        return
    stage = (args.artifact_dir or ROOT /
             ".candidate-artifacts/frankl-graph-integration-helpers").resolve()
    args.artifact_dir = stage
    if stage.exists() and any(stage.iterdir()):
        raise ValueError("Preserve existing gate evidence: " + str(stage))
    orbit.GATE_INPUTS = GATE_INPUTS
    orbit.group_spec = specification
    orbit.audit_source = pilot.audit_source
    try:
        orbit.run_group(args, inventory)
        details = pilot.declaration_inventory(stage, modules, required, private)
        receipt = json.loads((stage / "receipt.json").read_text())
        receipt["scope"] = inventory["scope"]
        receipt["graph_declaration_inventory"] = details
        receipt["status"] = "passed"
        orbit.write_receipt(stage, receipt)
    except BaseException as error:
        if (stage / "receipt.json").exists():
            receipt = json.loads((stage / "receipt.json").read_text())
            receipt.update({"status": "failed", "error": str(error),
                            "scope": inventory["scope"]})
            orbit.write_receipt(stage, receipt)
        raise
    print("PASS: scalar-word/row and balanced-partition helpers; no full graph data checked.", flush=True)


if __name__ == "__main__":
    main()
