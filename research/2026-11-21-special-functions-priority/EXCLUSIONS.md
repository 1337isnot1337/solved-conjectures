# Special-function priority exclusions

Audit date: November 21, 2026. These targets contribute zero new resolutions. Each exclusion below rests on a directly read prior proof.

## Chaudhary–Diethelm–Hashemishahraki’s smallest-zero conjecture

The source is *On the real zeros of the two-parametric Mittag-Leffler function*, [arXiv:2401.14771](https://arxiv.org/pdf/2401.14771), Conjecture 3(b), subsequently Applied Numerical Mathematics **203** (2024), 84–96, DOI:10.1016/j.apnum.2024.05.020. The conjecture proposes a leading logarithmic coefficient approximately $`-0.275`$ for the smallest positive zero as the order tends to one from above.

An earlier complete refutation is available in [Principia's MathDB361626 manuscript, pinned at 34b8b155d7db464ad7306f70b16d3af9cee34501](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-361626/mathdb-361626-solution.tex). The manuscript is dated September21,2026; the public archive commit is dated October27,2026. Its exact result is

```math
Z_1(1+\varepsilon)=L+\log L+o(1),
\qquad L=\log(1/\varepsilon).
```

The full proof was read. It derives a uniform residue-plus-branch-cut expansion on a growing interval, identifies the positive exponential contribution and the negative algebraic contribution, and rules out earlier zeros. The leading logarithmic coefficient is therefore $`-1`$, refuting the proposed coefficient. This is the same asymptotic direction considered in the present campaign, so it was abandoned before any solution claim. The fetched source blob is `8f9138e335a0499ade21d1ddbeecea36e504d7cc`.

## Gerhold–Simon’s neo-classical inequality

The target is Conjecture3.2 of Gerhold and Simon's 2023 article, [primary source](https://link.springer.com/article/10.1007/s00605-022-01817-8). It asserts, for every $`\alpha>2`$, positive integer $`k`$, and $`x,y\geq0`$,

```math
2^{\alpha-1}\sum_{j=0}^k
\binom{\alpha k}{\alpha j}x^{\alpha j}y^{\alpha(k-j)}
\geq(x+y)^{\alpha k}.
```

Stefan Gerhold's *Another Variant of the Neoclassical Inequality*, [arXiv:2611.22692v1](https://arxiv.org/pdf/2611.22692), submitted November17,2026, proves the complete assertion as Theorem2. The complete four-page primary manuscript was read.

Its proof establishes log-convexity of the generalized binomial coefficient in the scale parameter, using a gamma-ratio criterion, then applies convexity to the logarithm of the positive sum after normalizing by $`(x+y)^{\alpha k}`$. The endpoint values at one and two give the inequality for every real $`\alpha>2`$. The sharp constant and equality example are included. This is a full prior resolution, not a finite-parameter computation.

## Boudabsa–Simon’s hyperbolic-bound conjecture

The two-sided hyperbolic bounds in Conjecture4 of the 2021 Kilbas–Saigo paper were already proved in a September17,2026 [Principia manuscript](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-348998/mathdb-348998-solution.tex). Its entire argument was read. An independent [trureturing dossier](https://github.com/the-omega-institute/trureturing/blob/bba1aad31d92f0ac31774c3a7e7c04a3db945c56/Problems/boudabsa-simon-2021-kilbas-saigo-hyperbolic-bounds.md) also supplies a complete prose derivation through positive scaling kernels. No attempt was made to count this conjecture anew.

## Boudabsa–Simon’s parameter-monotonicity question

The same Principia manuscript's full interior exponential-functional representation makes the monotonicity in Remark3 an immediate rescaling consequence. The boundary was already in original Proposition1. Our independently developed proof is valid, but the target was excluded and issue186 closed. The [dedicated literature audit](../2026-11-21-special-functions-boudabsa-simon-monotonicity/LITERATURE.md) gives the exact parameter transfer and complete source comparison.

These exclusions concern the stated targets only. They do not claim that all other questions in the cited papers are resolved.
