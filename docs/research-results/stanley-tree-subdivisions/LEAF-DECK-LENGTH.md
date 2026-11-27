# Generic leaf-pair distances determine total tree length

Let $`T`$ be a finite reduced tree with at least one edge and positive edge lengths linearly independent over the rationals. Its **leaf-distance multiset** lists the distance between every unordered pair of distinct leaves, with multiplicities and without identifying the pairs. If a second reduced metric tree $`S`$ has the same leaf-distance multiset, its total edge length is exactly that of $`T`$. The lengths of $`S`$ may satisfy arbitrary rational relations. The result extends to a complement of finitely many explicit rational hyperplanes in the lengths of each fixed target topology.

This is enough to compare the total length of a trimmed rival in the ordinary distance-histogram problem. It also holds as a statement about the leaf data alone. Individual edge lengths can change while those data stay fixed.

## How a leaf-pair correspondence carries internal splits

The number of distances determines the common number $`n\ge2`$ of leaves. At $`n=2`$ the single distance is the length. At $`n=3`$ the total is half the sum of the three distances. Henceforth take $`n\ge4`$. Resolve all higher-degree vertices of $`S`$ arbitrarily into trivalent vertices joined by edges of length zero, producing a binary tree $`S^*`$ without changing distances or total length. Let $`p`$ match each leaf pair of $`S^*`$ with the target pair of the same distance. The target distances are distinct because their pendant-edge incidence vectors differ.

For an internal edge of $`S^*`$ with leaf split $`A\mid B`$, both blocks contain at least two leaves. Its crossing array $`d_S(i,j)`$, for $`i\in A,j\in B`$, is a row term plus a column term, by measuring to that edge from both ends. Every two-by-two rectangle satisfies

```math
d_S(i,j)+d_S(i',j')=d_S(i,j')+d_S(i',j).
```

Replace each entry by the matched target distance. Its value is the sum of the target lengths along its path. Rational independence implies the rectangle identity for each target edge's zero-one incidence array. For a target pendant edge at leaf $`u`$, this array indicates whether $`u`$ belongs to the pair $`p(i,j)`$.

Any zero-one matrix whose every rectangle satisfies this identity depends only on its row, only on its column, or is constant. Indeed, row differences are constant across columns. If two rows differ, they must be the constant zero and one rows, and every remaining row is constant. Otherwise all rows agree. Classify the target leaf indicators accordingly, treating the constant indicators separately. The pair $`p(i,j)`$ is the disjoint union of a fixed set, a set depending only on $`i`$, and a set depending only on $`j`$. The sizes of the latter two sets are constant since each union has size two. Both sizes are positive by injectivity of $`p`$ when varying one index and fixing the other. They must therefore both equal one, and the fixed set is empty. Injectivity gives distinct row labels and distinct column labels, with the two lists disjoint. Their total size is $`|A|+|B|=n`$, so together they are all target leaves.

Consequently $`p`$ restricts on the crossing array to $`(i,j)\mapsto\{u_i,v_j\}`$, where the row list $`U`$ and column list $`V`$ partition the target leaves. In particular, $`p`$ carries precisely the pairs crossing $`A\mid B`$ to the pairs crossing $`U\mid V`$. The leaf bijections obtained in this step may depend on the chosen edge.

## The target splits give a binary refinement

Different edges of $`S^*`$ produce different target splits. A bipartition is determined, up to exchanging sides, by its set of crossing pairs, and $`p`$ is a bijection.

Two splits are called compatible if one of the four intersections of their sides is empty. To see that the image splits are pairwise compatible, fix the first rival split $`A\mid B`$. A second internal edge lies on one side, say the side containing $`A`$. One of the second split's sides is a nonempty subset $`C\subsetneq A`$. Among pairs from $`A\times B`$ its crossing set is precisely $`C\times B`$. Under the product description for the first edge, its image consists of complete rows in $`U\times V`$. A target leaf indexing any one of these rows is separated by the second image split from every leaf in $`V`$. Thus all of $`V`$ lies on one side of the second split, as required.

Each image split $`U\mid V`$ is also compatible with every edge split of $`T`$. Otherwise a positive-length target edge separates $`u_1,v_1`$ from $`u_2,v_2`$, with $`u_i\in U`$ and $`v_i\in V`$. The within-side sum $`d_T(u_1,v_1)+d_T(u_2,v_2)`$ is strictly smaller than the opposite sum $`d_T(u_1,v_2)+d_T(u_2,v_1)`$. This is the four-point identity on a resolved quartet: the difference is twice the central path length, which includes the chosen positive edge. It contradicts the crossing rectangle identity.

