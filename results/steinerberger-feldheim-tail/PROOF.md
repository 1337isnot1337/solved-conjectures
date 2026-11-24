# Steinerberger’s two quantitative Feldheim tail guesses

The two original disproofs have a [complete Lean formalization](LEAN-AUDIT.md). The separate refinements later in this document are outside that verification scope.

**Result.** Both existential inequalities in Questions 1 and 2
of [Steinerberger, *Some Open Problems*, §24, March 31 2026](https://faculty.washington.edu/steinerb/openproblems.pdf),
already posed in [*A Sharp Estimate for Probability Distributions*,
§1.3, p. 3](https://arxiv.org/pdf/1801.00663v3#page=3), are false, even for a positive, analytic, strictly log-concave density
on \([0,\infty)\) with unbounded support and finite mean.

Take independent, identically distributed \(X,Y\) with
```math
\Pr(X>x)=\exp(-x-\varepsilon x^2)\qquad (x\ge0),\quad
\varepsilon=\frac1{200}.
\tag{1}
```
Write \(m=\operatorname{med}(X)\), \(\mu=\mathbb EX\), and let
```math
R(z)=
\frac{\Pr(X+Y\ge2z,\ \min(X,Y)\le z)}
     {\Pr(X+Y\ge2z,\ \min(X,Y)\ge z)} .
```
For every \(z>0\) this example satisfies the opposite strict bounds
```math
 R(z)<\frac{2(\log 2)z}{m},
 \qquad
 R(z)<\frac{2z}{\mu},
\tag{2}
```
where \(\log\) is natural.

## Probability and calculus

The denominator is \(\Pr(X\ge z)^2\). For the numerator, by
continuity the two choices of the below-threshold variable are
disjoint up to a null set. Integrating over that variable and
substituting \(x=z(1-t)\) gives
```math
 \frac{R(z)}{2z}
 =\int_0^1[1+2\varepsilon z(1-t)]e^{-a t^2}\,dt,
 \qquad a=2\varepsilon z^2.
 \tag{3}
```
Here the linear terms in the exponent cancel and
\(2z^2-x^2-(2z-x)^2=-2(z-x)^2\).

If \(0\le a\le1/2\), convexity of \(u\mapsto e^{-au}\) on
\([0,1]\) gives \(e^{-a t^2}\le 1-(1-e^{-a})t^2\). Also
\(1-e^{-a}\ge a-a^2/2\ge3a/4\). Inserting this into (3) gives
```math
\begin{aligned}
 \frac{R(z)}{2z}
 &\le 1+\varepsilon z
   -(1-e^{-a})\left(\tfrac13+\tfrac{\varepsilon z}{6}\right)\\
 &\le 1+\varepsilon z-\varepsilon z^2/2
 \le 1+\varepsilon/2.
\end{aligned}
\tag{4}
```
The last inequality is \(z-z^2/2\le1/2\).

If \(a\ge1/2\), the first term in (3) is bounded using the
same secant estimate at \(1/2\):
```math
 \int_0^1e^{-a t^2}\,dt
 \le1-\tfrac13(1-e^{-1/2})\le7/8.
```
The last relation follows already from
\(e^{1/2}\ge1+1/2+1/8>8/5\).
Extending the second term's Gaussian integral to infinity gives
```math
 2\varepsilon z\int_0^1(1-t)e^{-a t^2}\,dt
 \le 2\varepsilon z\,\frac{\sqrt\pi}{2\sqrt a}
 =\sqrt{\pi\varepsilon/2}<1/8
```
by \(\pi<4\) and \(\varepsilon=1/200\). Thus \(R(z)/(2z)<1\)
in this regime. In particular (4)'s uniform bound holds for all
\(z>0\).

## Median, mean, and regularity

The median satisfies \(m+\varepsilon m^2=\log2\).
It is bigger than \(1/2\), since
\(\tfrac12+\varepsilon/4<\log2\). For example,
\(\log2=\int_1^2x^{-1}dx\ge2/3\) by convexity of \(x^{-1}\).
Therefore
```math
 \frac{\log2}{m}=1+\varepsilon m>1+\varepsilon/2.
```
For the mean, the survival formula and \(e^{-u}\le1-u+u^2/2\)
for \(u\ge0\) give
```math
 \mu=\int_0^\infty e^{-x-\varepsilon x^2}\,dx
 \le 1-2\varepsilon+12\varepsilon^2 < 1-\varepsilon.
```
Hence \(1/\mu>1/(1-\varepsilon)>1+\varepsilon/2\).
Combining these strict inequalities with (4) proves (2).

The derivative of the survival function is
\(-f(x)=-(1+2\varepsilon x)e^{-x-\varepsilon x^2}\).
The resulting density is positive and real analytic on the
half-line, and its log has second derivative
```math
 -2\varepsilon-\frac{4\varepsilon^2}{(1+2\varepsilon x)^2}<0.
```
The same proof works for every \(0<\varepsilon\le1/200\).

If smoothness means a \(C^\infty\) density on all of
\(\mathbb R\) that vanishes outside the half-line, the example also
admits that version. For \(\eta>0\), set
\(f_\eta(x)=c_\eta e^{-\eta/x}f(x)\) for \(x>0\), and zero otherwise,
with \(c_\eta=(\int_0^\infty e^{-\eta/x}f(x)\,dx)^{-1}\).
It is globally smooth and strictly log-concave on \(x>0\).
Since the multiplier \(e^{-\eta/x}\) is increasing,
\(\operatorname{Cov}(e^{-\eta/X},1_{\{X>z\}})\ge0\),
so its survival function satisfies \(S_\eta(z)\ge S(z)\).
The numerator for the new density is at most \(c_\eta^2\) times
the old numerator because \(f_\eta\le c_\eta f\), whereas the
denominator is at least the original \(S(z)^2\). Thus
\(R_\eta(z)/(2z)\le c_\eta^2(1+\varepsilon/2)\) uniformly in \(z\).
As \(\eta\downarrow0\), \(c_\eta\to1\), the means converge by
dominated convergence, and the medians converge because the
original distribution function is continuous and strictly
increasing on its support. Both strict gaps in (2) therefore
persist for sufficiently small \(\eta>0\).

## Scope, prior work, and possible rate interpretations

[Feldheim–Feldheim, *Mean and Minimum of Independent Random Variables*,
Theorem 1](https://arxiv.org/abs/1609.03004) proves unbounded limsup
of the ratio \(1+R(z)\) under far broader hypotheses; this result is
not contradicted. Indeed (3) gives
\(R(z)/z\to\sqrt{2\pi\varepsilon}>0\) for (1), by substituting
\(u=t\sqrt a\) in the second term and using Gaussian domination.
The proposed inequalities were specific quantitative existential
strengthenings, not the original qualitative comparison theorem.
[Steinerberger, *A Sharp Estimate for Probability Distributions*,
Statistics & Probability Letters 155 (2019), 108584](https://doi.org/10.1016/j.spl.2019.108584)
proves a different median/density-dependent bound on a conditional
probability: the paper’s §1.3 separately poses exactly the two
displayed inequalities tested here, for absolutely continuous
unbounded distributions on the nonnegative half-line. Its sharpness
construction for the earlier theorem is compactly supported and
controls the unconditional one-sided crossing probability, not this
ratio.

No universal eventual linear growth follows, even with a
finite mean: the example \(S(x)=e^{-x^{3/2}}\) has
\(R(z)=O(z^{3/4})\) as \(z\to\infty\). For completeness, for
\(1<p<2\) and \(S(x)=e^{-x^p}\) the same substitution gives
```math
 R(z)=2p z^p\int_0^1(1-t)^{p-1}
 e^{-z^p[(1-t)^p+(1+t)^p-2]}\,dt.
```
The bracket is at least \(p(p-1)t^2\): its second derivative
is at least \(2p(p-1)\) by convexity of \(x^{p-2}\). Substituting
\(u=t z^{p/2}\) and using dominated convergence in fact gives
```math
 R(z)\ \sim\ \sqrt{\frac{\pi p}{p-1}}\,z^{p/2}.
```
This is separate from whether a smaller positive universal
coefficient could hold in an existential linear bound. A [separate proof](LINEAR-EXISTENCE.md) shows that smaller positive existential coefficients do work. For eventual linear failure with
a strictly positive analytic density all the way to the
boundary, the same bound follows for
\(S(x)=\exp(1-(1+x)^p)\), by replacing \(z\) by \(z+1\)
in the bracket/lower-curvature calculation (and integrating
only up to \(t=z/(1+z)\)).

Exact-phrase searches for the two §24 statements; author/title
cross-searches; and searches for Feldheim-tail quantitative bounds
with a quadratic cumulative hazard did not identify any previous
resolution of these two guesses in the sites examined. This is
a priority check, not a guarantee of priority.
