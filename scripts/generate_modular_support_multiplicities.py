#!/usr/bin/env python3
"""Generate exact multiplicity representatives of checked modular supports.

The input is an unchanged generate_modular_initial_support packet. For each
support, one copy of every value is retained and the remaining entries range
over unordered multisets from that support. The emitted Lean certificate
checks exact equality with SupportMultiplicity.representatives. A complete
initial packet additionally receives an actual-tuple representation theorem.

This producer is untrusted. Python validation and self-tests do not establish
Lean verification, binary-lift coverage, or an integer classification. A
representative bound stops with explicit incomplete status and emits no
RepresentativeCover theorem.
"""
from __future__ import annotations

import argparse
import copy
import hashlib
import itertools
import json
import math
from pathlib import Path

import generate_modular_initial_support as initial


SCHEMA = "modular-support-multiplicities-v1"
FIELDS = {"schema", "speeds", "denominator", "prime", "initial_packet_sha256",
          "initial_status", "status", "expected_support_count",
          "expected_representative_count", "groups", "representatives",
          "source_indices", "stopped"}


def encoded(value) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def digest(value) -> str:
    return hashlib.sha256(encoded(value)).hexdigest()


def representative_count(n: int, support: list[int]) -> int:
    """Count all multisets with every support value present at least once."""
    if type(n) is not int or n < 0:
        raise ValueError("The tuple length must be a natural number")
    if any(type(a) is not int or a < 0 for a in support) or sorted(set(support)) != support:
        raise ValueError("A support must be a strictly increasing list of naturals")
    size = len(support)
    if size > n:
        return 0
    if not support:
        return int(n == 0)
    return math.comb(n - 1, size - 1)


def representative_lists(n: int, support: list[int]) -> list[list[int]]:
    count = representative_count(n, support)
    if count == 0:
        return []
    result = sorted([sorted(support + list(extra)) for extra in
                     itertools.combinations_with_replacement(support, n - len(support))])
    if len(result) != count:
        raise ValueError("Combinations enumeration disagrees with its cardinality")
    return result


def produce(parent: dict, *, max_representatives: int = 100000) -> dict:
    initial.validate(parent)
    if type(max_representatives) is not int or max_representatives < 0:
        raise ValueError("The representative bound must be a natural number")
    n = parent["speeds"]
    counts = [representative_count(n, row["support"]) for row in parent["rows"]]
    data = {"schema": SCHEMA, "speeds": n, "denominator": parent["denominator"],
            "prime": parent["prime"], "initial_packet_sha256": digest(parent),
            "initial_status": parent["status"], "status": "incomplete",
            "expected_support_count": len(parent["rows"]),
            "expected_representative_count": sum(counts), "groups": [],
            "representatives": [], "source_indices": [], "stopped": None}
    for index, (row, count) in enumerate(zip(parent["rows"], counts)):
        if max_representatives and len(data["representatives"]) + count > max_representatives:
            data["stopped"] = (f"support {index}: cumulative representative limit "
                               f"{max_representatives}")
            break
        values = representative_lists(n, row["support"])
        data["groups"].append({"source_index": index, "mask": row["mask"],
            "support": list(row["support"]), "deficit": n - len(row["support"]),
            "start": len(data["representatives"]), "count": count})
        data["representatives"].extend(values)
        data["source_indices"].extend([index] * count)
    if len(data["groups"]) == len(parent["rows"]):
        data["status"] = "complete"
    validate(data, parent)
    return data


