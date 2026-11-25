# Lean scope for Rossi’s permutohedron characteristic-polynomial conjecture

**Status: complete for Conjecture 6.16.** The target is Giovanni Rossi’s
[Conjecture 6.16, arXiv:2611.25741v1, §6.5](https://arxiv.org/html/2611.25741v1#S6.SS5).
It asks for exactly `n−2` real roots in `(0,1)`, the root `1`,
and one root greater than `1`, all simple. The q-deformation is separate.
Lean checks the final reduction of Cinna Davis’s recorded proof,
using the Eulerian transformation credited to Rossi.

- [Recurrence](../../lean/Conjectures/RossiPermutohedronEulerianData.lean):
  the Eulerian recurrence gives constant term one and derivative
  `2^n−n−1` at zero. The shifted polynomial has its root at zero,
  is negative immediately to its right for `n ≥ 3`, and is positive at one.
- [Degree and coefficient recurrence](../../lean/Conjectures/RossiPermutohedronEulerianDegree.lean):
  the recurrence polynomial is monic of degree `n−1`; the shifted
  polynomial has degree `n`. The all-index theorem keeps the negative
  alternating grid as an explicit hypothesis.
- [Sign-grid proof](../../lean/Conjectures/RossiPermutohedronSignGrid.lean):
  every adjacent pair of strictly alternating signs supplies an interior
  root. Roots from different intervals are distinct. With the zero root
  and the root in `(0,1)`, the degree bound proves there are no other roots
  and excludes multiplicity.
- [Reciprocal transport](../../lean/Conjectures/RossiPermutohedronReduction.lean):
  the transform carries negative roots into `(0,1)`, zero to `1`,
  and the positive root into `(1,∞)`. Lean proves the exact multiset of
  roots of the transformed polynomial.

- [Analytic expansions](../../lean/Conjectures/RossiPermutohedronAnalyticExpansions.lean):
  for positive real grid coordinate, both the exponential series and the
  odd-imaginary-pole expansion are proved for the actual Eulerian
  recurrence expression. The power series is differentiated on smaller
  disks; the pole identity uses Mathlib’s differentiated cotangent
  series and proves the exact affine change and sign.
- [Nearest poles](../../lean/Conjectures/RossiPermutohedronNearestPoles.lean):
  the two nearest conjugate poles contribute exactly the signed
  trigonometric term on the grid. The squared norms of all poles are
  explicit. [The bulk binomial estimate](../../lean/Conjectures/RossiPermutohedronBulkBinomial.lean)
  proves the lower bound from the quadratic coefficient alone.

- [Bulk sign](../../lean/Conjectures/RossiPermutohedronBulkGrid.lean):
  if `n ≥ 128`, `n < 9*j^2`, and `2*j < n+1`, Lean proves the exact
  prescribed sign with magnitude strictly above one at
  `x = π*cot(π*j/(n+1))`. The remaining conjugate pairs have a strictly
  smaller total norm than half of the nearest-pole term. A factorial
  lower bound gives the required unit-level margin.

- [Near endpoints](../../lean/Conjectures/RossiPermutohedronNearGrid.lean):
  the central term of the alternating series dominates when `9*j^2 ≤ n`.
  The two tails have successive ratios at most `1/4` and `1/16`.
  For `j ≥ 2`, the resulting signed magnitude is strictly above one.
  At `j = 1`, the separate half-unit bound suffices after reflection.
- [Center](../../lean/Conjectures/RossiPermutohedronCentral.lean)
  and [reflection](../../lean/Conjectures/RossiPermutohedronGridGeometry.lean):
  the paired-pole sum extends continuously to coordinate zero, and
  inversion of the Eulerian rational expression gives the sign and
  positive exponential factor on the negative-coordinate half.
- [Uniform theorem](../../lean/Conjectures/RossiPermutohedronUniformGrid.lean):
  for every `n ≥ 128`, the full decreasing grid gives exactly `n−2`
  simple roots in `(0,1)`, the simple root `1`, and one simple root
  above `1` for the reciprocal recurrence model. Lean specifies the
  entire real root multiset, with multiplicity.

- [Ordered partitions](../../lean/Conjectures/RossiPermutohedronOrderedPartitions.lean):
  represent each ordered face by its surjective block labels. Removing the
  last element either removes a singleton block or retains all blocks.
  The two explicit bijections prove the exact Stirling-number count.
- [Rank polynomial](../../lean/Conjectures/RossiPermutohedronRank.lean):
  sums over the actual finite face set in Definition 2.3, including the
  empty face, and identifies the result with the shifted Eulerian recurrence.
- [Characteristic face sum](../../lean/Conjectures/RossiPermutohedronCharacteristic.lean)
  and [root transport](../../lean/Conjectures/RossiPermutohedronFaceRootTransport.lean):
  the paper’s signed face-sum formula equals the reciprocal recurrence model;
  the exact root multiset of that model transfers to the literal rank
  polynomial, including absence of nonreal roots.

- [Exact finite bridge](../../lean/Conjectures/RossiPermutohedronRecurrenceAll.lean):
  for every `3 ≤ n < 128`, Lean checks the integer coefficients against
  the actual Eulerian recurrence and checks the signs at all
  listed dyadic rationals by exact integer arithmetic. Positive
  denominators and strict order are checked by cross multiplication.
  The check does not depend on how the sample points were proposed.
- [Final theorems](../../lean/Conjectures/RossiPermutohedronRoots.lean):
  for every `n ≥ 3`, `rankPolynomial_exact_roots` proves that the literal
  rank-generating polynomial splits and has exactly `n` distinct
  negative roots. This is Rossi's explicitly equivalent formulation.
  `characteristicFacePolynomial_exact_roots` gives the exact root multiset
  and splitting of the signed characteristic face sum: `n−2` below one
  and above zero, the singleton root `1`, and one root above one.

The face-sum formula uses Rossi’s evaluated Möbius signs (Theorem 6.3);
this development does not separately re-prove that theorem from the
poset’s Möbius recursion. The directly counted rank polynomial is
unconditional and gives the original conjecture in the paper's equivalent
formulation. The q-deformation is outside this scope.
See the [written proof](PROOF.md) and [original audit](AUDIT.md).

The [root-count receipt](verification/receipt.json), [analytic receipt](verification/analytic/receipt.json), [bulk-sign receipt](verification/bulk/receipt.json), and [uniform-grid receipt](verification/uniform/receipt.json) record strict compilation, the complete owned-declaration axiom audit, and pinned stock-kernel replay. The [face-model receipt](verification/face-model/receipt.json) covers the independently counted rank and signed characteristic face sums. The [complete receipt](verification/complete/receipt.json) covers the exact final closure, including every finite certificate.
