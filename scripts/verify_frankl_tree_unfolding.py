#!/usr/bin/env python3
"""Fresh exact proof gate for recursive graph-ball unfoldings."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-tree-unfolding-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_tree_unfolding.py",
    ".github/workflows/lean-frankl-tree-unfolding.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-tree-unfolding-v2":
        raise ValueError("Unexpected tree-unfolding source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {
        "Conjectures.FranklIncidence", "Conjectures.FranklTreeCounts",
        "Conjectures.FranklTreeGluing", "Conjectures.FranklTreeBall",
        "Conjectures.FranklTreeUnfolding", "Conjectures.FranklTreeUnfoldingIso",
    }:
        raise ValueError("Unexpected tree-unfolding helper closure")
    required = inventory["required_endpoints"]
    group = {"id": "tree-unfolding", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(SimpleNamespace(group="tree-unfolding",
        artifact_dir=ROOT / ".candidate-artifacts/frankl-tree-unfolding",
        runtime=None, jobs=args.jobs), {})

if __name__ == "__main__":
    main()
