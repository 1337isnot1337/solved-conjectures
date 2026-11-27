# A binary saturated graphon extremizer

The hard case of [Erdős #23](https://www.erdosproblems.com/23) can be sought among graphons satisfying a pointwise saturation equation. This reduction does not prove the density-band inequality.

Let m(W) be the minimum ordered monochromatic edge mass. Choose a triangle-free graphon W maximizing m(W), and among maximizers maximize its ordinary edge density p(W)=∫W. Both extrema exist by cut compactness and continuity; see [ROOT-CONVERGENCE.md](ROOT-CONVERGENCE.md). Replacing W by 1[W>0] preserves triangle-freeness, can only increase m, and strictly increases p unless W was binary a.e. Thus W is binary. Define its codegree kernel K(x,y)=∫W(x,z)W(y,z) dz. Then

    W(x,y) = 1[K(x,y)=0]    for almost every (x,y).

One direction, W=1 ⇒ K=0 a.e., is the triangle-free identity ∫WK=0. For the other direction, we need to add safe edges in parallel, not just a single zero-measure edge.

The balanced pentagon gives m(W)≥2/25, so by [vertex-weight stationarity](GRAPHON-EXTREMIZERS.md) its degree is at least 4/25 almost everywhere. Pick countably many independent uniform roots z_i; almost surely their binary neighbourhoods N(z_i) cover almost the whole space, since a point of positive degree is missed by all roots with probability zero, and Fubini handles the points simultaneously. Each N(z_i) is independently W-empty on its square for a.e. root by triangle-freeness. Disjointify this cover into countably many measurable independent cells.

Suppose the set S of ordered pairs with W=0 and K=0 has positive measure. If it meets two distinct cells in a positive-measure rectangle, add precisely those safe edges there (and symmetrically). A triangle with one newly added edge is impossible because old common-neighbour mass of each added pair was zero. A triangle with two new edges would require an old edge inside one independent cell, and all-new triangles are impossible because the added edges are bipartite. If instead S has positive mass on one cell's square, split that cell into two parts so some safe edges cross the parts, then use those two independent sets in the same argument. Such a split exists because a positive-measure subset of a square has positive mass on pairs of distinct points and the countable family of dyadic partitions separates distinct points. Each alternative creates a triangle-free graphon with greater p and no decrease of m, contradicting the secondary maximization. This proves the equation.

Consequently, on these extremizers, the neighbourhood features W(x,z_i) identify *adjacency*, not just distinct graphon twins: for a.e. pair, exactly the nonedges eventually share a 1 at a sampled root. The finite disjoint-profile adjacency supersets decrease in L¹ to W. More explicitly, for k roots their expected spurious edge mass is

    ∫∫ (1−W(x,y))(1−K(x,y))^k dxdy.

This tends to zero by saturation. Those finite disjoint-profile supersets need not be triangle-free; treating them as admissible triangle-free templates would be an error. The unresolved step is using saturation, the degree floor, and extremality to rule out m>2/25 in the medium-density band.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
