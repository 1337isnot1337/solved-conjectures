# The linear Ehrhart coefficient for symmetric edge polytopes of multi-theta graphs

For integers \(k_1,\ldots,k_m\ge1\), let \(G\) be the graph made from \(m\) internally vertex-disjoint \(s\)-\(t\) paths of those lengths. If the graph is required simple, at most one \(k_j\) is allowed to equal 1. Let \(P_G\) be its symmetric edge polytope of dimension \(d=\sum_j k_j-m+1\), and put
\[
 F_G(x)=(1-x)^d h^*_{P_G}(-x/(1-x)).
\]
Then
\[
 |F_G(x)|\le1\qquad(0\le x\le1).
 \tag{1}
\]
In particular the [integral criterion](LINEAR_COEFFICIENT.md) proves a strictly positive linear Ehrhart coefficient for \(P_G\), and for all vertex wedges of these graphs and complete graphs. This is a structural partial result for Ferroni–Higashitani Conjecture 4.9(ii), not a claim on higher coefficients or on every graph.

## A path formula with arbitrary lengths and parities

Use the [Kálmán–Tóthmérész dissecting-tree formula](https://alco.centre-mersenne.org/articles/10.5802/alco.318/) and the planar-dual dissection of theta facets as employed in [Ferroni, arXiv:2607.02424v1, Proposition 2.1](https://arxiv.org/html/2607.02424v1#S2). Ferroni states the formula when all path lengths are equal. The following is its unequal-length extension, with slack edges when the parities differ.

Normalize the integral facet potential to be zero at \(s\), and let its value at \(t\) be \(D\). Differences on edges belong to \(\{-1,0,1\}\). Tight edges (nonzero differences) form a connected spanning graph. Each path can therefore have at most one slack edge: two would isolate the vertices between them. At least one path is entirely tight, otherwise \(s,t\) are disconnected in the tight subgraph. Consequently, the paths of the same parity as \(D\) are entirely tight, and all other paths have one slack edge. Along a tight path of length \(k\) the number of plus signs is \(i=(k+D)/2\), where plus means oriented in the \(s\)-to-\(t\) direction. Along a path with a slack edge the number of plus signs in its other \(k-1\) edges is \(i=(k-1+D)/2\). Any such data with \(|D|\le\min_j k_j\) and at least one entirely tight path determines a facet: integrate the edge signs along the paths and use their common potential difference and connected tight subgraph. (When there is no entirely tight path, the corresponding sum below is empty.)

The slack paths become two branches attached to the entirely tight core. All their remaining edges are bridges and occur in every contributing tree. For the core, embed the paths in their given order around the two endpoints, with exterior face between first and last. The planar-dual arborescence dissection applies to the connected oriented tight graph in this facet; bridge dual edges are loops and automatically omitted from a dual arborescence. The core dual is a cycle of bundles. A dual arborescence uses one edge from every bundle except one, so exactly one entirely tight path, the pivot \(p\), is retained whole in its primal tree. The other core paths each lose one edge. As in Ferroni's proof, the rooted directions along the two sides of this broken dual cycle force the deleted primal edge to be plus on the paths before \(p\) and minus on those after it, in a choice of orientation convention. This includes a one-path core, where there is a unique pivot and no additional deletion.

To count tree edges pointing away from the base vertex \(s\), the pivot contributes the plus count \(i\); a broken path contributes the number of plus edges before its break plus the number of minus edges after the break. The same rule applies to an originally slack path, whose break was forced already. To evaluate the normalized polynomial after \(z=-x/(1-x)\), each edge counted as pointing away contributes \(-x\) and each other tree edge contributes \(1-x\). Set
\[
 a=1-x,\qquad b=-x,\qquad
 B_{k,j}=\binom kj a^{k-j}b^j.
\]
The normalized pivot factor is \(B_{k,i}\). For a broken path with \(i-1\) pluses among the remaining \(k-1\) edges, its normalized contribution is
\[
 L_{k,i}=[y^{i-1}]\sum_{r=0}^{k-1}
           (a+by)^r(b+ay)^{k-1-r}
  = [y^{i-1}]\frac{(a+by)^k-(b+ay)^k}{1-y}
  =\sum_{j=0}^{i-1}(B_{k,j}-B_{k,k-j}).
 \tag{2}
\]
Indeed \(r\) is the number of positions before the deleted edge; a remaining plus gets the extra variable \(y\), and the weights are different before and after the break as above. In the middle equality \(a-b=1\). Put \(L_{k,0}=L_{k,k+1}=0\). Thus for a core path with original plus count \(i\), a deleted plus contributes \(L_{k,i}\) and a deleted minus contributes \(L_{k,i+1}\). For a slack path there is no sign on the removed edge and the contribution is \(L_{k,(k+1+D)/2}\). The normalized product of all paths has degree of normalization \(k_p+\sum_{j\ne p}(k_j-1)=d\), as required. Summing these products over \(D\), all allowed pivots and all counted paths is the exact normalized \(F_G\) by the dissecting-tree formula.

## Binomial tail domination

Fix \(x\in[0,1]\). Let \(J_k\) have the binomial distribution with parameters \(k,x\), so \(|B_{k,j}|=\mathbb P(J_k=j)\), and set
\[
 T_k(v)=\mathbb P(|2J_k-k|\ge v),\qquad v=0,1,2,\ldots.
\]
In (2) the prefix and reflected suffix overlap cancels, so its absolute value is at most the total probability of the two remaining tails.

Fix an integer \(D>0\) and pair the terms at potential gaps \(D,-D\). For a same-parity core path with \(i=(k+D)/2\), formula (2) gives
\[
 |L_{k,i}|\le T_k(D),\qquad
 |L_{k,i+1}|\le T_k(D+1).
\]
At the opposite gap the two bounds are exchanged, since \(L_{k,k+1-i}=L_{k,i}\). For a slack path both bounds coincide: its factor is bounded by \(T_k(D+1)=T_k(D)\) because \(k\not\equiv D\bmod 2\). For a pivot of length \(k\),
\[
 |B_{k,(k+D)/2}|+|B_{k,(k-D)/2}|
       =T_k(D)-T_k(D+1).
 \tag{3}
\]

Write \(U_j=T_{k_j}(D)\), \(V_j=T_{k_j}(D+1)\). The nonpivot factor product bound at the positive gap is
\(\prod_{j<p}U_j\prod_{j>p}V_j\); at the negative gap it is
\(\prod_{j<p}V_j\prod_{j>p}U_j\). This includes slack paths since their two bounds are equal. Now average the triangle inequality for the given order of paths and for the reversed order; they are two embeddings of the same graph, so either formula for \(F_G\) is valid. Reversal interchanges these two product bounds. By (3), the joint absolute contribution after this averaging is bounded by
\[
 \frac12\sum_p(U_p-V_p)
   \left(\prod_{j<p}U_j\prod_{j>p}V_j+
         \prod_{j<p}V_j\prod_{j>p}U_j\right)
 =\prod_j U_j-\prod_j V_j.
 \tag{4}
\]
The sum can include all paths because nonpivots of the wrong parity have \(U_p-V_p=0\). Both of the sums in parentheses telescope separately.

At \(D=0\), both deleted-sign factors in every even-length path have absolute value at most \(T_k(1)\), since their central summands cancel in (2). Odd-length slack paths also have this bound, with \(T_k(1)=1\). The pivot is even length with weight \(1-T_k(1)\) in absolute value. Therefore the total contribution is at most
\[
 \sum_p(1-T_{k_p}(1))\prod_{j\ne p}T_{k_j}(1)
 \le 1-\prod_j T_{k_j}(1).
\]
The final inequality follows by expanding \(\prod_j[T_{k_j}(1)+(1-T_{k_j}(1))]=1\) and keeping the terms of order zero and one in the latter summands. This is the \(D=0\) counterpart of (4).

Finally sum the \(D=0\) bound and (4) for \(1\le D\le\min_j k_j\). They telescope to \(1\), since the next tail vanishes in any shortest path. This proves (1). The endpoint \(x=1\) is included by polynomial continuity.

The key ingredients are the existing oriented-tree dissection and Ferroni's equal-length path model. The additional claims here are the parity-sensitive unequal path formula and the amplitude bound via binomial tails. Exact computational probes agreed with Ferroni's equal-length specializations and with the expected degree, reciprocality and first \(h^*\) coefficient in unequal probes; the proof above is not based on those tests.
