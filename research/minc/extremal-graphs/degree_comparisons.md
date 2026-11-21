# Minc’s sixth conjecture

Write $m_k=m(n,k)$ for the minimum normalized permanent of a simple $k$-regular bipartite graph with $n$ vertices on each side. Define $d_k=k!/k^k$ and $b_k=(1-1/k)^{k-1}$ for $k\ge2$. Uniformly for $2\le k<h\le n$,

```math
 \log(m_h/m_k)\le -\tfrac n2(1/k-1/h)+\tfrac12\log(n/k)+O(1/k+n^{-1/7}).       \tag{1}
```

In particular any inversion $m_h\ge m_k$ at a growing sublinear degree $k$ has
$h-k\le(1+o(1)) k^2\log(n/k)/n$. This covers comparisons between arbitrary degrees, including those far from the adjacent sparse and positive-density theorems. For adjacent degrees tending to infinity, strict decrease holds whenever $\liminf[n/(k(k+1))-\log(n/k)]>0$, and the ratio tends to zero if the difference tends to infinity. The [catalogue](https://yair-lavi.com/mincs-list/conjecture-6/index.html) records the corresponding sufficient condition with $\log n$ in place of $\log(n/k)$. For instance at $k=\lfloor\sqrt{2n/(\log n+\log\log n+c)}\rfloor$ the new upper limit for the ratio is $(2e^c)^{-1/4}$, strictly below one for $c>-\log 2$. The general adjacent comparison remains open.

## The two prefactors

Gurvits's column-rank theorem for the product of row linear forms of a doubly stochastic matrix gives a lower bound $\prod_{j=1}^n b_{\min(j,k)}$ if the column degrees are at most $k$, with $b_1=1$. The capacity equals one by weighted AM–GM. The factors through $k$ telescope to $d_k$. On the other side, Theorem 4.5 of Greenhill, Hasheminezhad, Iliffe and McKay gives the expectation in the uniform *simple* regular model over the whole degree range. Dividing their formula by $k^n$, we get

```math
 L_k b_k^n\le m_k\le U_k b_k^n,\qquad
 L_k=d_k/b_k^k,\quad
 U_k=\sqrt{2\pi n(1-1/k)/e}\,\exp(O(n^{-1/7})).
```

The lower bound including its prefactor is Gurvits's. The upper bound is their mean bound. The comparison here retains **both** prefactors. [Gurvits, Theorem 2.4](https://arxiv.org/abs/0711.3496) · [Greenhill et al., Theorem 4.5](https://arxiv.org/pdf/2601.04822) · [Wanless's earlier monotonicity theorem](https://doi.org/10.1080/03081080600562670)

In fact the resulting two-sided estimate is
```math
 -\tfrac12\log(n/h)-O(1/k+n^{-1/7})
 \ \le\ \log(m_h/m_k)-n\log(b_h/b_k)
 \ \le\ \tfrac12\log(n/k)+O(1/k+n^{-1/7}).
```
Indeed $\log L_k=\frac12\log(2\pi k/e)+O(1/k)$ by Stirling. The power series $\log b_k=-1+\sum_{j\ge1} k^{-j}/[j(j+1)]$ gives $\log(b_k/b_h)\ge(1/k-1/h)/2$. This proves (1). For an inversion rearrange to $1-k/h\le(k/n)[\log(n/k)+O(1/k+n^{-1/7})]$. If $k/n\to0$ the right side tends to zero, so $h/k\to1$ and the width bound follows. Substitution in (1) gives the adjacent claims, including the floor and the constant at the displayed transition. At positive density the [earlier adjacent comparison](positive_density_minimum.md) handles all sufficiently large orders. Neither input here asserts the conjecture at every intermediate degree.

## Near-minimizers in the integer class

The same prefactors constrain [Minc's integrality conjecture](https://yair-lavi.com/mincs-list/conjecture-24/index.html). Let $G$ have nonnegative integer entries and all margins $k<n$, and write $C=\sum_{ij}\binom{G_{ij}}2$. If $\operatorname{per}(G/k)\le e^t m_k$, $t\ge0$, then
```math
 (1-k/n)\,\delta_k C\le t+\tfrac12\log(n/k)+O(1/k+n^{-1/7}),\quad
 \delta_k=f(2/k)-2f(1/k)\ge 1/k^2,\quad f(x)=(1-x)\log(1-x).      \tag{2}
```
Use the [multicolumn bound](../nov20-independent/inequalities/explicit_eventual_zero_diagonal.md) with $n-k$ selected columns of $G/k$. In each column $j$ the sum of $f(G_{ij}/k)$ exceeds $\log b_k$ by at least $\delta_k C_j$, where $C_j$ is that column's contribution. Indeed $f(0)=0$ and its discrete second differences on the grid of mesh $1/k$ are at least the initial one, since $f''(x)=1/(1-x)$ is increasing. This includes the endpoint by continuity. The bound on $\delta_k$ follows by $f''\ge1$. Select the $n-k$ largest $C_j$. This retains at least $(1-k/n)C$ and proves $\operatorname{per}(G/k)\ge L_k b_k^n \exp((1-k/n)\delta_k C)$. Combine with the simple-model upper bound. If at least $k$ columns have no collisions, the factor $1-k/n$ can be replaced by one.

For every sequence $k=o(n)$ and bounded $t$, the total mass on cells of multiplicity at least two is $o(nk)$, since it is at most $2C$ and $(k/n)\log(n/k)\to0$. In fact these matrices have entrywise $\ell^1$ distance $O(k^2[1+t+\log(n/k)])$ to a binary matrix with the same margins. Once $n\ge 2k$, pick a repeated $(i,j)$. The rows absent in column $j$ and the columns absent in row $i$ each number at least $n-k+1$. Their rectangle has a positive entry, by the equal margins and the fact that their sizes sum to more than $n$. Cross one unit from that entry and the repeated entry into the two zeros. Each such switch decreases $C$ by at least one at cost four. This edit guarantee also holds when $k$ stays bounded. At positive density [every exact minimizer is eventually binary](../combinatorial/positive_density_integrality.md). The earlier [collision estimate and repair argument](../nov20-independent/compound/c24_defect_review.md) have a $\log n$ loss that need not give a vanishing relative edit distance for $k=o(n)$ arbitrarily close to linear. The switches above control the distance. They need not decrease the permanent.

The indexed sources searched for these comparisons included the catalogue, Wanless, Gurvits, the current all-density regular enumeration and work of Csikvári on finite perfect-matching bounds. The estimates are deductions from published ingredients and the cited capacity lemma. The open entries retain their original quantifiers.
