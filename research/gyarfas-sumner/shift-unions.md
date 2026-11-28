# Gyárfás–Sumner for unions of two shift graphs

**Status: complete argument for the restricted host-class problem, not the full Gyárfás–Sumner conjecture.** This answers Problem 1.14 in the November 20, 2026 version of Adenwalla, Braunfeld, Hons, Sylvester and Zamaraev, [*Set-defined graph classes: χ-boundedness meets tropical algebra*](https://arxiv.org/html/2607.23754v2) (Problem 1.11 in v1). The proof in fact needs only one of the two shift graphs to have large chromatic number. We do not claim priority.

A shift graph means an induced subgraph of the canonical two-dimensional shift graph, as in the source. Its vertices have distinct labels $`(i,j)`$ with $`i<j`$; the edges, directed in the natural orientation, are precisely $`(i,j)\to(j,k)`$. Red and blue labels are independent representations on the same set of vertices.

## Theorem

For every finite tree $`T`$ there exists $`C(T)`$ such that, for shift graphs $`G_R,G_B`$, if $`\chi(G_R)>C(T)`$, then $`G_R\cup G_B`$ contains $`T`$ as an induced subgraph.

We may restrict to the vertex set of $`G_R`$. If $`G_B`$ was not defined on all of it, supply blue-isolated vertices by giving them pairs of fresh, globally distinct labels; this preserves the blue shift representation. A one-vertex tree is immediate. Write $`t=|V(T)|\ge2`$, root $`T`$ at a center, and write $`h`$ for its height.

## 1. A chromatic layering tool

In any red shift graph $`K`$ and for integer $`s\ge1`$, put $`A_0=V(K)`$ and
```math
A_{r+1}=\{v: |N^+_K(v)\cap A_r|\ge s\}.
```
The sets are nested by monotonicity. If $`A_H=\varnothing`$, then the layers $`A_r\setminus A_{r+1}`$, $`0\le r<H`$, partition $`V(K)`$. Each layer is greedily $`s`$-colorable in reverse red topological order, since each vertex has at most $`s-1`$ out-neighbors in its layer. Thus $`\chi(K)>Hs`$ implies $`A_H\ne\varnothing`$.

## 2. Row-hub lemma

**Lemma.** Suppose all blue tuples in every red row $`i`$ have a common blue first coordinate $`f(i)`$, so their blue labels are $`(f(i),g(v))`$ for red vertices $`v=(i,j)`$. There is a bound $`C_{\rm hub}(T)`$ such that if $`\chi(G_R)>C_{\rm hub}(T)`$, the red-blue union contains an induced $`T`$.

**Parameters.** Choose
```math
q=t(t-1)+2,\qquad H=2^h,\qquad Q=q(H+1)^{H+1}.
```
Let $`N=1+Q+\cdots+Q^H`$, set $`s=4N`$, and take $`C_{\rm hub}(T)=Hs`$.

**A red tree with at most one incoming blue arc at each vertex.** Apply the layering tool. Starting at any root in $`A_H`$, embed the complete $`Q`$-ary rooted tree of height $`H`$ in red, always placing a depth-$`r`$ vertex in $`A_{H-r}`$. Use a parent-before-child order. When choosing a new vertex, require its red terminal label to be new among all red labels already used, and its blue $`g`$-label to be new among all blue labels already used. Each red child is chosen among at least $`s=4N`$ red out-neighbors of its assigned parent in the required layer. They all lie in the same red row; in this row, their red terminal labels are distinct, and their blue $`g`$-labels are distinct because their blue first coordinate is fixed and the blue tuple representation is injective. There are fewer than $`2N`$ previously used labels of each kind, so some candidate passes both conditions.

This is an induced red tree: when a new red pair $`(j,k)`$ is added, a previous red pair can point to it only if its terminal label is $`j`$, which belongs only to the assigned parent; the new vertex cannot point to an earlier vertex because $`k`$ is fresh. Within the resulting host tree every blue vertex has indegree at most one in the blue orientation: its predecessor would need blue terminal label equal to its own blue first coordinate, and the blue terminal labels are all distinct. No blue arc points from a later-added vertex to an earlier one, since each new blue terminal label avoids all old blue first coordinates. In particular, a blue arc between comparable host-tree vertices can only point from ancestor to descendant.

**Uniform ancestor links.** Mark each host-tree vertex by zero if it has no blue predecessor that is a strict host-tree ancestor, and otherwise by its positive distance to that predecessor. There are at most $`H+1`$ marks. We can retain a complete $`q`$-ary subtree of the same height, with the same root and parent-child relation, such that the mark is constant at each depth. To prove this, work bottom-up. After pruning below each child of a fixed vertex, its retained subtree has a *profile*, the sequence of common marks on its levels. There are at most $`(H+1)^{H+1}`$ profiles. Among that vertex's $`Q`$ children at least $`q`$ have the same profile; retain those children and their pruned subtrees. This proves the claim by induction. Every retained vertex retains all its ancestors, so the mark still records exactly its ancestor blue arc, if any.

Make a digraph on the levels $`0,\ldots,H`$, with consecutive arcs $`i\to i+1`$ and, for each positive mark $`m_i`$ at depth $`i`$, an arc $`i-m_i\to i`$. All arcs increase the depth and every vertex has indegree at most two. Every level reaches $`H`$. At most $`1+2+\cdots+2^{h-1}=2^h-1`$ levels have directed distance less than $`h`$ to $`H`$, so some shortest directed path ending at $`H`$ has length at least $`h`$. Such a path is induced as an undirected path: every edge goes forward, and a nonconsecutive arc would shorten it. Take $`h+1`$ consecutive levels on this path, $`\ell_0<\cdots<\ell_h`$.

**Embed the target at these levels.** Choose the image of the root of $`T`$ at host depth $`\ell_0`$. For an embedded vertex at depth $`\ell_r`$, choose the images of its children at depth $`\ell_{r+1}`$ below it, in distinct immediate host-tree branches. The host ancestor order on the chosen images always agrees with the target ancestor order; any two incomparable images are not red-adjacent. Two comparable chosen images are adjacent in the union exactly if the corresponding levels are adjacent in the level digraph: this is true for the consecutive red arcs and for the marked ancestor blue arcs. Hence comparable chosen images are adjacent exactly at parent-child pairs.

It remains to exclude blue arcs between incomparable images. At every target vertex, choose independently a uniformly random injection from its children into its $`q`$ immediate host branches; conditional on these branch choices, choose each child's image uniformly among vertices of the required host depth in its assigned branch. For any ordered incomparable pair $`u,v\in V(T)`$, let $`z`$ be its lowest common ancestor in $`T`$. Expose the random choices along the target root-to-$`v`$ path, including the image of $`z`$ and the branch at $`z`$ taken by the path to $`v`$. The only possible blue predecessor of the image of $`v`$ is now a fixed host-tree vertex, if it exists. It may not lie in a suitable alternative host branch at the image of $`z`$, in which case the blue arc from the image of $`u`$ is impossible. Otherwise the immediate branch at $`z`$ taken by the path to $`u`$ must equal one specific branch among the other $`q-1`$; it is uniform on those branches by the uniform injection and the fact that subsequent randomness on the path to $`v`$ is independent of that choice. Thus the conditional probability of the arc from the image of $`u`$ to the image of $`v`$ is at most $`1/(q-1)`$. The union bound over at most $`t(t-1)`$ ordered pairs is less than one. Some outcome has no unwanted blue arc, proving the lemma.

## 3. Large blue-label matchings or row hubs

Return to arbitrary blue tuples. Take $`M=4t`$. Given a set of vertices, a blue-label matching is a set of their blue pairs with no blue identifier shared between pairs. Use the nested sets $`B_0=V(G_R)`$ and
```math
B_{r+1}
 =\{v: \text{the blue pairs of }N^+_{G_R}(v)\cap B_r
               \text{ contain a matching of size at least }M\}.
```
Nesting again follows by monotonicity.

If $`B_h\ne\varnothing`$, embed the rooted $`T`$ from $`B_h`$ down the layers. At each child step, use one of the $`M`$ candidates in a matching in the required next layer. Their blue pairs are mutually disjoint, so fewer than $`2t`$ candidates use a previously used blue identifier. Their red terminal labels are distinct because the candidates have the same red row, so fewer than $`2t`$ candidates use a previously used red identifier. Fewer than $`M`$ candidates are ruled out. The red terminal condition makes the image an induced red tree exactly as above, and all blue pairs on the image are disjoint, so there is no blue edge on it.

Suppose $`B_h=\varnothing`$ and write $`L_r=B_r\setminus B_{r+1}`$ for the layers. In a layer $`L_r`$, call a red row $`i`$ active if there exists a vertex of $`L_r`$ whose red terminal label is $`i`$. The vertices in inactive rows form a red independent set, since an edge to any such row would witness its activity. For each active row $`i`$, the blue pairs of its vertices in $`L_r`$ have no matching of size $`M`$. Indeed, the red shift graph is induced on its labels: the entire red row $`i`$ in $`L_r`$ lies in the red out-neighborhood of each layer vertex with red terminal $`i`$. A matching of size $`M`$ in the row would make that vertex belong to $`B_{r+1}`$, a contradiction.

For an active row, choose a maximal blue-label matching. Its endpoints supply a list of at most $`2(M-1)`$ blue identifiers meeting every pair in the row. Number these identifiers separately within each row, using the same index range. Assign each vertex one of the indices that meets its blue pair, together with the bit recording which blue coordinate uses it. The resulting at most $`4(M-1)`$ parts, considered across all active rows of the layer, each have one common blue first (or common blue second) coordinate within every red row. In the second-coordinate case, reverse the order of the blue identifiers and swap coordinates in every pair. This reverses the natural blue orientation and represents the same blue graph, with a common first coordinate per red row. The row-hub lemma therefore applies in each part.

If no induced $`T`$ exists in the union, every such part has red chromatic number at most $`C_{\rm hub}(T)`$. The inactive rows cost at most one red color. Taking disjoint palettes across parts and layers gives
```math
\chi(G_R)\le h\bigl(1+4(M-1)C_{\rm hub}(T)\bigr).
```
This provides the claimed $`C(T)`$ and proves the theorem.

## Attribution and scope

The problem is explicitly listed for two shift graphs in Adenwalla–Braunfeld–Hons–Sylvester–Zamaraev's November 20 revision, Section 1.2, with a different numbering in the July version. Its adjacent Problem 1.13 asks about deleting arbitrary edges from a *single* shift graph and has a separate short proof. This two-graph argument relies on a complete red junction inside each red row in Section 3. It does not claim to handle the union of two arbitrary edge-deleted shift graphs or of homomorphic shift-colorable graphs. It does not imply the Gyárfás–Sumner conjecture for all graphs or all set-defined graph classes.

## Extension: any fixed number of shift graphs

The same method proves a stronger statement. Fix a nonnegative integer $`b`$. If $`G_R`$ is a two-dimensional shift graph, $`G_1,\ldots,G_b`$ are arbitrary subgraphs of two-dimensional shift graphs, and $`\chi(G_R)`$ is sufficiently large as a function of $`T,b`$, then the union contains an induced $`T`$. The graph $`G_R`$ must retain all its shift edges on its red labels; the other graphs may have arbitrary edge deletions. Every representation must still be injective on vertices. As before, restrict to the red vertex set and make absent vertices isolated with fresh labels.

Here is the multicolor modification. A color $`j`$ is **pinned** if, after optionally reversing its coordinate order as in Section 3, all vertices of each red row have a shared first coordinate $`f_j(i)`$ in that color and a second coordinate $`g_j(v)`$. Those $`g_j`$'s are distinct within each red row. Start with no pinned colors and induct on the number still unpinned, allowing any prescribed set of pinned colors in the induction hypothesis.

Use parameters independent of which colors are pinned:
```math
q=b\,t(t-1)+2,\qquad H=(b+2)^h,\qquad
Q=q(2^H)^{H+1},\qquad
N=1+Q+\cdots+Q^H,\qquad M=4(b+1)N.
```
For a candidate in a red out-neighborhood, form the set of its two labels in every unpinned color, with each label tagged by its color. Use label matchings as in Section 3, now requiring $`M`$ candidates with pairwise disjoint tagged label sets. When there are no unpinned colors, interpret this as requiring $`M`$ candidates. Form nested layers by this matching property, up to level $`H`$.

If the core at level $`H`$ is nonempty, grow the complete $`Q`$-ary red host tree. At every step choose a child among $`M`$ matching alternatives in the next layer, with a fresh red terminal label, a fresh terminal label in each pinned color, and both labels fresh in every unpinned color. Here “fresh” excludes labels previously used in either coordinate of its own color. Each previous label excludes at most one alternative in the red and pinned colors because the moving labels are distinct within the row. In each unpinned color this also follows from the matching. There are fewer than $`2(b+1)N<M`$ exclusions.

The host contains no unpinned edges. Within each pinned color the orientation has indegree at most one and follows the embedding chronology just as in Section 2; this remains true after arbitrary edge deletion. Mark each host vertex by the set of distances to its strict ancestors that have an arc to it in some pinned color. There are at most $`2^H`$ marks and at most $`b`$ distances per mark. Retain a level-homogeneous complete $`q`$-ary host tree by the same bottom-up profile argument. In the level digraph add the red consecutive arcs and one arc for each marked distance. The indegree is at most $`b+1`$, so at most $`1+(b+1)+\cdots+(b+1)^{h-1}\le H`$ levels have directed distance less than $`h`$ to the last level. A shortest directed path therefore gives $`h+1`$ increasing levels forming an induced path. Between incomparable target vertices, there are now at most $`b`$ possible extra-edge predecessors to avoid instead of one. The same random embedding and conditioning bounds the probability for an ordered pair by $`b/(q-1)`$; the union bound remains strictly less than one. This yields the required induced $`T`$.

If the core is empty and $`p<b`$ colors are pinned, take the $`H`$ layers. Ignore the red independent set of inactive rows in each layer as before. In every active row a maximal matching of size at most $`M-1`$ covers all row vertices by its tagged labels; it includes at most $`2(M-1)`$ labels of each unpinned color. Partition row vertices by one such covering label's color, its position within that color's cover list for the row, and its coordinate role. There are at most $`4(b-p)(M-1)`$ parts. Each part pins one additional color, because the selected color and role are the same throughout the part while the selected label is fixed within each red row. The induction hypothesis applies. If all colors are pinned and the core is empty, the elementary outdegree coloring gives $`\chi(G_R)\le HM`$. In particular, writing $`C_b=HM`$ and $`C_p=H[1+4(b-p)(M-1)C_{p+1}]`$ for $`p<b`$ gives a finite bound $`C_0`$ for the theorem. The same argument with the roles of constituents exchanged shows that fixed unions of induced two-dimensional shift graphs satisfy this host-class version no matter which constituent supplies the large chromatic number: $`\chi(\bigcup_{j=0}^b G_j)\le\prod_{j=0}^b\chi(G_j)`$ by taking tuples of colors.

This extension does not cover arbitrary homomorphic shift-colorable graphs. In a noninjective labeling, many candidates in a red row can share an entire extra-color tuple, so a pinned color need not have distinct moving labels within that row.
