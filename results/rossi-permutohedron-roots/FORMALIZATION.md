# Lean scope for Rossi’s permutohedron characteristic-polynomial conjecture

**Status: partial.** The target is Giovanni Rossi’s
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

The exponential and conjugate-pole estimates for the uniform sign grid,
the exact finite grid witnesses below 128, the identification of the
recurrence with the actual descent enumerator, and the equality with the
literal face-lattice characteristic polynomial are **not** established by
this Lean scope. They are separate from the reduction above. See the
[written proof](PROOF.md) and [original audit](AUDIT.md).

The [scoped receipt](verification/receipt.json) records strict compilation,
the complete owned-declaration axiom audit, and pinned stock-kernel replay.