def validate(data: dict, parent: dict) -> None:
    """Replay shape, membership, uniqueness and exact finite cardinalities."""
    initial.validate(parent)
    if set(data) != FIELDS or data["schema"] != SCHEMA:
        raise ValueError("Unexpected multiplicity packet schema")
    if any(data[k] != parent[k] for k in ("speeds", "denominator", "prime")):
        raise ValueError("Multiplicity parameters differ from the support packet")
    if data["initial_packet_sha256"] != digest(parent) or data["initial_status"] != parent["status"]:
        raise ValueError("The exact initial packet identity changed")
    n = parent["speeds"]
    counts = [representative_count(n, row["support"]) for row in parent["rows"]]
    if data["expected_support_count"] != len(counts) or data["expected_representative_count"] != sum(counts):
        raise ValueError("Expected support or representative inventory changed")
    if data["status"] not in ("complete", "incomplete"):
        raise ValueError("Unknown multiplicity completeness status")
    if not isinstance(data["groups"], list) or len(data["groups"]) > len(counts):
        raise ValueError("Invalid completed support inventory")
    complete = len(data["groups"]) == len(counts) and data["stopped"] is None
    if (data["status"] == "complete") != complete:
        raise ValueError("Completeness does not match the support inventory")
    if not complete and (not isinstance(data["stopped"], str) or not data["stopped"]):
        raise ValueError("An incomplete packet must record why it stopped")
    offset, source_indices = 0, []
    for index, group in enumerate(data["groups"]):
        row, count = parent["rows"][index], counts[index]
        expected = {"source_index": index, "mask": row["mask"],
            "support": row["support"], "deficit": n-len(row["support"]),
            "start": offset, "count": count}
        if group != expected:
            raise ValueError("A multiplicity group differs from its exact support")
        values = data["representatives"][offset:offset+count]
        if len(values) != count or values != sorted(values):
            raise ValueError("Representative count or canonical order changed")
        if len({tuple(r) for r in values}) != count:
            raise ValueError("Repeated representatives omit a multiplicity class")
        for r in values:
            if any(type(a) is not int or a < 0 for a in r):
                raise ValueError("A representative contains a non-natural entry")
            if len(r) != n or sorted(r) != r or sorted(set(r)) != row["support"]:
                raise ValueError("A representative has the wrong length, support or order")
        offset += count
        source_indices.extend([index] * count)
    if len(data["representatives"]) != offset or data["source_indices"] != source_indices:
        raise ValueError("Unexpected or incorrectly indexed representative rows")


def names(data: dict) -> tuple[str, str]:
    tag = f"N{data['speeds']:02d}D{data['denominator']:02d}P{data['prime']:04d}"
    return ("Conjectures.LonelinessModularSupportMultiplicities" + tag,
            "Loneliness.Modular.SupportMultiplicity." + tag)


def header(imports: list[str], namespace: str, description: str, *, numeric=False) -> list[str]:
    lines = ["import " + module for module in imports]
    lines += ["", "/-! " + description,
              "Generated by scripts/generate_modular_support_multiplicities.py. -/", "",
              "namespace " + namespace, ""]
    if numeric:
        lines += ["set_option maxRecDepth 20000", "set_option maxHeartbeats 4000000", ""]
    return lines


def finish(lines: list[str], namespace: str) -> str:
    return "\n".join(lines + ["", "end " + namespace, ""])


def list_literal(row: list[int]) -> str:
    return "[" + ", ".join(map(str, row)) + "]"


def data_source(data: dict, parent: dict) -> str:
    parent_module, parent_ns = initial.names(parent)
    _, ns = names(data)
    n, count, supports = data["speeds"], len(data["representatives"]), len(parent["rows"])
    lines = header([parent_module + "RowsData", "Conjectures.LonelinessModularSupportFiniteSound",
                    "Init.Data.RArray"], ns,
                   "Literal sorted representatives, including every coordinate multiplicity.", numeric=True)
    lines += [f"def supportRows : Fin {supports} → ℕ := {parent_ns}.rows", "",
              "def representativeData : Lean.RArray (List ℕ) :=",
              initial.rarray([list_literal(r) for r in data["representatives"]] or ["[]"]), "",
              f"def representativeLists (j : Fin {count}) : List ℕ := representativeData.get j.val", "",
              "def sourceIndexData : Lean.RArray ℕ :=",
              initial.rarray(list(map(str, data["source_indices"])) or ["0"]), "",
              f"theorem source_index_checked : ∀ j : Fin {count}, sourceIndexData.get j.val < {supports} := by",
              "  decide +kernel", "",
              f"def sourceIndex (j : Fin {count}) : Fin {supports} :=",
              "  ⟨sourceIndexData.get j.val, source_index_checked j⟩", "",
              f"theorem representative_lengths : ∀ j : Fin {count}, (representativeLists j).length = {n} := by",
              "  decide +kernel", "",
              f"def roots (j : Fin {count}) : Fin {n} → ℕ :=",
              "  SupportMultiplicity.tuple (representativeLists j) (representative_lengths j)", "",
              f"theorem roots_ofFn (j : Fin {count}) : List.ofFn (roots j) = representativeLists j :=",
              "  SupportMultiplicity.ofFn_tuple _ _"]
    return finish(lines, ns)


