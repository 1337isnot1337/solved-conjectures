#!/usr/bin/env python3
"""Produce complete ordered binary traces for closed modular thresholds.

The inputs are a complete initial-support packet and its complete canonical
multiplicity packet. No coordinate, unit-orbit, or Boolean symmetry is used.
Every branch contains all 2**n ordered children. Leaves use only the existing
Closed.Tree checker: strict/grid witnesses, parity, and exact short directions.

This producer is untrusted. Independent integer replay rejects corrupt traces;
ordinary Lean kernel proofs remain necessary. An unresolved state makes the
whole packet incomplete and prevents emission of any Lean certificate.
"""
from __future__ import annotations

import argparse
from collections import Counter
import copy
from fractions import Fraction
import hashlib
import json
import math
from pathlib import Path
import re

import generate_modular_initial_support as initial
import generate_modular_support_multiplicities as multiplicities


ROOT = Path(__file__).resolve().parents[1]
SCHEMA = "modular-closed-lifts-v1"
FIELDS = {"schema", "speeds", "numerator", "denominator", "modulus", "gap",
          "candidates", "initial_packet_sha256", "multiplicity_packet_sha256",
          "module_prefix", "namespace", "max_depth", "max_nodes", "status",
          "roots", "census", "unresolved"}
KINDS = ("branch", "strictWitness", "gridWitness", "allEven", "oneOdd",
         "direction", "unresolved")
IDENTIFIER = re.compile(r"[A-Za-z][A-Za-z0-9_]*(?:\.[A-Za-z][A-Za-z0-9_]*)*\Z")


def encoded(value) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def digest(value) -> str:
    return hashlib.sha256(encoded(value)).hexdigest()


def require(condition, message: str) -> None:
    if not condition:
        raise ValueError(message)


def natural(value, label: str) -> int:
    require(type(value) is int and value >= 0, label + " is not a natural number")
    return value


def folded(m: int, value: int) -> int:
    residue = value % m
    return min(residue, m - residue)


def child(m: int, x: tuple[int, ...], mask: int) -> tuple[int, ...]:
    return tuple(m - a if mask >> i & 1 else a for i, a in enumerate(x))


def validate_inputs(parent: dict, representatives: dict) -> None:
    multiplicities.validate(representatives, parent)
    require(parent["status"] == "complete", "Initial support coverage is incomplete")
    require(representatives["status"] == "complete", "Multiplicity coverage is incomplete")


def validate_parameters(data: dict, parent: dict, representatives: dict) -> None:
    require(set(data) == FIELDS and data["schema"] == SCHEMA, "Unexpected closed-lift schema")
    for key in ("speeds", "numerator", "denominator", "modulus"):
        natural(data[key], key)
    require(data["speeds"] == parent["speeds"] and data["numerator"] == 1
            and data["denominator"] == parent["denominator"] and data["modulus"] == parent["prime"],
            "Closed-lift parameters differ from the initial threshold")
    require(data["initial_packet_sha256"] == digest(parent)
            and data["multiplicity_packet_sha256"] == digest(representatives),
            "Exact input packet identity changed")
    n, den = data["speeds"], data["denominator"]
    require(type(data["gap"]) is list and len(data["gap"]) == 2, "Invalid rational gap")
    gn, gd = (natural(a, "Gap entry") for a in data["gap"])
    require(gd > 0 and math.gcd(gn, gd) == 1 and Fraction(gn, gd) > Fraction(1, den),
            "The reduced rational gap must exceed the closed threshold")
    require(type(data["candidates"]) is list, "Invalid direction candidate table")
    require(len({tuple(row) for row in data["candidates"]}) == len(data["candidates"]),
            "Duplicate direction candidates")
    for row in data["candidates"]:
        require(type(row) is list and len(row) == n
                and all(type(a) is int and a > 0 for a in row)
                and row == sorted(row) and math.gcd(*row) == 1,
                "A direction candidate has the wrong arity, order, positivity or gcd")
    require(type(data["module_prefix"]) is str and IDENTIFIER.fullmatch(data["module_prefix"])
            and data["module_prefix"].startswith("Conjectures."),
            "Invalid generated module prefix")
    require(type(data["namespace"]) is str and IDENTIFIER.fullmatch(data["namespace"])
            and data["namespace"].startswith("Loneliness.Modular."),
            "Invalid generated namespace")
    require(natural(data["max_depth"], "Maximum depth") <= 32, "Maximum depth exceeds 32")
    require(natural(data["max_nodes"], "Maximum nodes") >= len(representatives["representatives"]),
            "The state bound is smaller than the complete root inventory")
    require(data["status"] in ("complete", "incomplete"), "Unknown completeness status")


