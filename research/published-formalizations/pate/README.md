# Pate's conjecture

Tracking issue: [#537](https://github.com/1337isnot1337/solved-conjectures/issues/537).

## Published resolution and credit

Thomas H. Pate proposed the complementary permanental-compound conjecture in
“On permanental compounds,” *Linear Algebra and its Applications* 429 (2008),
1093–1101. This is a different conjecture from Pate's tensor-product conjecture.

The exact witness formalized here is Hoang Anh Tran, “A simple counterexample for
the permanent-on-top conjecture,” *Mathematical Inequalities & Applications*
25(1) (2022), 1–16, [DOI:10.7153/mia-2022-25-01](https://doi.org/10.7153/mia-2022-25-01).
See Conjecture 2 and Section 4 of the
[published article](https://files.ele-math.com/articles/mia-25-01.pdf), with the
[author's arXiv version 5](https://arxiv.org/pdf/2101.03428v5) as a cross-check.
Tran cites an earlier disproof by Drury for k = 1. This entry credits Tran's
particular witness and does not claim Tran supplied the first disproof.

## Statement audit

For every complex Hermitian positive-semidefinite A of order n and every
1 <= k < n, index C_k(A) by all k-element subsets I,J of {1,...,n}, and set

```text
C_k(A)[I,J] = per(A[I,J]) * per(A[I-complement,J-complement]).
```

Pate's conjecture asserts that per(A) is the largest eigenvalue of C_k(A).
The formal definition uses both complementary factors, every subset of the
specified size, and order-preserving enumerations of the subset and complement.
It uses mathlib's actual permanent and positive-semidefinite predicate.
`IsLargestEigenvalue` is `IsGreatest` of the set of real scalars admitting a
nonzero matrix-times-column eigenvector.

The endpoint `Published.Tran.not_pateConjecture` is in
[`PublishedTranPermanents.lean`](../../../lean/Conjectures/PublishedTranPermanents.lean).
It refutes the entire universal claim, using n = 5 and k = 2. This is not a
positive result restricted to a fixed dimension.

## Witness and proof plan

Tran's displayed matrix H is

```text
[3,      1-2i, -1,    1+2i, 1;
 1+2i,   3,    1-2i, -1,   1;
 -1,     1+2i, 3,     1-2i,1;
 1-2i,  -1,    1+2i, 3,    1;
 1,      1,    1,     1,    1].
```

It has permanent 504. The code proves positive semidefiniteness from G*G, where
G has rows (1,1,1,1,1), (-i,-1,i,1,0), and (-i,-1,i,1,0).
The repeated row replaces a square-root factor by an exact Gaussian-integer
Gram representation.

The nonzero column eigenvector for C_2(H) has eigenvalue 512. With zero-based
indices its coefficients are:

| Pair | Coefficient |
| --- | --- |
| {0,1} | -1-i |
| {1,2} | -1+i |
| {2,3} | 1+i |
| {0,3} | 1-i |
| {0,4} | 2i |
| {1,4} | 2 |
| {2,4} | -2i |
| {3,4} | -2 |
| Other pairs | 0 |

These are the conjugates of the source's tensor coefficients, as required by the
matrix-times-column convention used here. Exact offline arithmetic checked the
actual compound matrix against this vector. Its squared norm is 24.
Since 512 > 504, the permanent is not the largest eigenvalue.

## Source normalization caveat

The journal text preceding its displayed H appears to use a factor 2 in a vector
where the displayed matrix and the later tensor formula require sqrt(2). The
arXiv version 5 uses the compatible normalization. The formalization relies on
the displayed exact H and an independently checked Gram identity, so it does not
assume the inconsistent normalization.

## Status and verification

This is an incomplete formalization candidate for the published-result campaign
[#534](https://github.com/1337isnot1337/solved-conjectures/issues/534).
It does not count as a completed result. The current task explicitly authorizes
formalizing prior published resolutions; no mathematical discovery or priority is
claimed.

The local Lean 4.35.0 environment became unavailable during development. A prior
Drury draft reached and elaborated its standalone Gaussian-integer permanent
certificates, but the whole module failed elsewhere and no clean build artifact
was produced. The latest denominator-cleared factorization and the complete Tran
module have not yet received a clean Lean build. Exact offline arithmetic checks
are cross-checks, not substitutes for kernel verification.

Completion requires both modules to compile, the endpoint theorems to pass the
repository's axiom and stock-kernel checks, and an independent source-to-statement
audit. No `sorry`, `admit`, project-specific axiom, or `native_decide` is used in
the candidates.

Repository main/research, related issues and PRs, and current mathlib were screened
for these results. No full matching formalization was found. That screening is
not a global priority claim.
