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
checks this estimate from the stated decomposition.

## All base rows and the literal conjecture

Lean verifies the exact inverse-Catalan recurrence and strict inequalities
at every internal index of all 53 base rows. The zero-order row is vacuous.
See [the finite-base receipt](verification/finite-through-53/receipt.json).

Lean also proves continuity and opposite endpoint signs for the real
Bessel series, hence an actual zero in the stated rational interval.
It identifies that zero as the first and checks the remaining two power-sum
bounds conditional on the classical enumeration and reciprocal moments.
See [the root-bracket receipt](verification/root-bracket/receipt.json).

The [literal theorem](../../lean/Conjectures/LassalleLiteralConditional.lean)
checks the original West-permutation assertion from two explicit inputs:
the bridge from the permutation count to the Catalan quotient and the
classical Bessel product data. No project-specific axiom is added.
The [composition receipt](verification/literal-composition/receipt.json)
records the owned-declaration audit and independent stock replay of the two new
modules over four independently checked source closures. The full result
remains partial because the two source bridges are not formalized. See
[Singhal, Conjecture 4.1](https://arxiv.org/abs/2008.08222) for earlier
unimodality and finite log-concavity work. The source proof and prior
attribution remain unchanged.

The [receipt](verification/interval-coverage/receipt.json) records
strict compilation, every owned declaration audit, and independent
pinned stock-kernel replay.
