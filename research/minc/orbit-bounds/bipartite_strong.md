# Chollet’s conjecture on complex bipartite supports

For every complex Hermitian positive semidefinite $A$ whose off-diagonal support is bipartite,
```math
 \mathop{\mathrm{per}}(A\circ\bar A)\le \mathop{\mathrm{per}}A\,\prod_i a_{ii}.               \tag{1}
```
Both parts can be arbitrarily large. If all diagonal entries are positive, equality holds precisely when diagonal normalization gives a direct sum of isolated diagonal entries and two-by-two rank-one correlation matrices. Any zero diagonal gives equality. This strengthens the [ordinary bipartite comparison](orthonormal_families.md) but leaves unrestricted [Minc Conjecture 30](https://yair-lavi.com/mincs-list/conjecture-30/) open.

## Occupation lower bound

Normalize the diagonal to one and write $`A=K(C)=\left(\begin{smallmatrix}I&C\\ C^*&I\end{smallmatrix}\right)`$ in bipartition order. The rectangular $C$ is a contraction. Set $D_{ij}=|C_{ij}|^2$, $t_i=\sum_jD_{ij}$, $u_i=\sum_j D_{ij}^2$. Row and column sums of $D$ are at most one. We will bound both sides using the same quantity:
```math
 \mathop{\mathrm{per}} K(D)\ \le\ 2^{\sum_i\sqrt{u_i}}\ \le\ \mathop{\mathrm{per}}K(C).        \tag{2}
```

In the occupation representation from the [preceding proof](orthonormal_families.md), each $N_i$ is a nonnegative integer with $\mathbb EN_i=t_i$ and $\mathbb E N_i(N_i-1)=2(t_i^2-u_i)$. The elementary inequality
```math
 \log(1+h)\ge h\log 2-\tfrac12 h(h-1)\log(4/3)
 \qquad(h=0,1,2,\ldots)
```
is exact at $0,1,2$. For $h\ge 2$ it follows by extending the secant from $1$ to $2$ of the convex function $g(x)=\log(1+x)/x$. Therefore
```math
 \log\mathop{\mathrm{per}}K(C)\ge\sum_i\mathbb E\log(1+N_i)
 \ge\sum_i[t_i\log2-(t_i^2-u_i)\log(4/3)].
```
For fixed $u_i$ the bracket is a concave quadratic in $t_i\in[\sqrt{u_i},1]$. At the lower endpoint it equals $\sqrt{u_i}\log 2$. At the upper endpoint its excess over this value is $(1-\sqrt{u_i})[\log2-(1+\sqrt{u_i})\log(4/3)]\ge0$. This proves the lower bound in (2).

## A contraction upper bound

For any rectangular complex $V$ with $`\|V\|_{\rm op}\le1`$, put $`X=VV^*`$ and $u_i=X_{ii}$. Then
```math
 \mathop{\mathrm{per}}K(V)
 \le\mathop{\mathrm{per}}(I+X)
 \le 2^{\sum_i\sqrt{u_i}}.                                                   \tag{3}
```
For the first inequality expand $`\mathop{\mathrm{per}}K(V)=\sum_{|I|=|J|}|\mathop{\mathrm{per}}V[I,J]|^2`$. In the squared Gaussian polynomial norm of the product of the row forms indexed by $I$, the squarefree monomials give the sum over $J$; the remaining squared coefficients are nonnegative. The norm is $`\mathop{\mathrm{per}}X[I,I]`$. Summing over $I$ gives the claimed bound.

Let $\xi$ be a centered circular complex Gaussian with covariance $X\le I$. Adding independent standard Gaussian noise and conditioning on $\xi$ gives $`\mathop{\mathrm{per}}(I+X)=\mathbb E\prod_i(1+|\xi_i|^2)`$. Discard zero-variance coordinates. The Gaussian Hölder inequality, with each complex coordinate viewed as a real pair, gives
```math
 \mathop{\mathrm{per}}(I+X)\le\prod_i\left[\mathbb E(1+u_i Z)^{1/u_i}\right]^{u_i},
 \qquad Z\sim\mathrm{Exp}(1).
```
The block-diagonal covariance majorant in that inequality is the marginal covariance in block $i$ multiplied by $1/u_i$. It is the realification of the identity, with the common factor $1/2$, and it dominates the realified covariance because $X\le I$. Singular covariances are covered by the same inequality or by a limit. [Chen, Dafnis and Paouris, Theorem 1](https://arxiv.org/abs/1306.2410)

We prove the scalar estimate
```math
 H(p)=\int_0^\infty e^{-x}(1+x/p)^p\,dx\ \le\ 2^{\sqrt p}\quad(p\ge1),          \tag{4}
```
with equality only at 1. Set $h(z)=z-\log(1+z)$ for $z\ge0$. This is an increasing convex bijection onto $[0,\infty)$. Layer integration gives
```math
 H(p)=\int_0^\infty e^{-s}\,p\,h^{-1}(s/p)\,ds .
```
Indeed $`e^{-p h(x/p)}=\int_{ph(x/p)}^\infty e^{-s}\,ds`$. Since $h^{-1}$ is concave, its perspective $p h^{-1}(s/p)$ is concave in $p$. Integrating proves concavity of $H$. We have $H(1)=2$, and differentiating under the integral at 1 gives
```math
 H'(1)=\int_0^\infty e^{-x}\big[(1+x)\log(1+x)-x\big]dx
      =\int_0^\infty \frac{e^{-x}}{1+x}\,dx.
```
The last equality uses integration by parts twice. Near $p=1$ the integrand and its derivative are bounded by an integrable exponential times a polynomial. On $[0,1]$ and $[1,2]$ use the linear chords above $1/(1+x)$; on $[2,\infty)$ use $1/3$. Integration gives
```math
 H'(1)\le\tfrac12+\tfrac1{3e}+\tfrac1{6e^2}<0.647.
```
The derivative of $2^{\sqrt p}$ has global minimum $e(\log2)^2/2>0.650$ on $p\ge1$, by minimizing $2^y/y$ for $y\ge1$. The strict rational comparisons follow from $e>2.71$ by its Taylor series and $\log2>0.693$ by the first three terms of $2\sum_{j\ge0}3^{-(2j+1)}/(2j+1)$. Thus the tangent to $H$ at 1 lies strictly below $2^{\sqrt p}$ for $p>1$. This proves (4). Applying (4) at $p=1/u_i$ proves (3), strictly whenever any $0<u_i<1$.

Finally $D$ is nonnegative and doubly substochastic, so $`\|D\|_{\rm op}\le\sqrt{\|D\|_1\|D\|_\infty}\le1`$. Apply (3) to $V=D$ to prove (2). Equality requires every $u_i$ to be zero or one. A row of $D$ with $u_i=1$ has a single 1 because its sum is at most one. The column sums force those entries into distinct columns. Thus $C$ is a partial permutation matrix with phases, yielding exactly the stated direct sums. Both permanents of the normalized matrices then equal $2^l$ for $l$ nonzero pairs. A zero diagonal gives a zero row in both matrices. Undoing normalization gives (1).

## Sources and scope

Pant and Singh's Theorem 3.1 covers a real symmetric bipartite $Z$-matrix with arbitrary second positive semidefinite factor. Schubr's fourth edition proves the strong self-comparison and its equality cases for unrestricted complex phases when one part has at most five vertices. The argument here treats every bipartite support in the self-comparison. The version-four scope and equality statement were checked against the author's edition record. The source review and exact occupation replay are linked in the preceding note. Priority for unrestricted bipartite supports remains provisional. [Pant and Singh](https://arxiv.org/html/2604.24192v2#S3), [Schubr, fourth edition](https://research.luminaryoddities.org/strong-energy-bounded-permanent-inequalities-bipartite-supports/v/4), [Minc's catalogue](https://yair-lavi.com/mincs-list/conjecture-30/)

Zhang’s 18 November mixed inequality has an unrestricted first factor whenever the second factor has positive semidefinite comparison matrix. For the bipartite correlation matrix above this additional hypothesis is exactly that the operator norm of the entrywise absolute cross matrix is at most one. A normalized Fourier matrix of order q has operator norm one, while its entrywise absolute matrix has operator norm the square root of q. This gives examples in every equal part size q greater than one that distinguish the two hypotheses. [Zhang’s primary proof](https://github.com/mxym/math/blob/079a6c2b729ef37f82a00cb6e4888ed3060046b0/research/weighted-chollet-matching/paper.tex)
