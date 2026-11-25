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

## Reducing the analytic estimate to the Bessel product

Lean checks the exact normalized Catalan-quotient coefficient expansion,
its regrouping by total degree, and the two discrete Bernstein differences.
The [stencil identity](../../lean/Conjectures/LassalleQuotientStencil.lean)
therefore uses the actual quotient coefficients, not an approximation
defined to match the certificate. Lean then bounds each Bernstein layer,
verifies the convolution ratio, and sums the geometric and retained-term
errors using the exact rational budget. This proves the stated error
estimate from the sole analytic source decomposition specified in
[BesselSourceDecomposition](../../lean/Conjectures/LassalleBesselSourceReduction.lean).
That implication also verifies the normalized nonnegative-series tail
and the product bound from the two power sums.

The [analytic-reduction receipt](verification/analytic-reduction/receipt.json)
does not formalize the classical Bessel product and its coefficient
identities. The bridge from the actual permutation statistic to the
quotient row and the finite base are also outside these two receipts. See
[Singhal, Conjecture 4.1](https://arxiv.org/abs/2008.08222) for earlier
unimodality and finite log-concavity work. The source proof and prior
attribution remain unchanged.

The [receipt](verification/interval-coverage/receipt.json) records
strict compilation, every owned declaration audit, and independent
pinned stock-kernel replay.
