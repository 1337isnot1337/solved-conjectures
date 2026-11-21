# Real van der Waerden radius

## A sharp asymptotic threshold under bounded nuclear norm and diffuse rows and columns

Set $d_n=n!/n^n$, and let $J_n$ have every entry $1/n$. Suppose $B=B_n$
is real of order $n$, with zero row and column sums, and that

1. its nuclear norm (sum of singular values) is bounded by a fixed $L$,
2. its largest singular value is bounded by a fixed $\rho<1$, and
3. the largest Euclidean norm of a row or column tends to zero.

Then

~~~math
\frac{\operatorname{per}(J_n+B)}{d_n}
=\det(I-B^TB)^{-1/2}+o(1).
\tag{1}
~~~

In particular, eventually every nonzero $B_n$ in the sequence satisfies
$\operatorname{per}(J_n+B_n)>d_n$. The entries may be negative and the
rank may grow. In this class the threshold one for the operator norm is
sharp in the following sense. The [nearest Hall examples](hall-bound.md)
have centered rank one, nuclear and operator norms $H_n\to1$, and individual
row and column norms $O(n^{-1/2})$, yet their permanents vanish. Every fixed
operator-norm bound below one works eventually, and every fixed bound
above one admits violations in arbitrarily large orders. This leaves
Sinkhorn's [unrestricted sharp Frobenius radius](https://yair-lavi.com/mincs-list/problem-13/index.html)
undetermined.

### Controlling every normalized coefficient

Use a real thin singular-value decomposition $B=U\Sigma V^T$ with
positive singular values $s_j$; the zero matrix is immediate. For a
standard circular complex Gaussian vector $z$ of this rank let

~~~math
X=U\Sigma^{1/2}z,\quad Y=V\Sigma^{1/2}\bar z,\quad
Q=\|X\|^2=\|Y\|^2=\sum_j s_j|z_j|^2 .
~~~

Both vectors have coordinate sum zero, since the columns of $U,V$ are
orthogonal to the all-ones vector. Let $e_k(x)$ be the degree-$k$
elementary symmetric polynomial in the coordinates of $x$. The sum
$\sigma_k(B)$ of the $k$-rowed subpermanents equals
$\mathbb E[e_k(X)e_k(Y)]$ by the complex Gaussian pairing formula.
Expansion of the permanent around $J_n$ then gives

~~~math
\frac{\operatorname{per}(J_n+B)}{d_n}
=\sum_{k=0}^n c_{n,k},\qquad
c_{n,k}=\frac{n^k(n-k)!}{n!}\mathbb E[e_k(X)e_k(Y)].
~~~

For a deterministic zero-sum complex vector $x$, the arithmetic–geometric
mean inequality gives
$|\prod_i(1+w x_i)|\le(1+|w|^2\|x\|^2/n)^{n/2}$.
Cauchy's coefficient estimate on a circle with
$|w|^2=nk/[(n-k)\|x\|^2]$ therefore gives

~~~math
|e_k(x)|^2\le \|x\|^{2k}
\frac{n^{n-k}}{k^k(n-k)^{n-k}} .
~~~

Use the limit of radii tending to infinity for $k=n$; take $0^0=1$.
The zero vector and $k=0$ are immediate. The variables $|z_j|^2$ are
independent mean-one exponentials, so $\mathbb E Q^k=k!h_k(s)$, where
$h_k$ is the complete homogeneous symmetric polynomial. Applying the last
estimate separately to $X,Y$ yields

~~~math
|c_{n,k}|\le
\frac{n^n}{\binom nk k^k(n-k)^{n-k}}\,h_k(s).
\tag{2}
~~~

The prefactor is at most $C\sqrt{k+1}$ for an absolute $C$. Its reciprocal
is the probability of the mode $k$ in a binomial variable of parameters
$n,k/n$. Its variance is at most $k$, so at least three quarters of the
mass lies within $2\sqrt{k}$ of $k$ for $k>0$. The largest mass times the
number of integers in this interval bounds that probability from above.
For $1<R<1/\rho$ (any $R>1$ if $\rho=0$),

~~~math
\sum_{k\ge0}R^k h_k(s)
=\prod_j(1-Rs_j)^{-1}\le \exp(RL/(1-R\rho)).
~~~

