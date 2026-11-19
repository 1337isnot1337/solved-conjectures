#!/usr/bin/env python3
"""Generate exact subset duals for the smaller geometric norm bounds.

The LP solver only proposes certificates. Fraction arithmetic verifies every
row, and the generated Lean assertions independently check every subset.
"""

from fractions import Fraction as F
from math import lcm, prod
from pathlib import Path

import numpy as np
from scipy.optimize import linprog


ROOT = Path(__file__).resolve().parents[1]
CASES = [
    ("SixSpectrumRankFour", F(1, 6), [F(2, 11), F(1, 5), F(1, 4)], 9075),
    ("SixSpectrumRankFive", F(1, 6), [F(2, 11), F(1, 5), F(1, 4), F(1, 3)], 54450),
    ("SixSpectrum", F(1, 6), [F(2, 11), F(1, 5), F(1, 4), F(1, 3), F(1, 2)], 163350),
    ("TightSix", F(1, 7), [F(1, j) for j in range(6, 1, -1)], 17010000),
    ("TightSeven", F(1, 8), [F(1, j) for j in range(7, 1, -1)], 1587600),
    ("TightEight", F(1, 9), [F(1, j) for j in range(8, 1, -1)], 57153600),
    ("SevenSpectrum", F(1, 7), [F(5, 33)] + [F(1, j) for j in range(6, 1, -1)], 5145525),
    ("EightSpectrum", F(1, 8), [F(3, 23)] + [F(1, j) for j in range(7, 1, -1)], 209960100),
]


def certificates(prefix):
    d = len(prefix) - 1
    matrix = [[int(i <= r) for i in range(d)] for r in range(d)]
    matrix += [[-3 if i == r else 4 if i == r+1 else 0 for i in range(d)]
               for r in range(d-1)]
    rhs = prefix[1:] + [F(0)] * (d-1)
    rows = [(1, [0] * (2*d))]
    for mask in range(1, 2**d):
        target = [(mask >> i) & 1 for i in range(d)]
        result = linprog(target, A_ub=-np.array(matrix, dtype=float),
                         b_ub=-np.array(rhs, dtype=float), bounds=[(None, None)]*d,
                         method="highs")
        if not result.success:
            raise ValueError((mask, result.message))
        dual = [F(float(-a)).limit_denominator(100_000_000)
                for a in result.ineqlin.marginals]
        assert all(a >= 0 for a in dual)
        assert all(sum(dual[r]*matrix[r][i] for r in range(2*d-1)) == target[i]
                   for i in range(d))
        assert sum(dual[r]*rhs[r] for r in range(2*d-1)) >= prefix[mask.bit_count()]
        den = lcm(*(a.denominator for a in dual))
        rows.append((den, [int(den*a) for a in dual] + [0]))
    return rows


def tree(rows, lo, hi, indent=2):
    pad = " " * indent
    if hi-lo == 1:
        den, weights = rows[lo]
        return [pad + f"(.leaf ⟨{den}, #[{', '.join(map(str, weights))}]⟩)"]
    mid = (lo+hi)//2
    return ([pad + f"(.branch {mid}"] + tree(rows, lo, mid, indent+2) +
            tree(rows, mid, hi, indent+2) + [pad + ")"])


