# Lean scope for Novelli–Thibon's conjecture

Partial Lean verification of the existing [written proof](PROOF.md)
of the intended Conjecture 5.7 in the
[primary source](https://arxiv.org/html/2502.09072v2#S5.SS7).
The published index correction and attribution are unchanged.

Lean constructs left-to-right standardization by stable sorting.
It checks that the inverse-descent fundamental word condition is
exactly the fiber of that standardization, and proves the strict
comparison identity for any distinct ordered positions. The
[linear response](../../lean/Conjectures/NovelliThibonLinearResponse.lean)
sums the identity with arbitrary weights on the ordered comparisons.
It holds in any finite ordered alphabet and in any commutative
semiring, including rings with signed edge contributions. This is
the exact comparison identity in §2 of the written proof, not a
finite numerical test of particular shapes.

The source-specific attacking and optional-edge formulas, the
Schur/Pieri extraction, and the adjacent hook claim are not yet
formalized in this checkpoint. It does not settle Conjecture 5.4
or the general trace assertions. See the
[scoped pinned replay receipt](verification/finite-alphabet-comparison/receipt.json).
