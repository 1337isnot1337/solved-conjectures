#!/usr/bin/env python3
"""Generate complete initial support lists at arbitrary arity.

The numerical producer is untrusted. Its output is a postorder table of
original CoverCuts states, ordinary kernel proofs of every bounded fragment,
and separately checked Survivor facts for every retained support. No input
list of conjectured integer directions is accepted.

Bounds stop a pilot with status=incomplete. Such a packet can contain checked
completed minimum-pair components, but never receives a full-list theorem.
Smaller supports are retained, since folding may identify distinct speeds.
This producer does not certify subsequent multiplicity or binary lifts.
"""
from __future__ import annotations

import argparse
from collections import Counter
import copy
import hashlib
import itertools
import json
import math
from pathlib import Path
import re
import time


ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "modular-initial-support-v1"
FRAME_KEYS = ("fuel", "index", "selected", "available", "uncovered", "slots")
CUTS = "SupportSearch.Bits.Cuts"


class PilotLimit(RuntimeError):
    pass


def bits(mask: int):
    while mask:
        low = mask & -mask
        yield low.bit_length() - 1
        mask ^= low


def fold(modulus: int, value: int) -> int:
    return min(value % modulus, (-value) % modulus)


def natural(value, name: str) -> int:
    if type(value) is int and value >= 0:
        return value
    if isinstance(value, str) and re.fullmatch(r"0|[1-9][0-9]*", value):
        return int(value)
    raise ValueError(f"Expected a natural number for {name}")


def parameters(n: int, den: int, prime: int) -> None:
    if any(type(x) is not int for x in (n, den, prime)):
        raise ValueError("Parameters must be integers")
    if n < 2 or den < 3:
        raise ValueError("The speed bound must be at least two and denominator at least three")
    if prime < 2 or any(prime % d == 0 for d in range(2, math.isqrt(prime) + 1)):
        raise ValueError("The modulus must be prime")
    if prime % den == 0:
        raise ValueError("The denominator must not divide the modulus")


def initial_data(n: int, den: int, prime: int) -> dict:
    parameters(n, den, prime)
    half = prime // 2
    inverse = [0] + [pow(a, -1, prime) for a in range(1, half + 1)]
    cover = [sum(1 << t for t in range(1, half + 1)
                 if den * fold(prime, t*a) < prime) for a in range(half + 1)]
    return {"schema": SCHEMA, "speeds": n, "denominator": den, "prime": prime,
            "half": half, "width": half + 1, "inverse": inverse,
            "cover": [str(x) for x in cover], "rows": [], "roots": [],
            "status": "incomplete", "requested_pairs": [], "stopped": None}


def compatibility(data: dict, b: int) -> list[int]:
    prime, half, inverse = data["prime"], data["half"], data["inverse"]
    return [sum(1 << y for y in range(1, half + 1)
                if 0 < x <= half and b <= fold(prime, inverse[x]*y)
                and b <= fold(prime, inverse[y]*x)) for x in range(half + 1)]


def initial_state(data: dict, b: int, compatible: list[int]) -> dict:
    half = data["half"]
    cover = list(map(int, data["cover"]))
    return {"fuel": half + 2, "selected": 2 | (1 << b),
            "available": sum(1 << a for a in range(b + 1, half + 1)
                             if compatible[1] >> a & 1 and compatible[b] >> a & 1),
            "uncovered": ((1 << (half + 1)) - 2) & ~(cover[1] | cover[b]),
            "slots": data["speeds"] - 2}


