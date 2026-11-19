#!/usr/bin/env python3
"""Emit bounded arithmetic blocks for new literal period-ten representatives.

The v2 input packet is frozen by its compressed SHA256. Existing short-period
representatives are not duplicated. The 1572 new representatives keep their
original candidate words and weights, in increasing representative-ID order.
Blocks contain at most64 rows and private arithmetic checks at most2 rows.
The first hosted group checks one block before the other groups are launched.
Generated files are candidates until exact source/audit/stock-kernel gates pass.
"""
from __future__ import annotations
import argparse
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
PACKET = HERE / "literal_ten_weight_orbits.json.gz"
MANIFEST = HERE / "literal_ten_weight_orbit_batches.json"
PACKET_SHA256 = "a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416"
INPUT_SHA256 = "5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a"
RENDERER_SHA256 = "049ff677839e1498a6cfba0ef1ddd11eb27eaccb0ea57b8096ea345380745619"
BLOCK_SIZE = 64
CHUNK_SIZE = 2
GROUP_SIZE = 4
BRIDGE = "Conjectures.FranklSmallCyclicOrbitArithmetic"
BRIDGE_SHA256 = "de56e1f63a989f12c33a579b8872b1f9dd476c450d9550a6ea82865fa4fa5be9"

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

def require(condition, message):
    if not condition:
        raise ValueError(message)

def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()

def renderer():
    path = HERE / "generate_small_cyclic_weight_orbit_batches.py"
    require(sha(path.read_bytes()) == RENDERER_SHA256, "Arithmetic renderer changed")
    spec = importlib.util.spec_from_file_location("frankl_short_arithmetic_renderer", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    require(module.CHUNK_SIZE == CHUNK_SIZE, "Arithmetic private chunk size changed")
    return module

def load_packet():
    raw = PACKET.read_bytes()
    require(sha(raw) == PACKET_SHA256, "Frozen literal-ten packet changed")
    packet = json.loads(gzip.decompress(raw))
    require(packet["schema"] == "frankl-literal-ten-weight-orbits-v2",
            "Unexpected literal-ten packet schema")
    original = (HERE / "width_four_weight_candidates.json").read_bytes()
    require(sha(original) == INPUT_SHA256, "Original candidate rows changed")
    rows = json.loads(original)
    require(len(rows) == 9088, "Original row count changed")
    records = packet["new_representatives"]
    require(len(records) == 1572, "New representative count changed")
    require([r["id"] for r in records] == list(range(9448, 11020)),
            "New representative IDs are missing, duplicated, or reordered")
    for record in records:
        require(type(record["period"]) is int and record["period"] == 10,
                "New representative has a different literal period")
        require(type(record["source_row"]) is int and 0 <= record["source_row"] < len(rows),
                "Representative source row is out of bounds")
        entry = record["entry"]
        require([entry["word"], entry["weights"]] == rows[record["source_row"]],
                "Representative differs from its original candidate row")
    require(len(packet["members"]) == 9088, "Target member count changed")
    return packet

def produce(packet):
    base = renderer()
    require(sha((REPO / "lean" / (BRIDGE.replace(".", "/") + ".lean")).read_bytes())
            == BRIDGE_SHA256, "Arithmetic semantic bridge changed")
    records = packet["new_representatives"]
    require([r["id"] for r in records] == list(range(9448, 11020)),
            "Unexpected representative partition")
    files, blocks, lookup = {}, [], []
    for block_index, start in enumerate(range(0, len(records), BLOCK_SIZE)):
        selected = records[start:start + BLOCK_SIZE]
        emitted, block = base.emit_block(10, block_index, block_index, selected,
                                         packet_sha256=PACKET_SHA256)
        require(not files.keys() & emitted.keys(), "Repeated output module")
        files.update(emitted)
        blocks.append(block)
        lookup.extend([r["id"], 10, block_index, index]
                      for index, r in enumerate(selected))
    require(len(blocks) == 25 and len(files) == 50, "Unexpected P10 block count")
    require(sum(b["rows"] for b in blocks) == 1572
            and sum(b["private_chunks"] for b in blocks) == 786,
            "Unexpected arithmetic coverage")
    require([entry[0] for entry in lookup] == list(range(9448, 11020)),
            "Lookup does not cover exactly the new representatives")
    partitions = [blocks[:1]] + [blocks[start:start + GROUP_SIZE]
                                 for start in range(1, len(blocks), GROUP_SIZE)]
    groups = [{
        "id": "p10g" + str(index).zfill(2),
        "block_ids": [b["id"] for b in selected],
        "roots": [b["module"] for b in selected],
        "rows": sum(b["rows"] for b in selected),
        "private_chunks": sum(b["private_chunks"] for b in selected),
    } for index, selected in enumerate(partitions)]
    require(len(groups) == 7 and groups[0]["rows"] == 64, "Pilot grouping changed")
    manifest = {
        "schema": "frankl-literal-ten-orbit-arithmetic-batches-v2",
        "formal_status": "Unverified candidates until each exact group gate passes; no full transport or span-four conclusion.",
        "producer_sha256": sha(Path(__file__).read_bytes()),
        "renderer_sha256": RENDERER_SHA256,
        "orbit_packet_sha256": PACKET_SHA256,
        "original_input_sha256": INPUT_SHA256,
        "generic_bridge": BRIDGE, "generic_bridge_sha256": BRIDGE_SHA256,
        "periods": [10], "representatives": 1572,
        "max_rows_per_block": BLOCK_SIZE, "max_rows_per_private_chunk": CHUNK_SIZE,
        "max_blocks_per_group": GROUP_SIZE, "block_count": len(blocks),
        "private_chunk_count": 786, "group_count": len(groups),
        "initial_gate_group": "p10g00",
        "lookup_schema": ["representative_id", "period", "block_id", "local_index"],
        "lookup": lookup, "blocks": blocks, "groups": groups,
        "reused_short_representatives": 1225,
        "source_coverage": "All and only the 1572 new representatives of the frozen period-ten v2 packet. Reused short representatives and all9088 target transports remain separate obligations.",
    }
    return files, manifest

def check_written(files, manifest, output_dir, manifest_path):
    for name, raw in files.items():
        require((output_dir / name).read_bytes() == raw, "Generated source differs: " + name)
    require(manifest_path.read_bytes() == encoded(manifest), "Generated manifest differs")

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, default=REPO / "lean/Conjectures")
    parser.add_argument("--manifest", type=Path, default=MANIFEST)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    files, manifest = produce(load_packet())
    if args.check:
        check_written(files, manifest, args.output_dir, args.manifest)
    else:
        args.output_dir.mkdir(parents=True, exist_ok=True)
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        for name, raw in files.items():
            (args.output_dir / name).write_bytes(raw)
        args.manifest.write_bytes(encoded(manifest))
    print(json.dumps({"mode": "checked" if args.check else "emitted",
                      "representatives": 1572, "blocks": 25, "private_chunks": 786,
                      "groups": 7, "manifest_sha256": sha(encoded(manifest)),
                      "source_files": len(files),
                      "scope": manifest["formal_status"]}, indent=2))

if __name__ == "__main__":
    main()
