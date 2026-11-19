#!/usr/bin/env python3
"""Extend the frozen period-7/8/9 weight orbits to the literal ten-point window.

All data remain candidates until Lean verifies their arithmetic and transports.
Existing representative IDs and input rows are preserved. This recovery version
is regenerated from public inputs; its source is not claimed to match the lost
pre-outage producer.
"""
from __future__ import annotations
import argparse
from collections import defaultdict
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import sys
from time import monotonic

HERE = Path(__file__).resolve().parent
BASE_NAME = "generate_small_cyclic_weight_orbits.py"
BASE_SHA256 = "d8a0a0980c7773219c6e8808aaca0f220f22134bf6eeaad7427f6041dcb652ec"
SHORT_NAME = "small_cyclic_weight_orbits.json.gz"
SHORT_SHA256 = "0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c"
SCHEMA = "frankl-literal-ten-weight-orbits-v2"
INPUT_SHA256 = "5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a"

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def require(condition, message):
    if not condition:
        raise ValueError(message)

def canonical_bytes(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()

def load_base():
    source = HERE / BASE_NAME
    require(sha(source.read_bytes()) == BASE_SHA256, "Frozen base producer differs")
    spec = importlib.util.spec_from_file_location("frozen_short_orbit_producer", source)
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module

def produce():
    base = load_base()
    rows = base.load_rows(HERE / "width_four_weight_candidates.json")
    raw = (HERE / SHORT_NAME).read_bytes()
    require(sha(raw) == SHORT_SHA256, "Frozen short packet differs")
    old = json.loads(gzip.decompress(raw))
    require([r["id"] for r in old["representatives"]] == list(range(9448)),
            "Existing representative IDs differ")
    sources = {}
    for record in old["representatives"]:
        case = base.geometry(record["period"], record["source_row"], record["entry"]["word"])
        key = base.orbit_key(case)
        require(key not in sources, "Duplicate existing representative class")
        sources[key] = (record, case)
    groups = defaultdict(list)
    for index, (word, _) in enumerate(rows):
        case = base.geometry(10, index, word)
        groups[base.orbit_key(case)].append(case)
    new_representatives, members = [], []
    reused, changed = 0, 0
    for key, group in sorted(groups.items()):
        if key in sources:
            record, source = sources[key]
            reused += 1
        else:
            source = min(group, key=lambda case: case.row)
            word, weights = rows[source.row]
            record = {"id": 9448 + len(new_representatives), "period": 10,
                      "source_row": source.row,
                      "entry": {"word": word, "weights": weights}, "pilot": False}
            new_representatives.append(record)
        source_weights = record["entry"]["weights"]
        for target in group:
            mapping = base.representative_map(source, target)
            weights = [0] * 4
            for point, weight in zip(base.CORE, source_weights):
                weights[mapping[point] - 3] = weight
            require(any(weights), "Zero transported weights")
            changed += weights != rows[target.row][1]
            members.append({"period": 10, "source_row": target.row,
                            "representative_id": record["id"],
                            "entry": {"word": rows[target.row][0], "weights": weights},
                            "point_map": sorted(mapping.items())})
    members.sort(key=lambda member: member["source_row"])
    require([m["source_row"] for m in members] == list(range(9088)), "Target coverage differs")
    counts = {"members": len(members), "period10_classes": len(groups),
              "reused_representative_classes": reused,
              "new_arithmetic_representatives": len(new_representatives),
              "changed_member_weight_vectors": changed}
    require(counts == {"members": 9088, "period10_classes": 2797,
                      "reused_representative_classes": 1225,
                      "new_arithmetic_representatives": 1572,
                      "changed_member_weight_vectors": 2112}, "Validated census changed")
    return {"schema": SCHEMA,
            "formal_status": "Untrusted candidates; every arithmetic and transport requires Lean verification.",
            "input": {"name": "width_four_weight_candidates.json", "sha256": INPUT_SHA256, "rows": 9088},
            "base_packet": {"name": SHORT_NAME, "sha256": SHORT_SHA256, "representatives": 9448},
            "base_producer": {"name": BASE_NAME, "sha256": BASE_SHA256},
            "producer": {"name": Path(__file__).name, "sha256": sha(Path(__file__).read_bytes())},
            "period": 10, "core": [3, 4, 5, 6],
            "point_map_direction": "Representative support to target support; sorted by source point.",
            "representative_policy": "Reuse the existing class representative; otherwise use its lowest original row.",
            "counts": counts, "new_representatives": new_representatives, "members": members}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, default=HERE / "literal_ten_weight_orbits.json.gz")
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    require(args.output.resolve() not in {
        (HERE / "width_four_weight_candidates.json").resolve(),
        (HERE / SHORT_NAME).resolve()}, "Output overlaps an input")
    start = monotonic()
    packet = produce()
    raw = canonical_bytes(packet)
    compressed = load_base().deterministic_gzip(raw)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(compressed)
    report = {"schema": SCHEMA + "-report", "counts": packet["counts"],
              "producer_sha256": packet["producer"]["sha256"],
              "input_sha256": INPUT_SHA256, "short_orbits_sha256": SHORT_SHA256,
              "canonical_json_sha256": sha(raw), "compressed_sha256": sha(compressed),
              "compressed_bytes": len(compressed), "seconds": round(monotonic() - start, 3)}
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report, indent=2, sort_keys=True))

if __name__ == "__main__":
    main()
