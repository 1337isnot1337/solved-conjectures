# Antichains in branchless forests

A second reduction for [Erdős #601](https://www.erdosproblems.com/601), issue #1084. It keeps full order type and converts an arbitrary rayless graph to the comparability graph of a rooted forest with no infinite descending branch (from root towards descendants). The order used to measure order type is external to the forest.

## Choosing one vertex per finite part

Let a well-order of nonzero limit type \(\alpha\) be partitioned into arbitrary finite sets \(F_j\). There is a subset of type \(\alpha\) meeting each \(F_j\) in at most one point. In fact it meets every consecutive \(\omega\)-column infinitely.

Write \(\alpha=\omega\beta\) and use the consecutive \(\omega\)-columns. Form a bipartite incidence graph on columns and parts, putting an edge for nonempty intersection. Every column has countably infinitely many incident parts, and every part meets only finitely many columns. The incidence components are countable. In each component make a sequence of its columns in which each occurs infinitely often. At each step choose a vertex in the scheduled column from a part not used earlier in the component. Only finitely many parts have been used by that step. Combine the choices from the disjoint components. This also proves full order-type independence for disjoint unions of finite graphs with no bound on their sizes or degrees.

## Exact reduction to forests

The following are equivalent for every limit ordinal \(\alpha\).

1. Every rayless graph on \(\alpha\) has an independent set of order type \(\alpha\).
2. If a rooted forest without infinite branches is placed on the points of \(\alpha\), with each node at finite distance from its root and no connection between the external ordinal order and the forest order, then it has an antichain of ordinal order type \(\alpha\).

For (2) implies (1), apply Schmidt's rank characterization. Rank zero means finite; at positive rank choose a finite separator leaving components of strictly smaller rank. Recursively form a rooted decomposition: the separator is the finite bag at a node, and the residual components are its child pieces. A rank-zero piece contributes its entire finite vertex set as one bag. The strictly decreasing ranks rule out infinite branches. Every vertex occurs in a bag: if not, its residual pieces would form an infinite descending rank sequence. The bags are disjoint, and the bags of the endpoints of any graph edge are comparable, since different child pieces are anticomplete. Empty bags are harmless.

Use the previous lemma to retain a subset of order type \(\alpha\) that meets each bag in at most one point. On the occupied bags, contract out the unoccupied bags: the parent is now the closest retained strict ancestor, if one exists. The resulting rooted forest is branchless and its ancestor relation is exactly the restriction of the old one. Apply (2), using the retained vertices in their original ordinal order. The resulting antichain contains no original graph edge.

For (1) implies (2), take the graph whose edges are the comparable pairs of distinct forest nodes. It is rayless. Indeed a putative ray must start in one root component. Delete the root: the ray has a tail in a single child subtree, since vertices in distinct child subtrees are incomparable. Iterate to produce an infinite branch. Independence in this comparability graph is exactly forest antichainhood.

## Finite rank

It follows in particular that **every finite-Schmidt-rank graph on any limit ordinal has an independent set of full order type**. Use the same thinning and forest, now of bounded height \(h\) because the ranks decrease through natural numbers. Orient each comparable-pair edge towards the ancestor. Outdegree is at most \(h-1\), so the finite-density theorem in [FINITE-ARBORICITY.md](FINITE-ARBORICITY.md) applies. The rank bound is imposed on the original graph without any bound on the sizes of its finite separators. Thus this is not a consequence of imposing finite arboricity on the original graph; for instance, arbitrarily large finite cliques can occur as separate components.

A counterexample to the ordinal classification can therefore be taken to be a comparability graph of an externally well-ordered branchless forest of unbounded finite depth. Uniform finite rank cannot supply one. The equivalence does not decide what happens at unbounded depth.

## Priority and references

The finite-bag decomposition is standard, not a new graph characterization: see Schmidt's rank as given in [Bonato et al., Twins of rayless graphs](https://math.ryerson.ca/~abonato/papers/raylesstwins.pdf), and the related Halin decomposition in [Bürger–Kurkofka, Duality theorems for stars and combs I](https://pure-oai.bham.ac.uk/ws/portalfiles/portal/199716668/Journal_of_Graph_Theory_2021_B_rger_Duality_theorems_for_stars_and_combs_I_Arbitrary_stars_and_combs.pdf). The step relevant here is preserving the external ordinal order when making the bags singletons, followed by the exact antichain reformulation. See [FINITE-ARBORICITY.md](FINITE-ARBORICITY.md) for the original partition-relation sources and distinction from the old diamond counterexamples. A search for ordinal rayless graphs, full-order antichains and Schmidt rank did not identify this exact all-limit-order statement; no priority claim is made.
