# Erdős–Hajnal local triangle conjecture

**A deterministic barrier for a different finite-geometry construction.** Replacing the point-lines of a generalized quadrangle by local `(K4,H7)`-free gadgets does preserve both forbidden subgraphs. However, arbitrary local tripartite graphs, and arbitrary triangle-free graphs augmented by one apex per line, cannot beat square-root independence. A power gain needs a polynomially large average vertex set meeting the local triangles on a line. These conclusions do not require any randomness or symmetry of the line gadgets.

## Forbidden graphs localize to a line

Take a linear point-line system (two distinct points are on at most one common line) with no noncollinear triangle of collinear pairs. A generalized quadrangle is such a system. Place any graph on the points of each line and take the union of their edges; a host-collinear pair obtains its edge only from its unique line. Every triangle of the resulting graph lies in a single line. A K₄ lies in a line by considering two of its triangles with a common edge. Each of the two diamonds of a spindle likewise has its four vertices on a line, since its two triangles share the core edge. If their lines through the common apex u differ, then the opposite tips v and w cannot be host-collinear: together with u they would form a noncollinear triangle of host-collinear pairs. This prevents the required edge vw. Consequently a spindle also lies in a single line. Thus the union is `(K4,H7)`-free exactly when each line gadget is.

## Local neighborhoods force independence

For any vertex x, its graph neighbors on distinct lines through x have no cross edges, by the no-noncollinear-triangle property in the host. If every line gadget is k-colorable, its neighbors of x on that line can be colored with k−1 colors, discarding the color of x. Taking the union of the largest color class on each of the lines through x gives an independent set of size at least d(x)/(k−1) in the whole graph. This works on every vertex subset and under arbitrary further edge deletion inside the k-colorable gadgets. Together with the greedy independent-set bound n/(Δ+1), it gives Ω_k(√n). In particular, replacing lines by arbitrary tripartite graphs cannot give a power gain, although it avoids both forbidden graphs.

There is a stronger, different obstruction that does not assume the line gadgets have bounded chromatic number. On every line L choose a set S_L meeting all triangles of its gadget. Such a set always exists, and one may take a smallest one. Let G₀ retain only edges on line L with both endpoints outside S_L, for all L. For every x, the neighborhood N_{G₀}(x) is independent even **in the original G**: across lines through x this is the host condition; within a line all three candidate triangle vertices would be outside S_L. Thus the average degree of G₀ is at most α(G). Write B for the number of vertices per line and D for the number of lines per vertex in the host, and let k be the average |S_L| over all lines. At most B|S_L| edges of each line gadget are lost from G₀, so counting point-line incidences gives
```math
\overline d(G) \le \alpha(G)+2Dk.
```
Combining this with α(G)≥n/(1+average degree) gives the deterministic restraint
```math
\alpha(G)\bigl(\alpha(G)+1+2Dk\bigr)\ge n.
```
In a thick finite generalized quadrangle of order (s,t), [Higman's inequality and the point count](https://doi.org/10.1007/s10623-018-00591-9) give t≤s², n=(s+1)(st+1), D=t+1=O(√n). Thus bounded k forces Ω(√n), and an assumed power gain α(G)≤n^(1/2−ε) forces k=Ω(n^ε). This includes all cone gadgets consisting of a triangle-free graph plus one apex with arbitrary incident edges. A full cone is itself `(K4,H7)`-free: it is K₄-free because its base is triangle-free, and every triangle uses the apex, while the spindle has vertex-disjoint triangles. Different lines may freely choose their apex and their base graph.

For a fixed bounded-k construction on the whole geometry, independent vertex thinning does not remedy this obstruction at the exponent level. If p is the retention rate and pn tends to infinity, the retained vertex count M is asymptotic to pn with high probability. The number of retained edges incident to the S_L in their own line has expectation O(p²nD). For any fixed δ>0, Markov bounds their average degree in the sample by O((pn)^δ pD) with high probability, using M=(1+o(1))pn. Because pD=O(√(pn)), and ordinary neighborhoods remain independent in the retained graph, the same degree estimate gives α≥(pn)^(1/2−o(1)) in probability. Here `fixed` means the gadget choices do not depend on which vertices are retained. The deterministic restraint for the whole geometry does not require that assumption.

This does not handle arbitrary high-chromatic line gadgets with large triangle transversals, arbitrary tailored subsets of points, or geometries permitting noncollinear triangles. Those remain possible routes to Erdős #813.
