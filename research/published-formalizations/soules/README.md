# Soules's permanent-on-top conjecture

Tracking issue: [#538](https://github.com/1337isnot1337/solved-conjectures/issues/538).

## Published resolution and credit

George Soules proposed the permanent-on-top conjecture in his 1966 University of
California, Santa Barbara dissertation, *Matrix Functions and the Laplace
Expansion Theorem*.

The first disproof is credited to Valery S. Shchesnovich, “The permanent-on-top
conjecture is false,” *Linear Algebra and its Applications* 490 (2016), 196–201,
[DOI:10.1016/j.laa.2015.10.034](https://doi.org/10.1016/j.laa.2015.10.034).

This entry instead formalizes Hoang Anh Tran's later simpler witness in
“A simple counterexample for the permanent-on-top conjecture,”
*Mathematical Inequalities & Applications* 25(1) (2022), 1–16,
[DOI:10.7153/mia-2022-25-01](https://doi.org/10.7153/mia-2022-25-01).
See Conjecture 1 and Section 4 of the
[published article](https://files.ele-math.com/articles/mia-25-01.pdf), also
[arXiv:2101.03428v5](https://arxiv.org/pdf/2101.03428v5).
No first-disproof or new-counterexample credit is claimed for this formalization.

## Statement audit

For every complex Hermitian positive-semidefinite matrix A of order n, let its
Schur power be the matrix indexed by all permutations sigma,tau in S_n:

```text
Pi(A)[sigma,tau] = product_i A[sigma(i),tau(i)].
```

The conjecture asserts that per(A) is the largest eigenvalue of Pi(A).
The formal predicate quantifies over all n and all complex matrices satisfying
mathlib's `Matrix.PosSemidef`. It includes every permutation, not a selected
submatrix. `IsLargestEigenvalue` means `IsGreatest` of the real scalars with
nonzero matrix-times-column eigenvectors.

The endpoint `Published.Tran.not_soulesConjecture` is in
[`PublishedTranPermanents.lean`](../../../lean/Conjectures/PublishedTranPermanents.lean).
A single valid order-five witness refutes the full universal statement.

## Witness and proof plan

The matrix is exactly the H displayed in the
[Pate entry](../pate/README.md). Its permanent is 504 and its complex
positive-semidefinite property follows from an exact Gram identity.
The Schur power has order 5! = 120. The code defines it directly on
`Equiv.Perm (Fin 5)`.

The column vector is w(sigma) = c({sigma(0),sigma(1)}), where c is the
conjugate-coefficient vector tabulated in the Pate entry. The intended
kernel certificate checks every permutation row of the full Schur power:
Pi(H) w = 512 w. The vector is nonzero, so 512 is an eigenvalue. Because
512 > per(H) = 504, the conjectured largest-eigenvalue assertion fails.

A finite list enumerating every permutation makes the exact calculation
reducible by the kernel. A separate membership argument transfers the
calculated rows to the full permutation-indexed matrix. The permanent
enumeration is likewise proved equal to mathlib's standard permanent.

The normalization and conjugation caveats in the Pate entry apply here too.
Pate's and Soules's conjectures are distinct universal statements, even though
Tran's H refutes both. Neither target is claimed complete until its own endpoint
passes all verification gates.

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
