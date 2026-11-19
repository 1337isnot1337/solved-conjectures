#!/usr/bin/env python3
"""Exact isolated source/audit/kernel gates for bounded literal-ten arithmetic."""
from __future__ import annotations
import argparse
import importlib.util
from pathlib import Path
import verify_frankl_orbit_batches as gate

ROOT = gate.ROOT
PRODUCER = ROOT / "results/frankl-generator-families/generate_literal_ten_weight_orbit_batches.py"
MANIFEST = ROOT / "results/frankl-generator-families/literal_ten_weight_orbit_batches.json"
GATE_INPUTS = tuple(dict.fromkeys((*gate.GATE_INPUTS,
    "scripts/verify_frankl_literal_orbit_batches.py",
    ".github/workflows/lean-frankl-literal-orbit-batches.yml",
    str(PRODUCER.relative_to(ROOT)), str(MANIFEST.relative_to(ROOT)),
    "results/frankl-generator-families/literal_ten_weight_orbits.json.gz",
)))

def validate_layout():
    spec = importlib.util.spec_from_file_location("literal_ten_batches", PRODUCER)
    producer = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(producer)
    files, manifest = producer.produce(producer.load_packet())
    producer.check_written(files, manifest, gate.LEAN / "Conjectures", MANIFEST)
    return manifest

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("group", choices=["p10g" + str(i).zfill(2) for i in range(7)])
    parser.add_argument("--jobs", type=int, default=4, choices=range(1, 5))
    parser.add_argument("--runtime", type=Path)
    parser.add_argument("--artifact-dir", type=Path)
    args = parser.parse_args()
    manifest = validate_layout()
    gate.GATE_INPUTS = GATE_INPUTS
    old_write = gate.write_receipt
    def write_receipt(stage, receipt):
        receipt["scope"] = ("Only the selected bounded period-ten representative arithmetic. "
                            "Reused short representatives, explicit target transports, "
                            "full row coverage and span-four assembly remain separate obligations.")
        receipt["literal_ten_manifest_sha256"] = gate.digest(MANIFEST)
        old_write(stage, receipt)
    gate.write_receipt = write_receipt
    gate.run_group(args, manifest)

if __name__ == "__main__":
    main()
