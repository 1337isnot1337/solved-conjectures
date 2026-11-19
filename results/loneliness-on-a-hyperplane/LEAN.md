# Lean formalization: deterministic component

The exact shifted maximum on the containing real hyperplane is formally
verified. The probabilistic and counting assertions remain open.

## Checked statements

The namespace is `Loneliness.Hyperplane`. For any nonempty finite coordinate
set, `PrimitiveNormal m` means that the gcd of the absolute integer
coordinates of `m` is one. The proof derives integer Bézout coefficients
from this condition.

For every such normal and every real shift `s`,
`shifted_hyperplane_maximum` constructs a real vector `x` with
`pairing m x = 0`. Its actual nearest-integer clearance equals

\[
\frac12-
\frac{\operatorname{distance}\!\left(\sum_i m_i(1/2-s_i)\right)}
     {\sum_i |m_i|}.
\]

Every other point in that real hyperplane has clearance at most this value.
Negative and zero normal coordinates are allowed.

| Export | Conclusion |
| --- | --- |
| `primitive_bezout` | Integer coefficients satisfy `∑ i, m i * e i = 1`. |
| `shifted_hyperplane_attainment` | An actual point in the real hyperplane attains the formula. |
| `shifted_hyperplane_value` | The supremum over that hyperplane equals the formula. |
| `shiftedVelocityValue_max` | The shifted integer-velocity supremum on `[0,1]` is attained. |
| `orthogonal_velocity_bound` | Every real time satisfies the upper bound when `∑ i, m i * v i = 0`. |
| `orthogonal_velocity_value_le` | The actual shifted velocity maximum satisfies the upper bound. |

An individual velocity circle receives an upper bound. Its equality cases
require further arguments. The construction uses rounding and the proved
Bézout identity, with no density or lattice-counting premise.

## Sources and verification

- [Integer arithmetic and Bézout coefficients](../../lean/Conjectures/LonelinessHyperplaneArithmetic.lean)
- [Circular distance, shifted values, and continuity](../../lean/Conjectures/LonelinessHyperplaneBasic.lean)
- [Exact hyperplane maximum and velocity bound](../../lean/Conjectures/LonelinessHyperplane.lean)

All three modules passed strict source checks on 18 November 2026 (America/Chicago),
using Lean 4.35.0 and the repository's pinned Mathlib commit
`56a005855ea17e0b0958f73ec801ae140b0a1679`.
The source checks used one worker, a 2500 MB cap, and warnings as errors.
Each module then passed a separate `leanchecker` replay with exit status zero.

The module-owned audit checked 41 theorem declarations, including private
declarations. It also rejected any unapproved module-owned axiom.
All transitive axiom dependencies were among `propext`, `Classical.choice`,
and `Quot.sound`. Five headline axiom prints confirmed exactly that set.
These are local module receipts. The deterministic three-module component is
registered in the accepted root, required endpoint audit, and kernel replay
list. Hosted checks are recorded separately.

## Remaining assertions

The full note remains partially formalized. The
[probability candidate](../../lean/Conjectures/LonelinessHyperplaneProbability.lean)
and [Haar-profile candidate](../../lean/Conjectures/LonelinessHyperplaneHaarValue.lean)
are unregistered. Their complete source, axiom, and kernel checks remain
incomplete.

| Assertion | Required scope and remaining work |
| --- | --- |
| Uniform probability bound | The candidate uses all ordered positive distinct velocities in the relation box. It targets the actual supremum over torus shifts. |
| Nonempty samples | Real admissibility must imply a positive distinct integer witness. Probability statements apply after an explicit positive box threshold. Small boxes can have empty samples. |
| Fixed-shift limit | The uniform probability bound must imply convergence to the exact profile for each fixed shift. |
| Independent Haar shift | The actual velocity maximum must converge in distribution to the stated uniform law. The profile's Haar distribution alone does not prove this limit. |
| Exact threshold counts | For fixed `s` and real `u < L_m(s)`, the counted event is `L(v,s) ≤ u`. A recursive cover inside arbitrary rational subspaces remains necessary. |
| Quasipolynomial counts | The exact count must be a quasipolynomial for every integer `N ≥ 1`. Its nonzero degree must be at most `k − 2`. The sample denominator also needs an exact count theorem. |
| Endpoint probability | This assertion assumes `s = 0` and every normal coordinate is nonzero. It needs the maximizer classification, exact residue criterion, residue frequencies, and summable tails. |
| Sharpness of the rate | The example requires exact counts and values for the positive multiples of `(1,2,3)`. The attaining time for `g(1,2,3)` is `1/(4g)`. |

The main probability statement permits zero normal coordinates. The
endpoint statement has the additional nonzero-coordinate assumption.
Every probability uses all admissible velocities, with their multiplicities.
A uniform sample of primitive directions is a different model.

The uniform approximation argument uses orbit density at half the requested
tolerance. A pointwise strict bound alone does not establish the same strict
bound for a supremum.

The proposed endpoint proof counts residue classes directly in the original
box. For each positive `Q`-smooth divisor `g`, it uses `φ(Q)` classes modulo
`gQ`. Their expected density is `φ(Q)/(gQ)^(k−1)`. A fixed lattice translation
compares classes through lower-dimensional boundary counts. The tail uses
the convergent reciprocal-power series over `Q`-smooth integers.

This series converges also in dimension one. The case `k = 2` needs explicit
treatment because every sampled circle is already the containing torus.
The exact quasipolynomial claim remains separate from this residue argument
and the elementary `O(1/N)` probability route.
