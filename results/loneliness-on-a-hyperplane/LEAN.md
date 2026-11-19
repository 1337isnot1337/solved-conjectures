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

The full note still requires the finite exceptional-subspace cover and
admissible lattice counts for its uniform `O(1/N)` probability bound.
The Haar-shift distribution, quasipolynomial threshold counts, and sharpness
of that rate remain separate obligations. The exact-attainment probability
also requires the full-support maximizer classification and primitive
residue-class equidistribution.