def search_root(data: dict, b: int, row_indices: dict[int, int], *,
                max_nodes: int, max_seconds: float, max_rows: int) -> dict:
    half = data["half"]
    cover = list(map(int, data["cover"]))
    compatible = compatibility(data, b)
    start = initial_state(data, b, compatible)
    started = time.monotonic()
    nodes, frames = [], []
    known = {}
    used_compatible = set()
    census = Counter()
    visits, maximum_depth = 0, 0

    def visit(selected, available, uncovered, slots, fuel):
        nonlocal visits, maximum_depth
        visits += 1
        if max_nodes and visits > max_nodes:
            raise PilotLimit(f"minimum pair {b}: node limit {max_nodes}")
        if max_seconds and time.monotonic() - started > max_seconds:
            raise PilotLimit(f"minimum pair {b}: time limit {max_seconds:g}s")
        if fuel <= 0:
            raise ValueError("Unexpected certificate-fuel exhaustion")
        maximum_depth = max(maximum_depth, start["fuel"] - fuel)
        state = (selected, available, uncovered, slots, fuel)
        if state in known:
            return known[state]
        candidates = list(bits(available))
        gains = sorted((((uncovered & cover[a]).bit_count(), a) for a in candidates),
                       reverse=True)
        children = []
        if not compatible[1] >> b & 1:
            used_compatible.add(1)
            node = {"kind": "incompatible", "first": 1, "second": b}
        elif slots == 0 or available == 0:
            if uncovered:
                node = {"kind": "capacity", "value": gains[0][0] if gains else 0}
            else:
                if selected not in row_indices:
                    if max_rows and len(row_indices) >= max_rows:
                        raise PilotLimit(f"survivor-row limit {max_rows}")
                    row_indices[selected] = len(data["rows"])
                    data["rows"].append({"mask": str(selected), "support": list(bits(selected))})
                node = {"kind": "retained", "value": row_indices[selected]}
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
                a = gains[0][1]
                used_compatible.add(a)
                left = visit(selected, available & ~(1 << a), uncovered, slots, fuel - 1)
                right = visit(selected | (1 << a), available & ~(1 << a) & compatible[a],
                              uncovered & ~cover[a], slots - 1, fuel - 1)
                children = [left, right]
                node = {"kind": "split", "candidate": a, "left": left, "right": right}
        index = len(frames)
        nodes.append(node)
        frames.append({"fuel": fuel, "index": index, "selected": str(selected),
                       "available": str(available), "uncovered": str(uncovered),
                       "slots": slots, "children": children})
        known[state] = index
        census[node["kind"]] += 1
        return index

    root_index = visit(start["selected"], start["available"], start["uncovered"],
                       start["slots"], start["fuel"])
    return {"b": b, "initial": dict(frames[root_index]), "root_index": root_index,
            "nodes": nodes, "frames": frames,
            "compatible": {str(a): str(compatible[a]) for a in sorted(used_compatible)},
            "census": {"visits": visits, "frames": len(frames),
                       "maximum_depth": maximum_depth, "node_kinds": dict(census)}}


def canonicalize_rows(data: dict) -> None:
    old = data["rows"]
    order = sorted(range(len(old)), key=lambda i: (len(old[i]["support"]), old[i]["support"]))
    remap = {previous: current for current, previous in enumerate(order)}
    data["rows"] = [old[i] for i in order]
    for root in data["roots"]:
        for node in root["nodes"]:
            if node["kind"] == "retained":
                node["value"] = remap[node["value"]]


def produce(n: int, den: int, prime: int, pairs: list[int] | None = None, *,
            max_nodes: int = 250000, max_seconds: float = 60,
            max_rows: int = 25000) -> dict:
    if max_nodes < 0 or not math.isfinite(max_seconds) or max_seconds < 0 or max_rows < 0:
        raise ValueError("Pilot limits must be nonnegative; zero means no such limit")
    data = initial_data(n, den, prime)
    all_pairs = list(range(2, data["half"] + 1))
    requested = all_pairs if pairs is None else pairs
    if requested != sorted(set(requested)) or any(b not in all_pairs for b in requested):
        raise ValueError("Minimum pairs must be a sorted, nonrepeating subset of the full interval")
    data["requested_pairs"] = requested
    row_indices = {}
    for b in requested:
        try:
            data["roots"].append(search_root(data, b, row_indices, max_nodes=max_nodes,
                max_seconds=max_seconds, max_rows=max_rows))
        except PilotLimit as error:
            data["stopped"] = {"minimum_pair": b, "reason": str(error)}
            break
    canonicalize_rows(data)
    if data["stopped"] is None and [r["b"] for r in data["roots"]] == all_pairs:
        data["status"] = "complete"
    validate(data)
    return data


def is_survivor(data: dict, mask: int) -> bool:
    support = list(bits(mask))
    n, den, prime, half = (data[k] for k in ("speeds", "denominator", "prime", "half"))
    inverse = data["inverse"]
    if not 2 <= len(support) <= n or support[0] != 1 or support[-1] > half:
        return False
    b = support[1]
    if any(b > fold(prime, inverse[a]*c)
           for a in support for c in support if a != c):
        return False
    return all(any(den*fold(prime, t*a) < prime for a in support)
               for t in range(1, half + 1))


