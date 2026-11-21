# Gyires’s ratio inequality

Suppose a doubly stochastic matrix $A$ has at most two different rows. With $d_n=n!/n^n$, both $d_n\operatorname{per}(AA^T)$ and $d_n\operatorname{per}(A^TA)$ are at most $\operatorname{per}(A)^2$. In particular Gyires's four-term inequality holds, with equality precisely at $J$. Transposition gives the result with at most two different columns. Arbitrarily many distinct columns are allowed in the two-row theorem. The [earlier occupation argument](binary_occupation.md) bounded the second Gram term and the square term but needed a second restriction on the columns for the first Gram term. [Minc Conjecture 20](https://yair-lavi.com/mincs-list/conjecture-20/index.html)

Write $m,r>0$ for the row multiplicities, $n=m+r$, $p=m/n$, $D=mr/n$. For rows $u,v$, write $q_j=m u_j=1-rv_j$ and
$$
 \lambda=\frac{\sum_j(q_j-p)^2}{D}
 =1-\frac{\sum_j q_j(1-q_j)}{D}.
$$
Let $e$ be the centered indicator of the $m$ first-type rows, divided by $\sqrt D$ so it has norm one. Direct multiplication gives $AA^T=J+\lambda ee^T$. Put $G(x)=\operatorname{per}(J+xee^T)/d_n$. The target is $\operatorname{per}(A)/d_n\ge\sqrt{G(\lambda)}$. The constant matrix is immediate.

## Reducing the column parameters

The coefficients $c_k$ of $G$ are nonnegative: they are $n^k e_k(e)^2/\binom nk$, where $e_k$ is the elementary symmetric polynomial. In particular $c_0=1$, $c_1=0$, $c_2=n/(2(n-1))$. On $x\ge0$, $\sqrt{G(x)}$ is convex and increasing because it is the Euclidean norm of the vector with coordinates $\sqrt{c_k}x^{k/2}$ for $k=0$ and $k\ge2$. When two $q_j$ vary with fixed sum, $\lambda$ is affine in their squared difference. So is $\operatorname{per}(A)$ by symmetric multiaffinity in the columns. The margin is concave in that squared difference. At a minimizer maximizing $\sum q_j^2$, two unequal interior coordinates are impossible by concavity. [Pair reduction](binary_extremizers.md)

For a reduced vector let $m-a$ be the number of ones and $r-b$ the number of zeros. Unless it is deterministic, $a,b\ge1$ and the $a+b$ remaining probabilities all equal $a/(a+b)$. Define
$$
 d=\frac{ab}{a+b},\qquad
 B(a,b)=\binom{a+b}{a}\frac{a^a b^b}{(a+b)^{a+b}}.
$$
The Bernoulli sum of $q$ has probability $B(a,b)$ at $m$. The occupation formula gives
$$
 \lambda=1-d/D,\qquad \operatorname{per}(A)/d_n = B(a,b)/B(m,r).
$$
For $AA^T$ the count starts at $m$ and independently refreshes each bit with probability $1-\lambda$. Thus $G(\lambda)=S/B(m,r)$, where $S=\Pr(U=V)$ for independent $U\sim\operatorname{Bin}(m,d/m)$ and $V\sim\operatorname{Bin}(r,d/r)$. The latter count records equality of outgoing and incoming particles. In the deterministic case $S=1$, the normalized permanent of $A$ is $1/B(m,r)$ and the target follows directly.

## Two elementary bounds for the central atom

For positive integers $a\le m$, $b\le r$,
$$
 \frac{B(a,b)}{B(m,r)}\ge (D/d)^{3/8},
 \qquad
 \frac1{2\sqrt2}\le B(a,b)\sqrt d\le\frac1{\sqrt{2\pi}}.                \tag{1}
