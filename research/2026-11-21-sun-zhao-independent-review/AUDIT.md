# Independent review of the disproof of Sun–Zhao's conjecture

**Confirmed prior resolution, 21 November 2026:** the [complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex) is pinned at Principia commit `34b8b155d7db464ad7306f70b16d3af9cee34501`, 27 October 2026, 02:59:18 UTC. It uses the identical twelfth ratio iteration, retained indices 12, 13, 14, and an exact integer-product certificate from the same fifteen source terms. The internal manuscript date of 11 September is not the publication evidence. This campaign's counterexample is a rediscovery and is definitively excluded from new-result counts. Historical mathematical and access checks below are preserved; their former priority conclusions are superseded.

Review date: 21 November 2026. Reviewer: the current group's graph/number-theory worker, independently of the parallel group that authored the result.

Reviewed [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/fa34b035f4853c8e790bd520171739ee17923a56/results/sun-zhao-iterated-ratios/PROOF.md), blob `fe1eae10747b29a27519d148f513b4937ae117ae`, and the exact primary statement. **Verdict: the complete disproof of Conjecture 5.2 in arXiv:1602.04359v4 passes mathematical and source-scope review.** The separate priority assessment now confirms a complete earlier public disproof. The full journal version was not read in this original mathematical review and is not presumed here to have identical wording.

## 1. Primary source and precise truncation

