# Gravgaard–Lee’s mixed upper/lower Lüroth conjecture

## Complete statement and source

Maiken Gravgaard and Ying Wai Lee posed Conjecture 2.6 in *Decomposition of real numbers into sums of Lüroth sets*, [arXiv:2506.12513v2](https://arxiv.org/html/2506.12513v2#S2.SS1). The original conjecture is fully formalized for every integer threshold `k ≥ 2`. The endpoint `GravgaardLeeUpperLower.conjecture_2_6` says that every real residue modulo one is represented by an actual infinite expansion with all digits at most `k`, plus an actual infinite expansion with all digits at least `k`.

The stronger endpoint `GravgaardLeeUpperLower.exact_sum_interval` proves

```math
L_{\le k}+L_{\ge k}=(a,1+a],\qquad a=\frac{k-1}{k(k-1)-1}.
```

The lower endpoint is strictly excluded. `conjecture_2_6_digits` exposes both actual infinite digit sequences and the integer translate. There is no remaining refinement, expansion-existence, convergence, or thickness hypothesis.

The argument is the existing [direct refinement proof](DIRECT-REFINEMENT.md), recorded by Cinna Davis in commit [`06f4ac32f33e84191048569c621ca41b8c9cd91f`](https://github.com/1337isnot1337/solved-conjectures/commit/06f4ac32f33e84191048569c621ca41b8c9cd91f). The primary source's digit convention in Section 1.2 and its exact conjecture were read directly. The existing [source and priority audit](AUDIT.md) remains unchanged; its bounded search does not guarantee priority. This formalization makes no new mathematical priority claim.

This is one completed existing conjecture entry. The threshold-two boundary belongs to the universal theorem. The previously completed large-digit and mixed-(3,4) modules are reused dependencies and are not counted again.

## Actual expansions

`GravgaardLeeMixedLuroth.smallDigitSet k` consists of values of infinite digit sequences satisfying `2 ≤ d i ≤ k`. `GravgaardLeeLargeLuroth.largeDigitSet k` uses the source's convergent Lüroth series with digits `k ≤ d i`. The checked equivalence `GravgaardLeeUpperLower.mem_largeDigitSet` identifies that series definition with the recursively analyzed value function; `value_hasSum` proves the series correspondence.

Every constructed tail is positive. No closure of the lower-bounded digit set, finite zero-tail expansion, or interval hull is substituted for actual set membership.

## Proof correspondence

| Module | Checked role |
| --- | --- |
| [Basic](../../lean/Conjectures/GravgaardLeeUpperLowerBasic.lean) | Constant-digit endpoint, actual digit-set bounds, exact upper inclusion, and uniform gap inequalities. |
| [Linked](../../lean/Conjectures/GravgaardLeeUpperLowerLinked.lean) | All linked interval transitions, least valid lower cutoff, singleton normalization, and the initial valid state. |
| [Cylinders](../../lean/Conjectures/GravgaardLeeUpperLowerCylinders.lean) | Actual upper cylinders, compactness, endpoint bounds, and containment under every transition. |
| [Moves](../../lean/Conjectures/GravgaardLeeUpperLowerMoves.lean) | Finite valid refinement appending an actual digit on one side. Lower group cuts use their least stopping cutoff. |
| [Orbit](../../lean/Conjectures/GravgaardLeeUpperLowerOrbit.lean) | The actual upper-digit orbit under an obstruction, vanishing widths, and arbitrarily late nonmaximal digits. |
| [Repair](../../lean/Conjectures/GravgaardLeeUpperLowerRepair.lean) | Actual sibling and digit-2 cylinders, floor-selected adjacent lower digits, and both linked-state repair cases. |
| [Forcing](../../lean/Conjectures/GravgaardLeeUpperLowerForcing.lean) | Every valid scene admits one actual lower-digit advance. |
| [Convergence](../../lean/Conjectures/GravgaardLeeUpperLowerConvergence.lean) | A genuine infinite lower expansion, vanishing scales, and the exact lower inclusion for every `k ≥ 3`. |
| [Two](../../lean/Conjectures/GravgaardLeeUpperLowerTwo.lean) | Every real in `(0,1]` has a positive-tail expansion; the threshold-two upper set is `{1}`. |
| [Final statement](../../lean/Conjectures/GravgaardLeeUpperLower.lean) | Exact interval equality and the set-level and digit-level original conjecture, for every `k ≥ 2`. |

The orbit proof uses the quantitative bound `W_B²(1−a) ≤ 3QP` to show that the lower width vanishes when the upper scale does. This discharges the written narrowing argument without assuming a rate for the moving cutoff. The floor choice in the repair gives a direct scale comparison in place of the written `O(c²/Q)` observation.

The final iteration records every lower digit and both lower prefix parameters exactly. Its upper cylinder remains inside the preceding actual upper cylinder. Compactness is used only for the initial bounded-digit upper set; the lower summand comes from the constructed infinite digit sequence.

For `k = 2`, the next digit is `floor(1/x) + 1`. The tail stays in `(0,1]`, including when `1/x` is an integer. A geometric remainder proves convergence to the original real number.

## Verification and review

The [complete receipt](../../docs/verification/lean-gravgaard-lee-upper-lower-complete-20261124-162051/receipt.json) records a fresh strict rebuild of the full 12-module closure, including the two reused modules. The all-owned/private audit checked 664 declarations, including 475 theorems and 173 private declarations, and all 29 required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` occur transitively. Exact stock-kernel replay of all 12 modules passed.

The source, compiler/checker, verifier controls, audit, inventory, logs, and replayed objects have recorded hashes. The receipt SHA-256 is `f06a75528115b2bbb590e515a2ad20296ec7c2cfc6cdc4584e1afb26d967c472`. This complete gate mounted shared dependencies and the compiler read-only and allowed writes only to its isolated evidence directory.

The [independent Lean review](LEAN_REVIEW.md) checks the primary statement, actual-set correspondence, zero-tail exclusion, all-threshold quantifiers, and every verification artifact. It distinguishes the reviewer's authorship of the supporting threshold-two module from the independent review of the general proof. This is internal review, not external peer review.

The [partial receipt](../../docs/verification/lean-gravgaard-lee-upper-lower-20261124-162051/receipt.json) remains a historical checkpoint. The completed scoped check does not claim an aggregate repository build or public website deployment. The protected aggregate attempt failed on dependency-cache prerequisites; its log is preserved. These separate obligations are tracked in [issue #563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

## Reproduction

Use the compiler and Mathlib revisions pinned in `lean/lean-toolchain` and `lean/lake-manifest.json`. With those dependencies installed, run:

```bash
cd lean
lake env python3 ../scripts/verify_gravgaard_lee_upper_lower.py
```

The portable verifier rebuilds an isolated closure, checks registrations, audits every owned declaration, and replays exactly those project modules with the unchanged pinned checker. The dedicated workflow uses the same command. `scripts/verify_lean.sh` remains the separate aggregate gate.
