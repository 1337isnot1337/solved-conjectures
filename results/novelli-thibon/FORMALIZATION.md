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

Lean now checks the [literal diagram](../../lean/Conjectures/NovelliThibonDiagram.lean):
French reading order, the within-row and adjacent-row attacks, and
the vertical optional edges. It counts the leg-label fibers by the
original row lengths and proves the exact cancellation of the
adjacent-row count against the arm sum. For each fixed selection of
inversion indicators, Lean verifies the full
[optional-edge normalization](../../lean/Conjectures/NovelliThibonSourceNormalization.lean)
in the convention of Definition 5.3, including signed Laurent
exponents after canceling the powers of (q-1) and (q).

For the normalized finite-alphabet cell-filling expansion, Lean proves
the constant term and the full simultaneous
[first-order formula](../../lean/Conjectures/NovelliThibonFillingFirstOrder.lean)
of equations (9)–(11). It works in actual Mathlib dual numbers over any
commutative ring, for every diagram and every finite ordered alphabet.
No leg parameter is omitted: the formal support bound covers every
vertical edge.

The identification of the source LLT expansion (Lemma 4.2) with the
normalized filling expansion, the Schur/Pieri extraction, and the
adjacent hook claim are not verified here. This verifies neither
Conjecture 5.4 nor the general trace assertions.

- [Finite-alphabet comparison replay](verification/finite-alphabet-comparison/receipt.json)
- [Diagram and first-order replay](verification/diagram-first-order/receipt.json)