def emit(name, threshold, lower, cutoff):
    d = len(lower)
    prefix = [F(0)] + [4*(a-threshold)**2 for a in lower]
    increments = [prefix[i+1]-prefix[i] for i in range(d)]
    assert all(a > 0 for a in increments)
    assert cutoff**2 * prod(increments) > 1
    scale = lcm(*(a.denominator for a in prefix))
    scaled = [int(scale*a) for a in prefix]
    rows = certificates(prefix)
    lines = [f"namespace {name}", "",
             f"/-! Threshold {threshold}; containing-space lower bounds {', '.join(map(str, lower))}.",
             f"The exact increment product is {prod(increments)}. -/", "",
             f"def scale : ℕ := {scale}",
             f"def boundData : Array ℕ := #[{', '.join(map(str, scaled))}]",
             "def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0", "",
             "def rowData : Lean.RArray DualRow :="]
    lines += tree(rows, 0, len(rows))
    lines += ["", f"noncomputable def row (m : Fin (2^{d})) : DualRow := rowData.get m.val", ""]
    block_size = min(64, 2**d)
    blocks = 2**d // block_size
    for block in range(blocks):
        lines += [f"private theorem block_{block} : ∀ j : Fin {block_size},",
                  f"    DualValid {d} bounds (fun i => ({block}*{block_size}+j.val).testBit i.val)",
                  f"      (row ⟨{block}*{block_size}+j.val, by omega⟩) := by decide +kernel", ""]
    lines += [f"theorem rows_valid (m : Fin (2^{d})) :",
              f"    DualValid {d} bounds (fun i => m.val.testBit i.val) (row m) := by",
              f"  let q := m.val / {block_size}",
              f"  let j : Fin {block_size} := ⟨m.val % {block_size}, Nat.mod_lt _ (by decide)⟩",
              f"  have hq : q < {blocks} := by dsimp [q]; omega",
              f"  have he : m.val = q*{block_size}+j.val := by dsimp [q,j]; omega",
              "  interval_cases q"]
    for block in range(blocks):
        lines += [f"  · have hm : m = ⟨{block}*{block_size}+j.val, by omega⟩ := Fin.ext he",
                  "    rw [hm]", f"    exact block_{block} j"]
    lines += ["", f"theorem increment_positive : ∀ i < {d}, 0 < KZGeneral.increment bounds scale i := by",
              "  intro i hi", "  interval_cases i <;>",
              "    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]", "",
              f"theorem numerical_margin : 1 < ({cutoff} : ℝ)^2 *",
              f"    ∏ i ∈ Finset.range {d}, KZGeneral.increment bounds scale i := by",
              "  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,",
              "    Finset.prod_range_succ]", "",
              "theorem product_lower_bound (t : ℕ → ℝ)",
              f"    (ht : ∀ i < {d}, 0 < t i)",
              f"    (hprefix : ∀ r ≤ {d}, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)",
              f"    (hratio : ∀ i, i+1 < {d} → 3*t i ≤ 4*t (i+1)) :",
              f"    ∏ i ∈ Finset.range {d}, KZGeneral.increment bounds scale i ≤",
              f"      ∏ i ∈ Finset.range {d}, t i := by",
              f"  exact KZGeneral.product_of_certificate {d} bounds scale (by decide) (by decide)",
              "    row rows_valid increment_positive t ht hprefix hratio", "",
              "theorem norm_cutoff (t : ℕ → ℝ) (S deltaSquared : ℝ) (hS : 0 < S)",
              f"    (ht : ∀ i < {d}, 0 < t i)",
              f"    (hprefix : ∀ r ≤ {d}, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)",
              f"    (hratio : ∀ i, i+1 < {d} → 3*t i ≤ 4*t (i+1))",
              f"    (hdet : ∏ i ∈ Finset.range {d}, t i = deltaSquared / S) :",
              f"    S < ({cutoff} : ℝ)^2 * deltaSquared := by",
              f"  exact KZGeneral.norm_square_cutoff {d} (KZGeneral.increment bounds scale) t",
              f"    S deltaSquared {cutoff} hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin",
              "", f"end {name}", ""]
    print(f"{name}: {len(rows)} exact duals; product={prod(increments)}; cutoff={cutoff}")
    return lines


def main():
    lines = ["import Conjectures.LonelinessKZGeneral", "import Init.Data.RArray", "",
             "/-! Generated exact certificates for smaller prefix problems.",
             "All real variables remain universally quantified. The geometric",
             "basis, prefix estimates, and determinant identity are separate inputs. -/", "",
             "namespace Loneliness.KZSmall", "open scoped BigOperators", "open KZProduct", "",
             "set_option maxRecDepth 100000", "set_option maxHeartbeats 0", ""]
    for case in CASES:
        lines += emit(*case)
    lines += ["end Loneliness.KZSmall", ""]
    (ROOT / "lean/Conjectures/LonelinessKZSmallData.lean").write_text("\n".join(lines))


if __name__ == "__main__":
    main()