def find_leaf(m: int, x: tuple[int, ...], den: int, gap: Fraction,
              candidates: list[list[int]]) -> dict | None:
    if m % 2 == 0:
        odd = sum(a % 2 for a in x)
        if odd == 0:
            return {"kind": "allEven"}
        if odd == 1:
            return {"kind": "oneOdd"}
    delta = gap - Fraction(1, den)
    candidate_index = {tuple(row): i for i, row in enumerate(candidates)}
    for t in range(1, m // 2 + 1):
        y = [folded(m, t * a) for a in x]
        if m < den * min(y):
            return {"kind": "strictWitness", "time": t}
        # The grid constructor remains supported even when strict selection
        # already finds every nondivisible-grid witness at this threshold.
        if m % den != 0 and m <= den * min(y):
            return {"kind": "gridWitness", "time": t}
        radius = max(y)
        if radius * delta.denominator < 2 * m * delta.numerator:
            divisor = math.gcd(*y)
            if divisor:
                normalized = [a // divisor for a in y]
                index = candidate_index.get(tuple(sorted(normalized)))
                if index is not None:
                    return {"kind": "direction", "time": t, "radius": radius,
                            "gcd": divisor, "normalized": normalized, "candidate": index}
    return None


def replay(data: dict, representatives: dict) -> tuple[dict, list[dict]]:
    """Check every state without reusing the producer's leaf-selection routine."""
    n, den, p = data["speeds"], data["denominator"], data["modulus"]
    gap = Fraction(*data["gap"])
    expected = representatives["representatives"]
    require(type(data["roots"]) is list and len(data["roots"]) == len(expected),
            "The complete ordered root inventory changed")
    total = Counter({kind: 0 for kind in KINDS})
    depths, unresolved, per_root = Counter(), [], []

    def visit(node, m, x, depth, path, root_index, counts, levels):
        require(type(node) is dict and node.get("kind") in KINDS, "Invalid trace node")
        require(depth <= data["max_depth"], "A trace exceeds its configured lift depth")
        require(all(0 <= a and 2 * a <= m for a in x), "A state is not a folded residue tuple")
        kind = node["kind"]
        counts[kind] += 1
        levels[depth] += 1
        if kind == "branch":
            require(set(node) == {"kind", "children"} and type(node["children"]) is list
                    and len(node["children"]) == 1 << n, "A Boolean branch is incomplete")
            require(depth < data["max_depth"], "A branch is beyond the permitted lift depth")
            for mask, next_node in enumerate(node["children"]):
                # This formula is the exact ordered Closed.foldedLift action.
                next_x = tuple(m - x[i] if (mask // (2 ** i)) % 2 else x[i] for i in range(n))
                visit(next_node, 2 * m, next_x, depth + 1, path + [mask], root_index, counts, levels)
        elif kind in ("strictWitness", "gridWitness"):
            require(set(node) == {"kind", "time"}, "Unexpected witness fields")
            t = natural(node["time"], "Witness time")
            require(0 < t <= m // 2, "Witness time is outside the canonical half-grid")
            residues = [(t * a) % m for a in x]
            distances = [min(r, m - r) for r in residues]
            if kind == "strictWitness":
                require(all(m < den * a for a in distances), "False strict witness")
            else:
                require(m % den != 0 and all(m <= den * a for a in distances), "False grid witness")
        elif kind in ("allEven", "oneOdd"):
            require(set(node) == {"kind"} and m % 2 == 0, "Invalid parity leaf")
            require(sum(a % 2 for a in x) == (kind == "oneOdd"), "False parity leaf")
        elif kind == "direction":
            require(set(node) == {"kind", "time", "radius", "gcd", "normalized", "candidate"},
                    "Unexpected direction fields")
            t = natural(node["time"], "Direction time")
            radius = natural(node["radius"], "Direction radius")
            divisor = natural(node["gcd"], "Direction gcd")
            index = natural(node["candidate"], "Direction candidate")
            require(0 < t <= m // 2 and index < len(data["candidates"]), "Invalid direction time or index")
            residues = [(t * a) % m for a in x]
            distances = [min(r, m - r) for r in residues]
            require(radius == max(distances) and divisor == math.gcd(*distances) and divisor > 0,
                    "The exact direction radius or gcd changed")
            require(Fraction(radius, 2 * m) < gap - Fraction(1, den), "Direction is not strictly short")
            normalized = [a // divisor for a in distances]
            require(type(node["normalized"]) is list
                    and all(type(a) is int for a in node["normalized"])
                    and node["normalized"] == normalized
                    and sorted(normalized) == data["candidates"][index],
                    "The primitive direction is not the stated candidate permutation")
        else:
            require(set(node) == {"kind", "reason"} and node["reason"] in ("max_depth", "max_nodes"),
                    "An unresolved state lacks a supported resource reason")
            require((node["reason"] == "max_depth" and depth == data["max_depth"])
                    or (node["reason"] == "max_nodes" and depth < data["max_depth"]),
                    "The unresolved-state reason contradicts its depth")
            unresolved.append({"root": root_index, "path": path, "modulus": m,
                               "coordinates": list(x), "reason": node["reason"]})

    for index, (root, coordinates) in enumerate(zip(data["roots"], expected, strict=True)):
        require(type(root) is dict and set(root) == {"index", "source_index", "coordinates", "tree"},
                "Unexpected root fields")
        require(type(root["index"]) is int and type(root["source_index"]) is int
                and type(root["coordinates"]) is list
                and all(type(a) is int for a in root["coordinates"])
                and root["index"] == index and root["source_index"] == representatives["source_indices"][index]
                and root["coordinates"] == coordinates, "An ordered multiplicity root changed")
        counts = Counter({kind: 0 for kind in KINDS})
        levels = Counter()
        visit(root["tree"], p, tuple(coordinates), 0, [], index, counts, levels)
        total.update(counts)
        depths.update(levels)
        per_root.append({"index": index, "nodes": sum(counts.values()), "kinds": dict(counts),
                         "maximum_depth": max(levels, default=0),
                         "depths": {str(k): levels[k] for k in sorted(levels)}})
    census = {"nodes": sum(total.values()), "kinds": dict(total),
              "maximum_depth": max(depths, default=0),
              "depths": {str(k): depths[k] for k in sorted(depths)}, "per_root": per_root}
    require(census["nodes"] <= data["max_nodes"], "The state resource bound was exceeded")
    require(not any(r["reason"] == "max_nodes" for r in unresolved)
            or census["nodes"] + (1 << n) > data["max_nodes"],
            "The claimed state resource limit was not reached")
    return census, unresolved


def validate(data: dict, parent: dict, representatives: dict) -> None:
    validate_inputs(parent, representatives)
    validate_parameters(data, parent, representatives)
    census, unresolved = replay(data, representatives)
    require(data["census"] == census and data["unresolved"] == unresolved,
            "Recorded state counts or unresolved inventory differ from exact replay")
    require((data["status"] == "complete") == (not unresolved),
            "Completeness does not match the exhaustive branch trace")


def produce(parent: dict, representatives: dict, *, gap: Fraction,
            candidates: list[list[int]], max_depth: int = 2, max_nodes: int = 1000000,
            module_prefix: str | None = None, namespace: str | None = None) -> dict:
    validate_inputs(parent, representatives)
    n, den, p = parent["speeds"], parent["denominator"], parent["prime"]
    tag = f"N{n:02d}D{den:02d}P{p:04d}"
    data = {"schema": SCHEMA, "speeds": n, "numerator": 1, "denominator": den, "modulus": p,
            "gap": [gap.numerator, gap.denominator], "candidates": copy.deepcopy(candidates),
            "initial_packet_sha256": digest(parent), "multiplicity_packet_sha256": digest(representatives),
            "module_prefix": module_prefix or "Conjectures.LonelinessModularClosedLifts" + tag,
            "namespace": namespace or "Loneliness.Modular.ClosedLifts." + tag,
            "max_depth": max_depth, "max_nodes": max_nodes, "status": "incomplete",
            "roots": [], "census": {}, "unresolved": []}
    validate_parameters(data, parent, representatives)
    allocated = len(representatives["representatives"])

    def visit(m, x, depth):
        nonlocal allocated
        leaf = find_leaf(m, x, den, gap, candidates)
        if leaf is not None:
            return leaf
        if depth == max_depth:
            return {"kind": "unresolved", "reason": "max_depth"}
        if allocated + (1 << n) > max_nodes:
            return {"kind": "unresolved", "reason": "max_nodes"}
        allocated += 1 << n
        return {"kind": "branch",
                "children": [visit(2 * m, child(m, x, mask), depth + 1) for mask in range(1 << n)]}

    for index, coordinates in enumerate(representatives["representatives"]):
        data["roots"].append({"index": index, "source_index": representatives["source_indices"][index],
                              "coordinates": list(coordinates), "tree": visit(p, tuple(coordinates), 0)})
    data["census"], data["unresolved"] = replay(data, representatives)
    require(allocated == data["census"]["nodes"], "Allocated and recorded state inventories differ")
    data["status"] = "complete" if not data["unresolved"] else "incomplete"
    return data


def summary(data: dict) -> dict:
    return {"status": data["status"], "speeds": data["speeds"], "denominator": data["denominator"],
            "modulus": data["modulus"], "root_count": len(data["roots"]),
            "nodes": data["census"]["nodes"], "maximum_depth": data["census"]["maximum_depth"],
            "kinds": data["census"]["kinds"], "depths": data["census"]["depths"],
            "unresolved_roots": sorted({r["root"] for r in data["unresolved"]}),
            "unresolved_states": len(data["unresolved"]), "lean_verified": False,
            "initial_lean_coverage_verified": False, "integer_classification_verified": False}


def names(data: dict) -> tuple[str, str]:
    return data["module_prefix"] + "Binary", data["namespace"] + ".Binary"


def list_literal(values) -> str:
    return "[" + ", ".join(map(str, values)) + "]"


def vector_literal(values) -> str:
    return "!" + list_literal(values)


def header(imports, namespace, description, *, numeric=False):
    lines = ["import " + module for module in imports]
    lines += ["", "/-! " + description, "The initial support and multiplicity inputs remain separate obligations.",
              "Generated by scripts/generate_modular_closed_lifts.py. -/", "", "namespace " + namespace,
              "", "open FoldedSearch", ""]
    if numeric:
        lines += ["set_option maxRecDepth 20000", "set_option maxHeartbeats 4000000", ""]
    return lines


def finish(lines, namespace):
    return "\n".join(lines + ["", "end " + namespace, ""])


def runner_bound_wrapper(data):
    n = data["speeds"]
    return n >= 4 and data["denominator"] == n + 1 and Fraction(*data["gap"]) == Fraction(1, n)


def files(data: dict) -> dict[str, str]:
    require(data["status"] == "complete" and not data["unresolved"], "An incomplete trace emits no Lean certificate")
    base, ns = names(data)
    n, den, p, count = data["speeds"], data["denominator"], data["modulus"], len(data["roots"])
    directions, direction_indices = [], {}
    definitions, root_expressions = [], []
    branches = 0

    def tree_expression(node):
        nonlocal branches
        kind = node["kind"]
        if kind == "direction":
            key = (node["time"], node["radius"], node["candidate"])
            if key not in direction_indices:
                direction_indices[key] = len(directions)
                directions.append(key)
            return ".terminal " + str(direction_indices[key])
        if kind in ("allEven", "oneOdd"):
            return "." + kind
        if kind in ("strictWitness", "gridWitness"):
            return "." + kind + " " + str(node["time"])
        require(kind == "branch", "Unresolved or unknown node reached the Lean renderer")
        children = [tree_expression(child_node) for child_node in node["children"]]
        label = f"branch{branches:04d}"
        branches += 1
        definitions.extend([f"def {label}Children : Lean.RArray (Closed.Tree {n}) :=",
                            initial.rarray(["(" + c + ")" for c in children]), "",
                            f"def {label} : Closed.Tree {n} :=",
                            f"  .branch (fun bits => {label}Children.get (bitsIndex bits))", ""])
        return label

    for root in data["roots"]:
        root_expressions.append(tree_expression(root["tree"]))
    require(branches == data["census"]["kinds"]["branch"], "The rendered branch inventory changed")
    lines = header(["Conjectures.LonelinessModularClosedFoldedDirections", "Init.Data.RArray"], ns,
                   "Literal complete ordered binary trees at the closed rational threshold.", numeric=True)
    root_lists = "[" + ",\n   ".join(list_literal(r["coordinates"]) for r in data["roots"]) + "]"
    candidate_lists = "[" + ",\n   ".join(list_literal(row) for row in data["candidates"]) + "]"
    root_function = "![" + ",\n    ".join(vector_literal(r["coordinates"]) for r in data["roots"]) + "]"
    lines += [f"def rootLists : List (List ℕ) := {root_lists}", "",
              f"def roots : Fin {count} → Fin {n} → ℕ :=",
              "  " + (root_function if count else "Fin.elim0"), "",
              f"def candidates : List (List ℕ) := {candidate_lists}", "",
              f"def gap : ℚ := {data['gap'][0]} / {data['gap'][1]}", "",
              "def directionData : Lean.RArray Closed.DirectionLeaf :="]
    leaves = [f"⟨{t}, {radius}, {list_literal(data['candidates'][j])}⟩" for t, radius, j in directions]
    lines += [initial.rarray(leaves or ["⟨0, 0, []⟩"]), "",
              "def directionLeaves (index : ℕ) : Closed.DirectionLeaf := directionData.get index", "",
              f"def terminal : ℕ → (Fin {n} → ℕ) → ℕ → Bool :=",
              f"  Closed.directionTerminal 1 {den} gap candidates directionLeaves", "",
              f"def bitsIndex (bits : Fin {n} → Bool) : ℕ :=",
              "  " + " + ".join(f"(if bits {i} then {1 << i} else 0)" for i in range(n)), ""]
    lines += definitions
    for i, expression in enumerate(root_expressions):
        lines += [f"def tree{i:03d} : Closed.Tree {n} := {expression}", ""]
    lines += [f"def trees : Fin {count} → Closed.Tree {n} :=",
              "  " + ("![" + ", ".join(f"tree{i:03d}" for i in range(count)) + "]" if count else "Fin.elim0")]
    output = {base + "Data": finish(lines, ns)}
    lines = header([base + "Data", "Mathlib.Tactic.FinCases"], ns,
                   "Every ordered Boolean branch is checked by ordinary kernel evaluation.", numeric=True)
    lines += [f"theorem roots_exact : List.ofFn (fun i : Fin {count} => List.ofFn (roots i)) = rootLists := by",
              "  decide +kernel", ""]
    for i in range(count):
        lines += [f"theorem root{i:03d}_checked :",
                  f"    Closed.check 1 {den} terminal (trees {i}) {p} (roots {i}) = true := by",
                  "  decide +kernel", ""]
    lines += [f"theorem all_checked (i : Fin {count}) :",
              f"    Closed.check 1 {den} terminal (trees i) {p} (roots i) = true := by"]
    if count:
        lines += ["  fin_cases i"] + [f"  · exact root{i:03d}_checked" for i in range(count)]
    else:
        lines += ["  exact Fin.elim0 i"]
    output[base + "Checks"] = finish(lines, ns)
    lines = header([base + "Checks"], ns,
                   "Semantic interpretation of the checked roots; all geometric and parity inputs are explicit.")
    lines += [f"theorem classify_root (admissible : (Fin {n} → ℕ) → Prop)",
              f"    (hgap : ∀ w, admissible w → Search.PlaneGap (gap : ℝ) w)",
              f"    (honeOdd : Closed.OneOddSound (n := {n}) 1 {den} admissible)",
              f"    (i : Fin {count}) (v : Fin {n} → ℕ) (hrep : Represents {p} (roots i) v)",
              "    (hp : Search.Primitive v) (hadm : admissible v)",
              f"    (hlow : value (List.ofFn v) ≤ (1 / {den} : ℝ)) :",
              "    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by",
              f"  have hterminal := Closed.directionTerminal_sound (n := {n - 1}) (num := 1) (den := {den})",
              "    gap candidates directionLeaves admissible hgap",
              f"  exact Closed.check_sound (by decide : 0 < {den}) (by decide : 2 * 1 < {den})",
              "    terminal admissible _ hterminal honeOdd (trees i)",
              f"    {p} (roots i) (by decide) (all_checked i) v hrep hp hadm (by simpa using hlow)"]
    if runner_bound_wrapper(data):
        lines += ["", "/-- The preceding runner bound supplies both semantic hypotheses. -/",
                  f"theorem classify_root_of_runner_bound (hLRC : CoordinateSubspace.LonelyRunnerBound {n - 1})",
                  f"    (i : Fin {count}) (v : Fin {n} → ℕ) (hrep : Represents {p} (roots i) v)",
                  "    (hp : Search.Primitive v) (hpositive : ∀ a, 0 < v a)",
                  f"    (hnodup : (List.ofFn v).Nodup) (hlow : value (List.ofFn v) ≤ (1 / {den} : ℝ)) :",
                  "    ∃ ds ∈ candidates, (List.ofFn v).Perm ds := by",
                  f"  let admissible : (Fin {n} → ℕ) → Prop := fun w =>",
                  "    (∀ a, 0 < w a) ∧ (List.ofFn w).Nodup",
                  "  have hgap : ∀ w, admissible w → Search.PlaneGap (gap : ℝ) w := by",
                  "    intro w hw z hz",
                  f"    have h := PlaneGeometry.plane_gap_of_runner_bound {n - 2} hLRC w hw.1 z hz",
                  "    norm_num [gap] at h ⊢",
                  "    exact h",
                  f"  have honeOdd : Closed.OneOddSound (n := {n}) 1 {den} admissible := by",
                  "    intro w hw _hp hone",
                  "    have hpositive' : ∀ d ∈ List.ofFn w, 0 < d := by",
                  "      intro d hd",
                  "      obtain ⟨a, rfl⟩ := List.mem_ofFn.mp hd",
                  "      exact hw.1 a",
                  "    have h := Search.value_lower_of_one_odd_of_runner_bound",
                  f"      (List.ofFn w) {n - 1} hLRC hw.2 hpositive' hone",
                  "      (by simp) (by simp) (by norm_num)",
                  "    norm_num at h ⊢",
                  "    linarith",
                  "  exact classify_root admissible hgap honeOdd i v hrep hp ⟨hpositive, hnodup⟩ hlow"]
    output[base] = finish(lines, ns)
    return output


def required_theorems(data: dict) -> list[str]:
    _, ns = names(data)
    result = ["roots_exact", "all_checked", "classify_root"]
    result += [f"root{i:03d}_checked" for i in range(len(data["roots"]))]
    if runner_bound_wrapper(data):
        result += ["classify_root_of_runner_bound"]
    return sorted(ns + "." + name for name in result)


def self_test() -> dict:
    parent = initial.produce(3, 4, 7, max_nodes=1000, max_seconds=5, max_rows=100)
    representatives = multiplicities.produce(parent)
    settings = {"gap": Fraction(1, 3), "candidates": [[1, 2, 3]], "max_depth": 2,
                "max_nodes": 100, "module_prefix": "Conjectures.LonelinessClosedLiftSelfTest",
                "namespace": "Loneliness.Modular.ClosedLiftSelfTest"}
    good = produce(parent, representatives, **settings)
    validate(good, parent, representatives)
    require(good["status"] == "complete" and good["census"]["nodes"] == 33, "Small exhaustive fixture changed")
    files(good)
    rejected = []

    def first(data, kind, modulus_test=lambda _m: True):
        def visit(node, m):
            if node["kind"] == kind and modulus_test(m):
                return node
            for c in node.get("children", []):
                if found := visit(c, 2 * m):
                    return found
            return None
        for root in data["roots"]:
            if found := visit(root["tree"], data["modulus"]):
                return found
        raise ValueError("Missing corruption-test leaf: " + kind)

    def corruption(label, mutate):
        bad = copy.deepcopy(good)
        mutate(bad)
        try:
            validate(bad, parent, representatives)
        except ValueError:
            rejected.append(label)
        else:
            raise ValueError("A corrupt trace was accepted: " + label)

    corruption("omitted_root", lambda d: d["roots"].pop())
    corruption("changed_root", lambda d: d["roots"][0]["coordinates"].__setitem__(0, 2))
    corruption("omitted_boolean_child", lambda d: first(d, "branch")["children"].pop())
    corruption("zero_witness_time", lambda d: first(d, "strictWitness").__setitem__("time", 0))
    corruption("false_direction_radius", lambda d: first(d, "direction").__setitem__("radius", 0))
    corruption("false_direction_gcd", lambda d: first(d, "direction").__setitem__(
        "gcd", first(d, "direction")["gcd"] + 1))
    corruption("invalid_direction_index", lambda d: first(d, "direction").__setitem__("candidate", 1))
    corruption("false_parity", lambda d: first(d, "allEven").__setitem__("kind", "oneOdd"))
    corruption("false_census", lambda d: d["census"].__setitem__("nodes", 4))
    grid = copy.deepcopy(good)
    first(grid, "strictWitness", lambda m: m % grid["denominator"] != 0)["kind"] = "gridWitness"
    grid["census"], grid["unresolved"] = replay(grid, representatives)
    validate(grid, parent, representatives)
    require(".gridWitness" in files(grid)[names(grid)[0] + "Data"], "Grid witness renderer is missing")
    for limit, value in (("max_depth", 0), ("max_nodes", 1)):
        incomplete = produce(parent, representatives, **{**settings, limit: value})
        validate(incomplete, parent, representatives)
        require(incomplete["status"] == "incomplete" and incomplete["unresolved"],
                "A bounded incomplete search was mislabeled")
        try:
            files(incomplete)
        except ValueError:
            pass
        else:
            raise ValueError("An incomplete trace emitted a Lean certificate")
        incomplete["status"] = "complete"
        try:
            validate(incomplete, parent, representatives)
        except ValueError:
            rejected.append("false_complete_" + limit)
        else:
            raise ValueError("An unresolved trace was accepted as complete")
    return {"status": "self_test_passed", "corruptions_rejected": rejected,
            "small_complete_states": 33, "incomplete_emission_rejected": True, "lean_verified": False}


def load_canonical(path: Path) -> dict:
    raw = path.read_bytes()
    value = json.loads(raw)
    require(raw == encoded(value), "Input JSON must use the producer's exact canonical bytes: " + str(path))
    return value


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--initial-json", type=Path)
    parser.add_argument("--multiplicity-json", type=Path)
    parser.add_argument("--multiplicity-out", type=Path)
    parser.add_argument("--load-json", type=Path)
    parser.add_argument("--gap", type=Fraction)
    parser.add_argument("--candidates", type=json.loads)
    parser.add_argument("--max-depth", type=int)
    parser.add_argument("--max-nodes", type=int)
    parser.add_argument("--module-prefix")
    parser.add_argument("--namespace")
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--lean-dir", type=Path, default=ROOT / "lean")
    actions = parser.add_mutually_exclusive_group()
    actions.add_argument("--write", action="store_true")
    actions.add_argument("--check", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        print(json.dumps(self_test(), sort_keys=True))
        return
    require(args.initial_json is not None, "Supply the complete initial packet")
    parent = load_canonical(args.initial_json)
    representatives = (load_canonical(args.multiplicity_json) if args.multiplicity_json
                       else multiplicities.produce(parent))
    if args.load_json:
        stored = load_canonical(args.load_json)
        validate(stored, parent, representatives)
        settings = {"gap": Fraction(*stored["gap"]), "candidates": stored["candidates"],
                    "max_depth": stored["max_depth"], "max_nodes": stored["max_nodes"],
                    "module_prefix": stored["module_prefix"], "namespace": stored["namespace"]}
        require(args.gap is None and args.candidates is None and args.module_prefix is None
                and args.namespace is None and args.max_depth is None and args.max_nodes is None,
                "Do not override a loaded packet's search or rendering parameters")
    else:
        require(args.gap is not None and args.candidates is not None, "Supply the rational gap and candidate lists")
        settings = {k: getattr(args, k) for k in
                    ("gap", "candidates", "max_depth", "max_nodes", "module_prefix", "namespace")}
        settings["max_depth"] = 2 if args.max_depth is None else args.max_depth
        settings["max_nodes"] = 1000000 if args.max_nodes is None else args.max_nodes
        stored = None
    data = produce(parent, representatives, **settings)
    validate(data, parent, representatives)
    require(stored is None or data == stored, "Fresh exhaustive production differs from the loaded packet")
    output = files(data) if data["status"] == "complete" else {}
    if args.check:
        require(args.json_out is not None, "Exact reproduction requires --json-out")
        require(args.json_out.read_bytes() == encoded(data), "The exact trace packet differs")
        if args.multiplicity_out:
            require(args.multiplicity_out.read_bytes() == encoded(representatives), "The multiplicity packet differs")
        for module, source in output.items():
            path = args.lean_dir / (module.replace(".", "/") + ".lean")
            require(path.read_text() == source, "Generated Lean source differs: " + module)
    elif args.write:
        require(args.json_out is not None, "Writing requires --json-out")
        args.json_out.parent.mkdir(parents=True, exist_ok=True)
        args.json_out.write_bytes(encoded(data))
        if args.multiplicity_out:
            args.multiplicity_out.parent.mkdir(parents=True, exist_ok=True)
            args.multiplicity_out.write_bytes(encoded(representatives))
        for module, source in output.items():
            path = args.lean_dir / (module.replace(".", "/") + ".lean")
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(source)
    report = {**summary(data), "numeric_packet_sha256": digest(data),
              "generated_modules": sorted(output), "required_theorems": required_theorems(data) if output else [],
              "source_sha256": {module: hashlib.sha256(source.encode()).hexdigest()
                                for module, source in output.items()},
              "source_bytes": sum(len(source.encode()) for source in output.values())}
    print(json.dumps(report, sort_keys=True))
    if data["status"] != "complete":
        raise SystemExit(2)


if __name__ == "__main__":
    main()
