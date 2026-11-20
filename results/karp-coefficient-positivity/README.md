# Karp's coefficient-positivity conjecture

Status: previously resolved. [Principia Math In Progress, MathDB 323156](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-323156/mathdb-323156-solution.tex), dated 11 September 2026, already proves the exact full conjecture. This independently developed proof is retained as exposition and is excluded from new-resolution claims. See [the corrected prior-work audit](NOVELTY.md).

This directory gives a proof of Conjecture 1 in D. Karp's *Positivity of Toeplitz determinants formed by rising factorial series and properties of related polynomials*. The theorem applies to every degree, every pair of positive shifts, and every nonnegative strictly log-concave input sequence in the conjecture. The proof also supplies an explicit positive lower bound for each coefficient.

The source is [arXiv:1203.1482v1](https://arxiv.org/abs/1203.1482v1), Section 1, equation (3), Conjecture 1, page 2. The published versions are POMI 404 (2012), 184–198, and Journal of Mathematical Sciences 193(1) (2013), 106–114, DOI [10.1007/s10958-013-1438-y](https://doi.org/10.1007/s10958-013-1438-y). The [original published PDF](https://www.mathnet.ru/php/getFT.phtml?jrnid=znsl&option_lang=eng&paperid=5267&what=fullt) has the statement on printed page 185.

## The statement

Write $(x)_k=x(x+1)\cdots(x+k-1)$, with $(x)_0=1$. Let $n\geq3$, $\alpha,\beta>0$, and let $f_0,\ldots,f_n$ be nonnegative real numbers with

```math
f_k^2>f_{k-1}f_{k+1},\qquad 1\leq k\leq n-1.
```

Define

```math
Q_n^{\alpha,\beta}(x)
=\sum_{k=0}^n f_kf_{n-k}\binom nk
\left[(x+\alpha)_k(x+\beta)_{n-k}
 -(x+\alpha+\beta)_k(x)_{n-k}\right].
```

The conjecture asserts that $Q_n^{\alpha,\beta}$ has positive coefficients at every $x^j$, $0\leq j\leq n-2$. We prove that its degree is exactly $n-2$ and, more precisely,

```math
[x^j]Q_n^{\alpha,\beta}(x)
\geq(f_1f_{n-1}-f_0f_n)\binom nj
\left[(\alpha+\beta)^{n-j}-\alpha^{n-j}-\beta^{n-j}\right]>0.
```

Vanishing endpoints $f_0$ or $f_n$ are allowed. Strict log-concavity forces the interior terms to be positive, and the proof checks these endpoint cases explicitly.

## Why the proof works

Strict log-concavity makes the symmetric weights $f_kf_{n-k}$ increase toward the middle. This decomposes the original polynomial into positive multiples of differences of central tails of the rising-factorial Vandermonde sum.

For each central tail, count permutations whose cycles are colored red or blue and whose red vertices occupy a central interval of possible sizes. Mark one cycle and change its color. The uncancelled objects give an exact sum of nonnegative two-by-two minors of the unsigned Stirling-number triangle. This proves that each homogeneous part of the central tail has binomial-normalized coefficients increasing toward the middle.

That coefficient inequality gives a nonnegative polynomial after taking the difference of the two partial derivatives and dividing by the difference of the arguments. Integrating this polynomial along the line that transfers one positive shift between the two arguments proves nonnegativity of every tail coefficient. The first tail is an explicit mixed finite difference of $(x)_n$ and makes every required coefficient strictly positive.

The Stirling-number positivity fact and the Vandermonde identity are classical; the proof includes both needed arguments. The marked-cycle application gives an independent proof of the entire conjecture; it does not establish a new resolution.

## Files and checks

- [PROOF.md](PROOF.md) contains the self-contained proof and the exact marked-cycle identity.
- [NOVELTY.md](NOVELTY.md) identifies the source, records the literature search, and separates adjacent conjectures with prior resolutions.
- [verify.py](verify.py) contains exact diagnostic checks using only the Python standard library.

Run:

```sh
python3 results/karp-coefficient-positivity/verify.py
```

The recorded output is:

```text
PASS: 46230 literal colored permutations, 280 coefficient comparisons
PASS: 2528 exact marked-cycle identities through n=16
PASS: 120 source-polynomial checks at exact rational shifts, n=3,...,12
The all-parameter proof is in PROOF.md; finite checks are diagnostic only.
```

The first check enumerates permutations and their cycle colorings independently of the Stirling-number formula. The second checks the cancellation identity in integer arithmetic. The third constructs the source polynomial directly with rational shifts and checks its degree, coefficient signs, and the explicit lower bound, including input sequences with zero endpoints. These finite checks are not the proof.

## Attribution and status

The primary source attributes this conjecture to Karp alone. Karp–Sitnik proved the earlier pointwise-positivity theorem; pointwise positivity does not imply positivity of individual coefficients. A secondary database combines the names, so its attribution is not adopted here.

The argument was developed by the repository's research agents and has separate internal mathematical reviews. No outside peer review or author confirmation is claimed. A later GitHub archive check on 20 November 2026 found the earlier complete proof linked above. The initial search conclusion was incorrect and is superseded by [NOVELTY.md](NOVELTY.md). This target is excluded from the campaign's newly resolved conjectures.

The neighboring Hurwitz-stability conjecture already has public counterexamples. The neighboring Pólya-frequency real-zero conjecture has a separate recent proof claim. Neither is used or counted as a new result here.

Research discussion: [issue #89](https://github.com/1337isnot1337/solved-conjectures/issues/89).
