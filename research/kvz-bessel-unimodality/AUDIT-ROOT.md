# Root audit: Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

> **Prior-resolution correction, 21 November 2026.** [Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199), public since 1 November, already proves the exact full-domain unimodality assertion. The independent proof remains mathematically valid, but this historical review does not establish novelty. The result has been withdrawn; see [PRIOR_RESOLUTION_CORRECTION.md](PRIOR_RESOLUTION_CORRECTION.md).

Reviewed on 2026-11-20.

## Mathematical verdict

I read the complete 268-line proof at [9a5f90c84d13e85352b79402e4e79fc0f7819c2a](https://github.com/1337isnot1337/solved-conjectures/blob/9a5f90c84d13e85352b79402e4e79fc0f7819c2a/research/kvz-bessel-unimodality/PROOF.md). The argument proves the whole stated unimodality assertion. Its classification includes every equality case and the negative-order range. No gap was found.

The defining series has positive coefficients whenever the order exceeds minus one. After removal of the leading real power it is entire in the square of the argument. This justifies all differentiations on compact positive intervals and the differentiated local expansions.

For $f=I_{\nu_1}(a_1x)$ and $g=I_{\nu_2}(a_2x)$, the scaled differential equations give exactly
\[
H=x(f'g-fg'),\qquad
H'=fg\left(\frac{\nu_1^2-\nu_2^2}{x}-(a_2^2-a_1^2)x\right),
\qquad
(f/g)'=\frac{H}{xg^2}.
\]
The signs and powers of $x$ are correct.

Writing $\delta=\nu_1-\nu_2$ and $\rho=\nu_1+\nu_2$ is essential. Ordered orders need not have ordered squares. The proof retains $A=\delta\rho$, including negative $A$, and assumes only the valid bound $\rho>-2$.

For $\delta>0$, the local expansion gives $H=Cx^\rho(\delta+O(x^2))$ with $C>0$, so its initial sign is positive. For equal orders, the leading terms cancel and
\[
H=Cx^{2\nu}
\left(\frac{a_1^2-a_2^2}{2(\nu+1)}x^2+O(x^4)\right).
\]
Its zero-endpoint limit is zero because $2\nu+2>0$.

The two global lower bounds for $fg$ are valid: retaining both index-zero terms gives $fg\ge c_0x^\rho$, while retaining index one in $f$ and index zero in $g$ gives $fg\ge c_1x^{\rho+2}$. The constants are strictly positive. If $B=a_2^2-a_1^2>0$, eventually $H'\le-(Bc_0/2)x^{\rho+1}$. If $B=0$ and $A<0$, then $H'\le Ac_1x^{\rho+1}$. The exponent exceeds minus one, so integration forces $H\to-\infty$ in either case. No large-argument expansion or differentiation of an asymptotic remainder is needed.

The sign analysis is exhaustive:

- Equal orders and equal scales give the constant ratio.
- Equal orders and unequal scales give $H'<0$, with zero initial limit, hence a strictly decreasing ratio.
- Strictly ordered orders, equal scales and $\rho\ge0$ give positive nondecreasing $H$, hence a strictly increasing ratio.
- Strictly ordered orders with $A\le0$ in either peak case give strictly decreasing $H$ from positive values to negative infinity, hence exactly one zero.
- When $A>0$ and $B>0$, $H$ increases up to $\sqrt{A/B}$ and then strictly decreases. It stays positive through that point and eventually tends to negative infinity, so its only zero lies after $\sqrt{A/B}$.

The ratio has exactly the claimed behavior, with a strict global maximum in each peak case.

## Source and scope

I checked the primary conjecture in [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755), printed page 12. It asserts unimodality for every $\nu_1\ge\nu_2>-1$ and $0<a_1\le a_2$. The extra source parameter does not occur in the ratio.

I also read the complete [Trure prior-refutation record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/). Its claim and proof refute only the stronger positive-order log-concavity clause. Its scope assessment expressly leaves unimodality untouched. The present proof does not count that disproof again or claim the false stronger clause.

This proves the full remaining assertion, not a restricted-order or fixed-scale positive case.

## Independent prior-literature checks

Both search engines were used for combinations of the source authors, modified Bessel ratios, different orders or arguments, unimodality, Wronskians, and Sturm comparison. No exact earlier full-range result was found. The following primary texts were inspected at relevant definitions and theorem statements.

1. **J. Segura (2021), *Monotonicity Properties for Ratios and Products of Modified Bessel Functions and Sharp Trigonometric Bounds*.** [Full article](https://link.springer.com/article/10.1007/s00025-021-01531-1). Its objects are adjacent-order ratios at one argument, double ratios, and $I_\nu K_\nu$. Theorem 6 treats a fixed-order logarithmic derivative and double ratio. It does not state the arbitrary-order, two-scale classification.

2. **Z.-H. Yang and S.-Z. Zheng (2018), *Monotonicity of the ratio of modified Bessel functions of the first kind with applications*.** [Full article](https://link.springer.com/article/10.1186/s13660-018-1648-4). Theorem 1.1 classifies a rational expression in $W_\nu=xI_\nu/I_{\nu+1}$ with an auxiliary parameter. The theorem, stated applications and prior-result discussion concern that adjacent-order quantity.

3. **Z.-H. Yang and S.-Z. Zheng (2018), *Monotonicity and convexity of the ratios of the first kind modified Bessel functions and applications*.** [Primary PDF](https://files.ele-math.com/articles/mia-21-09.pdf), *Mathematical Inequalities & Applications* 21, 107–125, DOI 10.7153/mia-2018-21-09. Theorems 1–5 treat products divided by an average-order function, order-convexity of logarithmic derivatives, and same-argument four-factor quotients. Later propositions give adjacent-order bounds. These statements do not give arbitrary two-scale unimodality.

4. **Pudim public records.** The matched Bessel entries in its [application index](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md) concern square-root log-concavity, Riccati inequalities, adjacent-order bounds, second-kind functions, and real-order total positivity. Their displayed claims differ from this ratio. The index alone does not certify every underlying proof, and no broader certification is asserted here.

The source authors' integer-order-difference theorem is also distinct. The classical series, differential equation and Wronskian comparison method are credited tools.

## Limits

The mathematical audit passes. Priority remains a bounded literature conclusion, recorded separately in the companion novelty file. An absence of search hits does not rule out an unlocated publication. This is internal review, not external peer review.
