#!/usr/bin/env python3
"""Fresh strict, all-owned, exact stock proof gate for family relabeling."""
from __future__ import annotations
import argparse
import json
from types import SimpleNamespace
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
INVENTORY = "docs/frankl-family-relabel-sources.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS, INVENTORY,
    "scripts/verify_frankl_family_relabel.py",
    ".github/workflows/lean-frankl-family-relabel.yml")))

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--jobs", type=int, choices=range(1, 5), default=2)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY).read_text())
    if inventory["schema"] != "frankl-family-relabel-v1":
        raise ValueError("Unexpected inventory")
    modules = gate.dependency_order([inventory["root"]])
    if set(modules) != {"Conjectures.FranklBasic", "Conjectures.FranklFamily",
                        "Conjectures.FranklFamilyRelabel"}:
        raise ValueError("Unexpected relabeling closure")
    for path, expected in inventory["sources"].items():
        if gate.digest(ROOT / path) != expected:
            raise ValueError("Reviewed source differs: " + path)
    group = {"id": "family-relabel", "rows": 0,
             "roots": [inventory["root"]], "private_chunks": 0}
    gate.group_spec = lambda _manifest, _name: (group, modules, inventory["required_endpoints"], [])
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = inventory["scope"]
        receipt["reviewed_inventory"] = inventory
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    stage = ROOT / ".candidate-artifacts/frankl-family-relabel"
    try:
        gate.run_group(SimpleNamespace(group="family-relabel", artifact_dir=stage,
            runtime=None, jobs=args.jobs), {})
    except BaseException:
        for logfile in sorted((stage / "logs").glob("*.source.log")):
            diagnostics = logfile.read_text(errors="replace")
            if "error" in diagnostics or "warning" in diagnostics:
                print("SOURCE DIAGNOSTICS: " + logfile.name, flush=True)
                print(diagnostics[-24000:], flush=True)
        raise

if __name__ == "__main__":
    main()
