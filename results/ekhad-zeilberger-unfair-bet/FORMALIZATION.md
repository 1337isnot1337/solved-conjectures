# Lean scope for Ekhad–Zeilberger’s most unfair bet conjecture

**Status: partial.** This scope checks the literal finite-word overlap model
and completely determines the maximum and equality cases of its unrestricted
normalized score for all word lengths $k\ge2$ and all alphabet sizes $q\ge2$. It does not identify that score with
the leading coefficient of the winning-probability difference in Litt's
game, so the original binary challenge is not yet fully formalized.

- [Arithmetic bounds](../../lean/Conjectures/EkhadZeilbergerOverlap.lean) and
  [literal words](../../lean/Conjectures/EkhadZeilbergerWords.lean) build the
  finite word model, test the literal suffix-prefix equalities, bound actual
  cross-overlaps against a constant loser, and prove attainment for the
  proposed last-letter exception. The initial conditional nonconstant bound
  is discharged in the maximum theorem below.
- [Exact equality](../../lean/Conjectures/EkhadZeilbergerEquality.lean) proves
  that the constant-loser bound is sharp exactly for a single mismatch at
  an endpoint of the other word. One interior mismatch makes the
  cross-overlap bound strict; two endpoint mismatches force zero
  cross-overlap. Both endpoint choices attain equality.
- [Cross-overlaps](../../lean/Conjectures/EkhadZeilbergerCrossOverlap.lean)
  proves that two opposite one-step overlaps give the same self-overlap set,
  and derives a lower bound for the normalized variance expression at letter
  weight at most $1/3$ whenever the self-overlap weights differ.

- [Equal interiors](../../lean/Conjectures/EkhadZeilbergerInterior.lean)
  shows that a one-step cross-overlap and identical interiors force both
  nonconstant words to be unbordered.
- [Uniform projection](../../lean/Conjectures/EkhadZeilbergerWindowProjection.lean)
  models a uniform text of length $N+k-1$ as a finite product, counts the
  difference of actual window indicators, and proves it has mean zero.
  When the two interiors differ, its variance is at least
  $2Nq^{-k}(1-q^{-1})^2$. Distinct windows are orthogonal after centering in
  the two endpoints, and the contribution on each window is computed exactly.

- [Literal overlap covariance](../../lean/Conjectures/EkhadZeilbergerOverlapCovariance.lean)
  counts compatible assignments on the union of two actual windows. A
  compatible joint occurrence contributes one reciprocal alphabet factor per
  distinct prescribed coordinate. Summing the exact covariances by lag gives
  the finite second moment.
- [Variance identity](../../lean/Conjectures/EkhadZeilbergerVarianceIdentity.lean)
  rewrites this moment as sample size times the source overlap expression,
  plus a boundary term independent of sample size. The projection and the
  Archimedean property give the overlap variance floor without any assumed
  probabilistic limit theorem.
- [Exact unrestricted maximum](../../lean/Conjectures/EkhadZeilbergerOverlapOptimum.lean)
  excludes every nonconstant loser, handles the equal-interior exception,
  and proves equality exactly for the source's pair and its reversal, up
  to letter labels (with the words ordered by their self-overlaps).

The original binary statement is on [Ekhad and Zeilberger's challenge
page](https://sites.math.rutgers.edu/~zeilberg/mamarim/mamarimhtml/litt.html).
The checked arithmetic and word definitions come from Cinna Davis's
[earlier candidate](https://github.com/1337isnot1337/solved-conjectures/blob/71b2fcace0ed5aa4aee331a58b6e75568aa9234b/results/ekhad-zeilberger-unfair-bet/LEAN_CANDIDATE.md),
with build fixes that do not change theorem statements. The trace of the
written proof and its attribution is [issue #219](https://github.com/1337isnot1337/solved-conjectures/issues/219).
The [Janson–Nica–Segert probability expansion](https://arxiv.org/abs/2503.19035),
the exact fairness theorem, and the full-alphabet restriction and extremizers
remain outside the Lean scope. The fixed-pair probability expansion is needed
to identify the source score with the leading coefficient of the win gap.

Reproduce the [strict source, axiom, and kernel-replay receipt](verification/receipt.json)
using `scripts/verify_lean_target.py` with root
`Conjectures.EkhadZeilbergerOverlapOptimum`, `--per-module-replay`, and the endpoints
in the receipt.
The aggregate repository gate is separate.
