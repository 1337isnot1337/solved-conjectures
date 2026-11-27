# Lean verification of the blocking-pencil theorem

The original blocking-pencil theorem and its quantitative lower bound for polynomial graph families are fully formalized. The [Lean endpoints](../../lean/Conjectures/AsgarliGhiocaYipComplete.lean) are:

- `regularOrderingEstimate`: a uniform count of Frobenius-equivariant orderings for each squarefree root-free seed.
- `missing_lines`: the quantitative lower bound for a family of degree-$`d`$ graphs with a common nonzero leading coefficient, for $`d\ge2`$.
- `pencil_bounds`: the explicit lower and upper logarithmic bounds on the projective blocking number.

The lower bound uses the same $`q\ge4d^2`$ and $`k\le\log q/(8d\log d)`$ hypotheses as the written proof. Its incidence predicate includes the line at infinity and projective closure. The independent single-graph result and upper bound retain their original scope. The [exact Frobenius minimum](FROBENIUS.md) and [reflexive-family extension](REFLEXIVE.md) are separate, not formalized by this package.

## The point count

The [Lean proof](../../lean/Conjectures/AsgarliGhiocaYipComplete.lean) uses exact twist averaging instead of the written proof's lower point estimate. The monic resolvent has degree $`N=(d!)^k`$. Right translation by a root-label permutation acts on its geometric factors, and the total number of stable factor–twist pairs is exactly $`N`$. The seed specifies a stable pair for the required Frobenius twist. The polynomial Stepanov upper bound on the other pairs and the exact sum over regular parameters give a lower bound for that pair. The [Stepanov code and credits](../../lean/Conjectures/AGYStepanov/SOURCES.md) document the licensed dependency.

## Verification

Lean `4.35.0`, with the repository's pinned Mathlib. The [scoped receipt](verification/receipt.json) records a strict source build of 31 project modules, the all-owned audit (including private declarations), and stock `leanchecker` replay. Only `propext`, `Classical.choice`, and `Quot.sound` occur in the transitive axiom union. The receipt is for this exact closure, not for the entire catalogue.

From the repository root with the pinned packages installed, run the target-scoped build:

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.AsgarliGhiocaYipComplete \
  --require Conjectures.AsgarliGhiocaYip.regularOrderingEstimate \
  --require Conjectures.AsgarliGhiocaYip.missing_lines \
  --require Conjectures.AsgarliGhiocaYip.pencil_bounds \
  --require Conjectures.AsgarliGhiocaYip.half_le_twist_fibers \
  --out lean/.lake/agy-target-check
```
