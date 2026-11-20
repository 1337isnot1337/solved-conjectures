# Baricz–Pogány's asymptotic-coefficient positivity conjecture

## Status and source

This is a complete proof candidate for the unnumbered conjecture in
Section 4.4 of Á. Baricz and T. K. Pogány, *Probabilistic and Analytical
Aspects of the Symmetric and Generalized Kaiser–Bessel Window Function*,
*Constructive Approximation* 58 (2023), 713–783,
[DOI 10.1007/s00365-023-09627-3](https://link.springer.com/article/10.1007/s00365-023-09627-3).
Independent mathematical and prior-resolution reviews are ongoing.

The source defines coefficients by the large-argument expansion

```math
\frac{tI_\nu(t)}{I_{\nu+1}(t)}
\sim t\sum_{n=0}^{\infty}\alpha_n(\nu)t^{-n},
\qquad t\to+\infty,
```

with $`\alpha_0(\nu)=1`$ and $`\alpha_1(\nu)=\nu+1/2`$.
It conjectures, for every integer $`n\geq2`$ and every real
$`|\nu|<1/2`$, that

```math
\pi_n(\nu):=\alpha_n(\nu)-(\nu+1/2)^n>0.
\tag{1}
```

The proof below establishes the entire assertion. No finite-degree or
fixed-parameter restriction is imposed.

## 1. The formal coefficient series

For real $`\mu`$, the source's equations (3.5)–(3.6) use

```math
I_\mu(t)\sim\frac{e^t}{\sqrt{2\pi t}}
\sum_{n=0}^{\infty}(-1)^n a_n(\mu)t^{-n},
\qquad
a_n(\mu)=\frac{\prod_{k=1}^{n}(4\mu^2-(2k-1)^2)}{8^n n!},
\quad a_0(\mu)=1.
\tag{2}
```

Put $`a=\nu+1/2`$, so $`0<a<1`$, and define formal power series
over the real numbers by

```math
N(z)=\sum_{n\geq0}c_nz^n,
\quad c_n=(-1)^na_n(\nu),
\qquad
D(z)=\sum_{n\geq0}d_nz^n,
\quad d_n=(-1)^na_n(\nu+1).
\tag{3}
```

Both constant coefficients are one. The source's recurrence in Section
4.4 is exactly formal division:

```math
A(z):=\sum_{n\geq0}\alpha_n(\nu)z^n=\frac{N(z)}{D(z)}.
\tag{4}
```

Indeed, comparing the coefficient of degree $`n`$ in $`DA=N`$ gives

```math
\alpha_n(\nu)=c_n-
\sum_{m=0}^{n-1}\alpha_m(\nu)d_{n-m},
\tag{5}
```

which is the defining recurrence printed in the source. Since $`d_0=1`$,
this uniquely determines the coefficient sequence. Thus no analytic
convergence assumption about the asymptotic series is needed to identify
the coefficients in this proof.

## 2. Coefficient signs

Factoring the product in (2) gives

```math
c_n=\frac{\prod_{k=1}^{n}(k-a)(k+a-1)}{2^n n!},
\qquad
c_n=\frac{(n-a)(n+a-1)}{2n}c_{n-1}\quad(n\geq1).
\tag{6}
```

Every factor in the first product is strictly positive because
$`0<a<1`$. Hence $`c_n>0`$ for every $`n\geq0`$.

The analogous product for the denominator is

```math
d_n=\frac{\prod_{k=1}^{n}(k-a-1)(k+a)}{2^n n!}.
```

For $`n\geq1`$, division of these products telescopes:

```math
\frac{d_n}{c_n}
=\prod_{k=1}^{n}\frac{k-a-1}{k-a}
  \prod_{k=1}^{n}\frac{k+a}{k+a-1}
=\frac{-a}{n-a}\frac{n+a}{a}
=-\frac{n+a}{n-a}.
\tag{7}
```

In particular, $`d_n<0`$ for every positive $`n`$. Define

```math
B(z)=\sum_{n\geq1}b_nz^n,
\qquad b_n=-d_n=\frac{n+a}{n-a}c_n>0.
```

Then

```math
D(z)=1-B(z),\qquad
\frac{1}{D(z)}=\sum_{j\geq0}B(z)^j.
\tag{8}
```

The last equality is valid in the formal power-series ring: $`B`$ has
zero constant coefficient, so each coefficient on the right is a finite
sum. Every coefficient of $`D^{-1}`$ is nonnegative, and its constant
coefficient is one.

## 3. The coefficient identity

Equations (6)–(7) imply, for $`n\geq1`$, that

```math
d_n=c_n-(n+a-1)c_{n-1}.
\tag{9}
```

For clarity, substituting (6) into the right side gives

```math
\left(\frac{(n-a)(n+a-1)}{2n}-(n+a-1)\right)c_{n-1}
=-\frac{(n+a)(n+a-1)}{2n}c_{n-1}
=-\frac{n+a}{n-a}c_n.
```

Comparing coefficients in (9) proves the formal identity

```math
D(z)=(1-az)N(z)-z^2N'(z).
\tag{10}
```

Here $`N'`$ is the formal derivative. Equation (10) was proved directly
from coefficient products. It does not differentiate an asymptotic
remainder.

Combining (4) and (10) now gives

```math
\begin{aligned}
\sum_{n\geq0}\left(\alpha_n(\nu)-a^n\right)z^n
&=\frac{N(z)}{D(z)}-\frac{1}{1-az}\\
&=\frac{(1-az)N(z)-D(z)}{(1-az)D(z)}\\
&=\frac{z^2N'(z)}{(1-az)(1-B(z))}.
\end{aligned}
\tag{11}
```

All denominators in (11) have constant coefficient one, so every division
is well-defined formally.

## 4. Positivity in every degree

Since $`a>0`$, the series

```math
\frac{1}{1-az}=\sum_{j\geq0}a^jz^j
```

has nonnegative coefficients and constant coefficient one. Equation (8)
gives the same facts for $`(1-B(z))^{-1}`$.

The remaining factor in (11) is

```math
z^2N'(z)=\sum_{n\geq2}(n-1)c_{n-1}z^n.
```

Its coefficient of degree $`n`$ is strictly positive for every
$`n\geq2`$. Multiplication by the other two factors cannot decrease any
coefficient, and their product has constant coefficient one. Therefore
(11) proves the explicit lower bound

```math
\pi_n(\nu)\geq(n-1)c_{n-1}
=\frac{(n-1)\prod_{k=1}^{n-1}(k-a)(k+a-1)}{2^{n-1}(n-1)!}>0
\qquad(n\geq2).
\tag{12}
```

This proves the full conjecture for every permitted real parameter and
every degree.

## 5. Scope and attribution

The argument is entirely coefficientwise. It does not assert convergence
of the generally divergent asymptotic series or infer a pointwise
inequality by summing that series. The full coefficient assertion (1) is
the source's conjecture and is exactly what has been proved.

The large-argument Bessel expansion, formal division, and geometric-series
identity are classical. No novelty is claimed for those tools. The
source and prior-resolution audit are recorded separately in `NOVELTY.md`.
No numerical computation or formal proof assistant is used in the proof.