def validate(data: dict) -> None:
    """Replay every emitted node independently of recursive search choices."""
    if data.get("schema") != SCHEMA:
        raise ValueError("Unexpected packet schema")
    n, den, prime = (data[k] for k in ("speeds", "denominator", "prime"))
    parameters(n, den, prime)
    expected = initial_data(n, den, prime)
    for key in ("half", "width", "inverse", "cover"):
        if data[key] != expected[key]:
            raise ValueError(f"Incorrect arithmetic table: {key}")
    half = data["half"]
    cover = list(map(int, data["cover"]))
    rows, seen = [], set()
    for row in data["rows"]:
        mask = natural(row["mask"], "row mask")
        if mask in seen or row["support"] != list(bits(mask)) or not is_survivor(data, mask):
            raise ValueError("A retained row is duplicate or is not a normalized survivor")
        seen.add(mask)
        rows.append(mask)
    if data["rows"] != sorted(data["rows"], key=lambda x: (len(x["support"]), x["support"])):
        raise ValueError("Survivor rows are not in canonical order")
    all_pairs = list(range(2, half + 1))
    requested = data["requested_pairs"]
    if requested != sorted(set(requested)) or any(b not in all_pairs for b in requested):
        raise ValueError("Invalid requested pair inventory")
    root_pairs = [r["b"] for r in data["roots"]]
    if root_pairs != requested[:len(root_pairs)]:
        raise ValueError("Completed roots are not the exact requested prefix")
    for root in data["roots"]:
        b = root["b"]
        compatible = compatibility(data, b)
        for key, value in root["compatible"].items():
            a = natural(key, "compatible key")
            if a > half or natural(value, "compatible mask") != compatible[a]:
                raise ValueError("Incorrect sparse compatibility table")
        nodes, frames = root["nodes"], root["frames"]
        count = len(frames)
        if not count or len(nodes) != count or root["root_index"] != count - 1:
            raise ValueError("Incorrect postorder table shape")
        if root["initial"] != frames[-1]:
            raise ValueError("The initial state is not the final table frame")
        for key, value in initial_state(data, b, compatible).items():
            if natural(root["initial"][key], key) != value:
                raise ValueError(f"Incorrect initial state: {key}")
        used, reachable = set(), {count - 1}
        for i in range(count - 1, -1, -1):
            if i in reachable:
                reachable.update(frames[i]["children"])
        if reachable != set(range(count)):
            raise ValueError("The emitted table has unreachable or invalid references")
        for i, (node, frame) in enumerate(zip(nodes, frames, strict=True)):
            fuel, index, selected, available, uncovered, slots = (
                natural(frame[key], key) for key in FRAME_KEYS)
            if index != i or fuel == 0:
                raise ValueError("Invalid exact frame index or fuel")
            kind = node["kind"]
            if kind == "split":
                a = natural(node["candidate"], "split candidate")
                left, right = node["left"], node["right"]
                if not (type(left) is int and type(right) is int and
                        0 <= left < i and 0 <= right < i and
                        a <= half and available >> a & 1 and slots > 0):
                    raise ValueError("Invalid split or non-earlier reference")
                if frame["children"] != [left, right]:
                    raise ValueError("Frame and node references differ")
                used.add(a)
                expected_children = [
                    (fuel-1, left, selected, available & ~(1 << a), uncovered, slots),
                    (fuel-1, right, selected | (1 << a),
                     available & ~(1 << a) & compatible[a], uncovered & ~cover[a], slots-1)]
                for child, expected_child in zip((left, right), expected_children, strict=True):
                    if tuple(natural(frames[child][key], key) for key in FRAME_KEYS) != expected_child:
                        raise ValueError("Incorrect exact child state")
            else:
                if frame["children"]:
                    raise ValueError("Leaf frame has children")
                if kind == "incompatible":
                    a = natural(node["first"], "first incompatible coordinate")
                    c = natural(node["second"], "second incompatible coordinate")
                    if not (a <= half and c <= half and a != c and
                            selected >> a & 1 and selected >> c & 1 and
                            not compatible[a] >> c & 1):
                        raise ValueError("False incompatibility leaf")
                    used.add(a)
                    continue
                value = natural(node["value"], "leaf value")
                if kind == "retained":
                    if not (slots == 0 or available == 0) or uncovered != 0:
                        raise ValueError("Retained leaf has unexhausted choices or bad times")
                    if value >= len(rows) or selected != rows[value]:
                        raise ValueError("Retained leaf does not equal its row")
                elif kind == "witness":
                    if not uncovered >> value & 1 or any(cover[a] >> value & 1 for a in bits(available)):
                        raise ValueError("False witness leaf")
                elif kind == "capacity":
                    capacity = slots*value + sum(max((uncovered & cover[a]).bit_count()-value, 0)
                                                for a in bits(available))
                    if not capacity < uncovered.bit_count():
                        raise ValueError("False capacity leaf")
                else:
                    raise ValueError("Unknown certificate node")
        if set(root["compatible"]) != {str(a) for a in used}:
            raise ValueError("Sparse compatibility inventory differs from used splits")
    if data["status"] not in ("complete", "incomplete"):
        raise ValueError("Unknown completeness status")
    complete = root_pairs == all_pairs and data["stopped"] is None
    if (data["status"] == "complete") != complete:
        raise ValueError("Completeness flag differs from the full minimum-pair inventory")
    if data["stopped"] is not None:
        if len(root_pairs) >= len(requested) or data["stopped"]["minimum_pair"] != requested[len(root_pairs)]:
            raise ValueError("Stopped pair does not match the first unfinished root")


