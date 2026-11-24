# Drury's permanent conjecture

Tracking issue: [#536](https://github.com/1337isnot1337/solved-conjectures/issues/536).

## Published resolution and credit

The conjecture is attributed to Stephen Drury in Fuzhen Zhang, “An update on a few
permanent conjectures,” *Special Matrices* 4 (2016), 305–316.

The counterexample formalized here is George Hutchinson, “A counterexample to the
Drury permanent conjecture,” *Special Matrices* 5 (2017), 301–302,
[DOI:10.1515/spma-2017-0022](https://doi.org/10.1515/spma-2017-0022).
The published article is also available through its
[author-uploaded full text](https://www.researchgate.net/publication/321412049_A_counterexample_to_the_Drury_permanent_conjecture).

## Statement audit

For every complex Hermitian positive-semidefinite matrix A of order N at least
two, let B be A with its first row and column removed. Let B[j] be B with its j-th
row and column removed. Drury's conjecture asserts

```text
(a11 per(B))^2 + (sum_{j=1}^{N-1} |a1,j+1|^2 per(B[j]))^2 <= per(A)^2.
```

The formal predicate quantifies over every N = n + 2 and uses mathlib
`Matrix.PosSemidef`, actual `Matrix.permanent`, and
`Complex.normSq`. Real parts express the real quantities in the source.
`firstMinor` and `secondMinor` delete exactly the stated rows and columns.
In particular, the second minor has order N - 2. This is not the different
inequality with order N - 1 minors.

The endpoint is `Published.Drury.not_druryConjecture`, in
[`PublishedDruryPermanent.lean`](../../../lean/Conjectures/PublishedDruryPermanent.lean).
It negates the full universal claim. A single order-four counterexample suffices.

## Exact witness and certificates

The Gaussian-integer matrix is 10000 times Hutchinson's displayed terminating
decimal correlation matrix:

```text
[10000,        -110+2225i,   2281-237i,   -1790-1755i;
 -110-2225i,   10000,        9140+1634i,  8974+541i;
 2281+237i,    9140-1634i,   10000,       8758-2433i;
 -1790+1755i,  8974-541i,    8758+2433i,  10000].
```

Positive scaling preserves the conjecture and its failure, because every term
has the same total degree. The formal endpoint uses this exact scaled matrix.

Exact arithmetic gives:

| Quantity | Value |
| --- | ---: |
| per(A) | 50033545799805685 |
| per(B) | 4996048920680 |
| per(B[1]), per(B[2]), per(B[3]) | 182622053, 180825357, 186209556 |
| sum of squared-entry/minor terms | 3027451213832335 |
| conjectured left side minus right side | 1860237333661068650893733233000 |

Positive semidefiniteness is supplied by an exact denominator-cleared LDL*
identity, not by floating-point eigenvalues. The source declares integer M,
positive integer diagonal D, and positive N such that N A = M D M*. The integer
identity is intended for kernel-reduced `decide`; generic matrix lemmas transport
it to complex positive semidefiniteness. Permanent calculations likewise use
a transparent finite permutation enumeration proved equal to mathlib's permanent.

This result concerns Drury's displayed inequality only. It makes no claim about
Chollet's conjecture.

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
