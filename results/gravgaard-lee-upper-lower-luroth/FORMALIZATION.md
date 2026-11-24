# Gravgaard–Lee’s mixed upper/lower Lüroth conjecture

## Exact target and source

Maiken Gravgaard and Ying Wai Lee posed Conjecture 2.6 in *Decomposition of real numbers into sums of Lüroth sets*, [arXiv:2506.12513v2](https://arxiv.org/abs/2506.12513), February 17, 2026. The conjecture uses every common digit threshold k≥2 and actual infinite expansions, with the bounded-above and bounded-below sets representing every residue modulo one.

The existing [direct refinement proof](DIRECT-REFINEMENT.md), committed by Cinna Davis at `06f4ac32f33e84191048569c621ca41b8c9cd91f`, proves the stronger exact interval `(a,1+a]`, where `a=(k−1)/(k(k−1)−1)`. This formalization follows that argument and reuses the repository’s already checked genuine-series infrastructure. It does not substitute a closed lower-digit hull for actual expansions. The original entry’s source/priority qualifications remain unchanged.

## Verified partial scope

`GravgaardLeeUpperLowerBasic` proves the constant-digit endpoint, digitwise monotonicity, exact bounds for both actual digit sets, and the upper inclusion of the sum in `(a,1+a]`. Its uniform gap estimate is valid at every allowed threshold and split digit.

`GravgaardLeeUpperLowerLinked` proves the complete one-step interval geometry for k≥3: both append rules, lower-group discard, upper-group discard with the least suitable lower cutoff, and normalization when the upper group becomes a singleton. Every rule retains the strictly positive residual. The proof includes the initial linked state and the exact endpoint/gap identities.

`GravgaardLeeUpperLowerCylinders` defines the actual upper digit cylinders, proves their compactness and endpoint bounds, and verifies that each scene transition retains a subset of the original cylinder. The affine prefix translations match the interval residual formulas. Compactness is asserted only for the bounded-digit side.

## What remains

The finite refinement that guarantees a lower-side digit, including the excluded-zero-tail repair, is not yet formalized. The iteration and convergence producing a genuine lower-bounded-digit expansion, the reverse sum inclusion, the k=2 unrestricted-expansion endpoint and the original modulo-one conclusion remain open in Lean. These are substantive obligations, not axioms or hidden hypotheses. This checkpoint contributes zero completed conjecture formalizations.

## Checks

All three new modules compiled with Lean 4.35.0, the pinned Mathlib revision and warnings treated as errors. The repository’s all-owned audit checked the complete five-module local closure, including the two reused Lüroth modules: 431 declarations, 158 private declarations and nine explicit required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. The unchanged stock-kernel replay helper passed for exactly that closure.

The [receipt](../../docs/verification/lean-gravgaard-lee-upper-lower-20261124-162051/receipt.json) records exact source/verifier hashes; its directory contains the generated audit and full logs. Root imports, required endpoints and the replay registry are updated. The scoped receipt does not claim that the full repository-wide build passed.