def rarray(values: list[str], lo=0, hi=None, indent=2) -> str:
    hi = len(values) if hi is None else hi
    if hi <= lo:
        raise ValueError("A literal RArray must be nonempty")
    pad = " " * indent
    if hi - lo == 1:
        return pad + "(.leaf " + values[lo] + ")"
    mid = (lo + hi) // 2
    return (pad + f"(.branch {mid}\n" + rarray(values, lo, mid, indent+2) + "\n"
            + rarray(values, mid, hi, indent+2) + "\n" + pad + ")")


def memo(entries: list[tuple[int, int]], indent=2) -> str:
    pad = " " * indent
    if not entries:
        return pad + ".empty"
    if len(entries) == 1:
        return pad + f"(.entry {entries[0][0]} {entries[0][1]})"
    mid = len(entries) // 2
    return (pad + f"(.branch {entries[mid][0]}\n" + memo(entries[:mid], indent+2)
            + "\n" + memo(entries[mid:], indent+2) + "\n" + pad + ")")


def names(data: dict) -> tuple[str, str]:
    tag = f"N{data['speeds']:02d}D{data['denominator']:02d}P{data['prime']:04d}"
    return "Conjectures.LonelinessModularSupportLists" + tag, "Loneliness.Modular.SupportLists." + tag


def frame_literal(frame: dict) -> str:
    return "⟨" + ", ".join(str(frame[key]) for key in FRAME_KEYS) + "⟩"


def header(imports: list[str], namespace: str, description: str, *, numeric=False) -> list[str]:
    lines = ["import " + module for module in imports]
    lines += ["", "/-! " + description,
              "Generated by scripts/generate_modular_initial_support.py. -/", "",
              "namespace " + namespace, ""]
    if numeric:
        lines += ["set_option maxRecDepth 20000", "set_option maxHeartbeats 4000000", ""]
    return lines


def finish(lines: list[str], namespace: str) -> str:
    return "\n".join(lines + ["", "end " + namespace, ""])


def arithmetic_source(data: dict) -> str:
    _, ns = names(data)
    p, den, width = data["prime"], data["denominator"], data["width"]
    lines = header(["Conjectures.LonelinessModularInitialMemo", "Init.Data.RArray"], ns,
                   f"Exact arithmetic for arity {data['speeds']}, denominator {den}, prime {p}.", numeric=True)
    lines += ["def inverseData : Lean.RArray ℕ :=", rarray(list(map(str, data["inverse"]))), "",
              f"def inverse (a : ℕ) : ℕ := if a < {width} then inverseData.get a else 0", "",
              f"theorem inverse_checked : ∀ a : Fin {width}, 0 < a.val →",
              f"    (a.val * inverse a.val) % {p} = 1 := by", "  decide +kernel", "",
              f"theorem inverse_valid (a : ℕ) (ha : 0 < a) (hb : 2*a ≤ {p}) :",
              f"    (a * inverse a) % {p} = 1 % {p} := by",
              f"  have hlt : a < {width} := by omega", "  exact inverse_checked ⟨a, hlt⟩ ha", "",
              "def coverTable : Memo.Tree :=", memo(list(enumerate(map(int, data["cover"])))), "",
              f"def coverMask : ℕ → ℕ := InitialMemo.cover {den} {p} coverTable", "",
              f"theorem cover_checked : Memo.check (InitialBits.cover {den} {p}) coverTable = true := by",
              "  decide +kernel"]
    return finish(lines, ns)


