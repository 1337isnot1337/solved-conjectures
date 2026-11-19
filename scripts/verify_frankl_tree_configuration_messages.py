#!/usr/bin/env python3
"""Fresh exact gate for actual tree configuration messages and root ratios."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-tree-configuration-messages-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_tree_configuration_messages.py",
    ".github/workflows/lean-frankl-tree-configuration-messages.yml",
)))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=4)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-tree-configuration-messages-v1":
        raise ValueError("Unexpected actual-message source inventory")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    modules = gate.dependency_order([inventory["root"]])
    expected = {
        "Conjectures.FranklIncidence", "Conjectures.FranklTreeCounts",
        "Conjectures.FranklTreeGluing", "Conjectures.FranklTreeConfigurations",
        "Conjectures.FranklTreeCone", "Conjectures.FranklTreeRoot",
        "Conjectures.FranklTreeSpan", "Conjectures.FranklTreeCertificate",
        "Conjectures.FranklTreeConfigurationMessages",
    }
    if set(modules) != expected or len(modules) != len(expected):
        raise ValueError("Unexpected actual-message helper closure")
    if set(inventory["sources"]) != {
            "lean/" + module.replace(".", "/") + ".lean" for module in modules}:
        raise ValueError("Every dependency must be frozen in the source inventory")
    required = inventory["required_endpoints"]
    if len(required) != 30 or len(set(required)) != 30:
        raise ValueError("Unexpected required theorem inventory")
    group = {"id": "tree-configuration-messages", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, required, [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(SimpleNamespace(group="tree-configuration-messages",
        artifact_dir=ROOT / ".candidate-artifacts/frankl-tree-configuration-messages",
        runtime=None, jobs=args.jobs), {})


if __name__ == "__main__":
    main()
