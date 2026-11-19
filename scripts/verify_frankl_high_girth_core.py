#!/usr/bin/env python3
"""Fresh exact proof gate for actual-graph high-girth counts and distinct-union transfer."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-high-girth-graph-core-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_high_girth_core.py",
    ".github/workflows/lean-frankl-high-girth-core.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-high-girth-graph-core-v1":
        raise ValueError("Unexpected high-girth core source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {
        "Conjectures.FranklBoundaryAveraging",
        "Conjectures.FranklBoundaryBall",
        "Conjectures.FranklBoundaryConfigurationHelpers",
        "Conjectures.FranklBoundaryConfigurations",
        "Conjectures.FranklBoundaryFibers",
        "Conjectures.FranklFamily",
        "Conjectures.FranklFamilyCanonical",
        "Conjectures.FranklHighGirthGraphCore",
        "Conjectures.FranklIncidence",
        "Conjectures.FranklIncidenceFinite",
        "Conjectures.FranklLargeIncidence",
        "Conjectures.FranklLargeSelection",
        "Conjectures.FranklTreeBall",
        "Conjectures.FranklTreeBranchMessages",
        "Conjectures.FranklTreeCertificate",
        "Conjectures.FranklTreeCone",
        "Conjectures.FranklTreeConfigurationIso",
        "Conjectures.FranklTreeConfigurationMessages",
        "Conjectures.FranklTreeConfigurations",
        "Conjectures.FranklTreeCounts",
        "Conjectures.FranklTreeGluing",
        "Conjectures.FranklTreeOccupation",
        "Conjectures.FranklTreeRoot",
        "Conjectures.FranklTreeSpan",
        "Conjectures.FranklTreeUnfolding",
        "Conjectures.FranklTreeUnfoldingIso",
    }:
        raise ValueError("Unexpected high-girth core closure")
    required = inventory["required_endpoints"]
    group = {"id": "high-girth-graph-core", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    try:
        gate.run_group(SimpleNamespace(group="high-girth-graph-core",
            artifact_dir=ROOT / ".candidate-artifacts/frankl-high-girth-graph-core",
            runtime=None, jobs=args.jobs), {})
    except BaseException:
        for logfile in sorted((ROOT / ".candidate-artifacts/frankl-high-girth-graph-core" / "logs").glob("*.source.log")):
            diagnostics = logfile.read_text(errors="replace")
            if "error" in diagnostics or "warning" in diagnostics:
                print("SOURCE DIAGNOSTICS: " + logfile.name, flush=True)
                print(diagnostics[-24000:], flush=True)
        raise

if __name__ == "__main__":
    main()