def rows_sources(data: dict, block_size: int):
    base, ns = names(data)
    n, den, p, count = data["speeds"], data["denominator"], data["prime"], len(data["rows"])
    lines = header([base + "Arithmetic", "Conjectures.LonelinessModularSupportLists"], ns,
                   "Literal retained supports. These rows may have fewer entries than the speed bound.")
    lines += ["def rowData : Lean.RArray ℕ :=", rarray([row["mask"] for row in data["rows"]] or ["0"]), "",
              f"def rows (i : Fin {count}) : ℕ := rowData.get i.val", "",
              "def terminal : Finset ℕ → ℕ → Bool := SupportLists.terminal rows"]
    yield base + "RowsData", finish(lines, ns)
    blocks = list(range(0, count, block_size))
    for block, start in enumerate(blocks):
        length = min(block_size, count-start)
        lines = header([base + "RowsData", "Mathlib.Tactic.FinCases"], ns,
                       f"Row validity checks {start} through {start+length-1}.", numeric=True)
        for i in range(start, start+length):
            lines += [f"theorem row{i:06d}_valid :",
                      f"    Survivor {n} {den} {p} inverse (SupportSearch.Bits.decode (rows {i})) := by",
                      "  decide +kernel", ""]
        lines += [f"theorem rows_block{block:04d}_valid (i : Fin {length}) :",
                  f"    Survivor {n} {den} {p} inverse",
                  f"      (SupportSearch.Bits.decode (rows ⟨i.val+{start}, by omega⟩)) := by", "  fin_cases i"]
        lines += [f"  · exact row{i:06d}_valid" for i in range(start, start+length)]
        yield base + f"RowsChecks{block:04d}", finish(lines, ns)
    imports = [base + f"RowsChecks{i:04d}" for i in range(len(blocks))] or [base + "RowsData"]
    lines = header(imports, ns, "Validity of every retained survivor, including smaller supports.")
    lines += [f"theorem rows_valid (i : Fin {count}) :",
              f"    Survivor {n} {den} {p} inverse (SupportSearch.Bits.decode (rows i)) := by"]
    if count == 0:
        lines += ["  exact Fin.elim0 i"]
    else:
        lines += block_join(count, block_size, "i.val", "i.isLt", "rows_block", "_valid", fin_result=True)
    yield base + "Rows", finish(lines, ns)


def block_join(count: int, block_size: int, index: str, bound: str,
               theorem_prefix: str, theorem_suffix: str, *, fin_result=False) -> list[str]:
    blocks = list(range(0, count, block_size))
    if len(blocks) == 1:
        if fin_result:
            return [f"  simpa only [Nat.add_zero] using {theorem_prefix}0000{theorem_suffix} ⟨{index}, {bound}⟩"]
        return [f"  exact {theorem_prefix}0000{theorem_suffix} ⟨{index}, {bound}⟩"]
    lines = []
    for block, start in enumerate(blocks):
        last = block == len(blocks)-1
        if not last:
            lines += [f"  by_cases h{block} : {index} < {start+block_size}"]
        prefix = "  " if last else "  · "
        indent = "  " if last else "    "
        if block == 0:
            operation = "simpa only [Nat.add_zero] using" if fin_result else "exact"
            lines += [f"{prefix}{operation} {theorem_prefix}0000{theorem_suffix} ⟨{index}, h0⟩"]
        else:
            lines += [f"{prefix}have hshift : {index} - {start} + {start} = {index} := by omega",
                      f"{indent}simpa only [hshift] using",
                      f"{indent}  ({theorem_prefix}{block:04d}{theorem_suffix} ⟨{index} - {start}, by omega⟩)"]
    return lines


