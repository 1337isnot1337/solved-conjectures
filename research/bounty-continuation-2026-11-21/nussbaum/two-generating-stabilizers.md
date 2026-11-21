# Two generating clique stabilizers in Nussbaum’s problem

**Theorem.** Label a ternary orbit of length $`p`$ by the cyclic group $`G`$. Suppose the setwise stabilizers of maximal compatibility cliques have exactly two inclusion-minimal members $`K,L`$, and $`K+L=G`$. Two distinct orbit faces then meet if and only if their labels differ by an element of $`K`$ or of $`L`$. In particular the compatibility graph is a rectangular grid with $`m=|K\cap L|`$ faces per cell. Its side lengths are $`[G:K]`$ and $`[G:L]`$. There is no primality assumption on either index or on $`m`$.

Consequently the orbit has $`p\le 2^n`$ whenever the [weighted-grid theorem](weighted-grid-entropy.md) applies. If $`K\cap L`$ is trivial, the [local unweighted bound](local-grid-and-one-star-orbit.md) gives at least $`p`$ Boolean vertices in the union in every dimension.

## Quotient by the common subgroup

Put $`H=K\cap L`$. Every maximal clique stabilizer contains $`K`$ or $`L`$, by finiteness and the hypothesis on minimal members. The intersection of all those stabilizers is exactly $`H`$, since both $`K`$ and $`L`$ themselves occur. Every maximal clique is a union of $`H`$-cosets. Each coset is therefore a clique, and an edge between cosets implies that all pairs between the two cosets are edges. Indeed, the edge belongs to a maximal clique containing both cosets. Thus the quotient graph on $`G/H`$ has exactly the images of the original maximal cliques as its maximal cliques. Their stabilizers are the original stabilizers modulo $`H`$. Their common intersection is trivial.

In the quotient, the images $`K/H`$ and $`L/H`$ intersect trivially and generate the whole group. Write it as their direct product $`X\times Y`$, with $`X=K/H`$ and $`Y=L/H`$. Every maximal clique is a union of horizontal lines or a union of vertical lines. The quotient graph is incomplete, since a complete graph would have just one maximal clique stabilizer. Maximal cliques of both kinds occur, since each of $`X`$ and $`Y`$ is itself a stabilizer. Translation therefore makes each horizontal line and each vertical line a clique.

## Between parallel lines

On each set of line indices, join distinct indices if their full lines lie together in a clique of that orientation. Write $`R`$ for the graph on horizontal line indices and $`S`$ for the graph on vertical line indices. Two cells in distinct rows and columns are adjacent exactly when their row indices are adjacent in $`R`$ or their column indices are adjacent in $`S`$. Every edge extends to a maximal clique, which has one of the two orientations. Neither index graph is complete, because that would make the quotient graph complete.

If $`i,k,i'`$ is an induced path on three vertices of $`R`$, choose nonadjacent distinct indices $`j,j'`$ in $`S`$. The cells $`(i,j),(i',j),(k,j')`$ form a clique. A maximal clique containing them could have neither orientation, a contradiction. Exchanging rows and columns rules out induced three-vertex paths in $`S`$ as well. Thus the components of each index graph are complete: the first three vertices of a shortest path between nonadjacent vertices in one component would give a forbidden path.

Each index graph is translation-invariant. In such a graph the component $`D`$ of zero is a subgroup: if $`t\in D`$, translation by $`t`$ maps $`D`$ to the component of $`t`$, which is $`D`$. The other components are its cosets. Every maximal horizontal clique consists of *all* rows in a single $`R`$-component. Its rows lie in one component by the definition of $`R`$, and all the rows in that component can be joined by maximality. A translation of the row index by an element of $`D`$ fixes every such clique. It also fixes every vertical clique since each included column contains every row. The common intersection of maximal-clique stabilizers in the quotient is trivial, so $`D`$ is trivial. The same argument applies to the component of zero in $`S`$.

Both index graphs are edgeless. Quotient cells meet exactly along a single row or column. Lifting to $`G`$ gives the claimed description, including all $`|H|`$ faces in each cell.

## A consequence for periods with repeated prime factors

Let $`H`$ instead be defined initially as the intersection of *all* maximal-clique stabilizers. If $`[G:H]=qr`$ for distinct primes $`q,r`$, there are two possibilities. If a maximal clique has stabilizer $`H`$, the [least-stabilizer theorem](prime-power-periods.md) already gives the local period bound. Otherwise, in the incomplete quotient all maximal clique stabilizers have order $`q`$ or $`r`$, and both orders occur because their common intersection is trivial. Their preimages meet the two hypotheses above. Hence the remaining graph is precisely a $`q`$-by-$`r`$ grid with $`|H|`$ faces per cell. For example, the period bound holds throughout this quotient case when $`q,r\ge128`$, even with arbitrarily many faces per cell.

Having two inclusion-minimal stabilizers alone need not imply that they generate $`G`$. Periods and compatibility graphs outside these hypotheses remain in the [full sponsor question](https://sites.math.rutgers.edu/~zeilberg/math640_10.html).

## Finite checks

The [checker](check_generating_stabilizers.py) enumerated maximal cliques in 5,864 labeled circulants of orders 6, 10, 12, 15, 18, 20 and 24. Exactly 12 graphs had two generating inclusion-minimal stabilizers. In each, the two predicted indices gave the exact adjacency of every vertex pair. Further examples include grid sides 4 and 9 with two faces per cell, sides 8 and 9, and a disconnected graph whose two minimal stabilizers generate a proper subgroup.
