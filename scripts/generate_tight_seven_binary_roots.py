#!/usr/bin/env python3
"""Generate the complete one-lift checkpoint for the three tight seven-speed shapes.

Every original seven-speed prime and all 128 ordered Boolean patterns are
included. Each literal code selects an existing Closed.Tree constructor:
strictWitness, allEven, or a checked direction terminal. The producer is
untrusted; ordinary Lean kernel evaluation supplies mathematical acceptance.

This checkpoint does not enumerate initial supports or classify all seven-speed
tuples. Its semantic endpoint retains the six-speed runner bound explicitly.
"""
from __future__ import annotations

import argparse
from collections import Counter
import copy
import hashlib
import json
import math
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MODULE = "Conjectures.LonelinessTightSevenBinaryRoots"
NAMESPACE = "Loneliness.Modular.TightSevenBinaryRoots"
SCHEMA = "tight-seven-binary-roots-v1"
PRIMES = (251, 257, 263, 269, 271, 277, 281, 283, 293,
          307, 311, 313, 317, 331, 337, 347, 349)
SHAPES = ((1, 2, 3, 4, 5, 6, 7),
          (1, 2, 3, 4, 5, 7, 12),
          (1, 4, 5, 6, 7, 11, 13))
EXPECTED_COUNTS = {"strict_witness": 126, "all_even": 1, "direction": 1}


def encoded(value) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def folded(modulus: int, value: int) -> int:
    residue = value % modulus
    return min(residue, modulus - residue)


def child(prime: int, shape: tuple[int, ...], mask: int) -> tuple[int, ...]:
    return tuple(prime - value if mask >> i & 1 else value
                 for i, value in enumerate(shape))


def classify_code(prime: int, shape: tuple[int, ...], mask: int) -> int:
    values = child(prime, shape, mask)
    modulus = 2 * prime
    if all(value % 2 == 0 for value in values):
        return 1
    if values == shape:
        return 0
    for time in range(1, prime + 1):
        if all(modulus < 8 * folded(modulus, time * value) for value in values):
            return time + 2
    raise ValueError(f"Unresolved full Boolean pattern: prime={prime}, shape={shape}, mask={mask}")


def kind(code: int) -> str:
    return "direction" if code == 0 else "all_even" if code == 1 else "strict_witness"


def produce() -> dict:
    records = []
    for pi, prime in enumerate(PRIMES):
        for si, shape in enumerate(SHAPES):
            codes = [classify_code(prime, shape, mask) for mask in range(128)]
            records.append({"prime_index": pi, "shape_index": si, "prime": prime,
                            "codes": codes, "counts": dict(Counter(map(kind, codes)))})
    data = {"schema": SCHEMA, "primes": list(PRIMES), "shapes": [list(s) for s in SHAPES],
            "patterns_per_root": 128, "records": records}
    validate(data)
    return data