def exact_source(data: dict, parent: dict) -> str:
    base, ns = names(data)
    n, count, supports = data["speeds"], len(data["representatives"]), len(parent["rows"])
    lines = header([base + "Data"], ns,
                   "Exact support-indexed multiplicity tables, checked in the ordinary kernel.", numeric=True)
    lines += [f"theorem representatives_exact : ∀ i : Fin {supports},",
              f"    SupportMultiplicity.representatives {n} (SupportSearch.Bits.decode (supportRows i)) =",
              f"      (Finset.univ.filter (fun j : Fin {count} => sourceIndex j = i)).image representativeLists := by",
              "  unfold SupportMultiplicity.representatives SupportMultiplicity.representative Multiset.sort",
              "  simp only [List.mergeSort_eq_insertionSort]",
              "  decide +kernel", "",
              f"theorem root_member (j : Fin {count}) : representativeLists j ∈",
              f"    SupportMultiplicity.representatives {n}",
              "      (SupportSearch.Bits.decode (supportRows (sourceIndex j))) := by",
              "  rw [representatives_exact]",
              "  exact Finset.mem_image.mpr ⟨j, by simp, rfl⟩", "",
              f"theorem roots_support (j : Fin {count}) : (List.ofFn (roots j)).toFinset =",
              "    SupportSearch.Bits.decode (supportRows (sourceIndex j)) := by",
              "  rw [roots_ofFn]",
              "  exact (SupportMultiplicity.representatives_spec (root_member j)).2.1", "",
              f"theorem roots_sorted (j : Fin {count}) : (List.ofFn (roots j)).Pairwise (· ≤ ·) := by",
              "  rw [roots_ofFn]",
              "  exact (SupportMultiplicity.representatives_spec (root_member j)).2.2", "",
              "theorem representative_cover : SupportFiniteSound.RepresentativeCover supportRows roots := by",
              "  intro i r hr",
              "  rw [representatives_exact] at hr",
              "  obtain ⟨j, _hj, heq⟩ := Finset.mem_image.mp hr",
              "  exact ⟨j, (roots_ofFn j).trans heq⟩"]
    return finish(lines, ns)


def aggregate_source(data: dict, parent: dict) -> str:
    if data["status"] != "complete" or parent["status"] != "complete":
        raise ValueError("An actual-tuple cover requires complete initial and multiplicity lists")
    base, ns = names(data)
    parent_module, parent_ns = initial.names(parent)
    n, den, p, count = data["speeds"], data["denominator"], data["prime"], len(data["representatives"])
    lines = header([base + "Exact", parent_module], ns,
                   "Complete modular representation of actual tuples; no binary lifting is asserted.")
    lines += [f"theorem normalized_tuple_cover (v : Fin {n} → ℕ)",
              f"    (hmod : ∀ i, v i % {p} ≠ 0)",
              f"    (hlow : value (List.ofFn v) ≤ (1 : ℝ) / {den}) :",
              f"    ∃ j : Fin {count}, ∃ σ : Equiv.Perm (Fin {n}),",
              f"      FoldedSearch.Represents {p} (roots j) (v ∘ σ) := by",
              "  have hne : List.ofFn v ≠ [] := by",
              "    intro he",
              "    have hlength := congrArg List.length he",
              "    simp only [List.length_ofFn, List.length_nil] at hlength",
              "    omega",
              f"  have hmod' : ∀ a ∈ List.ofFn v, a % {p} ≠ 0 := by",
              "    intro a ha",
              "    obtain ⟨i, rfl⟩ := List.mem_ofFn.mp ha",
              "    exact hmod i",
              f"  obtain ⟨u, inverse, hunit, hretained⟩ := {parent_ns}.normalized_cover",
              "    (List.ofFn v) hne (by simp) hmod' hlow",
              f"  exact SupportFiniteSound.represented_root_of_retained (by decide : 0 < {p})",
              "    supportRows roots representative_cover v hunit hretained"]
    return finish(lines, ns)


def lean_sources(data: dict, parent: dict) -> dict[str, str]:
    validate(data, parent)
    if data["status"] != "complete":
        return {}
    base, _ = names(data)
    result = {base + "Data": data_source(data, parent), base + "Exact": exact_source(data, parent)}
    if parent["status"] == "complete":
        result[base] = aggregate_source(data, parent)
    return result


def summary(data: dict) -> dict:
    return {k: data[k] for k in ("schema", "speeds", "denominator", "prime", "initial_status", "status",
            "expected_support_count", "expected_representative_count", "stopped")} | {
        "completed_supports": len(data["groups"]), "representatives": len(data["representatives"]),
        "support_deficits": [g["deficit"] for g in data["groups"]], "lean_verified": False,
        "binary_lifting_verified": False, "integer_classification_verified": False}


