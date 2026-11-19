#!/usr/bin/env python3
"""Fresh isolated proof gate for the generic literal ten-point bridge."""
from __future__ import annotations
import argparse
import json
import re
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY_PATH = "docs/frankl-literal-ten-bridge-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY_PATH,
    "scripts/verify_frankl_literal_weights.py",
    ".github/workflows/lean-frankl-literal-weights.yml",
)))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY_PATH).read_text())
    if inventory["schema"] != "frankl-literal-ten-bridge-v2":
        raise ValueError("Unexpected bridge inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    required = inventory["required_endpoints"]
    private = []
    for module in modules:
        source = gate.source(module).read_text()
        names = re.findall(r"^private theorem (checked\d+)\b", source, re.M)
        if names:
            namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", source, re.M)
            if len(namespaces) != 1 or len(names) != len(set(names)):
                raise ValueError("Unexpected private proof layout: " + module)
            private += [namespaces[0] + "." + name for name in names]
    if len(private) != len(set(private)):
        raise ValueError("Duplicate private proof")
    group = {"id": "literal-weights", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": len(private)}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, private)
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reconstruction"] = inventory["recovery"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(SimpleNamespace(group="literal-weights",
        artifact_dir=ROOT / ".candidate-artifacts/frankl-literal-weights",
        runtime=None, jobs=args.jobs), {})

if __name__ == "__main__":
    main()
