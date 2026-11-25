# Lean verification

**Complete for the negative answer to Question 6.1 and its uniform small-damping strengthening.** [The primary source](https://arxiv.org/pdf/1802.02641#page=10), p. 10, asks whether diagonal multiplication by `exp(-α k^p)` is zero-sector reducing exactly when `p ≥ 2`, with `α > 0`. The original exact cubic witness already formalized in #529 is unchanged. The scoped extension ports the existing [written proof](PROOF.md), with author and prior-art attribution preserved in [the publication audit](AUDIT.md).

For every real `p > 2`, `CardonZeroSector.discriminant_neg_for_small` shows that the translated cubic's discriminant is strictly negative throughout a small interval `0 < α < ε(p)`. The discriminant is for the translated image of the actual input `(X−1)³`. The strictly positive limiting power gap is not restricted to integer exponents. `CardonZeroSector.fails_to_preserve_sector_for_small` then supplies a strictly positive sector angle, not a zero-width limiting interpretation. `CardonZeroSector.not_reduces_for_small` rules out the original reducing property on that entire parameter range.

This is not a classification of the other parameter pairs or an answer to Question 6.2. It adds a verified stronger theorem to the already resolved catalogue entry, not a new solved problem.

## Reproduction

Against pinned Lean 4.35.0 and Mathlib, in a prepared Lake build:

```sh
cd lean
for module in CardonZeroSector CardonZeroSectorAnalysis CardonZeroSectorSmallDamping; do
  lake env lean -j1 -DwarningAsError=true -o ".lake/build/lib/lean/Conjectures/$module.olean" "Conjectures/$module.lean"
  lake env leanchecker "Conjectures.$module"
done
lake env lean -j1 -DwarningAsError=true ../results/cardon-zero-sector/verification/TargetAudit.lean
```

The exact three modules passed strict compilation and stock kernel replay. The all-owned audit checked 68 declarations (54 theorems, 35 private) and nine named endpoints. [Exact receipt](verification/lean-receipt.json). The previously reported aggregate CI failure is separate from this scoped replay and is not claimed as fixed.
