# The positive parameter interval in Sokal's Apéry moment conjecture

**Alternative proof of the previously resolved positive side.** For all $x>1$, the sequence of Apéry polynomials
```math
A_n(x)=\sum_{k=0}^n\binom nk^2\binom{n+k}k^2 x^k,\qquad n=0,1,\ldots,
```
is a Stieltjes moment sequence. Together with [Edgar's theorem](https://arxiv.org/abs/2005.10733) at $`x=1`$ and the companion [proof](PROOF.md) for $`0<x<1`$, this establishes [Sokal, Conjecture 1, IHP slide 27](https://rtca2023.github.io/pages_Paris/DocM6/Sokal.pdf) in full. This is not a claim about his Conjecture 2 (coefficientwise Hankel-total positivity). See [the audit](AUDIT.md) for the prior Knowledge Sense result. The proof below also recovers the endpoint by a limit, without relying on Edgar for that step.

## 1. The radial density and its continuation

By the Legendre product formula, as derived in the companion proof,
```math
A_n(x)=\mathbb E P_n(Z),\qquad Z=2U-1,\qquad
U=\left|1+\sqrt{x}(e^{i\theta}+e^{i\psi})\right|^2,
```
for independent uniform angles. In fact the same change of variables as in that proof writes the last radius as $|1+2\sqrt{x}\cos(a)e^{ib}|$.

Set $L=4x$. The vector $V=\sqrt{x}(e^{i\theta}+e^{i\psi})$ is rotationally invariant; $|V|^2=2x(1+\cos(\theta-\psi))$ has the arcsine density $1/(\pi\sqrt{R(L-R)})$ on $(0,L)$. Thus its planar density, with respect to area, is $1/(\pi^2\sqrt{R(L-R)})$ at a point of squared radius $R<L$. Let $f$ denote the actual density of $U=|1+V|^2$, and temporarily set $s=\sqrt{u}$, $a=(1-s)^2$, $b=(1+s)^2$. Polar coordinates around $-1$ for $V$ give, for $0<s<1$ (so that $b<L$),
```math
f(s^2)=\frac1{\pi^2}\int_a^b
\frac{dR}{\sqrt{R(L-R)(R-a)(b-R)}}.
```
Here $R=1+s^2-2s\cos\varphi$ in the circular average and $dR/\sqrt{(R-a)(b-R)}=d\varphi$ for $0<\varphi<\pi$. Substituting $t=b(R-a)/((b-a)R)$ in the last integral gives
```math
f(s^2)=\frac{2K(m)}{\pi^2\sqrt D},\quad
D=b(L-a),\quad m=\frac{L(b-a)}{b(L-a)}=\frac{16xs}{D},
\quad 1-m=\frac{a(L-b)}{D}.
\tag{1}
```
We use the *parameter* convention $K(m)=\int_0^{\pi/2}(1-m\sin^2\varphi)^{-1/2}d\varphi$, initially real for $m<1$ and then principal in $\mathbb C\setminus[1,\infty)$.

Let $\widehat f(u)$ be the analytic continuation of the density germ in (1), rather than the actual density after crossing its singularities. The formula makes it holomorphic on $\mathbb C\setminus[1,\infty)$: the only possible finite singularities in the $u$-plane are
```math
u=0,\quad 1,\quad s_A^2,\quad s_B^2,\qquad
s_A=2\sqrt{x}-1>1,\quad s_B=2\sqrt{x}+1.
```
Indeed, aside from $s=\sqrt u=0$, they come from $D=0$ or $m=1$; the hypergeometric function $`K`$ can be continued off its singular points $0,1,\infty$. The point $u=0$ is regular for this starting branch: before evaluating the angular integral it is an average of an analytic function of $1+s^2-2s\cos\varphi$ near $s=0$, and the average is an even analytic function of $`s`$. Monodromy around $u=0$ is therefore trivial. After removing $u=0$ from the slit plane this loop generates its fundamental group, so the starting germ continues single-valuedly and extends back over $0$. In particular, $\widehat f$ is real on the real axis below $1$ by conjugation symmetry.

### Sign on the upper bank

We claim
```math
\mathop{\mathrm{Im}}\widehat f(u+i0)\ge0\qquad(u>0)
\tag{2}
```
away from its finitely many singular points. It is zero for $0<u<1$. To compute it for $u=s^2>1$, continue $`s`$ along upper detours of the positive real axis. At $s=1$ the parameter $1-m$ has a double zero with positive nonvanishing residual factor. On crossing $s=1$ in the upper half-plane, $(s-1)^2$ winds once clockwise; the argument of $1-m$ decreases by $2\pi$. The local expansion at $m=1$ has logarithmic term $-K(1-m)\log(1-m)/\pi$ (the [standard expansion of $`K`$ near its logarithmic singularity](https://dlmf.nist.gov/19.12.E1), with squared modulus as parameter). Thus continuation around this double zero replaces $K(m)$ by $K(m)+2iK(1-m)$, with the parameters below interpreted on their specified banks.

* If $1<s<s_A$, then $D>0$ and $0<m<1$. The numerator is $K(m)+2iK(1-m)$, with positive imaginary part.
* If $s_A<s<s_B$, then $D>0$ and $m>1$. At $s_A$ the simple zero of $1-m$ has negative derivative, so $m$ crosses onto the **upper** bank of its cut, while $1-m<0$. The numerator is $K(m+i0)+2iK(1-m)$, with positive imaginary part. For $y>1$, the sign $\mathop{\mathrm{Im}}K(y+i0)>0$ follows directly from the defining integral: the negative values of $1-y\sin^2\varphi$ are approached from below.
* If $s>s_B$, then $D<0$ and $m<0$. Along a small upper detour at $s_B$, the simple pole of $m$ with negative residue takes $m$ from the upper bank at $+\infty$ through the upper half-plane to a large negative value; $1-m$ goes through the lower half-plane. The factor $\sqrt D$ becomes $-i\sqrt{|D|}$ because $D$ has a simple zero with negative derivative. After division by this factor the imaginary part of the continued expression in (1) is proportional to

```math
K(m)-2\mathop{\mathrm{Im}}K(1-m-i0)>0 .
```

The lower bank value is the conjugate of the upper bank value.

The indicated continuations can be checked locally at each crossing and then followed along the intervening real intervals, none of which contains a singularity. This proves (2).

We record size bounds used below. In the closed upper half-plane near $1,s_A^2,s_B^2$, $\widehat f$ is at most logarithmically singular. For the first two points this follows from the expansion at $m=1$. For $s_B^2$ one has $m$ of order $(s-s_B)^{-1}$ and $D$ of order $s-s_B$. Both principal $K(m)$ and $K(1-m)$ are $O(|m|^{-1/2}\log(2+|m|))$ in the relevant half-planes. For example, from the integral for the principal $K(v)$, bound the absolute integrand by $|1-|v|\sin^2\varphi|^{-1/2}$ and substitute $t=\sqrt{|v|}\sin\varphi$; this gives that bound uniformly on both banks for large $|v|$. The singular factor $D^{-1/2}$ therefore leaves only a logarithm. Finally, as $|u|\to\infty$ in the closed upper half-plane,
```math
\widehat f(u)=O\big(|u|^{-1}\log(2+|u|)\big).
\tag{3}
```
To see this uniformly, in the first quadrant for $s=\sqrt u$ we have $D\sim-s^4$ and $m\sim-16x/s^3$. Near $m=0$ the two local hypergeometric solutions have bounded analytic and at-most-logarithmic growth, respectively: they can be taken as $K(m)$ and $K(1-m)$. A continuous logarithm of $m$ has bounded argument on this large-$`s`$ quadrant, so analytic continuation of any fixed linear combination has the same uniform growth bound. This, times $D^{-1/2}$, proves (3).

## 2. A positive integral for the low-radius density

Reflecting $\widehat f$ across the real axis gives conjugate upper and lower boundary values on its cut. Cauchy's formula around the cut, using (3) at infinity, gives
```math
\widehat f(u)=\frac1\pi\int_1^\infty
  \frac{\mathop{\mathrm{Im}}\widehat f(t+i0)}{t-u}\,dt
 \qquad (u\notin[1,\infty)).
```
For clarity, small circles around the three finite singularities contribute $O(\epsilon(1+|\log\epsilon|))$ by the local logarithmic bounds, and large circles contribute $O(\log R/R)$. Thus there are no pole terms. By (2) the right side is a positive Stieltjes mixture:
```math
f(u)=\int_{[0,1]}(1-\kappa u)^{-1}\,d\sigma(\kappa),
\qquad 0\le u<1,
\tag{4}
```
where $\sigma$ is the pushforward of
$`\mathop{\mathrm{Im}}\widehat f(t+i0)\,dt/(\pi t)`$ under $t\mapsto \kappa=1/t$. The measure is finite, either directly by the bounds or by evaluating at $u=0$.

Let $\beta$ be the probability measure with density $dv/(2\sqrt{1-v})$ on $(0,1)$. Its moments are $k!/(3/2)_k$, with $(a)_k=a(a+1)\cdots(a+k-1)$. The binomial series then shows
```math
(1-\kappa u)^{-1}
 =\int_0^1(1-v\kappa u)^{-3/2}\,d\beta(v)
 \quad (0\le\kappa\le1,\ 0\le u<1).
\tag{5}
```
For almost every pair $(\kappa,v)$ there is a unique $q\in[0,1)$ such that $v\kappa=4q/(1+q)^2$. The Legendre Poisson kernel identity is
```math
\int_0^1 P_n(2u-1)
\frac{1-q^2}{(1-2q(2u-1)+q^2)^{3/2}}\,du=q^n.
\tag{6}
```
It follows by applying $1+2q\partial_q$ to the ordinary Legendre generating function and using Legendre orthogonality on $[-1,1]$. In (6) the kernel is the positive multiple $(1-q^2)/(1+q)^3$ of $(1-v\kappa u)^{-3/2}$. Thus for $0\le u<1$, each kernel in the mixture (5) contributes a positive multiple of the moment sequence $(q^n)_n$ when integrated against $`P_n(2u-1)\,du`$. The reweighted mixture has finite total mass: integrating at $n=0$ by Tonelli gives $`\int_0^1 f(u)\,du\le1`$. For other $n$, exchanging integrals is justified by $|P_n(2u-1)|\le1$. We conclude that the $U<1$ part of $\mathbb E P_n(2U-1)$ is a positive moment sequence with support in $[0,1]$.

## 3. The high-radius contribution

When $U\ge1$, one has $T=2U-1\ge1$ and the classical Laplace formula gives
```math
P_n(T)=\frac1\pi\int_0^\pi
  \big(T+\sqrt{T^2-1}\cos\theta\big)^n\,d\theta.
```
For example it follows by integrating the generating function of the powers of the parenthesized expression and comparing with the Legendre generating function. The expression is positive for $T\ge1$, so the $U\ge1$ part is also a positive moment sequence. Adding the two representing measures yields a positive measure on $[0,\infty)$ with moments $A_n(x)$. This proves the theorem.

For the endpoint $`x=1`$, take $x\downarrow1$. The constructed measures are probability measures (the zeroth moment is $1$) with support uniformly bounded for $1<x\le2$: the low-radius part is supported on $[0,1]$ and the high-radius part is supported below $2(2(1+2\sqrt 2)^2-1)$. A subsequential weak limit exists on this fixed compact interval. Since each $A_n(x)$ is continuous in $x$, the limit represents $A_n(1)$. This gives another proof of the endpoint already established by Edgar.
