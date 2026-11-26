# Fractional powers of geometric sums and sharp coefficient-segment bounds

Principia Math in Progress proved Kovalev’s Conjecture 1.2 for the square root in September and posed fractional powers and sharp segment bounds as further questions. This supplement proves zero-freeness for exponents between zero and one-half and derives the stated segment bounds. [Earlier proof](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex).

- [Complete proof](PROOF.md)
- [Independent audit and prior work](AUDIT.md)
- [Discovery issue #444](https://github.com/1337isnot1337/solved-conjectures/issues/444)
- [Limits of the fractional-exponent extension](EXPONENT-SCOPE.md)

## Lean verification

Complete for the original square-root conjecture, every positive geometric-polynomial length, every Taylor-section degree, and the whole closed unit disk. The fractional-exponent and sharp-segment supplements remain unformalized.

- [Exact Lean scope and proof structure](FORMALIZATION.md)
- [Final statement review](LEAN_REVIEW.md)
- [Lean theorem](../../lean/Conjectures/KovalevZeroFree.lean)
- [Verification receipt](../../docs/verification/lean-kovalev-zero-free-complete-20261124-162051/receipt.json)
