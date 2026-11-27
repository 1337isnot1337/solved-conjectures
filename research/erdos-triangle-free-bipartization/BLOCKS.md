# Reduction to one 2-connected block

This is an exact structural reduction for [Erdős #23](https://www.erdosproblems.com/23), not a solution. Work with a triangle-free graph weighted by positive vertex weights, with edge weights the products of their endpoint weights. Let β(G) be the least monochromatic weight of a cut and let m(G) be total vertex weight.

**Claim.** If each block H of G satisfies β(H)≤m(H)²/25, then G satisfies β(G)≤m(G)²/25. If G is connected, at least two blocks have positive β, and all block bounds hold, its bound is strict. In particular a counterexample to the unweighted conjecture must already occur in a 2-connected block. The same claim holds with 1/25 replaced by any common constant at least 1/32, without the displayed strictness at the endpoint.

## Rooted estimate

Fix a vertex r of a triangle-free weighted graph H. Cut every edge incident to r by putting all its neighbors on the opposite side; these neighbors are independent. Assign every remaining vertex an independent fair colour. Every edge of H−r has monochromatic probability 1/2, as it has at least one randomly assigned endpoint. The expected monochromatic weight is at most e_w(H−r)/2≤(m(H)−p_r)²/8 by weighted Mantel. Weighted Mantel follows by rational integral blow-ups and continuity from the usual theorem. Thus

    m(H) − p_r ≥ √(8β(H)).

## Assemble the blocks

Assume first G is connected and there is a block H₀ with β(H₀)>0, choosing one that maximizes β over all blocks. Root the block-cut tree there. Optimal cuts can be combined by reversing the colours of a newly attached block when necessary at its parent articulation vertex; this preserves its monochromatic weight. Conversely any whole cut costs at least the sum of block optima. Consequently β(G)=∑_H β(H).

The vertices of the root block are charged in full. Every subsequent block has one parent articulation vertex, and its remaining vertices are charged exactly once. Apply the conjectured bound to the root, the rooted estimate to each other block, and put b_H=√β(H), obtaining

    m(G) ≥ 5 b₀ + √8 ∑_{H≠H₀} b_H.

Squaring and keeping only the root square and mixed terms gives at least 25∑_H b_H², since 10√8>25 and b₀≥b_H. This also proves strictness if another b_H is nonzero. If every block has zero bipartization cost, so does G. For disconnected G, use β additive and ∑ m(component)²≤m(G)². Replacing 5 by C^(−1/2) yields the stated threshold C≥1/32.

The proof is not the elementary connected-component reduction: articulation vertices are counted once, and the rooted estimate is what permits that stronger gluing. No corresponding assertion for arbitrary two-vertex separators is proved here.

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
