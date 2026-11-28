# Gyárfás–Sumner conjecture

Tracking issue: [#320](https://github.com/1337isnot1337/solved-conjectures/issues/320).

**Status: open; proof-method note, not a resolution.** We give a sufficient condition for an induced tree in dense blocks that need not be bipartite, extending the shape of the embedding lemma in the recent polylogarithmic bound. We also show why a coarse forward-block version of the failed-flow certificate cannot imply bounded ordinary chromatic number on its own. We make no priority claim for either observation.

## Target and current literature

For every fixed tree $`T`$ and integer $`k`$, is there a constant $`C(T,k)`$ such that a finite graph with clique number at most $`k`$ and without an induced $`T`$ always has chromatic number at most $`C(T,k)`$? This is Gyárfás and Sumner's conjecture, independently made in the early literature; the equivalent version forbids an arbitrary fixed forest.

- Scott and Seymour, [*A survey of $`\chi`$-boundedness*](https://doi.org/10.1002/jgt.22601), describe the conjecture and known tree families.
- Nguyen, Scott and Seymour, [*A note on the Gyárfás–Sumner conjecture*](https://arxiv.org/abs/2302.08922), give a path-induced rooted-tree theorem, not a theorem about all unwanted edges between different branches.
- Nguyen, Scott and Seymour, [*Trees and near-linear stable sets*](https://doi.org/10.1007/s00493-025-00177-9), give a general near-linear stable-set bound and a fractional coloring result for multibrooms, not the unrestricted conjecture.
- Bierbaumer and Bucić, [*Polylogarithmic bound for the Gyárfás–Sumner conjecture*](https://arxiv.org/html/2611.06699v1), posted November 4, 2026, prove $`\chi(G)\le C_{T,k}(\log |V(G)|)^{14k}`$ and explicitly leave the constant bound open. Their Lemma 6 supplies the starting point below; their Lemma 7 uses the failure of a flow followed by random block selection to find a stable set. Searches for a subsequent general solution and for the nonbipartite variant below did not yield a verified earlier result. Absence from these searches is not proof of novelty.

## Dense-block embedding without internal bipartiteness

Let $`T`$ be a tree on $`t\ge 2`$ vertices. Put $`R=R(k+1,t)`$, using the convention that a graph on at least $`R`$ vertices has either a $`(k+1)`$-clique or a stable $`t`$-set. Let $`G`$ have clique number at most $`k`$. Suppose there are disjoint nonempty blocks $`B_1,\dots,B_I`$, with $`I\ge 1`$, satisfying:

1. The graph on their union has maximum degree at most $`D`$; each block has at most $`D`$ vertices.
2. Each block induces a subgraph of minimum degree at least $`\lambda D`$, where $`0<\lambda \le 1`$ and $`\lambda D\ge 4R`$.
3. Each vertex in one block has at most $`\lambda D/(4t)`$ neighbors in any other individual block.
4. Each vertex $`v\in B_i`$ has a bundle $`Y_v`$ of at least $`M=\lceil 4096Rt^4/\lambda\rceil`$ neighbors in other blocks, with at most one vertex from each other block. For each source block $`B_i`$, the bundles for its vertices are pairwise disjoint.

Then $`G`$ contains an induced copy of $`T`$. No restriction on edges inside a block is needed beyond the clique and degree hypotheses.

### Proof

Restrict to the union of the blocks. Truncate each bundle to exactly $`M`$ arbitrary members. Root $`T`$, and embed its root arbitrarily. Maintain the invariant that every embedded even-depth vertex is in a different block; all its children, if already embedded, are in its own block. Whenever an even-depth vertex is processed, embed all its children and grandchildren in one round. An as-yet unprocessed even-depth vertex is alone in its block.

Let $`a\in B_i`$ be the image of an unprocessed parent with one or more children. For their images take the pool of neighbors of $`a`$ inside $`B_i`$ that see none of the other previously embedded vertices. Since there are fewer than $`t`$ such forbidden vertices outside $`B_i`$, assumption 3 leaves a pool of size at least $`3\lambda D/4`$. Let $`F`$ be the union of all used blocks and the neighbor sets of all previously embedded vertices. Then $`|F|\le 2tD`$. By disjointness of the $`Y_v`$ in the source block, the number of pool vertices with $`|Y_v\cap F|>M/4`$ is at most $`8tD/M\le \lambda D/4`$. Thus the remaining pool $`U`$ has size at least $`\lambda D/2`$.

On $`U`$ create a conflict graph in which distinct $`u,v`$ conflict if at least one of the following holds:
- $`|N(u)\cap Y_v|>M/(16t)`$, or the same with $`u,v`$ exchanged;
- there are more than $`M^2/(128t^4)`$ edges between $`Y_u`$ and $`Y_v`$.

For each $`u`$, the first directed test can flag at most $`16tD/M`$ vertices $`v`$, since their bundles are pairwise disjoint. Similarly the total number of edges from $`Y_u`$ to all other bundles is at most $`MD`$, so the second test can flag at most $`128t^4D/M`$ vertices $`v`$. Consequently the conflict graph has average degree at most $`288t^4D/M`$. The bound on $`M`$ and $`\lambda D\ge 4R`$ give
```math
1+288t^4D/M
 \le \lambda D/(4R)+(288/4096)\lambda D/R
 < \lambda D/(2R).
```
By the standard average-degree bound $`\alpha(H)\ge |V(H)|/(1+d(H))`$, there is a conflict-free set of at least $`R`$ vertices. One proof of the bound takes the vertices preceding all their neighbors in a random vertex order and uses Cauchy–Schwarz. By Ramsey's theorem applied to the original graph on these vertices, we can choose a stable $`t`$-set. Take as many of these vertices as there are children of the current parent; let their set be $`S`$. They are pairwise nonadjacent in $`G`$ and mutually nonconflicting.

For each $`v\in S`$, remove from $`Y_v`$ all of $`F`$ and all neighbors of the other vertices in $`S`$. At least $`M/2`$ vertices remain, because $`F`$ takes at most $`M/4`$ and the other siblings together take less than $`M/16`$. In each remaining bundle greedily pack disjoint stable $`t`$-sets using Ramsey's theorem whenever at least $`R`$ vertices remain. There are at least $`M/(4t)`$ packed sets per bundle, using $`M\ge 4R`$.

Choose one of the packed sets uniformly and independently for each $`v\in S`$. Each point of its bundle is selected with probability at most $`4t/M`$. For two different bundles, the probability that some selected pair is adjacent is at most
```math
\frac{M^2}{128t^4}\left(\frac{4t}{M}\right)^2=\frac{1}{8t^2}.
```
The number of pairs from the two bundles in a common block is at most $`M`$, since each bundle has at most one point per block. The probability of a shared block is therefore at most $`16t^2/M\le 1/(8t^2)`$. The union bound over fewer than $`t^2/2`$ bundle pairs is less than one.

Use a successful choice, truncating each selected stable $`t`$-set to the prescribed number of grandchildren of its associated $`v`$. Their blocks are fresh and distinct; there are no unwanted edges to old images, to the other siblings, or among the newly embedded grandchildren. All intended parent-child edges hold by construction. This advances the invariant and terminates in an induced embedding of $`T`$.

### Algorithmic consequence and limitation

For such a block partition in an induced-$`T`$-free graph, if the degree and scale hypotheses hold, at least one source block fails to admit bundles of size $`M`$. The same integral flow as in Bierbaumer–Bucić Lemma 7 then returns nonempty $`X\subseteq B_i`$ and $`Z`$ outside $`B_i`$ for which
```math
|Z|+\sum_{x\in X} b_Z(x)\lt M|X|,
```
where $`b_Z(x)`$ is the number of other blocks containing a neighbor of $`x`$ outside $`Z`$. The source-to-$`x`$ capacity is $`M`$, the vertex-to-target-block capacities are one, and the capacity out of each target vertex is one. This is an explicit certificate for general dense blocks. It avoids their need to make blocks bipartite *before embedding*. It does not show that the set left by iterating such cuts can be colored with a bounded number of colors, nor does it give a stronger asymptotic upper bound for the original conjecture. In particular, the independent-set cleanup within each block of the published argument used bipartiteness.

## Obstruction to coloring from weak forward-block certificates

Fix $`0<\varepsilon \le 1`$. There are triangle-free graphs of arbitrarily large chromatic number with ordered blocks such that:

- globally $`\Delta(G)\le D`$ and every block has $`D`$ vertices;
- each block induces $`K_{D/2,D/2}`$;
- each vertex has at most $`\varepsilon D`$ neighbors in any other block;
- each vertex has neighbors in at most one *later* block, a stronger property than a bounded average count on a cut set.

Start with the classical Erdős–Hajnal shift graph $`S_m`$, whose vertices are the pairs $`(i,j)`$ for $`1\le i<j\le m`$ and whose edges join $`(i,j)`$ to $`(j,\ell )`$ for $`i<j<\ell`$; see [Erdős and Hajnal's original account](https://www.renyi.hu/~p_erdos/1968-04.pdf) and the modern treatment by [Arpan Sadhukhan](https://arxiv.org/abs/2308.14010). Put each $`(i,j)`$ in the left side of block $`i`$. Choose an integer $`L\ge m/\varepsilon`$. Pad each left side to $`L`$ vertices and add a fresh right side of $`L`$ vertices; join the two sides completely within each block, adding no other padding edges. Take $`D=2L`$.

Every shift vertex has at most $`m`$ external neighbors in total, so its degree is at most $`L+m\le D`$; all other vertices have degree $`L`$. The per-block cross degree is also at most $`m\le \varepsilon D`$. A shift vertex $`(i,j)`$ sees only block $`j`$ in the forward direction, and a padding vertex sees none. Triangles cannot use padding vertices, because all of their neighbors are on the other independent side of the same block, and the shift graph has no triangle: the earliest first coordinate in a triangle would have the other two vertices in the same independent forward block.

In any proper coloring of the shift graph, let $`A_i`$ be the set of colors of the vertices $`(i,j)`$ with $`j>i`$. For $`i<j`$, the color of $`(i,j)`$ belongs to $`A_i`$ and cannot belong to $`A_j`$. Thus $`m`$ subsets of the palette are distinct, and $`\chi(G)\ge \chi(S_m)\ge \log_2 m`$.

For any nonempty induced subgraph, its earliest represented block gives a cut witness with $`Z=\varnothing`$ and $`b_Z(x)\le 1`$ for every vertex of that block. This stays true even after arbitrary deletions. The construction shows that a forward-neighbor-block count alone is not enough for bounded coloring, even in a highly structured dense-block setting. It does **not** contradict Gyárfás–Sumner: for sufficiently large $`m`$ the shift subgraph already contains any prescribed finite rooted tree as an induced subgraph. To see this, adjoin one formal parent above the root and assign all vertices, including the parent, distinct integers increasing along rooted edges. Represent each tree vertex by the ordered pair of labels of its parent and itself. Two such pairs shift-adjoin exactly when the two corresponding tree vertices are parent and child.