def self_test() -> dict:
    """Compare small families with independent ordered-tuple enumeration."""
    census = []
    for n, support in [(0, []), (1, []), (0, [1]), (3, [2]), (3, [1, 2, 3]),
                       (5, [1, 2, 3]), (6, [0, 2, 5])]:
        expected = {tuple(sorted(row)) for row in itertools.product(support, repeat=n)
                    if set(row) == set(support)}
        actual = {tuple(row) for row in representative_lists(n, support)}
        if expected != actual:
            raise AssertionError("Multiplicity enumeration differs from the independent ordered census")
        census.append({"length": n, "support": support, "representatives": len(actual)})
    pilots = []
    for n, den, p, size, expected_count in [(9, 10, 17, 8, 8), (5, 6, 7, 3, 6)]:
        parent = initial.produce(n, den, p, max_nodes=10000, max_seconds=30, max_rows=1000)
        if parent["status"] != "complete" or parent["rows"] != [{"mask": str(sum(1 << a for a in range(1, size+1))),
                                                                  "support": list(range(1, size+1))}]:
            raise AssertionError("The expected complete support pilot changed")
        data = produce(parent)
        if len(data["representatives"]) != expected_count or names(data)[0] not in lean_sources(data, parent):
            raise AssertionError("The complete pilot lacks its exact multiplicity family")
        pilots.append(summary(data))
    parent = initial.produce(5, 6, 7, max_nodes=0, max_seconds=0, max_rows=0)
    data = produce(parent)
    bounded = produce(parent, max_representatives=5)
    if bounded["status"] != "incomplete" or lean_sources(bounded, parent):
        raise AssertionError("A truncated family emitted a coverage theorem")
    partial_parent = initial.produce(9, 10, 17, [2], max_nodes=10000, max_seconds=30, max_rows=1000)
    partial = produce(partial_parent)
    partial_sources = lean_sources(partial, partial_parent)
    if partial_parent["status"] != "incomplete" or partial["status"] != "complete":
        raise AssertionError("Initial and multiplicity completeness were conflated")
    if names(partial)[0] in partial_sources or names(partial)[0] + "Exact" not in partial_sources:
        raise AssertionError("An incomplete initial list emitted an actual-tuple cover")
    corruptions = []
    bad = copy.deepcopy(data); bad["initial_packet_sha256"] = "0" * 64; corruptions.append(bad)
    bad = copy.deepcopy(data); bad["representatives"][0] = bad["representatives"][1]; corruptions.append(bad)
    bad = copy.deepcopy(data); bad["representatives"][0][-1] = 4; corruptions.append(bad)
    bad = copy.deepcopy(data); bad["source_indices"][0] = 1; corruptions.append(bad)
    bad = copy.deepcopy(bounded); bad["status"] = "complete"; corruptions.append(bad)
    for bad in corruptions:
        try:
            validate(bad, parent)
        except (ValueError, IndexError, KeyError, TypeError):
            pass
        else:
            raise AssertionError("A corrupted multiplicity packet was accepted")
    return {"independent_censuses": census, "complete_pilots": pilots,
            "bounded_pilot": summary(bounded), "partial_initial_pilot": summary(partial),
            "rejected_corruptions": len(corruptions), "lean_verified": False}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--input-json", type=Path, help="Exact initial-support packet")
    parser.add_argument("--load-json", type=Path, help="Replay an existing multiplicity packet")
    parser.add_argument("--max-representatives", type=int, default=100000)
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--lean-dir", type=Path)
    parser.add_argument("--check", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    if args.self_test:
        print(json.dumps(self_test(), sort_keys=True))
        return
    if args.input_json is None:
        parser.error("--input-json is required")
    parent = json.loads(args.input_json.read_text())
    if args.load_json:
        data = json.loads(args.load_json.read_text())
        validate(data, parent)
    else:
        data = produce(parent, max_representatives=args.max_representatives)
    if args.json_out:
        if args.check:
            if not args.json_out.is_file() or args.json_out.read_bytes() != encoded(data):
                raise ValueError("Generated packet differs: " + str(args.json_out))
        else:
            args.json_out.parent.mkdir(parents=True, exist_ok=True)
            if args.json_out.exists() and args.json_out.read_bytes() != encoded(data):
                raise ValueError("Refusing to overwrite a different multiplicity packet")
            args.json_out.write_bytes(encoded(data))
    output = summary(data)
    if args.lean_dir:
        hashes = {}
        for module, source in lean_sources(data, parent).items():
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
        output["actual_tuple_cover_emitted"] = names(data)[0] in hashes
    print(json.dumps(output, sort_keys=True))


if __name__ == "__main__":
    main()
