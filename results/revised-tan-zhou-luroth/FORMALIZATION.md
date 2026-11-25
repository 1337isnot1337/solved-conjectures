# Lean formalization

[The Lean theorem](../../lean/Conjectures/RevisedTanZhou.lean)
`RevisedTanZhou.revised_tan_zhou` proves the revised monotone conjecture
for every positive nonincreasing approximation function bounded by one.
The dimension is the reciprocal of one plus the lower order. The extended
nonnegative real convention includes infinite lower order, in which case
the dimension is zero.

The model uses the genuine infinite Lüroth series and its half-open
cylinders. The endpoint `mem_approxSet_iff` identifies the approximation
set with the usual strict inequalities at arbitrarily late convergents.
The word length is one more than the Lean index. The endpoint
`prefix_Q_formula` checks the literal unreduced denominator.

The source is Ying Wai Lee’s [Conjecture 2, INTEGERS 26 (2026), A45, p. 7](https://math.colgate.edu/~integers/aa45/aa45.pdf#page=7).
Cinna Davis’s [written proof](PROOF.md) is recorded in commit
`0fb7b77b`. The earlier unrestricted conjecture and Lee’s prior partial
results are discussed in the [audit](AUDIT.md).

## Argument checked in Lean

The upper bound sums the powers of the cylinder cover lengths. The
unreduced denominator splits into the product of the preceding digit
factors and the final digit, giving a geometric sum of cylinder costs.

For the lower bound, fix a positive exponent strictly below the desired
dimension and choose a favorable power estimate strictly above the lower
order. At each sufficiently large favorable cutoff, discard the small
Lebesgue-measure union of points with large early digits. Stop at the first
cylinder shorter than the chosen location scale. Its unreduced denominator
remains below the favorable cutoff, and it contains an equal-length closed
approximation interval near the starting point.

Use these intervals to build nested families with equally many ordered,
separated children in each parent. A subdivision of the unit interval
into equal source intervals supplies the addresses. Comparing the first
distinct child indices bounds the inverse address map by a Hölder estimate.
The Hausdorff dimension inequality for Hölder maps gives the lower bound.
This argument discharges the lower bound directly with the pinned Mathlib.

## Verification

The [local receipt](verification/receipt.json) records strict compilation,
the complete owned-declaration transitive axiom audit, and stock-kernel
replay with the pinned Lean and Mathlib versions. Reproduce the scoped
check from the repository root.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.RevisedTanZhou \
  --require RevisedTanZhou.revised_tan_zhou \
  --require RevisedTanZhou.mem_approxSet_iff \
  --out /tmp/revised-tan-zhou-verification
```
