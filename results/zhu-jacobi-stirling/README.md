# Zhu's generalized Jacobi–Stirling conjecture

[Catalogue](../../CONTENTS.md) · [Disproof](PROOF.md) · [Sources](SOURCES.md) · [Independent audit](AUDIT.md)

## Result

The unweighted generalized Jacobi–Stirling row polynomials do not form a coefficientwise Hankel-totally-positive sequence. With the source parameters renamed, put

```math
J_{0,0}=1,\qquad J_{n,k}=J_{n-1,k-1}+(ak^2+bk)J_{n-1,k},
\qquad P_n(x)=\sum_{k=0}^n J_{n,k}x^k,
```

where entries outside the triangle are zero. The exact determinant identity is

```math
\det(P_{i+j}(x))_{0\le i,j\le2}
=2x^3\bigl[(a+b)(2a+b)(3a+b)-2a^2x\bigr].
```

The coefficient of the monomial a squared times x to the fourth power is minus four. This disproves the complete universal conjecture. The same formula gives a negative determinant for every positive a, nonnegative b and x greater than the product (a+b)(2a+b)(3a+b) divided by twice a squared. In particular, the strictly positive choice (a,b,x)=(1,1,13) gives −8788.

The conjecture is the unweighted assertion in §5.2 of Zhu's paper, immediately after equation (5.10). Proposition 5.7 concerns the different factorial-weighted sequence.

## Review and priority

A separate internal audit checked the source normalization, derived the polynomial identity independently, and verified the strict interior counterexample. The [source audit](SOURCES.md) records primary and adjacent papers, both search engines, and public solution archives. No earlier disproof was located within the stated search scope. The notes remain unrefereed, with the source-access and indexing limits recorded explicitly.

**Lean status:** none.

## Reproduce

From the repository root:

```bash
python3 results/zhu-jacobi-stirling/verify.py
```

The standard-library script constructs sparse integer polynomials directly from the triangle recurrence and expands the determinant over its six permutations. It verifies the entire identity over the integer polynomial ring; the short hand proof is in [PROOF.md](PROOF.md).

## Source

Bao-Xuan Zhu, *Coefficientwise Hankel-total positivity of the row-generating polynomials for the output matrices of certain production matrices*, Advances in Mathematics 444 (2024), 109695, [doi:10.1016/j.aim.2024.109695](https://doi.org/10.1016/j.aim.2024.109695), [author manuscript](https://arxiv.org/pdf/2202.03793), §5.2, printed page 24.

Research and review: [issue 163](https://github.com/1337isnot1337/solved-conjectures/issues/163).