def validate(data: dict) -> None:
    """Check every integer leaf independently of witness-search choices."""
    if set(data) != {"schema", "primes", "shapes", "patterns_per_root", "records"}:
        raise ValueError("Unexpected checkpoint packet fields")
    if data["schema"] != SCHEMA or data["primes"] != list(PRIMES):
        raise ValueError("The original prime inventory changed")
    if data["shapes"] != [list(s) for s in SHAPES] or data["patterns_per_root"] != 128:
        raise ValueError("The literal shapes or Boolean-pattern inventory changed")
    if len(data["records"]) != len(PRIMES) * len(SHAPES):
        raise ValueError("A prime/shape root is missing or duplicated")
    for prime in PRIMES:
        if prime < 2 or any(prime % d == 0 for d in range(2, math.isqrt(prime) + 1)):
            raise ValueError("A fixed modulus is not prime")
    for index, record in enumerate(data["records"]):
        pi, si = divmod(index, len(SHAPES))
        prime, shape = PRIMES[pi], SHAPES[si]
        if set(record) != {"prime_index", "shape_index", "prime", "codes", "counts"}:
            raise ValueError("Unexpected root fields")
        if (record["prime_index"], record["shape_index"], record["prime"]) != (pi, si, prime):
            raise ValueError("Root ordering or exact modulus changed")
        codes = record["codes"]
        if not isinstance(codes, list) or len(codes) != 128:
            raise ValueError("A full Boolean branch is missing")
        modulus = 2 * prime
        for mask, code in enumerate(codes):
            if type(code) is not int or code < 0:
                raise ValueError("A leaf code is not a natural number")
            values = child(prime, shape, mask)
            if code == 0:
                radius = max(shape)
                short = tuple(folded(modulus, value) for value in values)
                divisor = math.gcd(*short)
                normalized = tuple(value // divisor for value in short) if divisor else ()
                if not (mask == 0 and values == shape and 0 < 1 < modulus
                        and all(value <= radius for value in short)
                        and 56 * radius < 2 * modulus and normalized == shape):
                    raise ValueError("False direction terminal")
            elif code == 1:
                if modulus % 2 != 0 or any(value % 2 for value in values):
                    raise ValueError("False all-even leaf")
            else:
                time = code - 2
                if not (0 < time <= prime and
                        all(modulus < 8 * folded(modulus, time * value) for value in values)):
                    raise ValueError("False strict rational witness")
        counts = dict(Counter(map(kind, codes)))
        if counts != EXPECTED_COUNTS or record["counts"] != counts:
            raise ValueError("The exact 126/1/1 leaf inventory changed")


def list_literal(values) -> str:
    return "[" + ", ".join(map(str, values)) + "]"


def compact_array(values: list[str], lo=0, hi=None) -> str:
    hi = len(values) if hi is None else hi
    if hi <= lo:
        raise ValueError("An RArray literal must be nonempty")
    if hi - lo == 1:
        return "(.leaf " + values[lo] + ")"
    middle = (lo + hi) // 2
    return (f"(.branch {middle} " + compact_array(values, lo, middle) + " "
            + compact_array(values, middle, hi) + ")")


def array_literal(values: list[str], lo=0, hi=None, indent=2) -> str:
    hi = len(values) if hi is None else hi
    pad = " " * indent
    if hi - lo == 1:
        return pad + "(.leaf " + values[lo] + ")"
    middle = (lo + hi) // 2
    return (pad + f"(.branch {middle}\n" + array_literal(values, lo, middle, indent + 2)
            + "\n" + array_literal(values, middle, hi, indent + 2) + "\n" + pad + ")")


def render(data: dict) -> str:
    validate(data)
    lines = ["import Conjectures.LonelinessModularClosedFoldedDirections",
             "import Conjectures.LonelinessModularTightPrimeDefs",
             "import Init.Data.RArray", "import Mathlib.Tactic.FinCases", "",
             "/-! Complete one-lift checks for the three literal tight seven-speed shapes.",
             "All original seventeen primes and every Boolean branch are checked.",
             "This does not assert initial support coverage. The semantic conclusion",
             "retains the six-speed runner bound explicitly.",
             "Generated by scripts/generate_tight_seven_binary_roots.py. -/", "",
             "namespace " + NAMESPACE, "", "open FoldedSearch", "",
             "set_option maxRecDepth 20000", "set_option maxHeartbeats 4000000", "",
             "def shapes : List (List ℕ) :=", "  [" + ",\n   ".join(map(list_literal, SHAPES)) + "]", "",
             "def roots : Fin 3 → Fin 7 → ℕ :=",
             "  ![" + ",\n    ".join("!" + list_literal(s) for s in SHAPES) + "]", "",
             "def primes : Fin 17 → ℕ :=", "  !" + list_literal(PRIMES), "",
             "theorem prime_set_exact : Finset.univ.image primes = TightPrimeBounds.primeSet 7 := by",
             "  decide +kernel", "",
             "theorem primes_gt_one (i : Fin 17) : 1 < primes i := by", "  fin_cases i <;> decide +kernel", "",
             "theorem root_lists_exact :",
             "    Finset.univ.image (fun j : Fin 3 => List.ofFn (roots j)) = shapes.toFinset := by",
             "  decide +kernel", "",
             "def directionLeaves : ℕ → Closed.DirectionLeaf",
             "  | 0 => ⟨1, 7, " + list_literal(SHAPES[0]) + "⟩",
             "  | 1 => ⟨1, 12, " + list_literal(SHAPES[1]) + "⟩",
             "  | _ => ⟨1, 13, " + list_literal(SHAPES[2]) + "⟩", "",
             "def terminal : ℕ → (Fin 7 → ℕ) → ℕ → Bool :=",
             "  Closed.directionTerminal 1 8 (1 / 7) shapes directionLeaves", "",
             "/-- Codes 0 and 1 select direction and all-even leaves. A code t+2",
             "selects the literal strict rational witness t. -/",
             "def codeTree (j : Fin 3) : ℕ → Closed.Tree 7",
             "  | 0 => .terminal j.val", "  | 1 => .allEven", "  | t + 2 => .strictWitness t", "",
             "def bitsIndex (bits : Fin 7 → Bool) : ℕ :=",
             "  " + " + ".join(f"(if bits {i} then {1 << i} else 0)" for i in range(7)), "",
             "/-- Literal data only. Every one of its 6528 leaves is checked below. -/",
             "def leafCodes : Lean.RArray (Lean.RArray ℕ) :=",
             array_literal([compact_array(list(map(str, r["codes"]))) for r in data["records"]]), "",
             "/-- A full Closed.branch retains every Boolean pattern. No coordinate",
             "bit is fixed, and no orbit or permutation reduction is applied. -/",
             "def tree (i : Fin 17) (j : Fin 3) : Closed.Tree 7 :=",
             "  .branch (fun bits => codeTree j ((leafCodes.get (3 * i.val + j.val)).get (bitsIndex bits)))", ""]
    for record in data["records"]:
        pi, si, prime = record["prime_index"], record["shape_index"], record["prime"]
        lines += [f"theorem checked_{prime:04d}_{si} :",
                  f"    Closed.check 1 8 terminal (tree {pi} {si}) (primes {pi}) (roots {si}) = true := by",
                  "  decide +kernel", ""]
    lines += ["theorem all_checked (i : Fin 17) (j : Fin 3) :",
              "    Closed.check 1 8 terminal (tree i j) (primes i) (roots j) = true := by",
              "  fin_cases i <;> fin_cases j"]
    lines += [f"  · exact checked_{r['prime']:04d}_{r['shape_index']}" for r in data["records"]]
    lines += ["", "/-- The ordinary six-speed bound supplies both semantic inputs",
              "of the closed checker. There is no spectrum or plane-classification premise. -/",
              "theorem classify_root (hLRC : CoordinateSubspace.LonelyRunnerBound 6)",
              "    (i : Fin 17) (j : Fin 3) (v : Fin 7 → ℕ)",
              "    (hrep : Represents (primes i) (roots j) v) (hp : Search.Primitive v)",
              "    (hpositive : ∀ a, 0 < v a) (hnodup : (List.ofFn v).Nodup)",
              "    (hlow : value (List.ofFn v) ≤ (1 / 8 : ℝ)) :",
              "    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by",
              "  let admissible : (Fin 7 → ℕ) → Prop := fun w =>",
              "    (∀ a, 0 < w a) ∧ (List.ofFn w).Nodup",
              "  have hterminal := Closed.directionTerminal_sound (n := 6) (num := 1) (den := 8)",
              "    (1 / 7) shapes directionLeaves admissible (by",
              "      intro w hw z hz",
              "      have h := PlaneGeometry.plane_gap_of_runner_bound 5 hLRC w hw.1 z hz",
              "      norm_num at h ⊢",
              "      exact h)",
              "  have honeOdd : Closed.OneOddSound (n := 7) 1 8 admissible := by",
              "    intro w hw _hp hone",
              "    have hpositive' : ∀ d ∈ List.ofFn w, 0 < d := by",
              "      intro d hd",
              "      obtain ⟨a, rfl⟩ := List.mem_ofFn.mp hd",
              "      exact hw.1 a",
              "    have h := Search.value_lower_of_one_odd_of_runner_bound",
              "      (List.ofFn w) 6 hLRC hw.2 hpositive' hone",
              "      (by simp) (by simp) (by norm_num)",
              "    norm_num at h ⊢",
              "    linarith",
              "  exact Closed.check_sound (by decide : 0 < 8) (by decide : 2 * 1 < 8)",
              "    terminal admissible _ hterminal honeOdd (tree i j) (primes i) (roots j)",
              "    (primes_gt_one i) (all_checked i j) v hrep hp",
              "    ⟨hpositive, hnodup⟩ (by simpa using hlow)", "",
              "theorem classify_original_prime_root (hLRC : CoordinateSubspace.LonelyRunnerBound 6)",
              "    (p : ℕ) (hprime : p ∈ TightPrimeBounds.primeSet 7)",
              "    (j : Fin 3) (v : Fin 7 → ℕ) (hrep : Represents p (roots j) v)",
              "    (hp : Search.Primitive v) (hpositive : ∀ a, 0 < v a)",
              "    (hnodup : (List.ofFn v).Nodup) (hlow : value (List.ofFn v) ≤ (1 / 8 : ℝ)) :",
              "    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by",
              "  have hmem : p ∈ Finset.univ.image primes := by",
              "    rw [prime_set_exact]",
              "    exact hprime",
              "  obtain ⟨i, _hi, rfl⟩ := Finset.mem_image.mp hmem",
              "  exact classify_root hLRC i j v hrep hp hpositive hnodup hlow", "",
              "/-- The literal-shape formulation exposes the exact finite scope:",
              "the root list must be one of the three displayed original shapes. -/",
              "theorem classify_original_shape (hLRC : CoordinateSubspace.LonelyRunnerBound 6)",
              "    (p : ℕ) (hprime : p ∈ TightPrimeBounds.primeSet 7) (x v : Fin 7 → ℕ)",
              "    (hshape : List.ofFn x ∈ shapes) (hrep : Represents p x v)",
              "    (hp : Search.Primitive v) (hpositive : ∀ a, 0 < v a)",
              "    (hnodup : (List.ofFn v).Nodup) (hlow : value (List.ofFn v) ≤ (1 / 8 : ℝ)) :",
              "    ∃ ds ∈ shapes, (List.ofFn v).Perm ds := by",
              "  have hmem : List.ofFn x ∈ Finset.univ.image (fun j : Fin 3 => List.ofFn (roots j)) := by",
              "    rw [root_lists_exact]",
              "    exact List.mem_toFinset.mpr hshape",
              "  obtain ⟨j, _hj, heq⟩ := Finset.mem_image.mp hmem",
              "  have hx : roots j = x := List.ofFn_injective heq",
              "  rw [← hx] at hrep",
              "  exact classify_original_prime_root hLRC p hprime j v hrep hp hpositive hnodup hlow", "",
              "end " + NAMESPACE, ""]
    return "\n".join(lines)


def summary(data: dict) -> dict:
    counts = Counter()
    for record in data["records"]:
        counts.update(record["counts"])
    return {"schema": SCHEMA, "prime_count": len(PRIMES), "shape_count": len(SHAPES),
            "roots": len(data["records"]), "patterns_per_root": 128,
            "total_patterns": len(data["records"]) * 128, "leaf_counts": dict(counts),
            "complete_numeric_enumeration": True, "lean_verified": False,
            "initial_support_coverage_verified": False, "complete_seven_speed_classification": False,
            "six_speed_bound_discharged": False}


def self_test() -> dict:
    data = produce()
    bad_packets = []
    bad = copy.deepcopy(data); bad["records"].pop(); bad_packets.append(bad)
    bad = copy.deepcopy(data); bad["records"][0]["codes"].pop(); bad_packets.append(bad)
    bad = copy.deepcopy(data); bad["records"][0]["codes"][0] = 1; bad_packets.append(bad)
    bad = copy.deepcopy(data)
    index = next(i for i, code in enumerate(bad["records"][0]["codes"]) if code >= 2)
    bad["records"][0]["codes"][index] = 2; bad_packets.append(bad)
    for packet in bad_packets:
        try:
            validate(packet)
        except ValueError:
            continue
        raise AssertionError("A false or incomplete checkpoint packet was accepted")
    return {**summary(data), "rejected_corruptions": len(bad_packets)}


def compare_experiment(data: dict, path: Path) -> None:
    experiment = json.loads(path.read_text())
    expected = [{"prime": r["prime"], "shape": r["shape_index"], "patterns": 128,
                 "grid_witness": 126, "all_even": 1, "one_odd": 0,
                 "aligned": 1, "unaligned": []} for r in data["records"]]
    if (experiment["primes"] != list(PRIMES) or experiment["shapes"] != [list(s) for s in SHAPES]
            or experiment["records"] != expected):
        raise ValueError("The independent original experiment has a different census")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--write", action="store_true")
    mode.add_argument("--check", action="store_true")
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--lean-dir", type=Path, default=ROOT / "lean")
    parser.add_argument("--json-out", type=Path)
    parser.add_argument("--compare-experiment", type=Path)
    args = parser.parse_args()
    if args.self_test:
        print(json.dumps(self_test(), sort_keys=True))
        return
    data = produce()
    if args.compare_experiment:
        compare_experiment(data, args.compare_experiment)
    source = render(data)
    destination = args.lean_dir / (MODULE.replace(".", "/") + ".lean")
    if args.check:
        if not destination.is_file() or destination.read_text() != source:
            raise ValueError("Generated Lean source differs: " + str(destination))
    elif args.write:
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_text(source)
    if args.json_out:
        if args.check:
            if not args.json_out.is_file() or args.json_out.read_bytes() != encoded(data):
                raise ValueError("Generated numeric packet differs: " + str(args.json_out))
        else:
            args.json_out.parent.mkdir(parents=True, exist_ok=True)
            args.json_out.write_bytes(encoded(data))
    print(json.dumps({**summary(data), "module": MODULE,
                      "source_sha256": hashlib.sha256(source.encode()).hexdigest(),
                      "numeric_packet_sha256": hashlib.sha256(encoded(data)).hexdigest(),
                      "source_bytes": len(source.encode())}, sort_keys=True))


if __name__ == "__main__":
    main()
