# Lean verification: Wang–Yang's Fuss–Narayana conjecture

[Lean entry module](../../lean/Conjectures/WangYangFussNarayana.lean) · [Written proof](proof.md) · [Source audit](sources.md) · [Target audit](verification/TargetAudit.lean) · [Verification receipt](verification/receipt.json)

The five-module Lean 4 formalization proves the complete statement of Conjecture 4.1 of Yi Wang and Arthur L. B. Yang (*Total positivity of Narayana matrices*, Discrete Mathematics **341**, 2018) for every integer parameter `m ≥ 2` and every finite minor on arbitrary strictly increasing row and column selections (using Mathlib's `Matrix.IsTotallyNonneg` and the matching strict positivity predicate `IsStrictlyTotallyPos`):

- `Conjectures.WangYangFussNarayana.matB_isTotallyNonneg`: the ordinary Type B Fuss–Narayana triangle `[B(n, k)]` is totally nonnegative.
- `Conjectures.WangYangFussNarayana.matA_isTotallyNonneg`: the ordinary Type A Fuss–Narayana triangle `[A(n, k)]` is totally nonnegative.
- `Conjectures.WangYangFussNarayana.matBRev_isTotallyNonneg`: the row-reversed Type B triangle `[B(n, n - k)]` is totally nonnegative.
- `Conjectures.WangYangFussNarayana.matARev_isTotallyNonneg`: the row-reversed Type A triangle `[A(n, n - k)]` is totally nonnegative.
- `Conjectures.WangYangFussNarayana.matBSquare_isStrictlyTotallyPos`: the Type B Fuss–Narayana square `[B(n + k, k)]` is strictly totally positive.
- `Conjectures.WangYangFussNarayana.matASquare_isStrictlyTotallyPos`: the Type A Fuss–Narayana square `[A(n + k, k)]` is strictly totally positive.
- `Conjectures.WangYangFussNarayana.wang_yang_fuss_narayana_conjecture`: the combined six-matrix theorem for every integer `m ≥ 2`.

All external results cited in [proof.md](proof.md) are formalized from scratch inside the closure with zero unproved hypotheses: Krattenthaler's product determinant (Lemma 3), the Cauchy–Binet identity, the consecutive-column strict positivity criterion, the lower-triangular flag-minor test, and Galvin–Pacurar's Newton change-of-basis theorem (Theorem 1.2).

## Module structure

1. [WangYangFussNarayanaMatrix.lean](../../lean/Conjectures/WangYangFussNarayanaMatrix.lean) — `IsStrictlyTotallyPos`, positive row/column scaling, finite-section lift, topological limits of TN matrices, column multilinearity, the Cauchy–Binet formula (`det_mul_cauchyBinet`), closure of `Matrix.IsTotallyNonneg` under finite multiplication, block-diagonal extension `blockDiagOne`, elementary subdiagonal matrices, lower-triangular all-ones matrices, and nonnegative lower-bidiagonal matrices.
2. [WangYangFussNarayanaDet.lean](../../lean/Conjectures/WangYangFussNarayanaDet.lean) — polynomial and rational product determinants (`det_polyProduct`, `det_ratProd_pos`; Krattenthaler Lemma 3) via two triangular matrix factorizations and `Matrix.det_vandermonde`.
3. [WangYangFussNarayanaCriteria.lean](../../lean/Conjectures/WangYangFussNarayanaCriteria.lean) — bordered-ones determinant reductions, the column criterion for STP (`isStrictlyTotallyPos_of_consecutive_cols`), the lower-triangular flag-minor test for TN (`isTotallyNonneg_of_lowerTriangular_flag_pos`), and Galvin–Pacurar Theorem 1.2 (`newtonChangeMat_isTotallyNonneg`).
4. [WangYangFussNarayanaDefs.lean](../../lean/Conjectures/WangYangFussNarayanaDefs.lean) — literal definitions of `fussNarayanaB`, `fussNarayanaA`, and all six arrays (`matB`, `matA`, `matBRev`, `matARev`, `matBSquare`, `matASquare`), plus exact product identities (2), (3), and (4) from the written proof.
5. [WangYangFussNarayana.lean](../../lean/Conjectures/WangYangFussNarayana.lean) — assembly of all six theorems (`matB_isTotallyNonneg`, `matA_isTotallyNonneg`, `matBRev_isTotallyNonneg`, `matARev_isTotallyNonneg`, `matBSquare_isStrictlyTotallyPos`, `matASquare_isStrictlyTotallyPos`) and the combined theorem `wang_yang_fuss_narayana_conjecture`.

## Reproduce the scoped gate

After installing the pinned Mathlib cache (`leanprover/lean4:v4.35.0`), run from the repository root:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.WangYangFussNarayana \
  --require Conjectures.WangYangFussNarayana.matB_isTotallyNonneg \
  --require Conjectures.WangYangFussNarayana.matA_isTotallyNonneg \
  --require Conjectures.WangYangFussNarayana.matBRev_isTotallyNonneg \
  --require Conjectures.WangYangFussNarayana.matARev_isTotallyNonneg \
  --require Conjectures.WangYangFussNarayana.matBSquare_isStrictlyTotallyPos \
  --require Conjectures.WangYangFussNarayana.matASquare_isStrictlyTotallyPos \
  --require Conjectures.WangYangFussNarayana.wang_yang_fuss_narayana_conjecture \
  --out /tmp/wang-yang-fuss-narayana-check
```

The [receipt](verification/receipt.json) binds the strict build (`-j1 -DwarningAsError=true`), the all-owned transitive axiom audit (5 modules, 322 declarations, 270 theorems, 79 private declarations, 7 required endpoints; only `propext`, `Classical.choice`, `Quot.sound`), and independent stock-kernel replay (`leanchecker` via `scripts/replay_lean.py`) to the exact proof source and pinned manifest. The repository-wide aggregate gate (`scripts/verify_lean.sh`) is separate.
