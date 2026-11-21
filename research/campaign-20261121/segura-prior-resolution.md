# Segura's conjecture: excluded after version-aware priority check

Research date: 2026-11-21. This is not a new resolution.

## Original statement

Javier Segura, *Monotonicity Properties for Ratios and Products of Modified Bessel Functions and Sharp Trigonometric Bounds*, Results in Mathematics 76 (2021), 221, Conjecture 1:

```math
I_\nu(x)K_\nu(x)>\frac{1}{2\sqrt{x^2+\nu^2+1/5}},\qquad x>0,\quad\nu\ge-1,
```

with best constants in the stated square-root family.

Primary source: https://link.springer.com/article/10.1007/s00025-021-01531-1

## Prior resolution

Javier Segura and Soichiro Suzuki, *Optimized bounds for the product and the ratios of modified Bessel functions*, arXiv:2608.03633, version 3. Version 1, indexed by several search engines, only claimed the inequality for large order. The current version adds a complete proof and sharpness of the constant 1/5. The version note states that the full proof was added in version 2 and the abstract corrected in version 3.

- https://arxiv.org/abs/2608.03633
- https://borowiecki.dev/list/math.CA/2026-08
- https://scirate.com/?date=2026-08-06&page=52&range=31

The arXiv endpoints returned DisabledError in the browsing tool. Current-version metadata from two mirrors agrees. It would be incorrect to treat the version-1 partial result as the latest status.

## Independent route derived before finding version 3

Let t=log x, q=e^(2t)+nu^2 and P=I_nu(e^t)K_nu(e^t). The Bessel ODE and unit logarithmic-variable Wronskian give

```math
2PP''-(P')^2-4qP^2=-1.
```

Set h=1/[2 sqrt(q+c)] and y=e^(2t). Direct differentiation gives

```math
E_h:=2hh''-(h')^2-4qh^2+1
=\frac{(c+1/4)y^2+(2c-1)(\nu^2+c)y+c(\nu^2+c)^2}
{(y+\nu^2+c)^3}.
```

At c=1/5, the numerator is

```math
\frac9{20}\left(y-\frac23(\nu^2+1/5)\right)^2\ge0.
```

An interior minimum r=P/h<1 contradicts the product ODE. Indeed, there P'=rh' and P''>=rh'', so -1>=r^2(E_h-1)>-1. The endpoint ratios are at least one. Strictness follows from a strong comparison argument (or differentiating at the unique possible equality point). The negative-order range follows from I_{-a}=I_a+(2/pi)sin(pi a)K_a for 0<a<1, together with K_{-a}=K_a. Uniform large-order asymptotics with x=nu sqrt(2/3) give optimality of 1/5.

This proof route may be useful elsewhere but does not satisfy the user's novelty requirement.
