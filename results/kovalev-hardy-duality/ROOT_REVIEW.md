# Root review

Reviewed on 21 November 2026. This review supports the proposed disproof of Kovalev's Conjecture 6.1. It is an internal mathematical review, not external refereeing. The source audit and its limits are recorded separately in `SOURCES.md` and `PRIOR_AUDIT.md`.

## Exact source and scope

I inspected the downloaded primary paper, [Hardy-type norms of matrices, arXiv:2607.17373v1](https://arxiv.org/abs/2607.17373), including the definition of the dual norm, Conjecture 6.1 on printed page 9, and the projection calculation in (6.4)–(6.5). The PDF retrieved from the current unsuffixed arXiv endpoint still identifies itself as version 1. Its SHA-256 is `5c6423b5bfa42808a1729f4d6aa40123b821e56b6b6cb18a6e5f22e0ac8f592c`.

The source conjectures two inequalities for every real square matrix of order greater than two. A counterexample to its lower inequality disproves that conjunction. The package does not claim to settle the separately stated upper inequality (6.6). Nor does it claim that the displayed threshold is the first failing dimension.

The counterexamples cover every order at least 500001. They are exact positive diagonal matrices defined by finite Gaussian expectations. Their entries need not be rational for them to be legitimate matrices in the source's domain. Their defining integrands are integrable and positive almost surely.

## Independent mathematical checks

I derived the supporting functional independently. For positive diagonal input, the matrix

```math
A=n\,\mathbb E\frac{(BU)U^T}{|BU|}
```

has dual norm one for the normalized trace pairing. For every real matrix $`C`$, pointwise Cauchy–Schwarz bounds its pairing with this matrix by $`\mathbb E|CU|`$, and the normalized input attains equality. Gaussian radius independence and sign symmetry give precisely the diagonal matrix in the proof. This establishes the equality over the full matrix space, including nondiagonal competitors.

The spherical fourth moment and the rank-two projection constant cancel exactly to give

```math
\bigl(c_n\|A\|_{H^4}\bigr)^4
=\frac8{\pi^2}\left[\left(\sum_i g_i^2\right)^2
+2\sum_i g_i^4\right].
```

I checked all factors of the order and of the Gaussian mean radius. The strict inequality needed to refute the source is in the correct direction.

For the chosen input matrix, permutation symmetry gives the small gradient coordinates even though the individual Gaussian squares are not independent of their common denominator. The proof does not assume that invalid independence. Conditional Jensen gives the first lower bound. The pointwise inequality for the second integrand holds on both sides of one. Its expectation factors only after using the genuine independence of the large coordinate and the chi-square average.

The average has mean one and variance $`2/k`$. Consequently the loss in its truncated expectation is at most $`1/\sqrt{2k}`$. At every integer $`k\geq500000`$, this is at most $`1/1000`$. This argument supplies an explicit bound for each finite dimension in the stated infinite family; no interchange of an unproved limit is needed.

I independently rederived both Bessel integral formulas by substituting $`G=\sqrt c\sinh t`$. The factors agree with the written proof. Differentiating the zeroth-order Bessel series uses $`L(z)=\log(2/z)-\gamma`$ before substituting the fixed argument. The geometric bounds on the positive series and their derivatives are valid because $`H_j\leq j`$ and $`1/(j!)^2\leq1`$. An upper bound substituted in each negative contribution gives the stated positive lower bound for the Bessel difference.

The logarithmic tails, alternating arctangent tails, and harmonic-number remainder for Euler's constant all have the asserted directions. In particular, the lower Euler remainder follows from the integral bound for the positive reciprocal-square tail; the upper remainder telescopes. These estimates prove the coarse constants needed for the two expectation bounds.

## Arithmetic replay

I read every operation in `verify.py` and replayed it locally. All required operations use exact integers or `fractions.Fraction`. The script returned `ALL_RATIONAL_COMPARISONS_PASSED` and reproduced the final positive gap

```math
\frac{8370960719747393508158728849}
{20430400000000000000000000000000}>0.
```

This is the gap above the rational upper bound for $`\pi^2/8`$, after already applying the finite-dimensional loss. The checker neither approximates Gaussian integrals nor searches a finite collection of matrices. It repeats finite arithmetic whose inequalities and remainders are stated in the proof.

The algebra review independently checked the complete argument and used a separate arithmetic derivation. The source review independently compared the exact conjecture with the older planar results. These reviews reduce identifiable risks but do not substitute for external mathematical scrutiny or establish absolute priority.

## Prior-art boundary

Root searches used both web engines for the exact title, arXiv identifier, author with Hardy duality, and counterexample terminology. The primary paper and older planar antecedents were retrieved. No earlier matching resolution appeared in those searches. The additional 2024 Babiker–Hussein review lead is addressed in the independent prior audit. I also inspected its actual printed page 132 and confirmed that it expressly leaves the suggested general near-duality unproved; its adjacent corollary concerns only two-by-two matrices. Search results and archive coverage are bounded evidence; the package does not assert that every unpublished manuscript or inaccessible source has been checked.
