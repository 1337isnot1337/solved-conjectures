#!/usr/bin/env python3
"""Independently replay literal ten-point orbit witnesses with actual finite sets.

This verifier imports neither orbit producer. Its success is candidate-data
evidence, not a Lean proof of arithmetic or of the complete span-four result.
"""
from __future__ import annotations
import argparse
import gzip
import hashlib
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
INPUT_SHA256 = "5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a"
SHORT_SHA256 = "0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c"
CORE = frozenset((3, 4, 5, 6))
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def require(condition, message):
    if not condition:
        raise ValueError(message)

def nat(value):
    return type(value) is int and value >= 0

def family(period, word):
    require(type(period) is int and period in (7, 8, 9, 10), "Invalid natural period")
    require(type(word) is list and len(word) == 7 and
            all(type(letter) is int and 0 <= letter < 16 for letter in word), "Invalid word")
    result = set()
    for start, letter in enumerate(word):
        for bit, offsets in enumerate(TILES):
            if letter & (1 << bit):
                generator = frozenset((start + offset) % period for offset in offsets)
                if generator & CORE:
                    result.add(generator)
    return frozenset(result)

def weights(entry):
    value = entry["weights"]
    require(type(value) is list and len(value) == 4 and
            all(nat(w) for w in value) and any(value), "Natural nonzero weight vector")
    return value

def support(generators):
    return CORE | frozenset().union(*generators)

def validate(packet, original, short):
    require(packet["schema"] == "frankl-literal-ten-weight-orbits-v2", "Schema differs")
    require(type(packet["period"]) is int and packet["period"] == 10, "Target period")
    require(packet["input"]["sha256"] == INPUT_SHA256 and
            packet["base_packet"]["sha256"] == SHORT_SHA256, "Input provenance differs")
    old = short["representatives"]
    require([r["id"] for r in old] == list(range(9448)), "Base representative IDs")
    new = packet["new_representatives"]
    require([r["id"] for r in new] == list(range(9448, 11020)), "New representative IDs")
    representatives = old + new
    geometries = {}
    for record in representatives:
        identifier, period, row = record["id"], record["period"], record["source_row"]
        require(nat(identifier) and nat(row) and row < 9088, "Representative bounds")
        require(type(period) is int and period in ((7, 8, 9) if identifier < 9448 else (10,)),
                "Representative period")
        require([record["entry"]["word"], weights(record["entry"])] == original[row],
                "Representative original row differs")
        geometries[identifier] = family(period, record["entry"]["word"])
    members = packet["members"]
    require(len(members) == 9088, "Target coverage count")
    used, changed = set(), 0
    for row, member in enumerate(members):
        require(type(member["period"]) is int and member["period"] == 10 and
                type(member["source_row"]) is int and member["source_row"] == row,
                "Ordered row coverage")
        identifier = member["representative_id"]
        require(nat(identifier) and identifier < len(representatives), "Representative ID bounds")
        source = representatives[identifier]
        source_family = geometries[identifier]
        entry = member["entry"]
        require(entry["word"] == original[row][0], "Target original word differs")
        target_weights = weights(entry)
        target_family = family(10, entry["word"])
        pairs = member["point_map"]
        require(type(pairs) is list and all(type(pair) is list and len(pair) == 2 and
                all(nat(point) for point in pair) for pair in pairs), "Natural point-map pairs")
        require([pair[0] for pair in pairs] == sorted(support(source_family)),
                "Exact distinct source support")
        mapping = dict(pairs)
        require(all(point < 10 for point in mapping.values()), "Target point bounds")
        require(len(set(mapping.values())) == len(mapping), "Support injectivity")
        require(set(mapping.values()) == support(target_family), "Exact target support")
        require({mapping[point] for point in CORE} == CORE, "Core image")
        require({frozenset(mapping[point] for point in generator) for generator in source_family}
                == target_family, "Literal generator image")
        require(all(target_weights[mapping[point] - 3] == source["entry"]["weights"][point - 3]
                    for point in CORE), "Exact natural weight transport")
        used.add(identifier)
        changed += target_weights != original[row][1]
    counts = {"members": 9088, "period10_classes": len(used),
              "reused_representative_classes": sum(identifier < 9448 for identifier in used),
              "new_arithmetic_representatives": len(new),
              "changed_member_weight_vectors": changed}
    expected = {"members": 9088, "period10_classes": 2797,
                "reused_representative_classes": 1225,
                "new_arithmetic_representatives": 1572,
                "changed_member_weight_vectors": 2112}
    require(counts == expected and packet["counts"] == expected, "Candidate counts differ")
    require(set(range(9448, 11020)) <= used, "Unused new representative")
    return {"status": "candidate witness replay passed; Lean verification still required",
            "all_maps_checked": len(members), "counts": counts}

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input", type=Path, default=HERE / "literal_ten_weight_orbits.json.gz")
    parser.add_argument("--report", type=Path)
    args = parser.parse_args()
    original_raw = (HERE / "width_four_weight_candidates.json").read_bytes()
    short_raw = (HERE / "small_cyclic_weight_orbits.json.gz").read_bytes()
    require(sha(original_raw) == INPUT_SHA256, "Original input checksum")
    require(sha(short_raw) == SHORT_SHA256, "Frozen short packet checksum")
    candidate_raw = args.input.read_bytes()
    result = validate(json.loads(gzip.decompress(candidate_raw)), json.loads(original_raw),
                      json.loads(gzip.decompress(short_raw)))
    result.update({"candidate_sha256": sha(candidate_raw), "input_sha256": INPUT_SHA256,
                   "short_orbits_sha256": SHORT_SHA256, "verifier_sha256": sha(Path(__file__).read_bytes())})
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))

if __name__ == "__main__":
    main()
