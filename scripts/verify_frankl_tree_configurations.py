#!/usr/bin/env python3
"""Fresh exact proof gate for graph configuration counts under rooted gluing."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-tree-configurations-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_tree_configurations.py",
    ".github/workflows/lean-frankl-tree-configurations.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-tree-configurations-v1":
        raise ValueError("Unexpected tree-configuration source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {
        "Conjectures.FranklIncidence", "Conjectures.FranklTreeCounts",
        "Conjectures.FranklTreeGluing", "Conjectures.FranklTreeConfigurations",
    }:
        raise ValueError("Unexpected tree-configuration helper closure")
    required = inventory["required_endpoints"]
    group = {"id": "tree-configurations", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(SimpleNamespace(group="tree-configurations",
        artifact_dir=ROOT / ".candidate-artifacts/frankl-tree-configurations",
        runtime=None, jobs=args.jobs), {})

if __name__ == "__main__":
    main()
