#!/usr/bin/env python3
"""Fresh exact proof gate for the full high-girth distinct-union frequency theorem."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-high-girth-theorem-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_high_girth_theorem.py",
    ".github/workflows/lean-frankl-high-girth-theorem.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-high-girth-theorem-v1":
        raise ValueError("Unexpected high-girth theorem source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {
        "Conjectures.FranklArithmetic",
        "Conjectures.FranklBoundaryAveraging",
        "Conjectures.FranklBoundaryBall",
        "Conjectures.FranklBoundaryConfigurationHelpers",
        "Conjectures.FranklBoundaryConfigurations",
        "Conjectures.FranklBoundaryFibers",
        "Conjectures.FranklFamily",
        "Conjectures.FranklFamilyCanonical",
        "Conjectures.FranklFamilyIndependent",
        "Conjectures.FranklHighGirthGraphCore",
        "Conjectures.FranklHighGirthTheorem",
        "Conjectures.FranklIncidence",
        "Conjectures.FranklIncidenceFinite",
        "Conjectures.FranklLargeBound",
        "Conjectures.FranklLargeCoverage",
        "Conjectures.FranklLargeIncidence",
        "Conjectures.FranklLargeLopsided",
        "Conjectures.FranklLargeNeighbors",
        "Conjectures.FranklLargeProbability",
        "Conjectures.FranklLargeQuery",
        "Conjectures.FranklLargeSelection",
        "Conjectures.FranklLargeTheorem",
        "Conjectures.FranklLopsided",
        "Conjectures.FranklLopsidedCoordinates",
        "Conjectures.FranklLopsidedHarris",
        "Conjectures.FranklTreeBall",
        "Conjectures.FranklTreeBoundK03",
        "Conjectures.FranklTreeBoundK04",
        "Conjectures.FranklTreeBoundK05",
        "Conjectures.FranklTreeBoundK06",
        "Conjectures.FranklTreeBoundK07",
        "Conjectures.FranklTreeBoundK08",
        "Conjectures.FranklTreeBoundK09",
        "Conjectures.FranklTreeBoundK10",
        "Conjectures.FranklTreeBoundK11",
        "Conjectures.FranklTreeBoundK12",
        "Conjectures.FranklTreeBoundK13",
        "Conjectures.FranklTreeBoundK14",
        "Conjectures.FranklTreeBranchMessages",
        "Conjectures.FranklTreeCertificate",
        "Conjectures.FranklTreeCone",
        "Conjectures.FranklTreeConfigurationIso",
        "Conjectures.FranklTreeConfigurationMessages",
        "Conjectures.FranklTreeConfigurations",
        "Conjectures.FranklTreeCounts",
        "Conjectures.FranklTreeDataK03",
        "Conjectures.FranklTreeDataK04",
        "Conjectures.FranklTreeDataK05",
        "Conjectures.FranklTreeDataK06",
        "Conjectures.FranklTreeDataK07",
        "Conjectures.FranklTreeDataK08",
        "Conjectures.FranklTreeDataK09",
        "Conjectures.FranklTreeDataK10",
        "Conjectures.FranklTreeDataK11",
        "Conjectures.FranklTreeDataK12",
        "Conjectures.FranklTreeDataK13",
        "Conjectures.FranklTreeDataK14",
        "Conjectures.FranklTreeGluing",
        "Conjectures.FranklTreeOccupation",
        "Conjectures.FranklTreeRoot",
        "Conjectures.FranklTreeSmallDegrees",
        "Conjectures.FranklTreeSpan",
        "Conjectures.FranklTreeUnfolding",
        "Conjectures.FranklTreeUnfoldingIso",
    }:
        raise ValueError("Unexpected high-girth theorem closure")
    required = inventory["required_endpoints"]
    group = {"id": "high-girth-theorem", "rows": 0,
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
        gate.run_group(SimpleNamespace(group="high-girth-theorem",
            artifact_dir=ROOT / ".candidate-artifacts/frankl-high-girth-theorem",
            runtime=None, jobs=args.jobs), {})
    except BaseException:
        for logfile in sorted((ROOT / ".candidate-artifacts/frankl-high-girth-theorem" / "logs").glob("*.source.log")):
            diagnostics = logfile.read_text(errors="replace")
            if "error" in diagnostics or "warning" in diagnostics:
                print("SOURCE DIAGNOSTICS: " + logfile.name, flush=True)
                print(diagnostics[-24000:], flush=True)
        raise

if __name__ == "__main__":
    main()
