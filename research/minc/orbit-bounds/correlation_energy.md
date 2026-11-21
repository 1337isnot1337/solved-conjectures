# Chollet’s conjecture

For a complex positive semidefinite correlation matrix $C$ of arbitrary order, put $w_{ij}=|c_{ij}|^2$ for distinct indices, $w_{ii}=0$, $S=\sum_{ij} w_{ij}$ and $T=\max_i\sum_j w_{ij}$. Then
```math
\log\operatorname{per} C\ \ge\ \frac{S}{6\max(27/4+T,\,2T)}.             \tag{1}
```
In particular **the stronger self-product inequality** $\operatorname{per}(C\circ\overline C)<\operatorname{per}C$ holds whenever $C\ne I$ and
```math
T\le 101/100,\qquad \sum_{ij}w_{ij}^2\le S/1000.                         \tag{2}
```
The second condition holds, for example, if every off-diagonal squared modulus is at most $1/1000$. No restriction on the rank, support pattern or order is needed. For two matrices satisfying (2), Cauchy–Schwarz on permutation weights proves the mixed Chollet inequality. Positive diagonal scaling allows application to normalized correlations of general PSD matrices. A zero diagonal entry forces its whole row to vanish.

## Deletion of a vector

Fix $0<t<1$, $\delta=1-t$, and put $C_t=tC+\delta I$. Write $Z_U=\operatorname{per}C_t[U,U]$ for a set of labels, with $Z_\varnothing=1$. Set $r_j(U)=Z_U/Z_{U-j}$ for $j\in U$. The following simultaneous bound on all coefficients of a differentiated product will be useful:
```math
r_i(U+i)\ge1+\delta t^2\sum_{j\in U}\frac{w_{ij}}{r_j(U)^2},\qquad i\notin U.   \tag{3}
```

To prove it, take standard circular complex Gaussian coordinates. Represent the Gram forms for $C_t$ as $L_j=m_j+\sqrt\delta\,z_j$, where the vector of shared forms $m$ has covariance $tC$ and the $z_j$ are independent standard coordinates, independent of $m$. Put $p_U=\prod_{j\in U}L_j$. Wick's identity gives $\|p_U\|_2^2=Z_U$. In the Gaussian space of analytic polynomials, multiplication by a linear form has adjoint its directional derivative. This follows on monomials from $\|z^\alpha\|^2=\alpha!$. Commuting the derivative past multiplication by the unit form $L_i$ gives
```math
Z_{U+i}=Z_U+\left\|\sum_{j\in U} b_j p_{U-j}\right\|_2^2,
\qquad |b_j|^2=t^2w_{ij}.
```
In particular every $r_j\ge1$ and every $Z_U$ is positive.

Tilt the Gaussian law by $|p_U|^2/Z_U$. Conditional on $m$, the coordinates $z_j$ are still independent under this law, each tilted by $|L_j|^2/h_j$, where $h_j=|m_j|^2+\delta$. The conditional mean of $1/L_j$ is $\overline{m_j}/h_j$ and its conditional second absolute moment is $1/h_j$. Its variance is therefore $\delta/h_j^2$. Dropping the squared conditional mean in the second moment of $\sum_j b_j/L_j$ yields
```math
\frac{\|\sum_j b_j p_{U-j}\|_2^2}{Z_U}
\ge \delta\sum_j |b_j|^2\mathbb E_{\rm tilt}(h_j^{-2})
\ge \delta\sum_j |b_j|^2 (Z_{U-j}/Z_U)^2.
```
In the last step the marginal density on $m$ is proportional to $\prod_{j\in U}h_j$, so $\mathbb E_{\rm tilt}(h_j^{-1})=Z_{U-j}/Z_U$. This proves (3).

## Averaging the deletion bounds

Set $t=2/3$, $b=\delta t^2=4/27$ and $a=b/(1+bT)$. Since $\log(1+x)\ge x/(1+x)$, (3) implies
```math
\log r_i(U+i)\ge a\sum_{j\in U} w_{ij}(1-2\log r_j(U)).
```
Indeed the sum with $r_j^{-2}$ is at most $T$ before multiplication by $b$, and $e^{-2x}\ge1-2x$.

