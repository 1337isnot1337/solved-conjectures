# Gilmore's crossing–nesting conjecture

Status: proved by the argument in [PROOF.md](PROOF.md). Independent internal audit passed. Research date: 20 November 2026. [Issue 79](https://github.com/1337isnot1337/solved-conjectures/issues/79).

Tomack Gilmore's *Trees, forests, and total positivity: I. q-trees and q-forests matrices*, Electronic Journal of Combinatorics 28(3) (2021), P3.54, states this as **Conjecture 6.16**, equation (6.133), printed page 65. The arXiv v2 numbering is **Conjecture 6.11**, equation (6.130).

For the matrix $M=(m_{n,k})$ defined by Gilmore's product of shifted inverse bidiagonal matrices, the conjecture asserts, for every $n>1$,
```math
m_{n,1}(r,s,1,1)=
\sum_{\pi\in\mathcal M_{2(n-1)}}r^{\mathop{\mathrm{cr}}(\pi)}
s^{\mathop{\mathrm{ne}}(\pi)}.
```

The proof establishes the stronger identity
```math
m_{n,1}(r,s,\mu,y)=y^{n-1}
\sum_{\pi\in\mathcal M_{2(n-1)}}
r^{\mathop{\mathrm{cr}}(\pi)}s^{\mathop{\mathrm{ne}}(\pi)}
\mu^{\mathop{\mathrm{al}}(\pi)}
```
as a polynomial identity for every $n\ge1$. Here $\mathop{\mathrm{al}}$ counts disjoint, nonoverlapping arc pairs.

The matrix product gives the recurrence
```math
m_{n,k}=y[k]_{r,s}m_{n,k+1}+
\mu^{n-k}m_{n-1,k-1}.
```
This is the last-step recurrence for weighted Dyck prefixes. At $k=1$, the prefixes become Dyck excursions, and the classical matching encoding gives the stated crossing, nesting, and alignment weights.

## Files

- [PROOF.md](PROOF.md): complete proof, exact matrix definition, boundary conditions, and parameter interpretation.
- [NOVELTY.md](NOVELTY.md): primary sources, search scope, and distinction from classical matching continued fractions.
- [verify.py](verify.py): independent exact comparison of the original matrix product, recurrence, and literal matchings.

Run the verifier with Python 3:

    python3 results/gilmore-crossing-nesting/verify.py

All 64 entries of the leading 8-by-8 matrix agree with the recurrence; literal perfect matchings agree through 12 vertices, with all four variables indeterminate. These finite checks supplement the unrestricted proof.

The known matching continued fraction is not claimed as new. The result is its identification with Gilmore's matrix. No prior resolution of that exact assertion was found in the documented searches; the search cannot exclude unpublished or unindexed work.

The neighboring shifted reverse Bessel Hankel-total-positivity conjecture remains open.

## Sources

- [Published article, DOI 10.37236/10465](https://doi.org/10.37236/10465).
- [Published PDF repository record](https://discovery.ucl.ac.uk/id/eprint/10138471/).
- [arXiv v2](https://arxiv.org/abs/2106.00656v2).

The [complete Lean formalization](../../lean/Conjectures/GilmoreCrossingNesting.lean)
proves the source conjecture in `GilmoreCrossingNesting.original_conjecture`
and the four-parameter identity in `GilmoreCrossingNesting.gilmore_conjecture`,
for every `n ≥ 1` over any commutative ring. It starts from the actual stabilized
product of shifted inverse bidiagonal matrices. The matching decoder is
surjective and injective in canonical closing-end order, and the weights are
identified with literal crossings, nestings, alignments, and size.

Fresh strict source compilation, an all-owned audit of 449 declarations and all 20 required theorem endpoints, and independent stock-kernel replay passed. Only `propext`, `Classical.choice`, and `Quot.sound` occur as transitive axioms. [Validation receipt](../../docs/verification/lean-named-20261121/gilmore-receipt.json). The combined repository gate and hosted validation remain separate.