Together with (2) this gives a uniformly summable bound on the
normalized coefficients through degree $n$, including the last ones.

### The limiting coefficients

Put $D=\sum_i X_i^2=\sum_j s_jz_j^2$. Then $\sum_i Y_i^2=\bar D$
and $|D|\le Q$. The variance $v_i=\mathbb E|X_i|^2$ is the $i$th
diagonal entry of $(BB^T)^{1/2}$. Cauchy–Schwarz gives
$v_i\le\sqrt{(BB^T)_{ii}}$. Thus $\max_i v_i=o(1)$ and
$\sum_i v_i\le L$, so

~~~math
\mathbb E\sum_i |X_i|^3 = \mathbb E|z_1|^3\sum_i v_i^{3/2}=o(1).
~~~

The same estimate holds for $Y$. With probability tending to one all
coordinates of $X$ have modulus below $1/2$. The logarithm series and
the zero coordinate sum give, uniformly in $|w|\le1$,

~~~math
\sum_i\log(1+wX_i)=-w^2D/2+O\!\left(\sum_i |X_i|^3\right).
~~~

The remainder tends to zero in probability, and $D$ is bounded in
probability by $Q$ with $\mathbb E Q\le L$. Exponentiating and extracting
a fixed coefficient by Cauchy's formula shows that $e_k(X)$ differs in
probability by $o(1)$ from $t_k(D)=[w^k]\exp(-w^2 D/2)$. The same holds
for $Y$ and $t_k(\bar D)$. The products converge in this same difference
sense in expectation: for fixed $k$, their squared moduli are bounded
by $C_k Q^{2k}$, using the coefficient bound above and
$(1-k/n)^{-(n-k)}\le e^k$. All moments of $Q$ are uniformly bounded
by its moment-generating function at $R$. Thus for each fixed $k$,

~~~math
c_{n,k}-\mathbb E|t_k(D)|^2\longrightarrow0.
~~~

The comparison series is uniformly summable as well. Its odd terms vanish
and its degree $2j$ term is at most
$\mathbb E Q^{2j}/[4^j(j!)^2]\le h_{2j}(s)$.
The two infinite sums therefore differ by $o(1)$, taking $c_{n,k}=0$
above degree $n$. By circular symmetry $D$ has rotation-invariant law.
Averaging $\exp(-\mathrm{Re}\,D)$ over the phase gives precisely
$\sum_{k\ge0}|t_k(D)|^2$ for a fixed magnitude. Finally,

~~~math
\mathbb E e^{-\mathrm{Re}\,D}
=\prod_j (1-s_j^2)^{-1/2}
=\det(I-B^TB)^{-1/2},
~~~

by the independent real and imaginary Gaussian components of variance
one half. This proves (1). To see eventual strictness, the previously
proved [uniform local bound](../nov20-independent/inequalities/uniform_radial_permanent.md)
already gives it for nonzero Frobenius norm at most $1/1000$.
For larger norm, $-\tfrac12\sum_j\log(1-s_j^2)\ge\|B\|_F^2/2$
gives a fixed positive margin in (1).

## Relation to published work

[McCullagh](https://arxiv.org/abs/1205.5723) obtained the determinant
asymptotic on moderate-deviation doubly stochastic matrices. The more
recent [Proposition 3.1 and its proof](https://arxiv.org/html/2610.23755v1#S3)
use an $O(1/n)$ entry bound for a uniform version and supply the Gaussian
subpermanent identity and centered arithmetic–geometric mean estimate
used here. The present coefficient bound includes the finite factorial
normalization directly. Neither a new determinant formula nor general
historical priority is claimed.

For example take $m=m(n)$ even with $m\to\infty$ and $m/n\to0$.
Set $u_i=\pm1/\sqrt m$ equally often on $m$ coordinates and zero elsewhere,
and $B=suu^T$ with fixed $0<s<1$. The signed matrix $J_n+B$ satisfies
the assumptions of (1), while $n\|B\|_{\max}=sn/m\to\infty$ and for
each $p>2$ the average absolute $p$th power of the entries of $nB$ is
$s^p(n/m)^{p-2}\to\infty$. This distinguishes the hypotheses from
the two cited entry or moment assumptions. The theorem does not cover
directions with localized rows or columns or unbounded nuclear norm.
