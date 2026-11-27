# A finite-dimensional obstruction for complementary graphs

Let a **witness** be a graph on $`\omega_1`$ for which the graph and its complement have uncountable chromatic number and their categorical product is countably chromatic. Two distinct product vertices are adjacent when their first coordinates form an edge of the graph and their second coordinates form an edge of its complement. [Lajos Soukup, Problem 1.4, arXiv:2610.08027v1](https://arxiv.org/html/2610.08027v1#S1)

**Theorem.** Under the bounded proper forcing axiom (BPFA), neither factor of a witness has an uncountable induced subgraph that is the comparability graph of a poset of finite dimension. In particular a graph constructed by comparing *any* two linear orders cannot witness Problem 1.4 under BPFA. In an extension by one Cohen real there is a witness whose graph is the comparability graph of a poset of dimension two. This gives opposite consistency results for the dimension-two restriction. The unconditional existence question for an arbitrary graph remains open. [Positive construction and its sources](ONE-COHEN.md)

The proof has a ZFC consequence for comparability graphs of arbitrary dimension. If an uncountable induced subgraph of a witness or its complement is represented by the comparable pairs of a poset, **every linear extension of that poset is an Aronszajn line**. In particular no linear extension contains an uncountable well-ordered, reverse well-ordered or real-type suborder. A real-type order here means an order isomorphic to a subset of the usual real line.

## Replicating a graph inside an uncountable subset

Write $`h(x,y)`$ for the symmetric adjacency bit on distinct vertices. From a countable product coloring $`c`$ form $`f(x,y)=(c(x,y),c(y,x))`$. If $`f(x,y)=f(x',y')`$ with $`x\ne x'`$ and $`y\ne y'`$, then $`h(x,x')=h(y,y')`$. Indeed, a disagreement in either direction would give adjacent product vertices with equal colors in one coordinate of $`f`$.

Neither factor contains an uncountable clique. If one did, choose for each vertex of the opposite factor a color occurring uncountably often in its column over the clique. Adjacent vertices cannot receive the same color, since two different clique representatives would give a monochromatic edge in the product. In particular every uncountable vertex subset contains an edge and a nonedge, and its induced factors still have uncountable chromatic number. This is the homogeneous-set argument in Soukup's Theorem 1.1. [Source proof](https://arxiv.org/html/2610.08027v1#S2)

For uncountable sets of vertices $`A,B`$, there are an uncountable $`I\subseteq B`$ and pairwise disjoint uncountable fibers $`A_i\subseteq A`$, indexed by $`i\in I`$, such that
```math
h(x,y)=h(i,j)\qquad (i\ne j,\ x\in A_i,\ y\in A_j).
```
For each $`i\in B`$, some label appears uncountably often among $`f(x,i)`$ for $`x\in A`$. Pass to an uncountable set of indices with the same label. Any two of the resulting fibers have countable intersection, since all pairs of distinct points in their intersection have the same bit. In an enumeration of type $`\omega_1`$, remove all earlier intersections from each fiber. The equality rule gives the displayed formula. This is Cinna Davis's replication argument. When $`A`$ and $`B`$ are stationary subsets of $`\omega_1`$, both $`I`$ and every $`A_i`$ can be chosen stationary: use countable completeness of the nonstationary ideal for the two label choices, and observe that thinning removes only countably many points per fiber.

## What a linear extension must omit

Let a poset on an uncountable induced subset represent the graph, so $`h(x,y)=1`$ exactly when $`x,y`$ are comparable. Interchanging the two factors gives the same proof for the complement. Fix a linear extension $`L`$. All the preceding properties hold on every uncountable subset, so restrict to the proposed suborder of $`L`$.

First suppose the suborder has type $`\omega_1`$. Apply replication inside it and choose adjacent indices $`i,j`$; every point of $`A_i`$ is then comparable with every point of $`A_j`$. Both fibers are unbounded in the well-order. Recursively choose a pair of points, first from $`A_i`$ and then from $`A_j`$, above everything chosen at preceding stages, for $`\omega_1`$ stages. Between any two chosen points of $`A_i`$ there is a chosen point of $`A_j`$. Both comparabilities point forward in the linear extension. By transitivity the chosen $`A_i`$ points give an uncountable chain, which is an uncountable clique. Reversing both orders excludes type $`\omega_1^*`$.

Next suppose the suborder embeds into the reals, and take all fibers in that suborder. In each fiber, consecutive pairs in the real order have disjoint nonempty open real intervals between them, so there are only countably many such pairs. Delete their endpoints when choosing two incomparable points $`x_i<z_i`$: the remaining set is uncountable and hence contains a nonedge. Some point $`y_i`$ of the original fiber lies strictly between these endpoints. Choose rationals $`p_i,q_i`$ such that
```math
x_i\lt p_i\lt y_i\lt q_i\lt z_i.
```
Uncountably many fibers share the same two cuts. Choose adjacent indices $`i,j`$ among these. The points $`x_i,z_i`$ are each comparable with $`y_j`$, and their positions in the linear extension force $`x_i\lt_P y_j\lt_P z_i`$. This contradicts the choice of $`x_i,z_i`$. This proves the ZFC assertion about every linear extension.

## Finite dimension under the basis theorem

A finite realizer of a poset is a nonempty finite list of linear extensions whose intersection is the given order. Fix a Countryman line $`C`$, so $`C^2`$ is a countable union of chains for the coordinatewise order. Under BPFA, every Aronszajn line contains a copy of $`C`$ or of its reverse. This is the fixed-line conclusion of Krueger and Moore's Lemma 12.3 and Corollary 12.5; Moore's earlier theorem proves the basis result under PFA. [Krueger–Moore, v2, §12](https://arxiv.org/pdf/2510.03581#page=21) · [Moore, Annals of Mathematics](https://annals.math.princeton.edu/2006/163-2/p08)

Suppose there are $`d`$ orders in a realizer on an uncountable induced subgraph. Thin the first order to a copy of $`C`$ or its reverse. Repeat for each subsequent order on the remaining uncountable set. The preceding ZFC lemma applies on every such restriction. After the finitely many steps, each coordinate order on the final uncountable set embeds in the same $`C`$ after choosing a sign. Earlier embeddings restrict along every thinning.

Write $`e_j`$ for the signed embeddings. For each vertex $`x`$ and each $`j>1`$, record a chain of a fixed countable cover of $`C^2`$ containing $`(e_1(x),e_j(x))`$. There are countably many finite lists of labels. One list occurs on an uncountable subset. On it, comparison in every signed coordinate agrees with comparison in the first signed coordinate, because the embeddings are injective. If all signs agree, the original orders agree there and the subset is a chain of the poset. If the signs differ, every pair is incomparable in the intersection order. Either case gives an uncountable homogeneous set. This contradiction proves the BPFA conclusion, including dimension one.

In the one-Cohen construction the graph records agreement of two linear orders, so it is precisely the comparability graph of their intersection. Its dimension is at most two and cannot be one because there is a nonedge. The restricted existence statement holds in a Cohen extension of any ground model and fails in a model of BPFA; the negative consistency assertion uses the consistency of BPFA. Neither conclusion decides Soukup's unrestricted ZFC question.

## Exact chromatic equality on at most the first uncountable cardinal

Under BPFA, for the comparability graph of any finite-dimensional poset on at most $`\omega_1`$ vertices, the chromatic number of the product with its complement equals the smaller factor chromatic number. If both factors are uncountably chromatic, the theorem forces the product to be uncountably chromatic as well. All three cardinalities are then $`\aleph_1`$.

The remaining cases hold in ZFC. A finite poset's comparability graph can be colored with its maximum chain size by sorting vertices according to the length of a longest chain ending there. Its incomparability graph can be colored with its maximum antichain size by Dilworth's chain partition theorem. By compactness for finite colorings, for either graph a chromatic number at least a positive integer $`n`$ implies that it contains an $`n`$-clique. Indeed absence of an $`n`$-clique gives an $`(n-1)`$-coloring on every finite induced subgraph, and hence on the whole graph. A clique of size $`n`$ in each factor gives a clique of size $`n`$ in the product by pairing corresponding vertices. If the smaller chromatic number is finite, take that value of $`n`$; if it is $`\aleph_0`$, use all finite $`n`$. The coordinate projections give the reverse inequality, and the empty graph is immediate. The comparison witness after one Cohen real gives failure of this same equality already in dimension two.
