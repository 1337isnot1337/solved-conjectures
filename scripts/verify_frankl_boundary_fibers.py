#!/usr/bin/env python3
"""Fresh exact proof gate for boundary-conditioned graph configuration fibers."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-boundary-fibers-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_boundary_fibers.py",
    ".github/workflows/lean-frankl-boundary-fibers.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-boundary-fibers-v1":
        raise ValueError("Unexpected boundary source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {
        "Conjectures.FranklIncidence", "Conjectures.FranklTreeBall",
        "Conjectures.FranklBoundaryFibers", "Conjectures.FranklBoundaryBall",
    }:
        raise ValueError("Unexpected boundary helper closure")
    required = inventory["required_endpoints"]
    group = {"id": "boundary-fibers", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(SimpleNamespace(group="boundary-fibers",
        artifact_dir=ROOT / ".candidate-artifacts/frankl-boundary-fibers",
        runtime=None, jobs=args.jobs), {})

if __name__ == "__main__":
    main()
