#!/usr/bin/env python3
"""Produce exact finite support-search tapes for a five-runner prime.

This program is untrusted. It emits literal inputs to the existing verified
support checker. Every generated finite assertion needs an ordinary Lean
kernel proof, an axiom audit, and independent kernel replay before acceptance.
The search includes every minimum pair and every compatible support of size
at most five. No numerical computation by this producer is a proof premise.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
import math
from pathlib import Path
import re
import time


ROOT = Path(__file__).resolve().parents[1]


def bits(mask: int):
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def folded(prime: int, value: int) -> int:
    residue = value % prime
    return min(residue, (prime - residue) % prime)



def prime_data(prime: int) -> dict:
    if prime <= 135 or any(prime % d == 0 for d in range(2, math.isqrt(prime) + 1)):
        raise ValueError("This producer requires a prime greater than 135")
    half = prime // 2
    inverse = [0] + [pow(a, -1, prime) for a in range(1, half + 1)]
    cover = [sum(1 << t for t in range(1, half + 1)
                 if 6 * folded(prime, t * a) < prime) for a in range(half + 1)]
    directions = [[1, 2, 3, 4, 5], [1, 3, 4, 5, 9]]
    rows = [{"root": sorted(folded(prime, inverse[t] * j) for j in direction),
             "time": t, "direction": direction}
            for direction in directions for t in direction]
    if any(len(set(row["root"])) != 5 for row in rows):
        raise ValueError("A retained row is not injective")
    return {"schema": "five-runner-prime-support-v1", "p": prime, "half": half,
            "width": half + 1, "inverse": inverse,
            "cover": [str(value) for value in cover], "rows": rows, "roots": []}


def search_root(data: dict, b: int) -> dict:
    prime, half = data["p"], data["half"]
    inverse = data["inverse"]
    cover = [int(value) for value in data["cover"]]
    compatible = [sum(1 << y for y in range(1, half + 1)
                      if b <= folded(prime, inverse[x] * y)
                      and b <= folded(prime, inverse[y] * x)) for x in range(half + 1)]
    available = sum(1 << a for a in range(b + 1, half + 1)
                    if compatible[1] >> a & 1 and compatible[b] >> a & 1)
    times = ((1 << (half + 1)) - 1) ^ 1
    selected = 2 | (1 << b)
    uncovered = times & ~(cover[1] | cover[b])
    retained = {sum(1 << a for a in row["root"]): index
                for index, row in enumerate(data["rows"])}
    nodes: list[dict] = []
    frames: list[dict] = []
    known: dict[tuple, int] = {}
    used_compatible: set[int] = set()
    kinds = Counter()
    initial_fuel = half + 2
    maximum_depth = 0

    def visit(selected: int, available: int, uncovered: int, slots: int, fuel: int) -> int:
        nonlocal maximum_depth
        if fuel <= 0:
            raise RuntimeError("Search exhausted its explicit certificate fuel")
        maximum_depth = max(maximum_depth, initial_fuel - fuel)
        state = (selected, available, uncovered, slots, fuel)
        if state in known:
            return known[state]
        candidates = list(bits(available))
        gains = sorted((((uncovered & cover[a]).bit_count(), a) for a in candidates),
                       reverse=True)
        children = []
        if slots == 0 or available == 0:
            if uncovered:
                threshold = gains[0][0] if gains else 0
                node = {"kind": "capacity", "value": threshold}
            elif selected in retained:
                node = {"kind": "retained", "value": retained[selected]}
            else:
                raise RuntimeError(f"Unclassified support: p={prime} b={b} {list(bits(selected))}")
        elif sum(gain for gain, _ in gains[:slots]) < uncovered.bit_count():
            threshold = gains[slots - 1][0] if len(gains) >= slots else 0
            node = {"kind": "capacity", "value": threshold}
        else:
            covered = 0
            for a in candidates:
                covered |= cover[a]
            missing = uncovered & ~covered
            if missing:
                node = {"kind": "witness", "value": next(bits(missing))}
            else:
                candidate = gains[0][1]
                used_compatible.add(candidate)
                without = visit(selected, available & ~(1 << candidate), uncovered, slots, fuel - 1)
                present = visit(selected | (1 << candidate),
                                available & ~(1 << candidate) & compatible[candidate],
                                uncovered & ~cover[candidate], slots - 1, fuel - 1)
                children = [without, present]
                node = {"kind": "split", "candidate": candidate,
                        "left": without, "right": present}
        index = len(frames)
        nodes.append(node)
        frames.append({"fuel": fuel, "index": index, "selected": str(selected),
                       "available": str(available), "uncovered": str(uncovered),
                       "slots": slots, "children": children})
        known[state] = index
        kinds[node["kind"]] += 1
        return index

    start = time.monotonic()
    root_index = visit(selected, available, uncovered, 3, initial_fuel)
    result = {"b": b, "initial": dict(frames[root_index]), "root_index": root_index,
              "nodes": nodes, "frames": frames,
              "compatible": {str(a): str(compatible[a]) for a in sorted(used_compatible)},
              "census": {"frames": len(frames), "maximum_depth": maximum_depth,
                         "leaves_and_splits": dict(kinds),
                         "initial_candidates": available.bit_count()}}
    validate_root(data, result)
    print(json.dumps({"p": prime, "b": b, **result["census"],
                      "seconds": round(time.monotonic() - start, 3)}), flush=True)
    return result


def validate_root(data: dict, root: dict) -> None:
    """Replay emitted state transitions independently from the recursive search."""
    cover = [int(value) for value in data["cover"]]
    rows = [sum(1 << a for a in row["root"]) for row in data["rows"]]
    for i, (node, frame) in enumerate(zip(root["nodes"], root["frames"], strict=True)):
        if frame["index"] != i or frame["fuel"] <= 0:
            raise ValueError("Bad frame identity")
        selected, available, uncovered = (int(frame[key]) for key in ("selected", "available", "uncovered"))
        slots = frame["slots"]
        kind = node["kind"]
        if kind == "split":
            a, left, right = node["candidate"], node["left"], node["right"]
            if not (left < i and right < i and available >> a & 1 and slots > 0):
                raise ValueError("Bad split or non-earlier reference")
            compatible = int(root["compatible"][str(a)])
            expected = [
                (selected, available & ~(1 << a), uncovered, slots),
                (selected | (1 << a), available & ~(1 << a) & compatible,
                 uncovered & ~cover[a], slots - 1),
            ]
            for child_index, state in zip((left, right), expected, strict=True):
                child = root["frames"][child_index]
                if child["fuel"] != frame["fuel"] - 1:
                    raise ValueError("Bad child fuel")
                if tuple(int(child[key]) for key in ("selected", "available", "uncovered", "slots")) != state:
                    raise ValueError("Bad child state")
        elif kind == "capacity":
            threshold = node["value"]
            capacity = slots * threshold + sum(max((uncovered & cover[a]).bit_count() - threshold, 0)
                                               for a in bits(available))
            if capacity >= uncovered.bit_count():
                raise ValueError("False capacity leaf")
        elif kind == "witness":
            t = node["value"]
            if not uncovered >> t & 1 or any(cover[a] >> t & 1 for a in bits(available)):
                raise ValueError("False uncovered-time witness")
        elif kind == "retained":
            if not (slots == 0 or available == 0) or selected != rows[node["value"]]:
                raise ValueError("False retained-row leaf")
        else:
            raise ValueError("Unknown instruction")


def rarray(values: list[str], lo: int = 0, hi: int | None = None, indent: int = 2) -> str:
    hi = len(values) if hi is None else hi
    pad = " " * indent
    if hi - lo == 1:
        return pad + "(.leaf " + values[lo] + ")"
    middle = (lo + hi) // 2
    return (pad + f"(.branch {middle}\n" + rarray(values, lo, middle, indent + 2) + "\n"
            + rarray(values, middle, hi, indent + 2) + "\n" + pad + ")")


def frame_literal(frame: dict) -> str:
    return "⟨" + ", ".join(str(frame[key]) for key in
                            ("fuel", "index", "selected", "available", "uncovered", "slots")) + "⟩"


def lean_files(data: dict, block_size: int = 32):
    prime = f"{data['p']:04d}"
    base = "Conjectures.LonelinessFiveRunnerPrime" + prime
    namespace = "Loneliness.Modular.FiveRunner.Prime" + prime
    cuts = "SupportSearch.Bits.Cuts"
    for root in data["roots"]:
        tag = f"B{root['b']:03d}"
        module = base + tag
        ns = namespace + "." + tag
        nodes = []
        fragments = []
        for node, frame in zip(root["nodes"], root["frames"], strict=True):
            if node["kind"] == "split":
                nodes.append(f"(.split {node['candidate']} {node['left']} {node['right']})")
                fragments.append(f"(.split (.reuse {node['left']}) (.reuse {node['right']}))")
            else:
                nodes.append(f"(.leaf (.{node['kind']} {node['value']}))")
                fragments.append(".leaf")
        content = [f"import {base}Arithmetic", f"import {base}Rows", f"import {module}Arithmetic",
                   "import Conjectures.LonelinessModularCoverCuts", "import Init.Data.RArray", "",
                   f"/-! Literal complete support tape for prime {data['p']}, minimum pair {root['b']}.",
                   "Generated by scripts/generate_five_runner_certificates.py.",
                   "Every finite check is proved separately; this data module alone proves no coverage. -/", "",
                   f"namespace {ns}", "", "noncomputable section", "",
                   "def nodeData : Lean.RArray SupportSearch.Tape.Node :=", rarray(nodes), "",
                   "def lookup (index : ℕ) : SupportSearch.Tape.Node := nodeData.get index", "",
                   "def tree : SupportSearch.Tree :=", f"  SupportSearch.Tape.toTree lookup {root['initial']['fuel']} {root['root_index']}", "",
                   f"def frameData : Lean.RArray {cuts}.Frame :=",
                   rarray([frame_literal(frame) for frame in root["frames"]]), "",
                   f"def frames (index : ℕ) : {cuts}.Frame := frameData.get index", "",
                   f"def fragmentData : Lean.RArray {cuts}.Fragment :=", rarray(fragments), "",
                   f"def fragments (index : ℕ) : {cuts}.Fragment := fragmentData.get index", "",
                   f"def rootFrame : {cuts}.Frame :=", "  " + frame_literal(root["initial"]), "",
                   "end", f"end {ns}", ""]
        yield module + "Data", "\n".join(content)
        count = len(root["frames"])
        for block, start in enumerate(range(0, count, block_size)):
            length = min(block_size, count - start)
            block_tag = f"{block:03d}"
            lines = [f"import {module}Data", "import Mathlib.Tactic.FinCases", "",
                     f"/-! Exact bounded support checks for frames {start} through {start+length-1}. -/", "",
                     f"namespace {ns}", "", "set_option maxRecDepth 20000", "set_option maxHeartbeats 0", ""]
            for i in range(start, start + length):
                lines.extend([f"theorem frame{i:05d}_checked :",
                              f"    {cuts}.boundedCheck coverMask compatibleMask terminal lookup frames {i} 3",
                              f"      (fragments {i}) (frames {i}) = true := by", "  decide +kernel", ""])
            lines.extend([f"theorem block{block_tag}_checked (j : Fin {length}) :",
                          f"    {cuts}.boundedCheck coverMask compatibleMask terminal lookup frames (j.val + {start}) 3",
                          f"      (fragments (j.val + {start})) (frames (j.val + {start})) = true := by",
                          "  fin_cases j"])
            lines.extend(f"  · exact frame{i:05d}_checked" for i in range(start, start + length))
            lines.extend(["", f"end {ns}", ""])
            yield module + "Checks" + block_tag, "\n".join(lines)


def combined_files(data: dict, block_size: int = 128):
    """Place each complete root in one source without changing its propositions.

    This removes hundreds of repeated module imports and independent checker
    startups. Bounded fragments and their individual kernel proofs stay intact.
    """
    import generate_five_runner_arithmetic as arithmetic
    import generate_five_runner_assembly as assembly
    arithmetic.validate(data)
    base = f"Conjectures.LonelinessFiveRunnerPrime{data['p']:04d}"
    yield base + "Arithmetic", arithmetic.shared_arithmetic(data)
    yield base + "Rows", arithmetic.retained_rows(data)
    for root in data["roots"]:
        module = base + f"B{root['b']:03d}"
        one = {**data, "roots": [root]}
        parts = [arithmetic.root_arithmetic(data, root)]
        parts.extend(content for _, content in lean_files(one, block_size))
        parts.append(assembly.root_assembly(data, root, block_size))
        imports = []
        bodies = []
        for content in parts:
            body = []
            for line in content.splitlines():
                match = re.fullmatch(r"import (\S+)", line)
                if match:
                    imported = match.group(1)
                    if not imported.startswith(module) and imported not in imports:
                        imports.append(imported)
                else:
                    body.append(line)
            bodies.append("\n".join(body).strip())
        header = "\n".join("import " + imported for imported in imports)
        yield module, header + "\n\n" + "\n\n".join(bodies) + "\n"
    if [root["b"] for root in data["roots"]] == list(range(2, data["half"] + 1)):
        yield base, assembly.prime_assembly(data)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--prime", type=int)
    parser.add_argument("--load-json", type=Path)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--only-b", type=int)
    parser.add_argument("--block-size", type=int, default=32)
    parser.add_argument("--combined", action="store_true",
                        help="render shared arithmetic/rows and one complete source per minimum pair")
    args = parser.parse_args()
    if args.load_json:
        data = json.loads(args.load_json.read_text())
        for root in data["roots"]:
            validate_root(data, root)
    else:
        if args.prime is None:
            parser.error("--prime or --load-json is required")
        data = prime_data(args.prime)
        selected_roots = [args.only_b] if args.only_b else range(2, data["half"] + 1)
        for b in selected_roots:
            data["roots"].append(search_root(data, b))
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_text(json.dumps(data, separators=(",", ":")) + "\n")
    files = []
    if args.lean_dir:
        renderer = combined_files if args.combined else lean_files
        for module, content in renderer(data, args.block_size):
            path = args.lean_dir / (module.replace(".", "/") + ".lean")
            if args.check:
                if path.read_text() != content:
                    raise RuntimeError(f"Generated source mismatch: {path}")
            else:
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(content)
            files.append({"module": module, "sha256": hashlib.sha256(content.encode()).hexdigest()})
    print(json.dumps({"p": data["p"], "root_count": len(data["roots"]),
                      "frames": sum(len(root["frames"]) for root in data["roots"]),
                      "generated_files": len(files), "acceptance": "untrusted producer output"}), flush=True)


if __name__ == "__main__":
    main()
