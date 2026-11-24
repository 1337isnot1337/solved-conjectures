# Lehmer’s Mahler measure conjecture

**Status (2026-11-24).** The uniform gap remains open in general.
This checkpoint gives a uniform lower estimate for a two-block
reciprocal polynomial in terms of its seed. The shift threshold
depends on the number of exterior roots of the seed, with no bound
on its degree. One consequence excludes an infinite class of
separated reciprocal polynomials from the search for measures
near one. There is no independent review, Lean verification, or
priority claim.
[Tracking issue #359](https://github.com/1337isnot1337/solved-conjectures/issues/359).

## The target and earlier work

For a nonzero integer polynomial $P=a\prod_j(z-\beta_j)$,
its Mahler measure is $M(P)=|a|\prod_j\max(1,|\beta_j|)$.
The question is whether there is an absolute $\mu>1$ such
that $M(P)>1$ implies $M(P)\ge\mu$. Lehmer asked whether nontrivial
measures of monic integer polynomials can be arbitrarily close to
one. The monic case is equivalent to the stated gap because a
leading coefficient of absolute value at least two already gives
measure at least two, and a polynomial with leading coefficient
minus one can be negated. Showing
that Lehmer's example attains the minimum is a stronger statement.
A uniform gap would also bound nonzero entropy away from zero for
integral toral automorphisms.
[Lehmer, 1933](https://doi.org/10.2307/1968172),
[Chervonyi–Gukov–Luong, §1](https://arxiv.org/html/2610.30277v1).

The 2026 work of Chervonyi, Gukov and Luong constructs
small-measure irreducibles in a high-degree range, and the
work of Jha and Thangadurai gives gaps for coefficient-congruence
classes. Both treat the general problem as open. Verger-Gaugry
posted earlier full-proof claims. The current primary literature
cited here does not recognize these as resolutions. This is a
bounded status and priority check.
[Chervonyi–Gukov–Luong](https://arxiv.org/abs/2610.30277),
[Jha–Thangadurai](https://arxiv.org/abs/2610.33631),
[2017 claim](https://arxiv.org/abs/1709.03771),
[2019 claim](https://arxiv.org/abs/1911.10590).

The expression $z^N f\pm f^*$ is the classical Salem–Boyd
construction. For a fixed seed, its Mahler measure has the
expected limit $M(f)$ as $N$ tends to infinity. The issue here
is uniformity as the seed itself varies, including degrees
that can be much larger than the number of roots outside the
unit circle. The source check located the classical asymptotic
results and did not locate the same exterior-root-count
estimate. Smyth's nonreciprocal bound supplies the arithmetic
input for the corollary.
[Boyd](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7F5A99F8FB4372A27E6D93D8C3908097/S000843950006570Xa.pdf/div-class-title-speculations-concerning-the-range-of-mahler-s-measure-div.pdf),
[Hironaka, §3](https://www.math.fsu.edu/~hironaka/papers/SalemBoyd.pdf),
[Smyth](https://doi.org/10.1112/blms/3.2.169).

## A uniform estimate for the separated form

Write $m(f)=\log M(f)$. Let $f$ be a monic complex polynomial
of degree $d$, with exterior-root count $k$ including
multiplicities. Let $f^\#(z)=z^d\overline{f(1/\bar z)}$.
For real $f$ this is the ordinary reciprocal $f^*$.
Given a positive integer $N$ and a complex $\varepsilon$
with $|\varepsilon|\le1$, set
$P_N(z)=z^N f(z)+\varepsilon f^\#(z)$.

**Theorem.** Suppose $k\ge1$, take $t,s>0$, and assume
$(N-k)t\ge4k+s$. Then

```math
m(P_N)\ge m(f)-2kt+\log(1-e^{-s}).
```

Let $r=e^u>1$. At points where $f(z)\ne0$ on $|z|=r$,
the ratio $|f^\#(z)/f(z)|$ is the product, over roots $\alpha$
of $f$, of $|1-\bar\alpha z|/|z-\alpha|$. The identity

```math
|1-\bar\alpha z|^2-|z-\alpha|^2
=(r^2-1)(|\alpha|^2-1)
```

makes every factor at most one when $|\alpha|\le1$.
For $a=|\alpha|>1$ and $r\ne a$, the ratio is bounded above
by its value when $z$ has the argument of $\alpha$, because
that minimizes $|z-\alpha|$. With $v=\log a$ the bound is

```math
\frac{ra-1}{|r-a|}
=\frac{\sinh((u+v)/2)}{\sinh(|u-v|/2)}
\le e^u\frac{u+v}{|u-v|}.
```

For the final inequality use the upper bound one for the
derivative of $\log(\sinh x/x)$ at $x>0$. In fact the derivative
is $\coth x-1/x$ and it is less than one by $e^{2x}>1+2x$.
The spacing between $(u+v)/2$ and $|u-v|/2$ is
$\min(u,v)\le u$.

Average the logarithm of the rational factor
$(u+v)/|u-v|$ for $u\in[t,2t]$. On changing variables
$u/t=w\in[1,2]$ and $v/t=h\ge0$, the ratio is
$(w+h)/|w-h|$. For $h\ge3$ it is at most five. For $h\le3$
the numerator is at most five, and the integral over
$[1,2]$ of the positive part of $-\log|w-h|$ is at most
$\int_{-1}^1-\log|x|\,dx=2$. Thus the average is at most
$\log5+2\lt4$, uniformly for every exterior root, with the
singularity at $w=h$ integrable.

There exists $u\in[t,2t]$, away from every root modulus in
logarithmic coordinates, for which the sum of these
logarithms is at most $4k$. Therefore on the whole circle

```math
\left|\frac{\varepsilon f^\#(z)}{z^N f(z)}\right|
\le \exp(4k-(N-k)u)\le e^{-s}.
```

The hypothesis also implies $N>k$. The reverse triangle
inequality gives $|P_N(z)|\ge(1-e^{-s})|z^N f(z)|$ on the
chosen circle.

For a monic polynomial $g$ of degree $D$ with roots $\gamma$,
the circular mean of $\log|g(re^{i\theta})|$ minus $D u$ is
$\sum_\gamma(\log|\gamma|-u)_+$, with a zero contribution
from any root at zero. This follows by applying Jensen's
formula to the factors. The expression is at most $m(g)$
for $u>0$. Since $P_N$ is monic of degree $N+d$, averaging
the reverse triangle inequality and subtracting $(N+d)u$
gives

```math
\begin{aligned}
m(P_N)
&\ge \log(1-e^{-s})+\sum_{\alpha}(\log|\alpha|-u)_+\\
&\ge \log(1-e^{-s})+m(f)-ku\\
&\ge m(f)-2kt+\log(1-e^{-s}).
\end{aligned}
```

Only exterior roots contribute to the last two sums.
This proves the theorem.

## A refinement using the exterior root locations

The exterior roots need not all be charged equally. Write
$v_j=\log|\alpha_j|$ for the exterior roots, and set

```math
C(t)=\sum_j\min(v_j/t,t/v_j),\qquad
L(t)=\sum_j\min(v_j,2t).
```

The same argument gives, for $t,s>0$ with
$Nt\ge16C(t)+L(t)+s$,

```math
m(P_N)\ge m(f)-L(t)+\log(1-e^{-s}).
```

To check the refinement, write $h=v_j/t$. When $h\le1/2$,
the logarithm of $(w+h)/|w-h|$ is at most $4h$ for
$1\le w\le2$, using $\log(1+x)\le x$. When $h\ge4$,
it is at most $8/h$. For $1/2\le h\le4$, the same
integral bound as before is $\log6+2\lt4$, while
$\min(h,1/h)\ge1/4$. Thus the average of the rational-factor
logarithms is at most $16C(t)$. Keep the sharper hyperbolic
factor $e^{\min(u,v_j)}$ in the ratio bound. Their combined
logarithmic contribution is at most $L(t)$ for $u\le2t$.
The chosen circle therefore has reciprocal perturbation
ratio at most $e^{-s}$. The actual loss in the Jensen
step is $\sum_j\min(v_j,u)\le L(t)$, which proves the
refinement. It can apply even when many exterior roots
are very close to the unit circle and $k$ is large.

## Consequence for irreducible reciprocal polynomials

Let $f$ be a monic integer polynomial of positive degree with
$f(0)\ne0$. Suppose $P_N=z^N f\pm f^*$ is irreducible and
noncyclotomic. If $N\ge257 k^2$, then

```math
M(P_N)>\frac{297}{250}=1.188.
```

First, $f^*=\pm f$ would make $P_N$ reducible. If all the
irreducible factors of $f$ were reciprocal up to sign, their
product would be too. Thus there is a nonreciprocal irreducible
factor with nonzero constant term. By Smyth's theorem its
measure is at least the real root $\theta_0$ of $x^3-x-1$.
Mahler measure is multiplicative and all other integer factors
have measure at least one. Hence $M(f)\ge\theta_0$ and
$k\ge1$.

Use $t=1/(32k)$ and $s=4$ in the theorem. The requirement
$N\ge k+(4k+4)32k$ follows from $N\ge257k^2$.
We have $e^4>32$ from its series through degree four,
so $-\log(1-e^{-4})\lt1/31$. The total loss is less
than $1/16+1/31\lt1/10$. Also $\theta_0>33/25$
by evaluating $x^3-x-1$ at $33/25$, and
$e^{-1/10}>9/10$. Thus $M(P_N)>\theta_0 e^{-1/10}>
(33/25)(9/10)=297/250$.

For a reciprocal polynomial written in this separated form,
$d$ is the width in degrees of the outer coefficient block
and $N-d-1$ is the intervening zero run when $N>d$.
The sufficient condition even follows from $N\ge257d^2$.
The exterior-root count can be much smaller than $d$ and
gives the stronger version. The value $1.188$ exceeds the
measure of Lehmer's original example. The estimate leaves
open the unrestricted problem and sequences whose block
separation is insufficient relative to their exterior-root count.
[Lehmer, 1933](https://doi.org/10.2307/1968172).
