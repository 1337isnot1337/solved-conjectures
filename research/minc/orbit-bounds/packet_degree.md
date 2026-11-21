# Marcus’s block-permanent inequality

Let $A$ be a complex positive semidefinite Hermitian matrix partitioned into $m$ square packets of order $k$, and let $G_{ij}=\operatorname{per}A_{ij}$. Form the simple graph $H$ on the packets with edge $ij$ when $i\ne j$ and $G_{ij}\ne0$. Write $d$ for its maximum degree.

1. If $d\ge1$ and $2^k-1\ge 2d^2(2d-1)$, then $\operatorname{per}A\ge\operatorname{per}|G|$, where the modulus is entrywise.
2. If $d\le2$, then $\operatorname{per}A\ge\operatorname{per}G$ in every order and at every packet size. The bound with entrywise moduli also holds when $k\ge2$ and $H$ has no triangle components.

The order and rank are unrestricted in these statements. The graph uses the *permanent* of each cross block, so an edge can be absent even when the block contains nonzero entries. These are partial results on the inequality in [Minc Conjecture 9](https://yair-lavi.com/mincs-list/conjecture-9/index.html).

## Disjoint pairs of packets

A zero Gram vector makes both sides zero. Otherwise $D=\prod_iG_{ii}>0$ by Lieb's permanent inequality, and $B_{ij}=G_{ij}/\sqrt{G_{ii}G_{jj}}$ is a correlation matrix: the Gram vectors are the normalized symmetric products of the packet vectors. Set $x_{ij}=|B_{ij}|\in[0,1]$ for an edge $ij$, and $q=2^k-1$. For every matching $L$ of $H$,

$$
 \frac{\operatorname{per}A}{D}\ \ge\ \prod_{e\in L}(1+q x_e^2).                 \tag{1}
$$

Apply the two-packet estimate to each pair and Lieb's product inequality to the resulting disjoint principal submatrices and all single packets. The sharp factor $q$ and the disjoint-pair technique are due to prior work. [Tubbenhauer, Lemma 7A.1 and Section 7](https://arxiv.org/html/2611.22058v1#S7), [Lieb](https://www.jstor.org/stable/24901474)

Give each edge an independent continuous uniform priority. Let $L$ contain an edge precisely when its priority is smaller than those of all adjacent edges. It is a matching. For each fixed matching $M$,

$$
 \Pr(M\subseteq L)\ \ge\ \prod_{ij\in M}(\deg i+\deg j-1)^{-1}
 \ \ge\ (2d-1)^{-|M|}.
$$

Indeed, reverse the priorities on $M$. Each inclusion event is then increasing in independent variables, because edges in $M$ are pairwise disjoint. Positive association gives the product bound. For completeness, two increasing functions of one variable have nonnegative covariance by integrating the product of their differences on two independent copies. Conditioning on successive coordinates proves the same inequality on a product space, and induction handles multiple increasing events. Expanding (1) and taking expectations gives

$$
 \frac{\operatorname{per} A}{D}\ \ge\
 \sum_{M\text{ matching}} \left(\frac q{2d-1}\right)^{|M|}\prod_{e\in M}x_e^2.       \tag{2}
$$

## An upper bound from the cycles of a permutation

We claim

$$
 \operatorname{per}|B|\ \le\ \sum_{M\text{ matching}}(2d^2)^{|M|}\prod_{e\in M}x_e^2. \tag{3}
$$

Take a contributing permutation. In each nontrivial cycle of length $h$, choose a rotated maximum matching of size $\lfloor h/2\rfloor$ along the cycle. For $h\ge3$ each edge appears with probability $\lfloor h/2\rfloor/h\le1/2$. Since $\log x_e\le0$, the expected log of the squared matching weight is at least the log of the cycle weight. For a transposition the unique undirected edge contributes $x_e^2$ to both. Consequently there is a choice of matching with squared weight at least the permutation weight. Fix one such choice for each permutation.

For any specified matching $M$, at most $(2d^2)^{|M|}$ permutations can have made that choice. Orient each selected edge along its permutation cycle, breaking the two-cycle tie by the vertex labels. At the second endpoint record its successor (at most $d$ choices). If the successor is outside the endpoints of $M$, also record its successor (at most $d$ choices). Whether the second record is needed is determined by the first record. There are no consecutive uncovered vertices in a nontrivial cycle with a rotated maximum matching. Therefore these records specify every successor in a nontrivial cycle, and all other vertices are fixed. This proves (3), including its identity term. Comparing (2) and (3) proves part 1. When $d=0$, (1) with the empty matching already proves the assertion.

## Paths and cycles for every packet size

For $k=1$ the usual inequality is an identity. Suppose $k\ge2$, so $q\ge3$. Since $G$ separates across components, Lieb's product inequality reduces the ordinary or absolute bound to its version on each component's packets. On a path, the only nontrivial cycles in a contributing permutation are transpositions. Thus $\operatorname{per}|B|=Z=\sum_M\prod_{e\in M}x_e^2$, which follows as a lower bound for $\operatorname{per}A/D$ from (2).

On a cycle of length $h\ge3$, the absolute permanent is $Z+2P$, where $P=\prod_e x_e$. For $h=3$ the ordinary inequality is the known three-packet theorem. [Tubbenhauer, Theorem 1A.1](https://arxiv.org/html/2611.22058v1#S1.SS1)

For $h=4$ or $5$, choose a uniformly random maximum matching. When $h=4$, each edge and each perfect matching is included with probability $1/2$. The two quadratic-matching coefficients in the expected product in (1) are at least $9/2$ each. Their excess over $Z$ covers $2P$ by the arithmetic-geometric mean inequality. When $h=5$, each edge is included with probability $2/5$ and each disjoint edge pair with probability $1/5$. All the coefficients dominate those of $Z$. The excess from the five pairs alone is at least $4P^{4/5}\ge 2P$, since each edge belongs to two of these pairs.

For $h\ge6$, use the independent priorities from (2). A pair of edges separated by just one edge along the cycle belongs to $L$ with probability $2/15$. Indeed, if the two priorities are $s,t$, the shared neighbor must exceed $\max(s,t)$ and the two other neighbors must exceed $s,t$ respectively. Integration gives
$$
 \int_0^1\!\int_0^1(1-s)(1-t)(1-\max(s,t))\,ds\,dt=2/15 .
$$
Each of the $h$ such pairs therefore has coefficient at least $9(2/15)=6/5$ in the expected product. The other coefficients dominate $Z$ by positive association. The total excess is at least $(h/5)P^{4/h}$ by geometric averaging, because every edge lies in exactly two of these pairs. The two neighbors of each vertex are nonadjacent. Their unit Gram vectors for $B$ are orthogonal, so Bessel's inequality gives $x_{i-1,i}^2+x_{i,i+1}^2\le1$. Multiplying $x_{i-1,i}x_{i,i+1}\le1/2$ around the cycle yields $P\le2^{-h/2}$. It follows that $(h/5)P^{4/h}\ge (h/5)2^{(h-4)/2} P\ge 2P$ for all $h\ge6$. This completes the comparison.

## Scope and source check

The catalogue reports an earlier forest result for the graph of nonzero matrix blocks and a triangle-with-trees result at packet size two. Tubbenhauer proves every case with at most four packets and a sufficient packet-size bound depending on the total number of packets. The arguments above concern arbitrarily large connected graphs and use degree in the graph of cross-block permanents. Searches for sparse block permanents, packet matchings and degree bounds located these results and did not establish independent priority for the degree criterion. Neither criterion covers all packet graphs at all sizes or settles the catalogue's full equality clause. [Minc's list](https://yair-lavi.com/mincs-list/conjecture-9/index.html), [Tubbenhauer's paper](https://arxiv.org/abs/2611.22058)
