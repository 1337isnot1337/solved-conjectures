"""Propose complete modular slope and bounded-pair checks for the164 maps.

Python finds the bad slope list and checks the proposed terminal list for
early diagnostics. Lean recomputes the full finite cover and every bounded
lift; these Python assertions are not proof premises.
"""

from argparse import ArgumentParser
from hashlib import sha256
import json
from math import gcd
from pathlib import Path
from time import monotonic

from generate_lean_scalar_masks import entries

HERE = Path(__file__).resolve().parent


def full_masks(prime):
    half = [0] + [mask for inverse, mask in entries(prime)]
    return [half[min(a, prime - a)] for a in range(prime)]


def witness(prime, masks, speeds):
    common = (1 << prime) - 1
    for speed in speeds:
        common &= masks[abs(speed) % prime]
        if not common:
            return False
    return True


def is_critical(speeds):
    values = set(speeds)
    return any(d > 0 and any(all(d * a in values for a in pattern)
                            for pattern in [(1, 2, 3, 4), (1, 3, 4, 7)])
               for d in values)


def propose(record, masks1, masks2, allowed):
    matrix = record["matrix"]
    bound = 23 * record["L"]
    bad = [r for r in range(1009)
           if not witness(1009, masks1, [a + b * r for a, b in matrix])]
    counts = {"slope_x_cases": len(bad) * bound, "bounded_primitive": 0,
              "second_prime_survivors": 0, "zero": 0, "repeat": 0,
              "critical": 0, "candidate": 0}
    candidate_set = set()
    for r in bad:
        for x in range(1, bound + 1):
            y = x * r % 1009
            if 2 * y > 1009:
                y -= 1009
            if abs(y) > bound or gcd(x, abs(y)) != 1:
                continue
            counts["bounded_primitive"] += 1
            speeds = [abs(a * x + b * y) for a, b in matrix]
            if witness(1013, masks2, speeds):
                continue
            counts["second_prime_survivors"] += 1
            if 0 in speeds:
                counts["zero"] += 1
            elif len(set(speeds)) != 5:
                counts["repeat"] += 1
            elif is_critical(speeds):
                counts["critical"] += 1
            else:
                factor = gcd(*speeds)
                primitive = tuple(sorted(a // factor for a in speeds))
                assert primitive in allowed, (record["id"], x, y, primitive)
                candidate_set.add(primitive)
                counts["candidate"] += 1
    return {"id": record["id"], "bound": bound, "bad_slopes": bad,
            "counts": counts, "candidate_tuples": sorted(candidate_set)}


def render(record):
    index = record["id"]
    bad = "[" + ", ".join(map(str, record["bad_slopes"])) + "]"
    matrix = f"(boundedMaps {index})"
    bound = f"(23 * boundedMapL {index})"
    image = f"({matrix} *ᵥ ![(x : ℤ), y])"
    namespace = f"Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M{index}"
    return (
        "import Conjectures.LonelinessFiveSpeedBoundedCheckDefs\n"
        "import Conjectures.LonelinessFiveSpeedLineReductionData\n"
        "import Conjectures.LonelinessFiveSpeedBoundedCandidates\n"
        "import Conjectures.LonelinessFiveSpeedScalarTreeMask1009\n"
        "import Conjectures.LonelinessFiveSpeedScalarTreeMask1013\n\n"
        "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n"
        "set_option Elab.async false\n\n"
        f"namespace {namespace}\n\nopen Matrix\nopen scoped Matrix\n\n"
        f"def badSlopes : List ℕ := {bad}\n\n"
        f"theorem slopes_checked : slopeCoverCheck 1009\n"
        f"    (treeMask 1009 ScalarTrees.P1009.tree) {matrix} badSlopes = true := by\n"
        "  decide +kernel\n\n"
        "theorem pairs_checked : boundedSlopeScanCheck 1009 1013\n"
        f"    (treeMask 1013 ScalarTrees.P1013.tree) {matrix}\n"
        f"    {bound} badSlopes candidateTuples = true := by\n"
        "  decide +kernel\n\n"
        f"theorem sound (x : ℕ) (hx : 0 < x) (hxK : x ≤ {bound})\n"
        f"    (y : ℤ) (hy : y.natAbs ≤ {bound}) (hcop : Nat.gcd x y.natAbs = 1)\n"
        f"    (hnonzero : ∀ i, {image} i ≠ 0)\n"
        f"    (hdistinct : Function.Injective (fun i => ({image} i).natAbs))\n"
        f"    (hnot : ¬Loneliness.CriticalFamilies.ContainsCriticalQuadruple\n"
        f"      (Loneliness.CoordinateSubspace.integerSpeeds {image}))\n"
        f"    (hlow : Loneliness.value (Loneliness.CoordinateSubspace.integerSpeeds {image}) < (1 / 5 : ℝ)) :\n"
        f"    Loneliness.Modular.primitiveDirection {image} ∈ candidateTuples :=\n"
        "  boundedSlopeScanCheck_candidates 1009 1013\n"
        "    (treeMask 1009 ScalarTrees.P1009.tree) (treeMask 1013 ScalarTrees.P1013.tree)\n"
        f"    {matrix} {bound} badSlopes candidateTuples\n"
        "    ScalarTrees.P1009.prime (by decide) (by decide +kernel)\n"
        "    ScalarTrees.P1009.sound ScalarTrees.P1013.sound slopes_checked pairs_checked\n"
        "    x hx hxK y hy hcop hnonzero hdistinct hnot hlow\n\n"
        f"end {namespace}\n"
    )


def render_aggregate():
    imports = "".join(
        f"import Conjectures.LonelinessFiveSpeedBoundedMap{i:03d}\n" for i in range(164)
    )
    cases = "".join(f"  · exact BoundedMapCertificates.M{i}.sound\n" for i in range(164))
    return imports + """
set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option Elab.async false

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem bounded_map_natural_candidates (m : Fin 164) :
    ∀ (x : ℕ), 0 < x → x ≤ 23 * boundedMapL m →
    ∀ (y : ℤ), y.natAbs ≤ 23 * boundedMapL m → Nat.gcd x y.natAbs = 1 →
    (∀ i, (boundedMaps m *ᵥ ![(x : ℤ), y]) i ≠ 0) →
    Function.Injective (fun i => ((boundedMaps m *ᵥ ![(x : ℤ), y]) i).natAbs) →
    ¬ContainsCriticalQuadruple (integerSpeeds (boundedMaps m *ᵥ ![(x : ℤ), y])) →
    value (integerSpeeds (boundedMaps m *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ) →
    Modular.primitiveDirection (boundedMaps m *ᵥ ![(x : ℤ), y]) ∈ candidateTuples := by
  fin_cases m
""" + cases + """
theorem bounded_map_candidates (m : Fin 164) (w : Fin 2 → ℤ)
    (hpos : 0 < w 0) (hprimitive : Nat.gcd (w 0).natAbs (w 1).natAbs = 1)
    (hbound : ∀ j, (w j).natAbs ≤ 23 * boundedMapL m)
    (hnonzero : ∀ i, (boundedMaps m *ᵥ w) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((boundedMaps m *ᵥ w) i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (boundedMaps m *ᵥ w)))
    (hlow : value (integerSpeeds (boundedMaps m *ᵥ w)) < (1 / 5 : ℝ)) :
    Modular.primitiveDirection (boundedMaps m *ᵥ w) ∈ candidateTuples := by
  let x := (w 0).toNat
  have hcast : (x : ℤ) = w 0 := Int.toNat_of_nonneg (le_of_lt hpos)
  have hx : 0 < x := by
    have hz : (0 : ℤ) < x := by simpa only [hcast] using hpos
    exact_mod_cast hz
  have hxabs : x = (w 0).natAbs := by
    rw [← hcast]
    simp only [Int.natAbs_natCast]
  have hxbound : x ≤ 23 * boundedMapL m := by
    rw [hxabs]
    exact hbound 0
  have hcop : Nat.gcd x (w 1).natAbs = 1 := by
    rw [hxabs]
    exact hprimitive
  have hw : ![(x : ℤ), w 1] = w := by
    funext j
    fin_cases j <;> simp only [Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, hcast]
  have h := bounded_map_natural_candidates m x hx hxbound (w 1) (hbound 1) hcop
    (by simpa only [hw] using hnonzero)
    (by simpa only [hw] using hdistinct)
    (by simpa only [hw] using hnot)
    (by simpa only [hw] using hlow)
  simpa only [hw] using h

end Loneliness.FiveSpeedCertificate
"""


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--maps", nargs="*", type=int)
    parser.add_argument("--map-data", type=Path, default=HERE / "line-certificate-data.json")
    parser.add_argument("--candidate-data", type=Path, required=True)
    parser.add_argument("--json-output", type=Path, required=True)
    parser.add_argument("--lean-dir", type=Path)
    args = parser.parse_args()
    started = monotonic()
    raw = args.map_data.read_bytes()
    maps = json.loads(raw)["maps"]
    candidates_raw = args.candidate_data.read_bytes()
    allowed = {tuple(row["speeds"]) for row in json.loads(candidates_raw)["candidates"]}
    selected = set(args.maps) if args.maps is not None else set(range(len(maps)))
    assert selected <= set(range(len(maps)))
    masks1, masks2 = full_masks(1009), full_masks(1013)
    records = []
    for matrix in maps:
        if matrix["id"] not in selected:
            continue
        row = propose(matrix, masks1, masks2, allowed)
        if args.lean_dir:
            name = f"LonelinessFiveSpeedBoundedMap{row['id']:03d}"
            content = render(row)
            args.lean_dir.mkdir(parents=True, exist_ok=True)
            (args.lean_dir / (name + ".lean")).write_text(content)
            row.update(module="Conjectures." + name, source_bytes=len(content.encode()),
                       source_sha256=sha256(content.encode()).hexdigest())
        records.append(row)
    aggregate = {key: sum(row["counts"][key] for row in records) for key in records[0]["counts"]}
    result = {"status": "proposed; Lean source, axiom and stock-kernel gates pending",
              "map_data_sha256": sha256(raw).hexdigest(), "candidate_data_sha256": sha256(candidates_raw).hexdigest(),
              "first_prime": 1009, "second_prime": 1013, "maps": records,
              "counts": aggregate, "elapsed_seconds": round(monotonic() - started, 3)}
    if args.lean_dir and selected == set(range(164)):
        content = render_aggregate()
        name = "LonelinessFiveSpeedBoundedMaps"
        (args.lean_dir / (name + ".lean")).write_text(content)
        result["aggregate"] = {"module": "Conjectures." + name,
                               "source_bytes": len(content.encode()),
                               "source_sha256": sha256(content.encode()).hexdigest()}
    args.json_output.write_text(json.dumps(result, separators=(",", ":")) + "\n")
    print(json.dumps({"maps": len(records), "bad_slopes": sum(len(row["bad_slopes"]) for row in records),
                      "counts": aggregate, "elapsed_seconds": result["elapsed_seconds"]}))


if __name__ == "__main__":
    main()
