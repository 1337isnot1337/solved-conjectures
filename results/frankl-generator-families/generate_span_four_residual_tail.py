#!/usr/bin/env python3
"""Reproduce the original residual tail and emit its recovered Lean candidates.

Uses only the Python standard library and the unchanged public C++ finder and
replayer. Generated sources require a fresh source/axiom/kernel gate; their
bytes are not asserted to match sources lost during the local runtime outage.
The original finder stdout is pinned to the previously recorded exact digest.
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent.parent
ORIGINAL_STDOUT_SHA256 = "a151c64c45348b0e47502d9ba9e941cd0f7b29c775d1f5289e8e9d44580bf074"
TILES = (7, 11, 13, 15)

DATA_TEMPLATE = "module\n\npublic import Conjectures.FranklSpanFourResidualTailCore\n\n/-! Deterministic recovery of the original 31 width-five witnesses.\nThe original finder stdout hash is a151c64c45348b0e47502d9ba9e941cd0f7b29c775d1f5289e8e9d44580bf074. -/\n@[expose] public section\n\nnamespace FranklSpanFour.Assembly.ResidualTail\n\ndef entries : List Entry := [\n@@ENTRIES@@\n]\n\ndef remainingRows : List (List ℕ) := [\n@@REMAINING@@\n]\n\ndef rankRows : List (List ℕ × ℕ) := [\n@@RANKS@@\n]\n\nend FranklSpanFour.Assembly.ResidualTail\n"

CERT_TEMPLATE = "module\n\npublic import Conjectures.FranklSpanFourResidualTailChunks\npublic import Conjectures.FranklSpanFourResidualTailData\n\n/-! Complete bounded exterior chunks for original width-five witness @@TAG@@. -/\n@[expose] public section\n\nnamespace FranklSpanFour.Assembly.ResidualTail.Certificate@@TAG@@\n\nset_option maxRecDepth 65536\nset_option maxHeartbeats 4000000\n\nprivate def chunks : List (List ℕ) := [\n@@CHUNKS@@\n]\n\nprivate theorem checkedInfo :\n    metadataCheck (entries[@@INDEX@@]!) = true ∧ positiveCheck (entries[@@INDEX@@]!) = true ∧\n      chunks.flatten = outside (entries[@@INDEX@@]!) := by\n  decide +kernel\n\n@@CHECKED@@theorem checked : entryCheck (entries[@@INDEX@@]!) = true := by\n  apply entryCheck_of_chunks checkedInfo.1 checkedInfo.2.1 checkedInfo.2.2\n  simp only [chunks, List.all_cons, List.all_nil, @@NAMES@@,\n    Bool.true_and]\n\nend FranklSpanFour.Assembly.ResidualTail.Certificate@@TAG@@\n"

AGGREGATE_SOURCE = "module\n\npublic import Conjectures.FranklSpanFourResidualTailCert00\npublic import Conjectures.FranklSpanFourResidualTailCert01\npublic import Conjectures.FranklSpanFourResidualTailCert02\npublic import Conjectures.FranklSpanFourResidualTailCert03\npublic import Conjectures.FranklSpanFourResidualTailCert04\npublic import Conjectures.FranklSpanFourResidualTailCert05\npublic import Conjectures.FranklSpanFourResidualTailCert06\npublic import Conjectures.FranklSpanFourResidualTailCert07\npublic import Conjectures.FranklSpanFourResidualTailCert08\npublic import Conjectures.FranklSpanFourResidualTailCert09\npublic import Conjectures.FranklSpanFourResidualTailCert10\npublic import Conjectures.FranklSpanFourResidualTailCert11\npublic import Conjectures.FranklSpanFourResidualTailCert12\npublic import Conjectures.FranklSpanFourResidualTailCert13\npublic import Conjectures.FranklSpanFourResidualTailCert14\npublic import Conjectures.FranklSpanFourResidualTailCert15\npublic import Conjectures.FranklSpanFourResidualTailCert16\npublic import Conjectures.FranklSpanFourResidualTailCert17\npublic import Conjectures.FranklSpanFourResidualTailCert18\npublic import Conjectures.FranklSpanFourResidualTailCert19\npublic import Conjectures.FranklSpanFourResidualTailCert20\npublic import Conjectures.FranklSpanFourResidualTailCert21\npublic import Conjectures.FranklSpanFourResidualTailCert22\npublic import Conjectures.FranklSpanFourResidualTailCert23\npublic import Conjectures.FranklSpanFourResidualTailCert24\npublic import Conjectures.FranklSpanFourResidualTailCert25\npublic import Conjectures.FranklSpanFourResidualTailCert26\npublic import Conjectures.FranklSpanFourResidualTailCert27\npublic import Conjectures.FranklSpanFourResidualTailCert28\npublic import Conjectures.FranklSpanFourResidualTailCert29\npublic import Conjectures.FranklSpanFourResidualTailCert30\n\n/-! Every original width-five weight witness has passed the exact checker. -/\n@[expose] public section\n\nnamespace FranklSpanFour.Assembly.ResidualTail\n\ntheorem entries_checked : entries.all entryCheck = true := by\n  apply List.all_eq_true.mpr\n  intro e he\n  simp only [entries, List.mem_cons, List.not_mem_nil, or_false] at he\n  rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl\n  · exact Certificate00.checked\n  · exact Certificate01.checked\n  · exact Certificate02.checked\n  · exact Certificate03.checked\n  · exact Certificate04.checked\n  · exact Certificate05.checked\n  · exact Certificate06.checked\n  · exact Certificate07.checked\n  · exact Certificate08.checked\n  · exact Certificate09.checked\n  · exact Certificate10.checked\n  · exact Certificate11.checked\n  · exact Certificate12.checked\n  · exact Certificate13.checked\n  · exact Certificate14.checked\n  · exact Certificate15.checked\n  · exact Certificate16.checked\n  · exact Certificate17.checked\n  · exact Certificate18.checked\n  · exact Certificate19.checked\n  · exact Certificate20.checked\n  · exact Certificate21.checked\n  · exact Certificate22.checked\n  · exact Certificate23.checked\n  · exact Certificate24.checked\n  · exact Certificate25.checked\n  · exact Certificate26.checked\n  · exact Certificate27.checked\n  · exact Certificate28.checked\n  · exact Certificate29.checked\n  · exact Certificate30.checked\n\ntheorem entries_checked_mem {e : Entry} (he : e ∈ entries) : entryCheck e = true :=\n  List.all_eq_true.mp entries_checked e he\n\nend FranklSpanFour.Assembly.ResidualTail\n"

INPUT_SHA256 = {
    "results/frankl-generator-families/span_four.py": "b357783ce1879293e49d50664aeb8ae77d3384a9a8507601131ecfd26e8ffd0a",
    "results/frankl-generator-families/window_filter.cpp": "e426f38a573e5013d1892664ccba38de426168a33055a43776c50fcc7d7fb120",
    "results/frankl-generator-families/window_replay.cpp": "081796e3465881a4ee95b964f36e073a1e5de3633dcabd5a23843891f7515d04",
    "lean/Conjectures/FranklSmallCyclicResidual.lean": "400f75dc06ff91a4a56fd6abb43726867a2bb54199e7adbfbde9a79f845fdad1"
}


def digest(data):
    return hashlib.sha256(data).hexdigest()


def lean_list(values):
    return "[" + ", ".join(map(str, values)) + "]"


def read_rows():
    text = (REPO / "lean/Conjectures/FranklSmallCyclicResidual.lean").read_text()
    body = text.split("def residualEdges : Finset (List ℕ) :=", 1)[1]
    body = body.split("theorem residual_edge_facts", 1)[0]
    rows = [list(map(int, match.split(","))) for match in re.findall(r"\[([0-9,\s]+)\]", body)]
    assert len(rows) == 35 and len({tuple(row) for row in rows}) == 35
    return rows


def extend(rows):
    after = {}
    for row in rows:
        after.setdefault(tuple(row[:-1]), []).append(row[-1])
    return [row + [last] for row in rows for last in after.get(tuple(row[1:]), [])]


def generator_masks(row):
    return [tile << p for p, letter in enumerate(row)
            for j, tile in enumerate(TILES) if letter >> j & 1]


def exterior_chunks(entry):
    local = [g for g in entry["generators"] if g & 248]
    total = 0
    for generator in local:
        total |= generator
    boundary = total ^ (total & 248)
    outside = [mask for mask in range(2048) if mask & boundary == mask]
    return [outside[i:i + 4] for i in range(0, len(outside), 4)]


def ranks(remaining):
    vertices = sorted({tuple(v) for row in remaining for v in (row[:-1], row[1:])})
    adjacent = {v: [] for v in vertices}
    for row in remaining:
        left, right = tuple(row[:-1]), tuple(row[1:])
        if left == right:
            assert all(x == 0 for x in row), "unexpected nonzero loop"
        else:
            adjacent[left].append(right)
    result, active = {}, set()

    def rank(vertex):
        if vertex in result:
            return result[vertex]
        assert vertex not in active, "unexpected nonzero directed cycle"
        active.add(vertex)
        value = max([0] + [rank(successor) + 1 for successor in adjacent[vertex]])
        active.remove(vertex)
        result[vertex] = value
        return value

    table = [[list(vertex), rank(vertex)] for vertex in vertices]
    assert len(table) == 24 and max(value for _, value in table) == 2
    return table


def replace(template, **values):
    for name, value in values.items():
        template = template.replace("@@" + name + "@@", value)
    assert "@@" not in template
    return template


def data_source(entries, remaining, rank_rows):
    return replace(DATA_TEMPLATE,
        ENTRIES=",\n".join("  ⟨" + lean_list(e["row"]) + ", " +
            lean_list(e["generators"]) + ", " + lean_list(e["weights"]) + "⟩" for e in entries),
        REMAINING=",\n".join("  " + lean_list(row) for row in remaining),
        RANKS=",\n".join("  (" + lean_list(row) + ", " + str(value) + ")" for row, value in rank_rows))


def certificate_source(index, chunks):
    checked = ""
    for j, chunk in enumerate(chunks):
        checked += (f"private theorem checked{j} :\n"
                    f"    chunkCheck (entries[{index}]!) {lean_list(chunk)} = true := by\n"
                    "  decide +kernel\n\n")
    return replace(CERT_TEMPLATE, TAG=f"{index:02}", INDEX=str(index),
        CHUNKS=",\n".join("  " + lean_list(chunk) for chunk in chunks),
        CHECKED=checked, NAMES=", ".join(f"checked{j}" for j in range(len(chunks))))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--lean-data", type=Path,
        default=REPO / "lean/Conjectures/FranklSpanFourResidualTailData.lean")
    parser.add_argument("--lean-certificates-dir", type=Path,
        default=REPO / "lean/Conjectures")
    parser.add_argument("--check", action="store_true",
        help="require existing generated Lean sources to match, without rewriting them")
    args = parser.parse_args()
    for path, expected in INPUT_SHA256.items():
        assert digest((REPO / path).read_bytes()) == expected, ("changed original input", path)
    rows = read_rows()
    words = extend(rows)
    assert len(words) == 48 and len({tuple(row) for row in words}) == 48
    source = "".join(" ".join(map(str, row)) + "\n" for row in words)
    with tempfile.TemporaryDirectory(prefix="frankl-residual-tail-") as temp:
        finder, replay = Path(temp) / "finder", Path(temp) / "replay"
        for original, target in [("window_filter.cpp", finder), ("window_replay.cpp", replay)]:
            subprocess.run(["c++", "-O3", "-std=c++20", str(ROOT / original), "-o", str(target)],
                           check=True, timeout=120)
        found = subprocess.run([str(finder), "5"], input=source, text=True,
                               capture_output=True, check=True, timeout=120).stdout
        assert digest(found.encode()) == ORIGINAL_STDOUT_SHA256
        lines = found.splitlines()
        assert len(lines) == len(words)
        entries, remaining, certificates = [], [], []
        for word, line in zip(words, lines, strict=True):
            key, separator, weights = line.partition(":")
            assert list(map(int, key.split())) == word
            if separator:
                values = list(map(int, weights.split()))
                assert len(values) == 5 and sum(values) > 0 and all(0 <= v <= 3 for v in values)
                entries.append({"row": word, "generators": generator_masks(word), "weights": values})
                certificates.append(line)
            else:
                remaining.append(word)
        assert len(entries) == 31 and len(remaining) == 17
        replayed = subprocess.run([str(replay), "5"], input="\n".join(certificates) + "\n",
            text=True, capture_output=True, check=True, timeout=120).stdout
        assert int(replayed) == 31
    rank_rows = ranks(remaining)
    chunks = [exterior_chunks(entry) for entry in entries]
    assert sum(len(part) + 1 for part in chunks) == 447
    generated = {args.lean_data: data_source(entries, remaining, rank_rows)}
    for index, part in enumerate(chunks):
        generated[args.lean_certificates_dir / f"FranklSpanFourResidualTailCert{index:02}.lean"] = \
            certificate_source(index, part)
    generated[args.lean_certificates_dir / "FranklSpanFourResidualTailCertificates.lean"] = AGGREGATE_SOURCE
    for path, text in generated.items():
        if args.check:
            assert path.read_text() == text, ("generated source mismatch", str(path))
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
    result = {
        "status": "reproduced candidate data; Lean verification is separate",
        "input_sha256": INPUT_SHA256, "original_finder_stdout_sha256": ORIGINAL_STDOUT_SHA256,
        "residual_rows": rows, "extensions": words, "entries": entries,
        "remaining_rows": remaining, "rank_rows": rank_rows, "exterior_chunks": chunks,
        "generated_source_sha256": {path.name: digest(text.encode()) for path, text in generated.items()},
        "original_replay_count": 31, "private_checked_nodes": 447,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"extensions": 48, "certificates": 31, "survivors": 17,
                      "generated_sources": len(generated), "check_only": args.check}))


if __name__ == "__main__":
    main()