def root_sources(data: dict, root: dict, block_size: int):
    base, parent = names(data)
    p, den, width, b = data["prime"], data["denominator"], data["width"], root["b"]
    module, ns = base + f"B{b:04d}", parent + f".B{b:04d}"
    initial = root["initial"]
    entries = sorted((b*width + int(a), int(mask)) for a, mask in root["compatible"].items())
    lines = header([base + "Arithmetic"], ns, f"Arithmetic for minimum pair {b}.", numeric=True)
    lines += ["def compatibleTable : Memo.Tree :=", memo(entries), "",
              f"def compatibleMask : ℕ → ℕ := InitialMemo.compatible {p} inverse {width} compatibleTable {b}", "",
              "theorem compatible_checked :",
              f"    Memo.check (InitialMemo.compatibleBase {p} inverse {width}) compatibleTable = true := by",
              "  decide +kernel", ""]
    for key, expression in [("selected", f"InitialSupport.selected {b}"),
                            ("available", f"InitialSupport.available {p} inverse {b}"),
                            ("uncovered", f"InitialSupport.uncovered {den} {p} {b}")]:
        lines += [f"theorem {key}_mask_checked : InitialBits.encode ({expression}) = {initial[key]} := by",
                  "  decide +kernel", ""]
    yield module + "Arithmetic", finish(lines, ns)
    nodes, fragments = [], []
    for node in root["nodes"]:
        if node["kind"] == "split":
            nodes.append(f"(.split {node['candidate']} {node['left']} {node['right']})")
            fragments.append(f"(.split (.reuse {node['left']}) (.reuse {node['right']}))")
        elif node["kind"] == "incompatible":
            nodes.append(f"(.leaf (.incompatible {node['first']} {node['second']}))")
            fragments.append(".leaf")
        else:
            nodes.append(f"(.leaf (.{node['kind']} {node['value']}))")
            fragments.append(".leaf")
    lines = header([module + "Arithmetic", base + "RowsData", "Conjectures.LonelinessModularCoverCuts"], ns,
                   f"Complete literal state table for minimum pair {b}.")
    lines += ["noncomputable section", "", "def nodeData : Lean.RArray SupportSearch.Tape.Node :=", rarray(nodes), "",
              "def lookup (index : ℕ) : SupportSearch.Tape.Node := nodeData.get index", "",
              "def tree : SupportSearch.Tree :=",
              f"  SupportSearch.Tape.toTree lookup {initial['fuel']} {root['root_index']}", "",
              f"def frameData : Lean.RArray {CUTS}.Frame :=", rarray(list(map(frame_literal, root["frames"]))), "",
              f"def frames (index : ℕ) : {CUTS}.Frame := frameData.get index", "",
              f"def fragmentData : Lean.RArray {CUTS}.Fragment :=", rarray(fragments), "",
              f"def fragments (index : ℕ) : {CUTS}.Fragment := fragmentData.get index", "",
              f"def rootFrame : {CUTS}.Frame := {frame_literal(initial)}", "", "end"]
    yield module + "Data", finish(lines, ns)
    count = len(root["frames"])
    for block, start in enumerate(range(0, count, block_size)):
        length = min(block_size, count-start)
        lines = header([module + "Data", "Conjectures.LonelinessModularCoverFastCuts", "Mathlib.Tactic.FinCases"], ns,
                       f"Exact original bounded checks for frames {start} through {start+length-1}.", numeric=True)
        for i in range(start, start+length):
            lines += [f"theorem frame{i:06d}_checked :",
                      f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames {i} 3",
                      f"      (fragments {i}) (frames {i}) = true := by",
                      "  apply SupportSearch.Bits.FastCuts.boundedCheck_sound", "  decide +kernel", ""]
        lines += [f"theorem block{block:04d}_checked (i : Fin {length}) :",
                  f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames (i.val+{start}) 3",
                  f"      (fragments (i.val+{start})) (frames (i.val+{start})) = true := by", "  fin_cases i"]
        lines += [f"  · exact frame{i:06d}_checked" for i in range(start, start+length)]
        yield module + f"Checks{block:04d}", finish(lines, ns)
    blocks = (count + block_size - 1) // block_size
    lines = header([module + f"Checks{i:04d}" for i in range(blocks)], ns,
                   f"Assemble every checked frame for minimum pair {b}.")
    lines += [f"theorem table_checks (index : ℕ) (hi : index < {count}) :",
              f"    {CUTS}.boundedCheck coverMask compatibleMask terminal lookup frames index 3",
              "      (fragments index) (frames index) = true := by"]
    lines += block_join(count, block_size, "index", "hi", "block", "_checked")
    lines += ["", f"theorem all_frames_checked (index : ℕ) (hi : index < {count}) :",
              f"    {CUTS}.Frame.Checked coverMask compatibleMask terminal lookup (frames index) :=",
              f"  {CUTS}.table_sound coverMask compatibleMask terminal lookup frames fragments",
              f"    {count} 3 table_checks index hi", "",
              f"theorem root_frame_eq : frames {root['root_index']} = rootFrame := by", "  decide +kernel", "",
              "theorem root_tape_checked :",
              f"    SupportSearch.Bits.tapeCheck coverMask compatibleMask terminal lookup {initial['fuel']} {initial['index']}",
              f"      {initial['selected']} {initial['available']} {initial['uncovered']} {initial['slots']} = true := by",
              f"  have h := all_frames_checked {root['root_index']} (by decide)", "  rw [root_frame_eq] at h", "  exact h", "",
              "theorem tape_checked :",
              f"    SupportSearch.Bits.tapeCheck (InitialMemo.cover {den} {p} coverTable)",
              f"      (InitialMemo.compatible {p} inverse {width} compatibleTable {b})",
              f"      terminal lookup {initial['fuel']} {initial['index']}",
              f"      (InitialBits.encode (InitialSupport.selected {b}))",
              f"      (InitialBits.encode (InitialSupport.available {p} inverse {b}))",
              f"      (InitialBits.encode (InitialSupport.uncovered {den} {p} {b})) {initial['slots']} = true := by",
              "  rw [selected_mask_checked, available_mask_checked, uncovered_mask_checked]", "  exact root_tape_checked", "",
              "theorem root_checked :",
              f"    SupportSearch.check (InitialSupport.badTimes {den} {p})",
              f"      (InitialSupport.pairCompatible {p} inverse {b}) terminal tree",
              f"      (InitialSupport.selected {b}) (InitialSupport.available {p} inverse {b})",
              f"      (InitialSupport.uncovered {den} {p} {b}) {initial['slots']} = true := by",
              f"  exact InitialMemo.checked_tree {den} {p} inverse {width} (by decide)",
              f"    coverTable compatibleTable cover_checked compatible_checked {b}",
              f"    terminal lookup {initial['fuel']} {initial['index']} {initial['slots']} tape_checked"]
    yield module, finish(lines, ns)