There are exactly $`n-3`$ internal edges in $`S^*`$. Its $`n-3`$ distinct pairwise compatible image splits therefore form the internal splits of a binary tree $`T^*`$ on the target leaves. For completeness, orient every split away from one fixed leaf, append the singleton clusters and the full cluster, and use inclusion to build the rooted hierarchy. Compatibility gives nesting or disjointness. Suppress the root of degree two if necessary. This realizes each requested split; a reduced tree with $`n`$ leaves has at most $`n-3`$ nontrivial splits, with equality exactly for binary trees. The image family is consequently maximal compatible. Every edge split of $`T`$ is compatible with the entire family and hence belongs to it, including the trivial pendant splits when appended. Contracting the additional internal edges of $`T^*`$ gives the target topology by the same hierarchy description. Give those additional edges length zero and retain the target edge lengths on its actual splits. The leaf distances and total length are preserved.

## The length identity

In a binary tree write $`b(i,j)`$ for the number of internal vertices of the path between leaves $`i,j`$. This is one plus the number of internal edge splits separating $`i`$ and $`j`$. Corresponding pairs under $`p`$ cross precisely corresponding internal splits of $`S^*,T^*`$. Hence their values of $`b`$ agree.

Pauplin's binary-tree length formula is

```math
\mathop{\mathrm{length}}(X)=\sum_{\{i,j\}} 2^{-b(i,j)}d_X(i,j).
```

Indeed, for any fixed edge start at each endpoint, walk away from the edge, and at each internal vertex independently choose one of the two forward edges uniformly. On each side this reaches a leaf with total probability one. The joint probability of reaching a given separated pair is $`2^{-b(i,j)}`$. Therefore the sum of the weights over the pairs crossing that edge is one. Expanding the distances in the formula gives each edge length coefficient one. The argument includes zero-length edges because it uses only the binary incidence pattern. [Pauplin (2000)](https://doi.org/10.1007/s002390010065)

Both the distance values and their weights now agree under $`p`$. This proves total-length equality. The proof uses genericity only to distinguish the finitely many target pair distances and to promote the finitely many genuine two-by-two distance sum identities to pendant incidence identities. Equality between two distinct target path forms, or a nonidentical pair-sum relation whose pendant incidence fails, cuts out a proper rational hyperplane. Excluding these finitely many hyperplanes suffices uniformly over every rival.

## Application to one extra untagged leaf

Suppose an ordinary distance-histogram comparison has the same total arclength on the target and rival. If the rival has one additional leaf and its remaining leaves have exactly the target leaf-distance multiset, discard the extra pendant edge and suppress its parent if it becomes bivalent. All distances between the remaining leaves persist, and total arclength decreases strictly by the length of the removed pendant edge. The theorem gives a contradiction for a generic target. The separate ordinary-histogram analysis supplies the requisite equality of normal-leaf distances; the leaf-deck theorem itself does not assume a signed distance law.

## Limits, sources and attribution

Two pendant cherries show why total length is the correct conclusion. In each cherry there are two pendant lengths and a stem. Write $`p,q`$ for the sums of the pendant lengths of two cherries. Add $`(q-p)/2`$ to both pendant lengths in the first cherry and subtract this amount from its stem. Apply the opposite changes at the second cherry. For a four-leaf binary tree the two stem changes cancel on the shared edge. Precisely the two within-cherry distances interchange. All other leaf distances and total length stay fixed. An open chamber of choices keeps the new edge lengths positive, and the rational linear transformation is an involution so rational independence is preserved. In that chamber a changed pendant length is generically different from every original edge length, ruling out a weighted isometry.

Evans and Lanoue give a pair of unweighted caterpillars with the same unlabelled leaf-pair distance multiset. Their generic reconstruction theorem uses the richer sequences of subtree lengths generated by successive random leaves. Classical reconstruction from a **labelled** leaf-distance matrix retains leaf incidences, and Pauplin's formula weights pairs using a known topology. The argument above transfers these weights through unlabelled data without a global leaf correspondence. Searches for unlabelled leaf distances, pair-distance distributions, total branch length, additive tree measures, balanced minimum evolution and generic phylogenetic reconstruction did not locate the exact total-length conclusion in the sources checked. [Evans–Lanoue](https://pmc.ncbi.nlm.nih.gov/articles/PMC6135540/) · [Pauplin](https://doi.org/10.1007/s002390010065) · [Labelled reconstruction and triplet covers](https://arxiv.org/abs/1209.2391)

The crossing-array description and the transfer of Pauplin weights through compatible splits were obtained jointly in the repository’s work on extra leaves. The [review and sources](LEAF-DECK-REVIEW.md) record the contributions and independent checks. The [finite check](verify_leaf_deck_length.py) tests different possible assignments of the unlabelled observations. The mathematical proof handles every number of leaves.
