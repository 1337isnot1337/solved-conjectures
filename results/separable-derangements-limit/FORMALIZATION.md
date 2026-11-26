# Lean verification of the separable derangement limit

The [written proof](PROOF.md) gives the limit in Dougherty-Bliss,
Galván, Polley, and Shuster’s Conjecture 15 and answers Vatter’s
Question 4.5. The Lean scope below verifies the displacement
identities used to study diagonals of the finite permutations.
[Conjecture 15](https://arxiv.org/html/2608.27583v1#S7) ·
[Vatter’s Question 4.5](https://arxiv.org/html/2602.16355v3#S4).

- [Displacements](../../lean/Conjectures/SeparableDerangementDisplacement.lean).
  The finite permutation is the repeated direct or skew sum of its
  actual child permutations. Lean checks that direct sums preserve
  displacements and skew sums add the sum of lengths after a block
  minus the sum before it. It identifies the position map with the
  canonical enumeration of consecutive blocks. At a skew sum, every
  position in an earlier block has strictly larger displacement than
  every position in a later block. The two-block definition follows
  the [upstream CKZ block sum](../../lean/Conjectures/CKZUpstream/D5/S1/Words/Patterns/Separable/CutFactorization.lean)
  using the same Mathlib finite equivalences.
- [Diagonal counts](../../lean/Conjectures/SeparableDerangementDiagonalCounts.lean).
  Lean identifies the fiber at displacement zero with the fixed
  points. For any integer displacement, the point count is the sum
  of the child point counts on their shifted diagonals. In a skew sum,
  at most one shifted child count can be positive.

The full limit, the spine and probability arguments, and the
convergence of fixed-diagonal counts remain outside this checked scope.

The pinned Lean 4.35.0 gate rebuilt both project modules with warnings
as errors, audited every declaration owned by the closure, and
independently replayed their objects with the stock kernel.
[Verification receipt](verification/diagonal-counts/receipt.json) ·
[Tracking issue #732](https://github.com/1337isnot1337/solved-conjectures/issues/732).
