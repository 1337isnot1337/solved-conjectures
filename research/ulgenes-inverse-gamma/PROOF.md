# Ulgenes’s inverse-gamma Newton-series conjecture

## Status and exact scope

This is a complete candidate proof of Conjecture 3.1 in David Peter Hadrian
Ulgenes, *Series and Product Representations of Gamma, Pseudogamma and Inverse
Gamma Functions*, Maple Transactions 5(1), Article 16090 (2025),
[DOI 10.5206/mt.v5i1.16090](https://doi.org/10.5206/mt.v5i1.16090).
The statement is on p. 9 of
[arXiv:2301.09699v4](https://arxiv.org/pdf/2301.09699v4).
Independent review and the prior-resolution audit are in progress in
[issue 113](https://github.com/1337isnot1337/solved-conjectures/issues/113).

Let $\alpha$ be the unique positive zero of the digamma function $\psi$.
Write $\Gamma^{-1}_{+}$ for the inverse of the restriction of $\Gamma$ to
$(\alpha,\infty)$. The conjecture is that, for every $x>\Gamma(\alpha)$,

```math
\Gamma^{-1}_{+}(x)
=2+\sum_{n=0}^{\infty}
\left[
\sum_{k=0}^{n}
\frac{k}{
\displaystyle
\left(\prod_{i=1}^{k}\log\frac{(k+1)!}{i!}\right)
\left(\prod_{i=1}^{n-k}\log\frac{(k+1)!}{(k+1+i)!}\right)
}
\right]
\prod_{i=1}^{n}\log\frac{x}{i!}.
\tag{1}
```

Empty products have value $1$. The term with $n=0$ is $0$.
We prove (1) on the entire stated interval. In fact, the series converges
locally uniformly there and absolutely at every point of the interval.

The classical inputs are Pedersen's conformal mapping description of
$\log\Gamma$ and the Nevanlinna representation for Pick functions. The
interpolation identity and its convergence argument are proved below.
No assertion of novelty is made for these classical inputs or for the
general interpolation principle by itself.

## 1. The inverse of $\log\Gamma$ is a Pick function

Set

```math
a=\log\Gamma(\alpha),\qquad
F(t)=\Gamma^{-1}_{+}(e^t),\qquad t>a.
\tag{2}
```

Since $\Gamma(1)=\Gamma(2)=1$ and $\log\Gamma$ is strictly convex on
$(0,\infty)$, its minimum satisfies $a<0$ and $1<\alpha<2$.

We use the holomorphic branch of $\log\Gamma$ on
$\mathbb C\setminus(-\infty,0]$ that is real on the positive real axis.
Pedersen proves that this branch maps the upper half-plane conformally onto

```math
\mathcal V
=\mathbb C\setminus
\bigcup_{j=0}^{\infty}
\left\{u-ij\pi:
u\ge\log|\Gamma(\alpha_j)|\right\},
\tag{3}
```

where $\alpha_0=\alpha$ and $\alpha_j$ is the critical point of $\Gamma$
in $(-j,-j+1)$ for $j\ge1$. See
[Pedersen, *Inverses of gamma functions*, §2, equation (2)](https://arxiv.org/pdf/1309.2167).
In particular, $\mathcal V$ contains the upper half-plane.

The inverse conformal map, restricted to that upper half-plane, is therefore
a Pick function: it is holomorphic and takes values in the upper half-plane.
It agrees with $F$ on the upper boundary of $(a,\infty)$.
To check the branch, take any $u>\alpha$. Since
$(\log\Gamma)'(u)=\psi(u)>0$, the local inverse at
$\log\Gamma(u)$ sends points immediately above the real axis to points
above $u$. Uniqueness of the inverse in (3) identifies this local inverse
with the inverse conformal map. Thus $F$ extends holomorphically and with
real values across every point of $(a,\infty)$.

The Nevanlinna representation now gives real $A$, a number $B\ge0$, and a
positive measure $\mu$ such that

```math
F(t)=A+Bt+
\int_{(-\infty,a]}
\left(\frac{1}{s-t}-\frac{s}{1+s^2}\right)\,d\mu(s),
\qquad t>a,
\tag{4}
```

with

```math
\int_{(-\infty,a]}\frac{d\mu(s)}{1+s^2}<\infty.
\tag{5}
```

The general representation and its measure-recovery formula are recalled
at the beginning of §4 of Pedersen's paper. The support restriction here
follows from the real holomorphic extension across $(a,\infty)$:
the boundary imaginary part vanishes uniformly on every compact
subinterval, so the measure-recovery formula assigns zero measure there.
Formula (4) concerns the inverse of $\log\Gamma$, rather than merely the
inverse of $\Gamma$.

## 2. An exact interpolation remainder

Let $0\le\lambda_1<\lambda_2<\cdots$ tend to infinity.
For $n\ge1$, let $P_n$ be the polynomial of degree at most $n$ interpolating
$F$ at $\lambda_1,\ldots,\lambda_{n+1}$, and put

```math
\omega_n(t)=\prod_{j=1}^{n+1}(t-\lambda_j).
```

For any $s\le a$, the polynomial interpolating
$t\mapsto1/(s-t)$ at these nodes has the exact remainder

```math
\frac{1}{s-t}
-\sum_{j=1}^{n+1}
\frac{1}{s-\lambda_j}
\prod_{\substack{1\le\ell\le n+1\\\ell\ne j}}
\frac{t-\lambda_\ell}{\lambda_j-\lambda_\ell}
=\frac{\omega_n(t)}{
(s-t)\prod_{j=1}^{n+1}(s-\lambda_j)}.
\tag{6}
```

One proof is to multiply both sides by $s-t$. Their difference is a
polynomial of degree at most $n+1$, vanishes at all $n+1$ nodes, and also
vanishes at $t=s$. Hence it vanishes identically. At $t=s$, the right-hand
numerator divided by $\prod_j(s-\lambda_j)$ has value $1$, which gives
the needed last zero after subtraction.

Interpolation reproduces affine functions because $n\ge1$. Applying
(6) inside (4) therefore gives

```math
F(t)-P_n(t)
=\int_{(-\infty,a]}
\frac{1}{s-t}
\prod_{j=1}^{n+1}\frac{t-\lambda_j}{s-\lambda_j}
\,d\mu(s).
\tag{7}
```

This interchange involves only a finite linear combination. Each
renormalized kernel in (4) is integrable by (5). The combined remainder
kernel in (7) is bounded on bounded subsets of $(-\infty,a]$ and is
$O(|s|^{-n-2})$ as $s\to-\infty$, so it is also integrable.

## 3. Convergence when the reciprocals of the nodes have divergent sum

Assume

```math
\sum_{j=2}^{\infty}\frac{1}{\lambda_j-a}=\infty.
\tag{8}
```

Fix a compact interval $K=[b,c]\subset(a,\infty)$. Choose an integer
$M\ge2$ such that $\lambda_{M+1}>c$. For $j>M$, $t\in K$, and $s\le a$,

```math
\left|\frac{t-\lambda_j}{s-\lambda_j}\right|
=\frac{\lambda_j-t}{\lambda_j-s}
\le\frac{\lambda_j-b}{\lambda_j-a}
=1-\frac{b-a}{\lambda_j-a}<1.
\tag{9}
```

Define the finite constant

```math
C_K=
\left(\sup_{t\in K}\prod_{j=1}^{M}|t-\lambda_j|\right)
\int_{(-\infty,a]}
\frac{d\mu(s)}{(b-s)\prod_{j=1}^{M}(\lambda_j-s)}.
\tag{10}
```

The integral is finite: its integrand is continuous away from the support
endpoint denominators, all those denominators are positive there, and its
decay is $O(|s|^{-M-1})$. This is integrable by (5).

For $n+1\ge M$, equations (7)–(10) imply

```math
\sup_{t\in K}|F(t)-P_n(t)|
\le C_K
\prod_{j=M+1}^{n+1}
\left(1-\frac{b-a}{\lambda_j-a}\right)
\le C_K
\exp\left(-(b-a)
\sum_{j=M+1}^{n+1}\frac{1}{\lambda_j-a}\right).
\tag{11}
```

The last expression tends to zero by (8). Thus the interpolation
polynomials converge to $F$ locally uniformly on $(a,\infty)$.
The argument also includes any $t$ equal to an interpolation node,
where the remainder is identically zero from that stage onward.

## 4. Logarithmic factorial nodes and the exact source coefficients

Take

```math
\lambda_j=\log(j!),\qquad j\ge1.
\tag{12}
```

These nodes are strictly increasing from $\lambda_1=0$.
For $j\ge2$, $\lambda_j\le j\log j$. Consequently (8) holds, since

```math
\sum_{j=2}^{\infty}\frac{1}{\log(j!)-a}
\ge\sum_{j=2}^{\infty}\frac{1}{j\log j+|a|}
=\infty.
\tag{13}
```

Moreover, $j+1>\alpha$ and $\Gamma(j+1)=j!$, so

```math
F(\lambda_j)=j+1.
\tag{14}
```

The Newton interpolation formula is

```math
P_N(t)=F(\lambda_1)+
\sum_{n=1}^{N} d_n\prod_{j=1}^{n}(t-\lambda_j),
\qquad
d_n=F[\lambda_1,\ldots,\lambda_{n+1}].
\tag{15}
```

The explicit divided-difference formula and (14) give, for $n\ge1$,

```math
d_n=
\sum_{k=0}^{n}
\frac{k+2}{
\displaystyle\prod_{\substack{0\le\ell\le n\\\ell\ne k}}
(\lambda_{k+1}-\lambda_{\ell+1})}
=
\sum_{k=0}^{n}
\frac{k}{
\displaystyle\prod_{\substack{0\le\ell\le n\\\ell\ne k}}
(\lambda_{k+1}-\lambda_{\ell+1})}.
\tag{16}
```

The last equality subtracts the constant $2$, whose divided differences
of every positive order vanish. Separate the denominator into
$\ell<k$ and $\ell>k$. By (12), it becomes exactly

```math
\prod_{\ell\ne k}
(\lambda_{k+1}-\lambda_{\ell+1})
=
\left(\prod_{i=1}^{k}\log\frac{(k+1)!}{i!}\right)
\left(\prod_{i=1}^{n-k}\log\frac{(k+1)!}{(k+1+i)!}\right).
\tag{17}
```

Finally, $F(\lambda_1)=2$ and

```math
\prod_{j=1}^{n}(\log x-\lambda_j)
=\prod_{j=1}^{n}\log\frac{x}{j!}.
\tag{18}
```

Thus the partial sums of (1) are exactly $P_N(\log x)$.
Section 3 proves their convergence to
$F(\log x)=\Gamma^{-1}_{+}(x)$ for every $x>\Gamma(\alpha)$.
Compact subsets of this interval map to compact subsets of $(a,\infty)$
under $\log$, so convergence is locally uniform in $x$ as well.

## 5. Absolute convergence

Formula (4) also determines the signs of the divided differences.
For $n\ge2$,

```math
d_n=
\int_{(-\infty,a]}
\frac{d\mu(s)}{\prod_{j=1}^{n+1}(s-\lambda_j)},
\qquad
(-1)^{n-1}d_n\ge0.
\tag{19}
```

For $n=1$, the same integral is supplemented by $B\ge0$, so $d_1\ge0$.
The integrals are justified by (5), as in Section 2.

Fix $t>a$. If $t$ is a node, all sufficiently late Newton terms vanish.
Otherwise let $q$ be the finite number of nodes smaller than $t$.
For every $n\ge\max(2,q)$,

```math
\mathop{\mathrm{sgn}}
\left(\prod_{j=1}^{n}(t-\lambda_j)\right)=(-1)^{n-q}.
```

Together with (19), this says that every sufficiently late nonzero term
of the Newton series has the same sign, namely $(-1)^{q-1}$.
Its partial sums already converge by Section 3. The sum of the absolute
values of this one-sign tail therefore converges. This proves absolute
convergence at every point in the conjectured interval.

## Classical sources and scope of the deduction

1. D. P. H. Ulgenes, *Series and Product Representations of Gamma,
   Pseudogamma and Inverse Gamma Functions*, Maple Transactions 5(1)
   (2025), Article 16090, Conjecture 3.1.
   [Publisher](https://mapletransactions.org/index.php/maple/article/view/16090),
   [arXiv v4](https://arxiv.org/pdf/2301.09699v4).
2. H. L. Pedersen, *Inverses of gamma functions*, Constructive Approximation
   41 (2015), 251–267. The preprint's §2, equation (2), gives the conformal
   image of $\log\Gamma$; §4 recalls the Nevanlinna representation.
   [Full preprint](https://arxiv.org/pdf/1309.2167).

The conclusion here is the exact infinite series in Ulgenes's conjecture,
with its full real domain and its published coefficients. The proof does
not rely on finite numerical agreement, fixed orders, or formalization.
