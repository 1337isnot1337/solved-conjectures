# Independent algebra audit

Date: 20 November 2026. Reviewed candidate: [6f0a89376800f91b8dcb9a756a8246710911dc29](https://github.com/1337isnot1337/solved-conjectures/commit/6f0a89376800f91b8dcb9a756a8246710911dc29), `research/ferreira-simon-wright/CANDIDATE_PROOF.md`. This is an internal independent review, not external peer review.

## Mathematical conclusion

The full written counterexample proof passes. It proves an interval of counterexamples to the entire conjectured equivalence, including a family with positive beta. The proof does not depend on finite-precision calculations or on a guessed uniform asymptotic expansion.

For fixed positive a and nonnegative b, take alpha equal to 1 minus a times t and beta equal to b times t. The reviewer independently checked the following steps.

### The coefficient identity and uniform bound

Write $`u_n=(an+b)t`$. Euler reflection gives exactly

```math
\frac{(-1)^n}{t\,n!\Gamma(-n+u_n)}
=\frac{\Gamma(n+1-u_n)}{n!}
\frac{\sin(\pi u_n)}{\pi t}.
```

The two factors of $`(-1)^n`$ cancel. At reciprocal-gamma zeros the identity holds by continuity. If $`0<t<1/(a+b)`$ and $`n\geq1`$, then $`0<u_n<n`$. The gamma argument is consequently between 1 and $`n+1`$. Log convexity bounds the gamma function by the larger of its endpoint values, namely $`n!`$. The sine estimate gives the uniform bound $`an+b`$ claimed in the draft.

For each fixed index, the coefficient tends to $`an+b`$. The index-zero term is $`b/\Gamma(1+bt)`$ when $`b>0`$, and identically zero when $`b=0`$. Thus no nonexistent gamma value at zero is substituted into an ordinary finite quotient.

The bound by a polynomial in the index times $`r^n`$ is summable on every disk of radius less than one, after any fixed number of differentiations. The derivative factors and finitely many exceptional low indices cause no problem. Dominated convergence proves the locally uniform limit in every fixed derivative order. In particular, the claimed second-derivative limit is rigorous.

### Curvature and parameter ranges

For the limit function

```math
h(x)=\frac{b+(a-b)x}{(1-x)^2},
```

direct differentiation gives

```math
h'(x)=\frac{a+b+(a-b)x}{(1-x)^3},\qquad
h''(x)=\frac{4a+2b+2(a-b)x}{(1-x)^4}.
```

Substitution gives exactly the quadratic numerator in equation (9) of the draft. At one half, the curvature $`h'^2-hh''`$ is $`-16(a^2+6ab+b^2)`$, which is strictly negative for every allowed a and b. The limit function is positive at one half. Its approximants are therefore positive near that point for small positive t even without using the source's global density-positivity theorem.

For the boundary family, $`a=1,b=0`$, the values at one half are $`(2,12,80)`$ and the curvature is $`-16`$. The source defines the threshold at beta zero to be one. Since alpha is strictly below one and positive for small t, the threshold premise holds and the density fails log concavity.

For the interior family, $`a=3,b=1`$, the curvature limit at zero is 2 and that at one half is $`-448`$. The curvature at zero is exactly the reciprocal-gamma expression defining the source's threshold. Its strict positivity places alpha strictly below the threshold; its strict negativity at one half disproves log concavity. All parameters are inside $`0<\alpha<1`$, $`0<\beta<1`$ once t is sufficiently small.

The same calculation proves the general open family $`a^2>2ab+b^2`$. This is a structural interval argument, not a positive result restricted to one dimension or index. Multiplication by the positive normalization $`\Gamma(\alpha+\beta)`$ multiplies curvature by its square, so it cannot change the signs.

The only small presentation correction requested was to exclude the corner $`\alpha=\beta=0`$ from the introductory unextended gamma normalization formula. At that corner it requires a continuous extension. Neither counterexample family approaches this corner, and the correction does not change the argument.

## Primary-source comparison

The reviewer directly read [Ferreira–Simon, arXiv:2212.07974v2](https://arxiv.org/pdf/2212.07974), including the definition and admissible set on page 2, Theorem D on page 5, Section 5.1 on pages 15–16, and Section 6.4 on pages 23–24. The journal reference is *Constructive Approximation* **60** (2024), 309–338, [DOI:10.1007/s00365-023-09666-w](https://doi.org/10.1007/s00365-023-09666-w). The publisher dates the online publication to 24 August 2023.

The source's threshold sign and its extension to beta zero agree with the draft. The proposed equivalence quantifies over both counterexample families. The failure of its first implication is sufficient to disprove that equivalence; this audit does not assert a separate resolution of every possible implication between density log concavity and reciprocal Mittag–Leffler convexity.

## Independent prior-resolution screening

Both available search engines were used with combinations of the authors' names, Wright, log concavity, counterexample, conjecture, proof, refutation, and the arXiv identifier. Searches included recent papers and public mathematical result repositories. No earlier exact resolution was located in the inspected material. This is a bounded search conclusion.

The reviewer checked [Thomas Simon's current publication page](https://pro.univ-lille.fr/thomas-simon/publications), whose listed papers extend into 2026. Two recent adjacent papers were then examined directly:

- Ferreira and Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940](https://arxiv.org/pdf/2512.04940), with its [HTML text](https://arxiv.org/html/2512.04940v1). The full primary text was searched and its main results and parameter-ordering discussion were read. Its results concern stochastic and convex orders of normalized Mittag–Leffler variables. No log-concavity theorem or conjecture resolution was found; the Wright paper appears in the bibliography.
- Li, Morgan, and Siegrist, [*Concavity structure of fractional differential equations and zeros of Mittag–Leffler functions*](https://link.springer.com/article/10.1007/s41478-026-01192-9), October 2026. The primary text concerns fractional differential equations of order between one and two and ordering of Mittag–Leffler zeros. It does not establish log concavity of the present Wright densities. Its different conjecture is not part of this result.

Searches also returned prior work on a Tricomi quotient and on multiplicative beta–gamma kernels. Those statements use different functions or a different determinant property. They do not prove the threshold-to-log-concavity implication here. The beta–gamma paper did reveal an earlier theorem relevant to a separate repository result, and that separate novelty claim has been corrected; it is not evidence against the Wright argument.

The complete literature audit by the proposing agent and the parent reviewer remains necessary. The conclusion of this file is that the written proof has no mathematical gap found in this independent review, and the additional sources examined here do not contain a prior resolution of its exact target.

Discussion: [issue 100](https://github.com/1337isnot1337/solved-conjectures/issues/100).
