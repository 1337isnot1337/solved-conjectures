# Erdős's same-vertex-set cycles problem

## A simultaneous cycle-merging certificate

Suppose a graph has two edge-disjoint 2-factors R and B on the same vertex set. They need not be connected. An alternating switch is a simple even cycle whose edges alternate between R and B. Exchanging the two colours on its edges preserves both 2-factors and their common vertex set. The following criterion gives a deterministic way to make both factors connected, with no assumptions on graph order.

Take a collection of pairwise edge-disjoint alternating switches. For each switch C of length 2h, require its h red edges to lie in distinct initial components of R, and its h blue edges to lie in distinct initial components of B. Form two incidence graphs, one for each colour: one side consists of that colour's initial components, and the other side of the selected switches. A switch node is adjacent to all components in which it uses an edge of that colour.

**If some subcollection of switches makes both incidence graphs trees, the original graph contains two edge-disjoint Hamilton cycles on the common vertex set.** Longer switches are allowed, so the criterion does not demand 4-cycles and can be used in high-girth graphs.

Indeed at the time of a switch, if its red edges lie in distinct current red components, swapping removes one edge from each such cycle, leaving paths. The intervening blue edges of the switch join the paths cyclically into one new red component. The same applies to blue. In an incidence tree, the component nodes incident to an unprocessed switch are in distinct components of the forest using only already processed switch nodes; otherwise the forest path between two such nodes plus the unused switch would give a cycle. By induction this is precisely the evolving connectivity of the two 2-factors on their initial component labels. Edges of the pending switches retain their initial colours because the switches are edge-disjoint. The final incidence connectivity gives one spanning cycle of each colour. The switches may share vertices; only edge-disjointness is needed for this argument.

### Exact selection test for 4-cycle switches

If both factors start with k components and the candidate switches are 4-cycles, turn each switch into an edge of a red multigraph on the red components and simultaneously into an edge of a blue multigraph on the blue components. Use switch labels as the common edge ground set E. It is sufficient that for every subset U of E,

    rank_R(U) + rank_B(E minus U) >= k−1,

where each rank is the graphic matroid rank, i.e. the number of vertices minus the number of components of the indicated spanning subgraph. By the matroid intersection theorem this is equivalent to the existence of a subset of k−1 switch labels that is a forest in both projection multigraphs. Each of those forests is then a spanning tree, and subdividing its edges gives the incidence trees above. Thus the selection condition is both necessary and sufficient **for this particular common spanning-tree certificate**, not for Hamilton decomposability in general. For longer switches the same incidence-tree argument is valid but there is no such ordinary two-graphic-matroid test stated here.

Colour switching itself is established, for example in [the literature on abelian Cayley decompositions](https://doi.org/10.1016/S0095-8956%2803%2900033-9). This note isolates a simultaneous certificate on an arbitrary starting pair of factors. The open step in applying it to the [regular high-girth core](README.md) is to force sufficiently many compatible alternating switches, or to replace the tree-routing condition by a weaker one. Knowing each factor can be merged separately gives no common-tree guarantee.
