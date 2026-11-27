# Reconstructing subdivided trees from path counts

Let $`p_j`$ be the number of **unordered** pairs of distinct vertices of a finite tree at distance $`j\ge1`$. These are the counts of simple paths of each positive length. Recovery of the path and degree sequences from the ordinary chromatic symmetric function is due to Martin, Morin and Wagner. For the rest of the argument the sequences themselves suffice. [Original theorem, Corollary 5](https://arxiv.org/abs/math/0609339) · [Stanley's original question](https://math.mit.edu/~rstan/pubs/pubfiles/100.pdf)

Suppress every vertex of degree two. Each edge of the resulting reduced tree has a positive integer length, the number of edges in its original path. Write $`k`$ for its number of vertices, as read from the degree sequence. We treat trees on at least two vertices; order one is immediate. Put $`p_j=0`$ beyond the diameter. Form the following sets and graph directly from the observed sequences:
```math
 B_j=p_{j+2}-2p_{j+1}+p_j,\qquad
 S=\{j\ge1:B_j\ne0\},\qquad
 A=S\setminus\{u+v:u,v\in S\}.
```
The sums defining $`A`$ allow $`u=v`$. On the vertex set $`A`$ join two distinct integers $`a,b`$ precisely when $`a+b\in S`$, forming a simple graph $`J`$. Set $`D=\sum_{v:\deg v\ne2}\binom{\deg v}{2}`$.

**Observable certificate.** If the three equalities
```math
 |S|=\binom{k}{2},\qquad |A|=k-1,\qquad |E(J)|=D
```
hold, the degree sequence and path counts determine the entire tree among all finite trees.

**Independent-subdivision theorem.** For every reduced tree on $`k\ge2`$ vertices, assign each of its edges an independent uniform length from $`1,\ldots,t`$ and subdivide accordingly. Write $`m=\binom{k}{2}`$. The probability of failing the certificate is at most
```math
 \frac{\binom m2+(k-1)\binom{m+1}{2}+\binom{k-1}{2}m}{t}.
```
In particular the successful fraction tends to one on each fixed topology. The bound is uniform even along arbitrary sequences of growing reduced trees with $`k=o(t^{1/5})`$. Every certified subdivision is characterized by its ordinary chromatic symmetric function among all finite trees. The statement concerns random independent edge lengths on a specified reduced tree; it gives no proportion for the uniform distribution on all trees of a fixed order.

**Histogram-only corollary.** If every branch vertex of the reduced target has degree three, the same generic conclusion holds using only the path counts, against every tree. The trivalent structure of a competitor is deduced from the histogram. Stanley's unrestricted isomorphism question remains open. [Independent review and earlier work](PATH-DISTANCE-REVIEW.md) · [Exact finite checks](verify_path_distance_certificate.py)

## The signed distance distribution

The following identity also follows coefficientwise from Gutman's Schultz and modified Schultz polynomial identities for trees. We include the endpoint count to fix the convention for unordered paths. [Gutman, Theorems 3 and 4](https://doiserbia.nb.rs/Article.aspx?id=0561-73320530001G)

Write $`w_v=\deg(v)-2`$. For $`j\ge1`$,
```math
 B_j=\sum_{\{u,v\}:\ d(u,v)=j}w_uw_v .
```
For an unordered path with endpoints $`u,v`$ at distance $`j`$, write $`b_u=\deg(u)-1`$ for the number of possible one-step extensions at its end, and likewise for $`v`$. Summing $`b_u+b_v`$ counts each path of length $`j+1`$ twice by shortening it at one end. Summing $`b_ub_v`$ counts each path of length $`j+2`$ once by removing both end edges. Expand $`(b_u-1)(b_v-1)`$ and sum to obtain the formula. Thus only reduced vertices contribute, including leaves. The signed sum at a distance may vanish if distinct pairs share that distance.

There are exactly $`m`$ unordered pairs of reduced vertices. If $`|S|=m`$, every pair has a distinct distance. This statement also holds in every competitor with the same observations because its degree sequence fixes $`k`$. Consequently $`S`$ is the full set of positive reduced-vertex pair distances. A path between nonadjacent reduced vertices splits at an interior reduced vertex into two shorter positive path distances. Every member of $`A`$ must therefore be a single reduced edge length. There are $`k-1`$ reduced edges, so $`|A|=k-1`$ identifies them all, each bearing a different length as its label.

Two adjacent reduced edges of lengths $`a,b`$ make a two-edge path of length $`a+b`$. The true line graph of the reduced tree, with edge lengths as its vertex labels, is therefore a spanning subgraph of $`J`$. Its number of edges is $`D`$, because every adjacent edge pair has exactly one common endpoint. The last certificate equality forces it to be all of $`J`$.

To invert the line graph, identify every maximal clique of size at least two with the common endpoint of its edges: pairwise incident edges in a tree meet at a single vertex. In the reduced tree every nonleaf has degree at least three, so these cliques are exactly its branch vertices. Each edge label occurs in one clique if it ends at a leaf, and two if it joins branch vertices. Complete the missing leaf endpoints (both for a one-edge tree). Replacing each labelled edge by a path of its recorded length recovers the unmarked tree. This also gives a direct proof of the required case of line-graph inversion.

## Counting the exceptional assignments

The reduced tree has $`m`$ nonempty simple paths, each with a different $`0,1`$ edge-incidence vector. Its weight is the linear form in the independent edge lengths given by this vector. It suffices to avoid three kinds of equalities.

1. Two different paths have equal weight. Their vectors differ, giving at most $`\binom m2`$ proper hyperplanes.
2. A single edge weight is the sum of two nonempty path weights (the paths may be equal). The sum of the two incidence vectors has total coordinate sum at least two, while the edge vector has sum one. This gives at most $`(k-1)\binom{m+1}{2}`$ proper hyperplanes.
3. The weights of two nonadjacent edges sum to the weight of a path. The union of those edges is disconnected, hence its incidence vector is not a path vector. This gives at most $`\binom{k-1}{2}m`$ proper hyperplanes.

Outside their union all reduced-pair distances are distinct, each true edge is indecomposable, and no extra adjacency appears in $`J`$. The signed products on the uniquely represented distances are nonzero, so all three certificate conditions hold. For each proper hyperplane, conditioning on all but one coordinate having a nonzero coefficient leaves at most one of the $`t`$ allowed values. The union bound gives the stated estimate, uniformly in the topology. Neither rational independence nor exponential spacing is required.

## Reading trivalence from the distance histogram

The order $`n=p_1+1`$ and $`p_2=\sum_v\binom{\deg(v)}2`$ come from the histogram. For any tree with at least two vertices,
```math
 M=2p_2-2n+6=\sum_v(\deg(v)-2)^2.
```
Indeed $`\sum_v\deg(v)=2(n-1)`$. Each nonzero defect has absolute value at least one. Thus any competitor has $`k'\le M`$ reduced vertices. For the target in the corollary all these defects are $`1`$ or $`-1`$, so $`k=M`$. Whenever $`|S|=\binom M2`$, its competitor has at least $`M`$ reduced vertices by the pair-count bound and hence exactly $`M`$. Equality in the sum of squares forces degrees one or three at every reduced vertex. There are $`(M-2)/2`$ trivalent vertices, since the number of leaves exceeds the number of trivalent vertices by two. Consequently $`D=3(M-2)/2`$ and the entire certificate can be evaluated from the histogram alone. The case of a nontrivial path has $`M=2`$, one reduced edge and $`D=0`$.
