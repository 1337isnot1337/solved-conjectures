# A saturation constraint on long broken edges

In a maximal triangle-free graph, fix a maximum cut with crossing graph B and the monochromatic graphs M_X,M_Y on its two sides. Suppose a monochromatic edge uv on side X has B-distance greater than four. Then:

1. Every vertex on X is at M_X-distance at most two from u or v. Thus M_X is connected with diameter at most five.
2. The two B-neighborhoods A=N_B(u) and C=N_B(v), which are disjoint, lie in a single M_Y-component. Every a∈A and c∈C are at M_Y-distance at most two.

In particular, if both monochromatic side graphs are disconnected, every monochromatic edge has crossing distance exactly four. More generally, if the M_Y components all have mass less than w(N_B(u))+w(N_B(v)), the same conclusion holds for the specific edge uv. These statements hold with positive vertex weights when maximizing product-weighted cut size. The maximum-cut hypothesis is only needed to ensure B connects every component and to give the optional degree lower bound below.

## Proof

Since uv is already an edge of a triangle-free graph, A∩C is empty. A vertex z on X cannot have a B-common neighbor with u and another B-common neighbor with v: concatenating the two two-step paths would give a B-walk of length four from u to v. So z has no B-common neighbor with at least one of u,v. If z equals either endpoint, it already satisfies the desired distance conclusion. Otherwise, saturation says that z and the chosen endpoint are adjacent or have a W-common neighbor. An adjacency is monochromatic, and a common neighbor cannot be on Y because that would be a B-common neighbor. Thus there is an M_X-walk of length at most two, proving the first assertion; the edge uv joins the two balls.

For a∈A and c∈C, a common B-neighbor z would give the forbidden B-walk u–a–z–c–v. They are distinct. Saturation again supplies their monochromatic adjacency or a common neighbor, necessarily on Y. Therefore their M_Y-distance is at most two. A,C are both nonempty in a maximum cut with positive weights: at u or v, flipping just that vertex would otherwise improve the cut. This proves the second assertion.

For the zero-one saturated graphon chosen in [SATURATION](SATURATION.md), the same argument works in terms of almost-everywhere positive walk kernels by Fubini, for almost every monochromatic edge with vanishing B-walk mass at length four. In particular almost every vertex on its side lies in the union of the two monochromatic radius-two supports. On the opposite side the two B-neighborhoods are joined by monochromatic walks of length at most two for almost every opposite-side pair from those neighborhoods. Each neighborhood has mass at least 2/25 at a maximizing graphon, since the optimal crossing kernel has this minimum degree by [EXTREMAL-WALKS](EXTREMAL-WALKS.md). The resulting shared monochromatic component therefore has mass at least 4/25.

Saturation alone does not prove that the relevant monochromatic components are small. These are necessary structural conditions for long broken edges, not a claim that all maximum cuts have only four-step broken edges.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
