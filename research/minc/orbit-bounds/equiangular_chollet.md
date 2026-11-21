# Chollet’s conjecture

**Every complex correlation matrix whose off-diagonal entries have the same absolute value satisfies Chollet’s self-product inequality, in every order and rank.** The phases are arbitrary subject to positive semidefiniteness. More precisely, for such a matrix $C\ne I$,
```math
\operatorname{per}(C\circ\overline C)<(\operatorname{per}C)^2.            \tag{1}
```
This includes all equiangular Gram systems, without tightness or a restriction on the number of vectors. A second class in Theorem 2 below allows different moduli and arbitrarily large total squared correlation per row. If each of two matrices belongs to either class, Cauchy–Schwarz on permutation monomials gives the mixed Chollet inequality after positive diagonal normalization. A zero on the diagonal forces a zero row and gives equality for that pair. These conditions cover a portion of the [original conjecture](https://yair-lavi.com/mincs-list/conjecture-30/index.html).

## A lower bound using the frame operator

Let $v_1,\ldots,v_n$ be the unit Gram vectors of any complex correlation matrix. Write $F=\sum_i v_i v_i^*$, $q_i=\sum_j|c_{ij}|^2$, and
```math
L(q)=(1+1/q)\log(1+q)-1-\gamma ,
```
where $\gamma$ is Euler's constant. Then
```math
\log\operatorname{per}C\ge\sum_i L(q_i).                                \tag{2}
```
Indeed the permanent is the expectation of $\prod_i |v_i^*g|^2$ under a standard circular complex Gaussian. Evaluate the logarithmic Jensen lower bound under the Gaussian with covariance $I+F$, including the change of density. Its relative entropy against the original law is $\operatorname{tr}F-\log\det(I+F)$. The expected logarithm of each squared form is $\log(1+q_i)-\gamma$, since a standard complex Gaussian squared modulus is exponential of mean one. The scalar function $f(x)=\log(1+x)/x=\int_0^1(1+sx)^{-1}\,ds$ is convex on $[0,\infty)$, with $f(0)=1$. The spectral theorem and Jensen's inequality give
```math
\log\det(I+F)=\operatorname{tr}(Ff(F))
=\sum_i v_i^* f(F)v_i\ge\sum_i f(q_i).
```
Using $\operatorname{tr}F=n$ proves (2). Gaussian log-mean permanent estimates are a prior technique. [Yuan and Parrilo](https://chenyang.co/assets/pdfs/Yuan-Parrilo2021_Article_MaximizingProductsOfLinearForm.pdf) · [Ma](https://arxiv.org/html/2609.37461v1).

## The scalar comparison for equiangular vectors

Let $w$ be the common squared modulus, $T=(n-1)w$ and $q=1+T$. The numerator of (1) is
```math
Q_n(T)=\mathbb E(1-w+wX)^n
=\sum_{j=0}^n(n)_j w^j(1-w)^{n-j},\qquad X\sim\mathrm{Exp}(1).          \tag{3}
```
This follows by expanding the permanent of $(1-w)I+wJ$ in its diagonal part, where $J$ is all ones and $(n)_j$ is falling. $Q_n$ is nondecreasing in $T$ by the permutation formula with diagonal one. The denominator's square root has the two lower bounds $q$ and $\exp(nL(q))$. The first is the [Grone–Pierce correlation inequality](https://doi.org/10.1137/0609016), the second is (2). Both increase with $q$, since $L'(q)=(q-\log(1+q))/q^2>0$.

First let $0<T\le4/5$ and $W=w(J-I)$. The closed-walk bound $\operatorname{per}(I+W)\le\det(I-W)^{-1}$ follows by taking the exponential of $\sum_{j\ge2}\operatorname{tr}(W^j)/j$, which includes each collection of disjoint cycles with its weight. The eigenvalues give
```math
Q_n(T)\le [(1-T)(1+w)^{n-1}]^{-1}\le (1-T^2)^{-1}<q^2.
```
The last inequality follows because $(1-T)(1+T)^3$ increases up to $T=1/2$, then decreases, is one at zero and exceeds one at $4/5$.

For the other values put $\phi(T)=0$ on $0\le T\le1$ and $\phi(T)=\log T-1+1/T$ above one. This is the supremum of $\log(1+Tx)-x$ over $x\ge0$. We have
```math
2 L(1+T)-\phi(T)>1/25\qquad (T\ge4/5).                                \tag{4}
```
At $T=4/5$, use $\gamma<0.578$ and $\log(14/5)>1.029$. Up to $T=1$ use the monotonicity of $L$. For $q=1+T\ge2$ the derivative of the difference is
```math
2(q-\log(1+q))/q^2-(q-2)/(q-1)^2 .
```
On $[2,3]$ the first term is at least $2(3-\log4)/9>1/4$, since $(q-\log(1+q))/q^2=\int_0^1 s/(1+qs)\,ds$. The second term is at most $1/4$. Above three it is at most $1/q$, whereas $q>2\log(1+q)$ gives a larger first term. This proves (4).

For all $n\ge2$, rescale the exponential integral (3) by $X=nx$. The base $1-w+nwx$ is at most $(n/(n-1))(1+Tx)$ and $(n/(n-1))^n\le4$. Integrate over $[0,2]$ using the supremum $\phi(T)$. Beyond 2 the derivative of $\log(1+Tx)-x$ is at most $-1/2$. Hence
```math
Q_n(T)\le8(n+1)\exp(n\phi(T)).
```
For $n\ge200$, $\log(8(n+1))<n/25$ by its value at 200 and the derivatives. Inequality (4) finishes those orders.

For $2\le n<200$ the [scalar certificate](verify_flat_correlations.py) checks $4/5\le T\le n-1$ by subdivision into 1,986 closed rational intervals in total. For each interval $[a,b]$ it checks either $Q_n(b)<(1+a)^2$ or $\log Q_n(b)<2nL(1+a)$. Monotonicity covers the intervening continuum. The upper endpoint polynomial is evaluated by integer arithmetic. For $w=u/d$, its numerator at order $j$ obeys $N_0=1$, $N_j=(d-u)^j+juN_{j-1}$, with the same $w$ at each step. The script brackets logarithms of positive rationals by outward rounding the division and then enlarging Python Decimal's correctly rounded logarithm by one representable unit. Its lower bound for $L$ uses $\gamma<H_{1024}-10\log2<289/500$, also checked in the script. This proves (1) in the remaining orders, including $w=1$. Order one is the identity. The interval computation verifies a scalar comparison independent of phases and dimensions of the Gram vectors.

## Squared correlations of equal row sum

**Theorem 2.** Put $w_{ii}=0$, $w_{ij}=|c_{ij}|^2$ off the diagonal, and suppose each row of $W$ sums to the same $T$. Without any upper bound on $T$, (1) holds for $C\ne I$ whenever
```math
V=\sum_{ij} w_{ij}^2\le 10^{-8}nT.                                      \tag{5}
```
In particular this class includes unit-norm tight frames of unbounded redundancy when the indicated weighted average squared modulus is small. If $F=qI$ on its span then every $q_i=q$.

For $T\le4/5$, this follows from the [correlation energy theorem](correlation_energy.md). For $T\ge30$, put $q=1+T$ and use $Q=\operatorname{per}(I+W)\le q^n$ by row sums. From $q\ge31$ and $\gamma<0.578$ we have $2L(q)>\log q$ since $\log q>2(1+\gamma)$. Equation (2) suffices.

It remains to bound the numerator in $4/5\le T\le30$. Fix $u=1/100$ and let $P$ project onto the eigenspaces of $W$ with eigenvalues greater than $u$. Its rank $h$ is at most $V/u^2$. Since $\|W\|_{\rm op}\le T$, we have
```math
0\preceq I+W\preceq (1+u)I+TP.
```
The left matrix is the entrywise absolute square of a Gram matrix. Permanent is monotone in positive semidefinite order, by tensoring the order and evaluating on the symmetrized product of coordinate basis vectors. Integrating independent Gaussian coordinates for $(1+u)I$ conditionally on $Pg$, then using AM–GM, gives
```math
Q\le\mathbb E\prod_i(1+u+T|(Pg)_i|^2)
 \le\mathbb E(1+u+T\|Pg\|^2/n)^n .
```
For $0<\epsilon<1$, the logarithm of the last base at $\|Pg\|^2/n=x$ is at most $\log(1+u)+(1-\epsilon)x+\phi(T/(1-\epsilon))$. The moment generating function of $\|Pg\|^2$ at $1-\epsilon$ equals $\epsilon^{-h}$. Since $0\le T\phi'(T)\le1$, this gives
```math
\frac1n\log Q\le\phi(T)+\log(1+u)-\log(1-\epsilon)+\frac{V}{nu^2}\log(1/\epsilon).
```
Take $\epsilon=1/100$. The two logarithms in the middle sum to less than $0.021$, and the last term is at most $0.003\log 100<0.015$. The overhead is less than $1/25$, so (2) and (4) prove (1).

The full [Chollet conjecture](https://yair-lavi.com/mincs-list/conjecture-30/index.html) still allows arbitrary Gram moduli and phases. Literature checks included the original catalogue and primary work on low rank, tight and equiangular frames, Gaussian permanent lower bounds, graph support and weighted diagonal dominance. [Ma](https://arxiv.org/abs/2609.37461) handles bounded rank and a particular tight-frame order. [Pant and Singh](https://arxiv.org/abs/2604.24192v2) treat support conditions. [Zhang](https://github.com/mxym/math/blob/079a6c2b729ef37f82a00cb6e4888ed3060046b0/research/weighted-chollet-matching/paper.tex) treats the comparison-matrix condition. No primary source located in the searches gives the unrestricted equiangular result or (5). Historical priority is unconfirmed.