The primary source is Brian Y. Sun and James J. Y. Zhao, *Log-behavior of two sequences related to the elliptic integrals*, [arXiv:1602.04359v4](https://arxiv.org/pdf/1602.04359v4). I opened the full PDF, checked recurrence (1.1) and the initial conditions on printed page 1, and read the exact ratio definition and Conjecture 5.2 on printed page 14, including a rendered screenshot.

The final-section operator is explicitly the forward ratio indexed from zero:

```math
\mathcal R(a)_n=\frac{a_{n+1}}{a_n},\qquad n\ge0.
```

The conjecture quantifies over every positive integer iteration order $`k`$ and removes the first $`k`$ terms of the resulting sequence. Therefore it removes indices $`0,\ldots,k-1`$ and retains indices $`k,k+1,k+2,\ldots`$. It requires log-convexity at even orders and log-concavity at odd orders. There is no unspecified eventual threshold that can replace this explicit deletion.

At order twelve, the three compared entries at indices 12, 13, and 14 are retained. The middle index is 13. The earlier discussion of ordinary ratios with a different indexing convention does not change the explicit final-section definition. Terms are deleted after taking the twelfth ratio; the index is not shifted by twelve a second time.

## 2. Ratio iteration, forward differences, and the sign

For a positive sequence, define $`\Delta f(n)=f(n+1)-f(n)`$. Induction on the iteration order gives

```math
\log(\mathcal R^k a)_n=\Delta^k\log a_n.
```

For $`b=\mathcal R^{12}P`$, the logarithm of the relevant log-convexity quotient is consequently

```math
\log\frac{b_{12}b_{14}}{b_{13}^2}
=\Delta^2\log b_{12}
=\Delta^{14}\log P_{12}
=\sum_{j=0}^{14}(-1)^j\binom{14}{j}\log P_{12+j}.
```

The last sign is correct because the forward-difference order is even. The log-convexity assertion would require the displayed expression to be nonnegative. A strictly negative value gives $`b_{13}^2>b_{12}b_{14}`$, which is the opposite inequality.

The block $`P_{12},\ldots,P_{26}`$ has fifteen terms. Each ratio application decreases its length by one, so twelve applications leave exactly the required three entries. This also checks the finite block length independently of the binomial difference formula.

## 3. Source-sequence values

I independently implemented the primary recurrence

```math
P_0=1,\quad P_1=8,\qquad
n^2P_n=8(3n^2-3n+1)P_{n-1}-128(n-1)^2P_{n-2}.
```

The implementation uses exact rational division and checks that each result is a positive integer. Its values through index 26 reproduce all fifteen integers in the submitted proof. No source-checker code or saved numerical output is imported.

The recurrence and initial values uniquely identify the source sequence on the required block. Positivity holds for every value used, so all intermediate ratios and all logarithms in the certificate are defined. The proof does not exploit a negative term or a zero denominator.

## 4. Rational logarithmic certificate

Set

```math
x_j=\frac{32P_{12+j}}{16^{12+j}},\qquad
u_j=\frac{x_j-1}{x_j+1},\qquad 0\le j\le14.
```

All $`x_j`$ are positive, and direct rational comparisons verify $`|u_j|\le1/3`$. Since

```math
\log x_j=\log P_{12+j}+\log32-(12+j)\log16,
```

the fourteenth difference is unchanged: the added function of $`j`$ is affine and is annihilated by the difference operator.

For $`|u|<1`$, the convergent logarithm series gives

```math
\log\frac{1+u}{1-u}
=2\sum_{r=0}^{23}\frac{u^{2r+1}}{2r+1}+\epsilon(u).
```

The last retained power is 47 and the first omitted power is 49. Thus

```math
|\epsilon(u)|
\le2\sum_{r=24}^{\infty}\frac{|u|^{2r+1}}{2r+1}
\le\frac{2|u|^{49}}{49(1-u^2)}.
```

The submitted manuscript's counterexample uses the rational approximation

```math
S=2\sum_{j=0}^{14}(-1)^j\binom{14}{j}
\sum_{r=0}^{23}\frac{u_j^{2r+1}}{2r+1}.
```

The sum of the absolute binomial weights is $`2^{14}`$, so its uniform error bound is exactly

```math
|D-S|\le E,
\qquad
E=\frac{2^{15}}{49(1-1/9)3^{49}},
\qquad D=\Delta^{14}\log P_{12}.
```

There is no missing factor of two or off-by-one truncation error.

My independent checker verifies both strict rational comparisons

```math
-\frac{185605}{10^{15}}<S-E,
\qquad
S+E<-\frac{185604}{10^{15}}.
```

It also uses a separate interval route: form an individual interval for each $`\log x_j`$ with its own remainder bound, then apply fourteen interval forward differences. If $`X\in[a,b]`$ and $`Y\in[c,d]`$, the next interval is $`Y-X\in[c-b,d-a]`$. This reconstructs a valid final enclosing interval without forming a single weighted error sum. Its endpoints lie strictly inside the same proposed rational bounds.

Both routes therefore establish

```math
-\frac{185605}{10^{15}}
<\Delta^{14}\log P_{12}
<-\frac{185604}{10^{15}}<0.
```

Every operation in these comparisons is rational arithmetic. No floating-point logarithm, rounded decimal, or heuristic error tolerance is used.

## 5. Independent multiplicative checks

The same implementation constructs the two integers

```math
A=\prod_{j\text{ even}}P_{12+j}^{\binom{14}{j}},
\qquad
B=\prod_{j\text{ odd}}P_{12+j}^{\binom{14}{j}},
\qquad 0\le j\le14.
```

It verifies $`A<B`$ directly. Both integer products have exactly 582,535 binary digits, matching the submitted certificate. Since $`D=\log(A/B)`$, this is an independent exact sign check.

Finally, twelve successive ratio applications to the required block, implemented with exact rational numbers, leave three positive values and verify that the square of the middle value strictly exceeds the product of the outer values. This confirms the translation back to the conjectured inequality.

The [independent checker](check.py) and its [recorded output](verification.json) accompany this audit. The code uses only the Python standard library and imports none of the submitted implementation. Its interval-difference route is separate from the submitted uniform weighted-sum route. All checks pass.

## 6. Resolution scope and remaining priority limits

This is an exact counterexample to the whole printed universal Conjecture 5.2 in the inspected arXiv version. The use of one admissible iteration order does not turn the result into a positive fixed-order special case: that universal claim is false once one required inequality fails. The proof establishes the strict failure itself, rather than inferring it from numerical near-cancellation.

It does not prove that every larger iteration order fails. It does not refute a different conjecture with an unspecified order-dependent eventual threshold. The determinant-transform Conjecture 5.1, the other sequence's Conjecture 5.3, and the earlier first-ratio and root-sequence theorems are different assertions.

The package's [NOVELTY.md](https://github.com/1337isnot1337/solved-conjectures/blob/fa34b035f4853c8e790bd520171739ee17923a56/results/sun-zhao-iterated-ratios/NOVELTY.md) records the separate search for earlier resolutions. This review did not repeat that full search. In particular, the complete 2020 journal article and the author's Maple archive remain access limits in that audit. The exact statement verified here is arXiv:1602.04359v4; this review makes no assertion that the journal's final wording is unchanged. No mathematical or source-scope gap was found in the inspected claim. Priority and external acceptance are separate questions.

## 7. Contemporaneous campaign provenance

The initial campaign main head was `b50fa6e4f1d18ceee74d2500bd43faeca4f13208`. I checked its README, CONTENTS, and HISTORY, with respective blob SHAs `afa18f0a812f85446bc3836ecfe7b82871470a7b`, `438fb8b9abcc6feb764a4831dd9992c27a392a61`, and `528c5961a5293e6b5e6c2a6477d5b1d706ecd8e9`. There were no matches for Sun–Zhao, the source identifier, Larcombe, Fennessey, or the iterated-ratio target.

[Coordination issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156) opened at `2026-11-21T06:22:12Z`. [Target issue 198](https://github.com/1337isnot1337/solved-conjectures/issues/198) opened at `2026-11-21T07:19:27Z` and records the exact candidate and pending reviews.

The full-proof path `results/sun-zhao-iterated-ratios/PROOF.md` has one publication entry in the retrieved path history: commit [`fa34b035f4853c8e790bd520171739ee17923a56`](https://github.com/1337isnot1337/solved-conjectures/commit/fa34b035f4853c8e790bd520171739ee17923a56), with author and committer timestamps both `2026-11-21T07:29:04Z`. Its parent is `7cdfb23dd8c11c4f6875d5639b7a9195cf4a207f`.

This supports attribution as a new parallel-campaign package, followed by the present group's independent review. It is not an initial catalogue result being re-counted. Repository provenance does not by itself certify external mathematical priority.

No shared index or result file is modified by this research-only audit. The coordinating worker retains this package outside the joint strict tally pending the concrete journal-version and author-archive checks. Mathematical correctness and exact arXiv scope pass; the remaining source/priority gates are not silently treated as complete.