def aggregate_source(data: dict) -> str:
    if data["status"] != "complete":
        raise ValueError("No global theorem may be emitted from an incomplete packet")
    base, ns = names(data)
    n, den, p, half = (data[k] for k in ("speeds", "denominator", "prime", "half"))
    roots = data["roots"]
    lines = header([base + "Rows", "Mathlib.Tactic.IntervalCases"] +
                   [base + f"B{r['b']:04d}" for r in roots], ns,
                   "Complete initial survivor list. This does not classify integer directions.")
    lines += ["noncomputable section", "", "def trees : ℕ → SupportSearch.Tree"]
    lines += [f"  | {r['b']} => B{r['b']:04d}.tree" for r in roots]
    lines += ["  | _ => .reject", "",
              f"theorem initial_checked (b : ℕ) (hb : 2 ≤ b) (hbound : 2*b ≤ {p}) :",
              f"    SupportSearch.check (InitialSupport.badTimes {den} {p})",
              f"      (InitialSupport.pairCompatible {p} inverse b) terminal (trees b)",
              f"      (InitialSupport.selected b) (InitialSupport.available {p} inverse b)",
              f"      (InitialSupport.uncovered {den} {p} b) {n-2} = true := by",
              f"  have hbupper : b ≤ {half} := by omega"]
    if roots:
        lines += ["  interval_cases b"] + [f"  · exact B{r['b']:04d}.root_checked" for r in roots]
    else:
        lines += ["  omega"]
    lines += ["", "theorem exact_survivors (s : Finset ℕ) :",
              f"    Survivor {n} {den} {p} inverse s ↔ Retained rows s :=",
              f"  checked_survivor_iff {n} {den} {p} (by decide) inverse rows rows_valid trees initial_checked s", "",
              "theorem normalized_cover (ds : List ℕ) (hne : ds ≠ [])",
              f"    (hlen : ds.length ≤ {n}) (hmod : ∀ d ∈ ds, d % {p} ≠ 0)",
              f"    (hlow : value ds ≤ (1 : ℝ)/{den}) :",
              f"    ∃ u v : ℕ, (u*v) % {p} = 1 % {p} ∧",
              f"      Retained rows (foldedSupport {p} u (FourSpeed.residueSupport {p} ds)) :=",
              f"  checked_list_cover {n} {den} {p} (by decide) (by decide) (by decide) (by decide)",
              "    inverse inverse_valid rows trees initial_checked ds hne hlen hmod hlow", "", "end"]
    return finish(lines, ns)


def lean_sources(data: dict, block_size: int = 32) -> dict[str, str]:
    validate(data)
    if not 1 <= block_size <= 128:
        raise ValueError("A numerical block must have between one and 128 frames or rows")
    base, _ = names(data)
    sources = {base + "Arithmetic": arithmetic_source(data)}
    sources.update(rows_sources(data, block_size))
    for root in data["roots"]:
        sources.update(root_sources(data, root, block_size))
    if data["status"] == "complete":
        sources[base] = aggregate_source(data)
    return sources


def summary(data: dict) -> dict:
    return {"schema": SCHEMA, "status": data["status"], "speeds": data["speeds"],
            "denominator": data["denominator"], "prime": data["prime"],
            "completed_pairs": [r["b"] for r in data["roots"]],
            "expected_pair_count": max(data["half"]-1, 0),
            "frames": sum(len(r["frames"]) for r in data["roots"]),
            "survivors": len(data["rows"]),
            "survivor_cardinalities": dict(sorted(Counter(len(r["support"]) for r in data["rows"]).items())),
            "stopped": data["stopped"], "lean_verified": False,
            "binary_lifting_verified": False, "integer_classification_verified": False}


