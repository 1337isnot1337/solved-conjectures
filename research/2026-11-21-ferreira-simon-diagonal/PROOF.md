# Ferreira–Simon's diagonal Mittag–Leffler conjecture

Date: 21 November 2026. Status: complete proposed proof, independently checked within the research campaign. A separate source audit records the prior-resolution search and its limits. The note is unrefereed.

## Statement

For positive parameters, define

```math
E_{\alpha,\beta}(z)=\sum_{n=0}^{\infty}\frac{z^n}{\Gamma(\alpha n+\beta)},
\qquad E_\alpha=E_{\alpha,1}.
```

Ferreira and Simon, *Mittag-Leffler functions and convex ordering*, [arXiv:2512.04940v1](https://arxiv.org/pdf/2512.04940), Remark 5(b), printed page 14, conjecture that the diagonal value at minus one increases with the parameter throughout the unit interval.

**Theorem.** For every pair of real parameters satisfying $`0<\alpha<\beta<1`$, one has

```math
E_{\alpha,\alpha}(-1)<E_{\beta,\beta}(-1).
```

This is the entire parameter-monotonicity conjecture in that remark. The fixed argument minus one is part of the original statement; the proof covers every allowed real parameter and does not infer a theorem from a numerical case.

## 1. A bounded integral for the diagonal value

We use the classical Pollard representation, stated as equation (8) in the source:

```math
E_\alpha(-x^\alpha)=\int_0^\infty e^{-xr}g_\alpha(r)\,dr,
\qquad
g_\alpha(r)=
\frac{\sin(\pi\alpha)}{\pi}
\frac{r^{\alpha-1}}{r^{2\alpha}+2\cos(\pi\alpha)r^\alpha+1},
\quad x\ge0.
```

Here $`0<\alpha<1`$ and $`g_\alpha`$ is a probability density. Its normalization also follows from the change of variables in the next section.

Differentiating the defining entire series gives

```math
\alpha E_\alpha'(z)=E_{\alpha,\alpha}(z).
```

Differentiating the integral at $`x=1`$ is justified by domination: for $`1/2\le x\le3/2`$, the absolute derivative is at most $`r e^{-r/2}g_\alpha(r)`$, and the first factor is bounded. Consequently,

```math
E_{\alpha,\alpha}(-1)
=\int_0^\infty r e^{-r}g_\alpha(r)\,dr.
\tag{1}
```

The factors of alpha cancel in the chain rule. In particular, there is no extra factor of alpha in (1).

## 2. A common quantile parametrization

For $`0<u<1`$, put

```math
Q_\alpha(u)=
\left[
\frac{\sin(\pi\alpha u)}
     {\sin(\pi\alpha(1-u))}
\right]^{1/\alpha}.
\tag{2}
```

This is a strictly increasing map of the unit interval onto the positive half-line. We verify its change-of-variables formula directly.

Write $`a=\pi\alpha`$, $`\theta=au`$, and $`y=r^\alpha`$. Then

```math
y=\frac{\sin\theta}{\sin(a-\theta)},
\qquad
\frac{dy}{d\theta}=\frac{\sin a}{\sin^2(a-\theta)}>0,
```

and the elementary sine identity

```math
y^2+2(\cos a)y+1
=\frac{\sin^2a}{\sin^2(a-\theta)}
```

yields

```math
g_\alpha(r)\,dr
=\frac{\sin a}{\pi\alpha}\,
\frac{dy}{y^2+2(\cos a)y+1}
=\frac{d\theta}{a}=du.
\tag{3}
```

The endpoint values of $`y`$ are zero and infinity. Thus (1) becomes

```math
E_{\alpha,\alpha}(-1)
=\int_0^1 Q_\alpha(u)e^{-Q_\alpha(u)}\,du.
\tag{4}
```

The identity $`Q_\alpha(1-u)=Q_\alpha(u)^{-1}`$ will make the integrand monotone after pairing complementary points.

## 3. The logarithmic quantile contracts

Fix $`1/2<u<1`$ and define

```math
s_\alpha(u)=\log Q_\alpha(u)
=\frac{\log\sin(\pi\alpha u)
       -\log\sin(\pi\alpha(1-u))}{\alpha}.
```

It is strictly positive, because

```math
\sin(\pi\alpha u)-\sin(\pi\alpha(1-u))
=2\cos(\pi\alpha/2)\sin(\pi\alpha(u-1/2))>0.
```

Consider

```math
h(z)=z\cot z-\log\sin z,\qquad 0<z<\pi.
```

Its derivative is

```math
h'(z)=-z\csc^2z<0.
```

Therefore

```math
\frac{\partial s_\alpha(u)}{\partial\alpha}
=
\frac{h(\pi\alpha u)-h(\pi\alpha(1-u))}{\alpha^2}<0.
\tag{5}
```

Both arguments of $`h`$ lie in its stated interval, and the first is larger. Thus the positive logarithmic quantile strictly decreases with alpha. By reciprocal symmetry, its absolute value decreases on the other half of the unit interval as well.

## 4. Pairing the integral

For $`s\ge0`$, set

```math
f(s)=\frac12\left[e^{s-e^s}+e^{-s-e^{-s}}\right].
```

For every $`s>0`$,

```math
2f'(s)
=e^{s-e^s}(1-e^s)
-e^{-s-e^{-s}}(1-e^{-s})<0.
\tag{6}
```

Both terms on the last line are strictly negative. Pairing $`u`$ with $`1-u`$ in (4) gives

```math
E_{\alpha,\alpha}(-1)
=2\int_{1/2}^1 f(s_\alpha(u))\,du.
\tag{7}
```

If $`0<\alpha<\beta<1`$, equation (5) gives $`s_\beta(u)<s_\alpha(u)`$ for every $`u\in(1/2,1)`$. Equation (6) reverses this inequality for $`f`$. Integrating the resulting strict pointwise inequality in (7) proves the theorem. All integrands are bounded by $`1/e`$, so no convergence issue is involved.

## 5. Endpoints and the source's zero bound

For each fixed $`u\in(1/2,1)`$, the logarithmic quantile tends to infinity as alpha decreases to zero, since the sine ratio tends to $`u/(1-u)>1`$. It tends to zero as alpha increases to one, by the identity $`\sin(\pi u)=\sin(\pi(1-u))`$. Dominated convergence in (7) therefore gives

```math
\lim_{\alpha\downarrow0}E_{\alpha,\alpha}(-1)=0,
\qquad
\lim_{\alpha\uparrow1}E_{\alpha,\alpha}(-1)=e^{-1}.
```

The source's Proposition 1 says that

```math
x^{\beta-1}E_{\beta,\beta}(-x^\beta)
-x^{\alpha-1}E_{\alpha,\alpha}(-x^\alpha)
```

is positive precisely between its two positive zeros, denoted there by $`y_{\alpha,\beta}`$ and $`z_{\alpha,\beta}`$. The theorem makes this expression positive at one, so $`z_{\alpha,\beta}>1`$. Together with the already proved Theorem B, this gives the complete bound proposed in Remark 5(b):

```math
x_{\alpha,\beta}<1<z_{\alpha,\beta}.
```

This consequence is not counted as a separate conjecture.

## Attribution and scope

The Pollard density and the sine quantile are classical. The proof includes the exact substitution and both derivative-sign arguments, so the new application can be checked without a numerical package. It proves the full real-parameter statement, not a finite sample of alpha values.

This assertion is distinct from the mean-normalized convex ordering proved in the source's Theorem C and from its Remark 7(b) stochastic-order conjecture. The latter has a separate Poisson-series proof in this research campaign. The present proof does not depend on it.

The [source audit](SOURCES.md) records searches for an earlier resolution of this exact assertion and the limits of those searches. No Lean work is performed.