Include every index independently with probability $p$, obtaining $U_p$, and let $G(p)=\mathbb E\log Z_{U_p}$. Differentiating the finite expectation gives $G'(p)=\sum_i D_i(p)$, where $D_i$ averages $\log r_i(U+i)$ over the other indices. All $D_i$ are nonnegative. For a distinct $i,j$, conditioning the set for $D_j$ on the absence of $i$ gives expectation at most $D_j/(1-p)$. Consequently, applying the last deletion bound to every $i$ and summing proves
```math
G'(p)\ge apS-2aTp\,G'(p)/(1-p),\qquad 0<p<1.
```
The column sums of $W$ are also at most $T$ by symmetry. Rearrangement gives
```math
G'(p)\ge \frac{aS p(1-p)}{1-p+2aTp}
\ge \frac{aS p(1-p)}{\max(1,2aT)} .
```
Integration gives $\log Z_{[n]}\ge S/[6\max(27/4+T,2T)]$. Finally, expanding the permanent in the diagonal $\delta I$ expresses $\operatorname{per}C_t$ as the average of $\operatorname{per} C[V,V]$ for a Bernoulli-$t$ set $V$. Each is at most $\operatorname{per} C$ by adding unit vectors successively in the multiplication–differentiation identity. This proves (1) also for singular $C$.

## A comparison up to and beyond unit row sum

Let $W=(w_{ij})$. Then $I+W=C\circ\overline C$ is a correlation matrix. For $0\le s\le1$, $I+sW$ is also a correlation matrix. Its off-diagonal permanental cofactors have absolute values at most its permanent: Gaussian Cauchy–Schwarz bounds each by the geometric mean of two principal deletion permanents, and each deletion permanent is at most the full one. Thus
```math
\partial_s\log\operatorname{per}(I+sW)\le S.
```
For $qT<1$, the cycle expansion gives
```math
\log\operatorname{per}(I+qW)
\le\sum_{k\ge2}\frac{q^k}{k}\operatorname{tr}W^k
\le\left(\sum_{k\ge2}\frac{q^kT^{k-2}}{k}\right)\sum_{ij}w_{ij}^2 .
```
The exponential of the closed-walk sum includes each collection of vertex-disjoint simple cycles with its correct weight and has only nonnegative further terms. The second inequality follows from symmetry and $\|W\|_{\rm op}\le T$. Take $q=197/200$. Under (2), $q(101/100)<199/200$ and the scalar series is less than $\log 200<6$ by using $101/100$ for $T$. Integrating the derivative bound from $q$ to 1 now gives
```math
\log\operatorname{per}(I+W)\le (3/200+6/1000)S
< S/47 \le \log\operatorname{per} C\quad(S>0).
```
For normalized matrices $C,D$ obeying (2), the mixed permanent is bounded by the square root of the two self-product permanents by ordinary Cauchy–Schwarz. Both ordinary permanents are at least one, proving the mixed claim, including the identity cases.

## Marcus’s block-permanent inequality

There is a second application of (1). Split the unit vectors into internally orthonormal packets of size $k\ge2$. For their Gram matrix $C$ let $G_{ij}=\operatorname{per} C_{ij}$ in this partition. The [packet contraction bound](orthonormal_packets.md) gives $\log\operatorname{per}|G|\le S/(k\sqrt5)$. Hence $\operatorname{per}|G|<\operatorname{per} C$ for $C\ne I$ as soon as
```math
k\sqrt5>6\max(27/4+T,2T).
```
The row energy may be bounded by any upper frame bound minus one. In particular a bound on the number of orthonormal families needed to cover the entire collection is unnecessary here.

[Chollet’s listed problem](https://yair-lavi.com/mincs-list/conjecture-30/index.html) and [Marcus’s listed problem](https://yair-lavi.com/mincs-list/conjecture-9/index.html) remain open in this record. The Grone–Pierce correlation bound is $\operatorname{per} C\ge 1+S/n$. [Primary paper](https://doi.org/10.1137/0609016). The source audit also checked structural, low-rank, comparison-matrix and Gaussian bounds under these and Frobenius-norm formulations. [Pant–Singh](https://arxiv.org/abs/2604.24192v2) · [Ma’s low-rank estimates](https://arxiv.org/abs/2609.37461) · [Zhang’s weighted result](https://github.com/mxym/math/blob/079a6c2b729ef37f82a00cb6e4888ed3060046b0/research/weighted-chollet-matching/paper.tex). The elementary closed-walk upper bound and the Gaussian permanent formula are prior tools. No priority claim is made for those inputs. The [exact replay](verify_correlation_energy.py) checks the deletion inequality and its cofactor-matrix form on rational Gram matrices.