def self_test() -> dict:
    """Compare against independent powerset enumeration and reject corruptions."""
    results = []
    for n, den, p in [(2, 3, 2), (3, 4, 7), (5, 6, 11), (9, 10, 17), (3, 3, 101)]:
        data = produce(n, den, p, max_nodes=0, max_seconds=0, max_rows=0)
        candidates = range(2, data["half"]+1)
        brute = set()
        for size in range(2, min(n, data["half"])+1):
            for rest in itertools.combinations(candidates, size-1):
                support = (1,) + rest
                b = min(rest)
                if not all(b <= fold(p, data["inverse"][a]*c)
                           for a in support for c in support if a != c):
                    continue
                if all(any(den*fold(p, t*a) < p for a in support)
                       for t in range(1, data["half"]+1)):
                    brute.add(sum(1 << a for a in support))
        if data["status"] != "complete" or {int(r["mask"]) for r in data["rows"]} != brute:
            raise AssertionError("Search differs from independent powerset enumeration")
        sources = lean_sources(data, block_size=3)
        if names(data)[0] not in sources:
            raise AssertionError("Complete packet is missing its aggregate")
        results.append(summary(data))
    bounded = produce(9, 10, 71, [2], max_nodes=64, max_seconds=0, max_rows=0)
    if bounded["status"] != "incomplete" or not bounded["stopped"]:
        raise AssertionError("A bounded failed pilot was marked complete")
    if names(bounded)[0] in lean_sources(bounded, block_size=3):
        raise AssertionError("An incomplete packet emitted a global theorem")
    sample = produce(5, 6, 11, max_nodes=0, max_seconds=0, max_rows=0)
    corruptions = []
    bad = copy.deepcopy(sample); bad["inverse"][1] = 0; corruptions.append(bad)
    bad = copy.deepcopy(sample); bad["roots"].pop(); corruptions.append(bad)
    bad = copy.deepcopy(sample); bad["rows"][0]["mask"] = str(int(bad["rows"][0]["mask"]) | 1); corruptions.append(bad)
    bad = copy.deepcopy(sample)
    root = next(r for r in bad["roots"] if any(node["kind"] == "split" for node in r["nodes"]))
    index = next(i for i,node in enumerate(root["nodes"]) if node["kind"] == "split")
    root["nodes"][index]["left"] = index; corruptions.append(bad)
    for bad in corruptions:
        try:
            validate(bad)
        except (ValueError, IndexError, KeyError):
            pass
        else:
            raise AssertionError("A corrupted certificate was accepted by the untrusted replay")
    return {"independent_small_censuses": results, "bounded_pilot": summary(bounded),
            "rejected_corruptions": len(corruptions), "lean_verified": False}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--speeds", type=int)
    parser.add_argument("--denominator", type=int)
    parser.add_argument("--prime", type=int)
    parser.add_argument("--only-b", type=int, action="append")
    parser.add_argument("--max-nodes", type=int, default=250000)
    parser.add_argument("--max-seconds", type=float, default=60)
    parser.add_argument("--max-rows", type=int, default=25000)
    parser.add_argument("--load-json", type=Path)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--block-size", type=int, default=32)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        print(json.dumps(self_test(), sort_keys=True))
        return
    if args.load_json:
        if args.speeds is not None or args.denominator is not None or args.prime is not None or args.only_b:
            parser.error("--load-json cannot be combined with generation parameters")
        data = json.loads(args.load_json.read_text())
        validate(data)
    else:
        if args.speeds is None or args.prime is None:
            parser.error("--speeds and --prime are required without --load-json")
        den = args.denominator if args.denominator is not None else args.speeds+1
        data = produce(args.speeds, den, args.prime,
            sorted(args.only_b) if args.only_b is not None else None,
            max_nodes=args.max_nodes, max_seconds=args.max_seconds, max_rows=args.max_rows)
    if args.json_out:
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        temporary = args.json_out.with_name(args.json_out.name + ".tmp")
        temporary.write_text(json.dumps(data, sort_keys=True, separators=(",", ":")) + "\n")
        temporary.replace(args.json_out)
    output = summary(data)
    if args.lean_dir:
        hashes = {}
        for module, source in lean_sources(data, args.block_size).items():
            path = args.lean_dir / (module.replace(".", "/") + ".lean")
            if args.check:
                if not path.is_file() or path.read_text() != source:
                    raise ValueError("Generated source differs: " + str(path))
            else:
                if path.exists() and path.read_text() != source:
                    raise ValueError("Refusing to overwrite a different generated source: " + str(path))
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(source)
            hashes[module] = hashlib.sha256(source.encode()).hexdigest()
        output["generated_sha256"] = hashes
        output["global_theorem_emitted"] = names(data)[0] in hashes
    print(json.dumps(output, sort_keys=True))


if __name__ == "__main__":
    main()
