# Independent audit of Ferreira–Simon's diagonal monotonicity conjecture

Date: 2026-11-21. Related issue: [#171](https://github.com/1337isnot1337/solved-conjectures/issues/171).

## Scope and source

The primary source is Rui A. C. Ferreira and Thomas Simon, [*Mittag-Leffler functions and convex ordering*, arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1). Remark 5(b), printed page 14, proposes that the function $\alpha\mapsto E_{\alpha,\alpha}(-1)$ increases throughout $(0,1)$. The proof under review establishes strict increase for every pair $0<\alpha<\beta<1$.

This audit concerns mathematical validity and the exact statement. A separate novelty audit is required before counting a new resolution.

## Integral identity and normalization

Equation (8) in Section 3 of the source gives

```math
E_\alpha(-x^\alpha)=\int_0^\infty e^{-xr}g_\alpha(r)\,dr,\qquad
 g_\alpha(r)=\frac{\sin(\pi\alpha)r^{\alpha-1}}{\pi(r^{2\alpha}+2\cos(\pi\alpha)r^\alpha+1)}.
```

The denominator is positive for $r>0$ and $0<\alpha<1$. The identity at $x=0$ normalizes $g_\alpha$ to mass one. The defining Mittag–Leffler series gives

```math
\frac{d}{dx}E_\alpha(-x^\alpha)=-x^{\alpha-1}E_{\alpha,\alpha}(-x^\alpha).
```

Differentiation of the integral is justified near $x=1$: for $x\ge1/2$, the absolute derivative $r e^{-xr}$ is bounded by $2/e$, an integrable constant with respect to the probability density $g_\alpha$. Therefore

```math
E_{\alpha,\alpha}(-1)=\int_0^\infty r e^{-r}g_\alpha(r)\,dr.
```

There is no extra factor of $\alpha$ in this identity.

## Quantile substitution

For $u\in(0,1)$, put

```math
q_\alpha(u)=\left(\frac{\sin(\pi\alpha u)}{\sin(\pi\alpha(1-u))}\right)^{1/\alpha}.
```

Let $a=\pi\alpha$, $\theta=au$, and $y=q_\alpha(u)^\alpha=\sin\theta/\sin(a-\theta)$. Direct differentiation and expansion give

```math
\frac{dy}{d\theta}=\frac{\sin a}{\sin^2(a-\theta)},\qquad
 y^2+2\cos(a)y+1=\frac{\sin^2a}{\sin^2(a-\theta)}.
```

Consequently

```math
\frac{dq_\alpha}{du}
 =\frac{\pi q_\alpha^{1-\alpha}}{\sin a}
   \left(q_\alpha^{2\alpha}+2\cos(a)q_\alpha^\alpha+1\right)
 =\frac{1}{g_\alpha(q_\alpha(u))}.
```

The function $q_\alpha$ is strictly increasing, with endpoint limits zero and infinity. It is exactly the inverse distribution function for $g_\alpha$. This direct calculation avoids any dependency on stable-variable conventions.

## Pointwise contraction and strictness

The reciprocal symmetry $q_\alpha(1-u)=q_\alpha(u)^{-1}$ is exact. For $u>1/2$,

```math
\sin(au)-\sin(a(1-u))
 =2\cos(a/2)\sin(a(u-1/2))>0,
```

so $s_\alpha(u)=\log q_\alpha(u)>0$. At fixed $u$, differentiation gives

```math
\frac{\partial s_\alpha(u)}{\partial\alpha}
 =\frac{h(\pi\alpha u)-h(\pi\alpha(1-u))}{\alpha^2},
 \qquad h(z)=z\cot z-\log\sin z.
```

Since $h'(z)=-z\csc^2z<0$ on $(0,\pi)$, this derivative is strictly negative for $u>1/2$.

Pairing $u$ with $1-u$ converts the desired expectation to

```math
E_{\alpha,\alpha}(-1)=2\int_{1/2}^1 f(s_\alpha(u))\,du,\qquad
 f(s)=\frac{e^s e^{-e^s}+e^{-s}e^{-e^{-s}}}{2}.
```

For $s>0$,

```math
2f'(s)
 =e^s e^{-e^s}(1-e^s)
  -e^{-s}e^{-e^{-s}}(1-e^{-s})<0.
```

Both displayed terms are strictly negative. Hence for every $0<\alpha<\beta<1$ and every $u\in(1/2,1)$,

```math
f(s_\alpha(u))\lt f(s_\beta(u)).
```

The integrands are bounded and measurable. Integrating proves strict increase, without differentiating an improper integral in the parameter $\alpha$.

## Verdict

The integral normalization, quantile Jacobian, parameter derivative, symmetry, strict comparison, and full source scope all check. No mathematical gap was found in this proof. It is an analytic proof for the full open interval, with no finite verification or numerical inference.
