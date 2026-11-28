# Special-function screening: 21 November 2026

Status: no new resolution in this checkpoint. This file records a rejected candidate so a later worker does not confuse an independent rediscovery with an open-problem solution.

## Kadankova–Simon–Wang's infinite-divisibility question

### Source statement and scope

Kadankova, Simon and Wang, *On some new moments of Gamma type*, [arXiv:1908.03428v2](https://arxiv.org/pdf/1908.03428), Section 1.2, equation (6), asks whether existence of a distribution with moments consisting of an equal-length ratio of unit-scale gamma products forces its logarithm to be infinitely divisible. All parameters are positive. For the absolutely continuous case, the source identifies this with Conjecture 1 of Karp–Prilepkina. The source's separate convexity conjecture for a two-dimensional parameter domain is a different statement and remains unaddressed here.

A direct rational counterexample was found during this session. It is not a new resolution, because an older source already supplies positive-real-parameter counterexamples to the same implication.

### Decisive earlier result

Daniel Dufresne, *G distributions and the beta-gamma algebra*, Electronic Journal of Probability **15** (2010), paper 71, 2163–2199, [full primary paper](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/845/845-2871-1-PB.pdf), treats exactly these equal-length gamma-ratio distributions in Section 6. Its introduction, printed page 2166, expressly states that the logarithm can fail infinite divisibility for three or more gamma factors.

More specifically, Example 2 on printed page 2195 constructs a G(3,3) distribution with numerator parameters (1,2,3) and three positive real denominator parameters approximately (1.0120,1.8659,3.8871). It then identifies a negative interval for the corresponding exponential-sum kernel, proving failure of infinite divisibility. The parameters are real; this is not merely the complex-parameter example discussed elsewhere in that section. The sum gap is positive.

This 2010 result precludes counting the later re-posed necessity question as newly resolved. No result folder or catalogue entry is added.

### Independent exact illustration

For completeness, the simpler calculation found here is retained as a checkable illustration, with no novelty claim. Define
```math
U(s)=\frac{(s+13/10)^2}{(s+1)(s+2)(s+3)}
=\frac{\Gamma(s+1)\Gamma(s+23/10)^2}
{\Gamma(s+4)\Gamma(s+13/10)^2}.
```
Partial fractions give
```math
U(s)=\frac{9}{200(s+1)}
-\frac{49}{100(s+2)}
+\frac{289}{200(s+3)}.
```
Thus U is the Laplace transform of
```math
g(t)=\frac{e^{-t}}{200}
\left(289e^{-2t}-98e^{-t}+9\right),\qquad t>0.
```
The quadratic is strictly positive on the entire real line: its leading coefficient is 289 and its discriminant is 98^2-4(289)(9)=-800. Hence U is completely monotone, U(0)=169/600, and g/U(0) is a probability density.

If T has this density and X=exp(-T), then for every real s>-1,
```math
\mathbb E X^s=\frac{600}{169}U(s)
=\frac{(1)_s(23/10)_s^2}{(4)_s(13/10)_s^2}.
```
The denominator-to-numerator gamma parameter sum gap equals one. These parameters satisfy the exact equal-length, positive-real, absolutely continuous hypotheses in the question.

On the other hand,
```math
-(\log U)'(s)
=\frac1{s+1}+\frac1{s+2}+\frac1{s+3}
-\frac2{s+13/10}
=\int_0^\infty e^{-st}k(t)\,dt,
```
where
```math
k(t)=e^{-t}+e^{-2t}+e^{-3t}-2e^{-13t/10}.
```
At t=log(4), negativity is equivalent to
```math
\frac{21}{64}<2\,4^{-13/10},
\qquad\text{equivalently}\qquad
21^{10}<2^{44}.
```
The integer inequality is exact. By uniqueness of Laplace transforms, this continuous, integrable sign-changing kernel cannot represent a completely monotone logarithmic derivative. Therefore U is not logarithmically completely monotone and the law of T, equivalently that of log X, is not infinitely divisible.

There is also an interval of counterexamples. For
```math
2-\frac1{\sqrt2}\lt a<\log_4(128/21),
```
replace 13/10 by a in U. Its inverse Laplace density is
```math
\frac{e^{-t}}2\left((a-1)^2-2(a-2)^2e^{-t}+(a-3)^2e^{-2t}\right).
```
For a in this interval the quadratic is strictly positive, because its discriminant is 4(2(a-2)^2-1)<0. The logarithmic-derivative kernel is negative at log(4) by the upper bound on a. The interval contains 13/10.

### Source-convention warning

Karp and Prilepkina, *Completely monotonic Gamma ratio and infinitely divisible H-function of Fox*, [arXiv:1501.05388v2](https://arxiv.org/pdf/1501.05388), Section 2, Conjecture 1, gives the upper bound “number of zeros of G is at most number of zeros of v”. The [author-posted published version](https://www.researchgate.net/publication/271207401_Completely_Monotonic_Gamma_Ratio_and_Infinitely_Divisible_H-Function_of_Fox), printed page 140, has the same direction.

The example above has no interior zero of G and a sign-changing v, so it does not refute that zero-count upper bound. Do not rename this calculation as a proof or disproof of Karp–Prilepkina's zero-count conjecture. The statement in Kadankova–Simon–Wang that the necessity question is equivalent to that conjecture should not be used without a separate justification.

## Other screened leads

- Yang–Tian's power-Bernstein conjecture for the first-kind Bessel ratio has a pre-existing public claimed solution (APP-0040 in the [Pudim applications catalogue](https://github.com/pudim-project/pudim-ai-demo-zetalaw/blob/main/APPLICATIONS.md)). It is therefore not selected as a fresh target.
- Clark–Ismail's all-order complete-monotonicity conjecture was disproved by Alzer, Berg and Koumandos in *On a conjecture of Clark and Ismail*, Journal of Approximation Theory (2005). The original [Clark–Ismail article record](https://digitalcommons.usf.edu/mth_facpub/126/) and [the later primary paper](https://www.sciencedirect.com/science/article/pii/S0021904505000328) were located. It is excluded.
- The real-degree Stirling-remainder conjectures of Mahmoud–Qi have a pre-existing claimed disproof in [arXiv:2610.33699](https://arxiv.org/abs/2610.33699). They are not selected as fresh targets.
- Simon's all-order Tricomi-Wronskian monotonicity assertion remains in the existing research lane [issue 103](https://github.com/1337isnot1337/solved-conjectures/issues/103); this checkpoint adds no resolution.
