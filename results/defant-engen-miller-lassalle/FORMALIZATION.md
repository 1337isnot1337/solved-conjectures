# Lean scope for Defant–Engen–Miller’s Lassalle refinement conjecture

**Partial.** Lean verifies the eventual interval certificate in the
[written proof](PROOF.md), and the implication from that certificate to
strict log-concavity once the written analytic estimate holds. It does
not yet prove the full assertion about uniquely sorted permutations.

- [Literal formulation](../../lean/Conjectures/LassalleStackSorting.lean):
  West stack sorting on finite permutations, exactly one preimage,
  the first-value refinement, and original
  [Conjecture 7.1](https://arxiv.org/pdf/1809.01340#page=18).
- [Exact coefficient model](../../lean/Conjectures/LassalleCatalanQuotient.lean):
  the integer Catalan inverse-series recurrence and the quotient row.
  Its [symmetry](../../lean/Conjectures/LassalleQuotientSymmetry.lean)
  reduces the eventual check to the first half of each row.
- [Rounded arithmetic](../../lean/Conjectures/LassalleIntervalArithmetic.lean)
  with denominator 2⁵⁰: Lean proves directed rounding and enclosure
  soundness over the reals. The [clipped falling factors](../../lean/Conjectures/LassalleBernsteinAtIndex.lean)
  agree exactly with the written Bernstein factors at admissible indices.
  [Rational constants](../../lean/Conjectures/LassalleBesselConstants.lean)
  include the two alternating-sum signs and the tail budget.
- [Complete box coverage](../../lean/Conjectures/LassalleBoxCoverage.lean):
  Lean checks all 205 leaves of the bisection tree and its full
  rectangle. It proves strict determinant positivity for the truncated
  approximants throughout the rectangle, also for any four values
  within the stated error bounds. The [eventual reduction](../../lean/Conjectures/LassalleEventualReduction.lean)
  transfers this to strict log-concavity of the integer quotient
  rows for every k ≥ 54, conditional on the written analytic estimate.

The complete Bessel-product/approximation proof, the link from the
actual permutation statistic to the quotient row, and the finite base
of the written proof are outside this receipt. See
[Singhal, Conjecture 4.1](https://arxiv.org/abs/2008.08222) for earlier
unimodality and finite log-concavity work. The source proof and prior
attribution remain unchanged.

The [receipt](verification/interval-coverage/receipt.json) records
strict compilation, every owned declaration audit, and independent
pinned stock-kernel replay.
