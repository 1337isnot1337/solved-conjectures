# A four-cycle in a minimal support

This is a structural reduction for [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution. If a weighted counterexample exists, one can select a least-support saturated weighted counterexample whose support contains both a four-cycle and an induced six-vertex path. In fact every saturated least-support counterexample contains both. The C4 assertion below does not assert that an arbitrary weighted C4-free graph can be saturated without inserting a C4.

Let the support be a simple graph with positive vertex weights summing to 1, and let beta be the minimum unordered monochromatic product edge mass.

## Stationarity and regular supports

Take a counterexample with the fewest positive-weight vertices; complete its template to a maximal triangle-free graph, and maximize beta over its weight simplex. Saturation can only increase the cost of each cut. Compactness gives a maximum, and every maximizer has full support by minimality. At an interior maximum there is a distribution on optimal cuts for which the mean monochromatic neighboring mass at each vertex is 2 beta. Indeed, the gradients of the active cut polynomials, projected onto the weight-sum-zero hyperplane, have zero in their convex hull (otherwise a common strict ascent direction exists). Euler's identity identifies the common gradient coordinate as 2 beta.

In each optimal cut the monochromatic neighboring mass of a vertex is at most half its weighted degree d_w(v), by flipping just that vertex. Consequently every vertex has d_w(v) >= 4 beta > 4/25. In particular, if the support is k-regular on h vertices, summing the weighted degrees without weights gives sum_v d_w(v) = k, and hence k/h > 4/25. This conclusion concerns interior weighted maximizers; it does not assert that every weighting on a sparse regular template has a low weighted edge density.

## Codegree one is impossible

If this saturated support is C4-free, every two distinct nonadjacent vertices have exactly one common neighbor. It is connected with diameter at most two. It cannot be bipartite, so its girth is five: if there were no pentagon then for any vertex r each distance layer 0, 1, 2 would be independent (an edge in layer 2 gives a triangle or pentagon), yielding a bipartition.

For clarity, regularity can be seen directly. With adjacency matrix A, ordinary degree diagonal D and all-ones matrix J, one has A² = D + J - I - A. Commuting with A gives (A_uv - 1)(deg(v) - deg(u)) = 0. The complement is connected: if not, all different complement components are joined completely in the graph; triangle-freeness then forces exactly two independent components and a bipartite graph. Thus degrees are constant along complement edges and everywhere. Counting the radius-two layers shows h = k² + 1.

The ratio test above gives 2 <= k <= 6. On the all-ones orthogonal space the adjacency eigenvalues satisfy x²+x-(k-1)=0. For k=4,5,6 the discriminant 4k-3 is not a square, and the two roots have equal multiplicity by rational conjugacy. Trace zero would then give k-k²/2 = 0, impossible. This is the relevant part of the classical [Hoffman–Singleton analysis](https://people.orie.cornell.edu/dpw/orie6334/HoffmanS60.pdf); no existence question about degree 57 is needed.

The k=2 graph is C5. Its five possible single-omission cuts give beta <= e/5 when the total weighted edge mass is e. If k=3, the support is the Petersen graph (also the cubic uniqueness case of Hoffman–Singleton). Write it as the graph on two-subsets of {1,2,3,4,5}, adjacent on disjointness. Cut by membership of a uniformly selected element. Each edge is omitted precisely when the selected element lies outside the union of its endpoint sets, so again beta <= e/5. These cuts prove beta <= 1/25 if e <= 1/5. If e >= 1/5, the elementary triangle-free bound beta <= e - 4e² <= 1/25 applies (see [the original bound and extensions as cited by Balogh–Clemen–Lidický](https://arxiv.org/abs/2103.14179)). This excludes both candidates. The induced P6 condition follows separately from [the induced-path proof](INDUCED-PATH-FREE.md).

## Remaining gap

The proof uses that every distinct nonedge has exactly one common neighbor, not merely that there are few duplicated codegrees. Saturation can add edges that destroy the original C4 restriction. Therefore the conclusion is about the support of a minimal counterexample to the full problem; it is not a proof for all weights on all C4-free templates. The next regime, saturated supports of maximum codegree two, has infinite irregular families ([Eberhard et al., 2026](https://ajc.maths.uq.edu.au/pdf/94/ajc_v94_p235.pdf)), so simply replacing the Moore classification is insufficient.
