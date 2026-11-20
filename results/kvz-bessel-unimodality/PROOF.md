# Karp–Vishnyakova–Zhang's Bessel-ratio unimodality conjecture

## Status and exact scope

This is a complete, internally reviewed proof of the full unimodality assertion in
Conjecture 1 of Karp, Vishnyakova and Zhang, *Unimodality preservation by
ratios of functional series and integral transforms*,
[arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), printed page 12;
*Results in Mathematics* 80 (2025), article 112,
[DOI 10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4).
The same assertion is Conjecture 2 in the
[first version](https://arxiv.org/pdf/2408.01755v1), printed page 11.

The assertion concerns every pair of orders and scales satisfying

```math
\nu_1\geq\nu_2>-1,\qquad 0<a_1\leq a_2.
```

It says that the ratio of modified Bessel functions is unimodal on the
entire positive half-line. The source includes a parameter that does not
occur in that ratio; it imposes no further restriction here.

The source's additional log-concavity assertion is a separate, already
refuted clause. The public
[prior-refutation record](https://www.trureturing.org/research/karp-vishnyakova-zhang-2025-bessel-ratio-log-concavity/)
expressly leaves the unimodality clause open. This manuscript proves that
surviving assertion. It makes no new claim about the earlier log-concavity
disproof.

Two independent mathematical reviews are complete and pass. The bounded
prior-resolution audit is recorded in [NOVELTY.md](NOVELTY.md). No numerical
computation or formal proof assistant is used in the argument.

## 1. Complete classification

For positive $`x`$, put

```math
R(x)=\frac{I_{\nu_1}(a_1x)}{I_{\nu_2}(a_2x)}.
```

Here unimodality includes monotone and constant functions.

**Theorem.** Under the stated assumptions, exactly the following cases
occur.

| Conditions | Behavior on the positive half-line |
| --- | --- |
| Equal orders and equal scales | Constant, equal to one |
| Equal orders and strictly smaller numerator scale | Strictly decreasing |
| Strictly larger numerator order, equal scales, and nonnegative sum of orders | Strictly increasing |
| Strictly larger numerator order and strictly smaller numerator scale | Strictly increasing up to one point, then strictly decreasing |
| Strictly larger numerator order, equal scales, and negative sum of orders | Strictly increasing up to one point, then strictly decreasing |

In either of the last two cases, the turning point is unique and is a
strict global maximum. In particular, the entire conjectured unimodality
statement holds, including negative orders greater than minus one.

## 2. Series facts and the differential equation

For every $`\nu>-1`$ and $`a>0`$, the defining series is

```math
I_\nu(ax)=\sum_{k=0}^{\infty}c_k x^{\nu+2k},
\qquad
c_k=\frac{(a/2)^{\nu+2k}}{k!\,\Gamma(k+\nu+1)}>0.
\tag{1}
```

The ratio test shows that the power series after removal of $`x^\nu`$
has infinite radius of convergence as a series in $`x^2`$. It and all its
derivatives converge uniformly on every compact positive interval. In
particular, the Bessel function is positive and smooth on the positive
half-line. Its series can be differentiated term by term there.

Write $`f(x)=I_{\nu_1}(a_1x)`$ and
$`g(x)=I_{\nu_2}(a_2x)`$. Coefficient comparison in (1), using

```math
4k(k+\nu)c_k=a^2c_{k-1}\qquad(k\geq1),
```

gives the scaled modified Bessel equation

```math
x^2f''+xf'-(a_1^2x^2+\nu_1^2)f=0,
\qquad
x^2g''+xg'-(a_2^2x^2+\nu_2^2)g=0.
\tag{2}
```

The first two coefficients also give the convergent local expansion

```math
I_\nu(ax)=C_{\nu,a}x^\nu
\left(1+p_{\nu,a}x^2+O(x^4)\right),
\qquad
C_{\nu,a}=\frac{(a/2)^\nu}{\Gamma(\nu+1)}>0,
\quad
p_{\nu,a}=\frac{a^2}{4(\nu+1)}.
\tag{3}
```

All uses of derivatives of (3) below follow from its convergent power
series, not from differentiating an unspecified asymptotic remainder.

## 3. The scaled Wronskian

Define

```math
H(x)=x\bigl(f'(x)g(x)-f(x)g'(x)\bigr),
\qquad
\delta=\nu_1-\nu_2\geq0,
\quad
\rho=\nu_1+\nu_2>-2,
```

and

```math
A=\nu_1^2-\nu_2^2=\delta\rho,
\qquad B=a_2^2-a_1^2\geq0.
```

Since the denominator of the ratio is positive,

```math
R'(x)=\frac{H(x)}{xg(x)^2}.
\tag{4}
```

Thus the derivative of the ratio has exactly the sign of $`H`$.
Differentiating the definition of $`H`$ and using both equations in (2)
gives

```math
\begin{aligned}
H'(x)
&=f'g-fg'+x(f''g-fg'')\\
&=f(x)g(x)\left(\frac{A}{x}-Bx\right).
\end{aligned}
\tag{5}
```

This is the key identity. Its derivation does not replace the order
inequality by an inequality between squared orders. In particular, it
allows $`A<0`$.

If $`\delta>0`$, equation (3) gives

```math
H(x)=C_{\nu_1,a_1}C_{\nu_2,a_2}
x^\rho\bigl(\delta+O(x^2)\bigr)
\qquad(x\downarrow0).
\tag{6}
```

Consequently $`H`$ is strictly positive sufficiently near zero, whether it
tends to zero, to a positive constant, or to positive infinity.

If the orders are equal to $`\nu`$, their leading terms cancel. The next
terms in (3) give

```math
H(x)=C_{\nu,a_1}C_{\nu,a_2}x^{2\nu}
\left(\frac{a_1^2-a_2^2}{2(\nu+1)}x^2+O(x^4)\right).
\tag{7}
```

In this case $`H(x)\to0`$ at zero because $`2\nu+2>0`$.

## 4. Eventual negativity without large-argument asymptotics

Two terms of the positive series suffice. The term with index zero in
each series gives a constant $`c_0>0`$ such that

```math
f(x)g(x)\geq c_0x^\rho\qquad(x>0).
\tag{8}
```

Taking the term with index one in the series for $`f`$ and the term with
index zero in the series for $`g`$ gives another constant $`c_1>0`$ with

```math
f(x)g(x)\geq c_1x^{\rho+2}\qquad(x>0).
\tag{9}
```

These are global lower bounds, since every series coefficient is positive.

If $`B>0`$, choose $`X>0`$ so that
$`A/x-Bx\leq-Bx/2`$ whenever $`x\geq X`$. Equations (5) and (8) imply

```math
H'(x)\leq-\frac{Bc_0}{2}x^{\rho+1}\qquad(x\geq X).
```

Because $`\rho>-2`$, integration from $`X`$ to $`x`$ proves

```math
H(x)\longrightarrow-\infty\qquad(x\to\infty).
\tag{10}
```

If $`B=0`$ and $`A<0`$, equations (5) and (9) instead give

```math
H'(x)=\frac{A}{x}f(x)g(x)
\leq Ac_1x^{\rho+1}.
```

The same divergent integral proves (10) in this case as well. This part
of the proof requires neither a large-argument expansion of the Bessel
functions nor one for their derivatives.

## 5. Sign analysis and proof of the theorem

First suppose the orders are equal. If the scales are also equal, then
the two functions agree and the ratio is one. If the numerator scale is
strictly smaller, then $`A=0`$ and $`B>0`$. Equation (5) makes $`H`$
strictly decreasing everywhere, and (7) says its limit at zero is zero.
Therefore $`H(x)<0`$ for every positive $`x`$, and (4) proves strict
decrease of the ratio.

Now suppose $`\delta>0`$. Equation (6) makes $`H`$ positive near zero.
If the scales are equal and $`\rho\geq0`$, then $`B=0`$ and $`A\geq0`$.
Equation (5) makes $`H`$ nondecreasing, so it remains strictly positive.
The ratio is strictly increasing. When $`\rho=0`$, the scaled Wronskian
is a positive constant, and the same conclusion holds.

If the scales are equal and $`\rho<0`$, then $`A<0`$. Equation (5)
makes $`H`$ strictly decreasing. It starts positive by (6) and tends to
negative infinity by (10). Continuity and strict decrease give exactly
one zero. Equation (4) then gives strict increase before that zero and
strict decrease after it.

It remains to consider $`\delta>0`$ and $`B>0`$. If $`A\leq0`$, then
equation (5) makes $`H`$ strictly decreasing. Equations (6) and (10)
again give exactly one zero. If $`A>0`$, put

```math
x_0=\sqrt{A/B}.
```

Equation (5) says that $`H`$ strictly increases on $`(0,x_0)`$ and
strictly decreases on $`(x_0,\infty)`$. It is positive throughout the
first interval and at $`x_0`$, by (6). It tends to negative infinity by
(10), so it has exactly one zero, necessarily beyond $`x_0`$. Equation
(4) again proves the claimed unique strict maximum of the ratio.

These cases exhaust all the allowed parameters and prove the theorem.

## 6. What is and is not claimed

The proof establishes the entire unimodality assertion for arbitrary real
orders and scales in the source's domain. It also specifies which ratios
are monotone and which have one maximum. It is not a verification of
particular orders or a fixed-size numerical test.

The Bessel series, differential equation, and Wronskian identity are
classical tools. No novelty is claimed for those tools. The result is their application to the complete stated unimodality
conjecture. The separate, already refuted log-concavity clause remains
excluded. Priority and source-version details belong in `NOVELTY.md`.
