# A least weighted counterexample is pentagon-covered

Suppose [Erdős Problem 23](https://www.erdosproblems.com/23) has a counterexample, and choose one with the fewest positive-weight vertices, allowing arbitrary product weights. Then one may assume it is maximal triangle-free, and **every induced two-edge path lies in an induced pentagon**. In particular every pair of distinct vertices lies together in a pentagon. This is a support reduction, not an assertion that a counterexample exists.

## Compress independent neighborhood unions

If \(u,v\) are nonadjacent and \(N(u)\cup N(v)\) is independent, identify them into a single vertex of mass \(w_u+w_v\), adjacent to the union. The new graph is triangle-free, because every triangle through the merged vertex would require an edge inside the union. Every cut of the new graph lifts by assigning both old vertices the merged sign, with no larger monochromatic cost. Indeed the new endpoint-product weight on each edge is at least the total old cost of edges it replaces. Thus the compressed graph has at least the old minimum cost and strictly fewer supported vertices. Such a pair cannot occur in a least weighted counterexample.

Complete the chosen support to a maximal triangle-free graph, preserving weights. This does not decrease the minimum monochromatic cost and does not increase the vertex count. It remains a least-order counterexample, so the same compression obstruction applies on the completed support.

Take any nonedge \(uv\). By the obstruction there is an edge \(ab\) between \(N(u)\) and \(N(v)\), say \(a\in N(u)\) and \(b\in N(v)\). Then \(u-a-b-v\) is an induced three-edge path, since either additional chord would give a triangle. By saturation \(u,v\) have a common neighbor \(x\). Any such \(x\) lies outside that path and avoids \(a,b\) by triangle-freeness. Thus \(u-a-b-v-x-u\) is an induced pentagon. In particular every prescribed two-edge path \(u-x-v\) is extendable this way, not just some path between its endpoints.

The graph is connected, as otherwise each smaller component obeys the weighted bound and their squared masses sum to at most the square of the total. No vertex is a leaf: removing a leaf, then putting it opposite its only neighbor, preserves the minimum cost while decreasing total mass. Hence every edge lies in a two-edge path, and therefore in a pentagon. Together with the nonedge argument this proves the pair-covering assertion.

Ordinary neighborhood domination is a special case of this compression. The union step is stronger because it does not require either row to contain the other. The argument requires choosing a least-order counterexample in the **product-weighted** formulation (equivalent to the unweighted assertion by blow-ups); it does not apply to an arbitrary graph with a large cut deficit and gives no uniform lower bound on the masses of the pentagons it constructs.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