$$
For a unit increase of the first argument $x$ with second argument $y$, the log decrease of $B$ is $f(x+y)-f(x)$ with $f(x)=x\log(1+1/x)$. The log increase of $xy/(x+y)$ is $\int_x^{x+y}du/[u(u+1)]$. Their local derivative ratio is
$$
 u(u+1)f'(u)=\int_0^1\frac{u(1-v)}{u+v}\,dv.
$$
It increases from $2\log2-1>3/8$ at one towards $1/2$. Summation proves the first bound and monotonicity of $B(a,b)\sqrt d$ in each argument. Its value at $(1,1)$ and its limit on the diagonal by Stirling give the two extremes in (1).

## Small and large values of the Gram eigenvalue

For $0\le x<1$ we have $G(x)\le1/(1-x)$. Here is a direct argument. Integrate $\prod_i|z_0+\sqrt{nx}\,e_i z_1|^2$ over the uniform unit sphere in $\mathbb C^2$ and multiply by $n+1$. Phase integration and the uniform distribution of $|z_1|^2$ on $[0,1]$ give the coefficients $c_k$ above by the beta integral. AM–GM bounds the product by $(|z_0|^2+x|z_1|^2)^n$, using centering and $\sum e_i^2=1$. Its normalized integral is $1+x+\cdots+x^n$.

For $n\ge3$, $c_2\le3/4$. Positivity of the remaining coefficients and $G(2/3)\le3$ give, for $0\le x\le 39/100$,
$$
 G(x)\le 1+c_2x^2+(3x/2)^3(2-4c_2/9)
 \le 1+3x^2/4+45x^3/8\le (1-x)^{-3/4}.
$$
For the last comparison, let $h(x)=[1-(1-x)^3(1+3x^2/4+45x^3/8)^4]/x$. This is a polynomial of degree 14. All 15 coefficients of $(1+v)^{14}h(39v/(100(1+v)))$ are strictly positive by the [exact rational expansion](verify_two_row_gram.py), also covering the right endpoint by continuity. Now (1) implies $G(\lambda)\le [B(a,b)/B(m,r)]^2$ throughout this interval. Order two has only the deterministic and uniform reduced vectors.

For $39/100\le\lambda<1$ the variance of $U-V$ is $d(1+\lambda)$. The sharp concentration theorem of Baillon, Cominetti and Vaisman gives $S\le0.47/\sqrt{d(1+\lambda)}$. It applies to an ordinary sum of independent Bernoulli variables after reflecting the trials of $V$ and adding their number. By (1),
$$
 \frac{B(a,b)^2}{B(m,r)}
 \ge \frac{\sqrt{2\pi D}}{8d}
 =\frac{\sqrt{2\pi}}{8\sqrt{d(1-\lambda)}}.
$$
The latter exceeds the bound on $S$ even at $\lambda=39/100$, since $(47/100)^2\,61 < (2\pi/64)\,139$. The comparison strengthens as $\lambda$ grows. This proves the missing Gram inequality. [Baillon, Cominetti and Vaisman](https://arxiv.org/abs/0806.2350)

The [stochastic mixing theorem](binary_occupation.md) already gives $\operatorname{per}(A^TA),\operatorname{per}(A^2)\le\operatorname{per}A$. At any nonuniform $A$, $d_n<\operatorname{per}A$ makes both corresponding terms in the four-term inequality strict. The uniform matrix attains equality. The [Gram block product argument](../gyires_block_closure.md) also allows independent row and column permutations of direct sums of any number of blocks of the present types.

The exact checker reproduces the variance-regime comparison and polynomial certificate, compares 784 compressed probabilities, and independently computes 70 pairs of ordinary matrix permanents. The literature search covered the original Gyires papers, Chang's interior bound, the catalogue and the Bernoulli concentration theorem. No historical priority or unrestricted proof is claimed. [Gyires (1980)](https://doi.org/10.5486/PMD.1980.27.3-4.15) · [Chang (1990)](https://doi.org/10.1080/03081089008817977)
