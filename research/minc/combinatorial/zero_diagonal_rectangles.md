# Zero-diagonal doubly stochastic minimum

Let $U=(J-I)/(n-1)$, where $J$ is the all-ones matrix, and write $\sigma_k$ for the sum of the weights of all size-$k$ bipartite matchings. Suppose $A$ is zero-diagonal and doubly stochastic. If all entries where $A$ differs from $U$ lie in $R\times C$ with $R\cap C=\varnothing$, then for every $2\le k\le n$,
```math
\sigma_k(A)>\sigma_k(U)\qquad\text{whenever } A\ne U.                     \tag{1}
```
There is no bound on the rank, size or magnitude of the changed block. In particular (1) proves the permanent inequality along the entire feasible interval of every rank-one direction from $U$. For a rank-one difference $uv^T$, the zero-diagonal constraint says $u_i v_i=0$ for every label, so its two supports are disjoint.

This is a restricted theorem toward [Minc Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html). The full statement permits the row and column labels of the changes to overlap.

## A rectangular matching bound

Let $Y$ be nonnegative of size $r\times c$, with row sums $c$ and column sums $r$. For $0\le j\le\min(r,c)$ put $m_j=\binom rj\binom cj j!$. Then
```math
\sigma_j(Y)\ge m_j,\qquad
\sigma_2(Y)-m_2=\tfrac12\|Y-J_{r,c}\|_F^2.                              \tag{2}
```
Here is a proof of the bound from the stable-polynomial form of van der Waerden's theorem. Set $L_i(x)=\sum_h Y_{ih}x_h$ and
```math
p(x)=e_j(L_1(x),\ldots,L_r(x))\Big(\sum_{h=1}^c x_h\Big)^{c-j}.
```
The elementary symmetric polynomial is real stable (differentiate $\prod_i(t+z_i)$ in $t$ and specialize at zero). Substituting the nonnegative linear forms preserves stability since each has positive row sum. This gives a stable polynomial of degree $c$ in $c$ variables with nonnegative coefficients. At the all-ones vector, the $L_i$ are all $c$. The column sums give equal first partial derivatives of $p$ there. By homogeneity each equals $p(\mathbf1)/c$ times the degree, hence equals $p(\mathbf1)$. Weighted AM–GM on the monomials now gives $p(x)\ge p(\mathbf1)\prod_h x_h$ for $x>0$. Thus its capacity is $p(\mathbf1)=\binom rj c^c$.

The coefficient-capacity inequality gives $[x_1\cdots x_c]p\ge(c!/c^c)p(\mathbf1)$. The coefficient on the left is $(c-j)!\sigma_j(Y)$, proving the first inequality of (2). For the identity at $j=2$, twice the matching count is the squared total weight minus the sums of the squared row and column sums plus $\sum Y_{ih}^2$. The first three quantities agree with those of $J_{r,c}$, and the difference of the last terms is the squared norm in (2). The square case of the first bound is Friedland's proof of Tverberg's conjecture. [Friedland (1982)](https://doi.org/10.1080/03081088208817436) · [Friedland and Gurvits on matching sums and capacity](https://homepages.math.uic.edu/~friedlan/frgur9.4.07.pdf) · [Gurvits's coefficient inequality](https://doi.org/10.37236/790).

## Conditioning on the changed rectangle

Take a uniform size-$k$ matching on the complete bipartite graph with its diagonal deleted. Let $K$ be the number of its edges in $R\times C$. Write $r=|R|$, $c=|C|$, and set $Y=(n-1)A[R,C]$. Its margins satisfy (2), because every entry outside the rectangle agrees with $U$. Conditional on $K=j$, the $j$ edges there are a uniform $j$-matching of the complete rectangle. Indeed, independent permutations of $R$ and $C$ extend to a simultaneous relabeling of both sides of the ambient graph, and this group acts transitively on the $j$-matchings of the rectangle. Every other edge has the same weight as under $U$. It follows that
```math
\frac{\sigma_k(A)}{\sigma_k(U)}
 =\sum_j \Pr(K=j)\frac{\sigma_j(Y)}{m_j}
 \ge 1+\Pr(K=2)\frac{\|Y-J_{r,c}\|_F^2}{2m_2}.                         \tag{3}
```
The expression on the right is for $r,c\ge2$. If either size is at most one, the margins force $A=U$.

For $r,c\ge2$ there is a derangement with exactly two edges from $R$ to $C$. Start with derangements inside each set and interchange the images of two distinct rows of $R$ with those of two distinct rows of $C$, one pair at a time. Extend by a derangement on the unused labels if there are at least two. A single unused label can instead be inserted on one of the two edges from $C$ to $R$. Retaining the two $R$-to-$C$ edges and any $k-2$ other edges supplies the required partial matching. Thus $\Pr(K=2)>0$, proving strictness in (1).

The same proof works with other nonnegative weights on the ambient matchings whenever the baseline edge weight is a positive constant on the rectangle and the baseline law is invariant under the indicated independent relabelings. For example, the diagonal can be given a common nonnegative weight. The positive-probability argument for strictness still uses the same derangements.

A separate symmetrization test illustrates the need for (3). Take
```math
A=\tfrac12\begin{pmatrix}0&1&1&0\\1&0&0&1\\0&1&0&1\\1&0&1&0\end{pmatrix}
```
and interchange labels one and two with the same transposition $T$ on both sides. Then $TAT^T=A^T$, $\operatorname{per} A=1/8$, and $\operatorname{per}((A+TAT^T)/2)=9/64$. This is the [earlier transpose example](../sign-matrices/c44_research.md). It also rules out unconditional descent by each individual simultaneous transposition.

[London and Minc](https://doi.org/10.1080/03081088908817922) prove the original inequality through order four. [Burghduff](https://doi.org/10.1080/03081089508818428) proves strict local minimality. The catalogue and the primary-source searches on rectangular subpermanents, perturbed zero-diagonal matrices and simultaneous relabeling yielded no reference giving (3) on this face. Historical priority for the rectangular matching bound is not asserted. The [integer replay](verify_zero_diagonal_rectangles.py) computes both sides of the conditioning identity by subset dynamic programming, including all matching degrees and several non-square rectangles.
