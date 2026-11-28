# Fixed-interface compression for common-support Hamilton packings

The [spectral path-cover lemma](SPECTRAL-PORT-ROUTING.md) works inside given blocks. It leads to an exact criterion with fixed external edges, even when those edges share vertices.

## Statement

Let a simple bipartite graph be partitioned into at least two balanced nonempty vertex blocks. Inside each block $`B`$ is a spanning $`d_B`$-regular bipartite graph $`J_B`$ with second biadjacency singular value $`\lambda_B`$. Write $`S_1,\ldots,S_a`$ for pairwise edge-disjoint prescribed sets of external edges. An edge is external if its endpoints belong to different blocks.

Use these capacity assumptions for every block and family:

- At most $`u_B`$ vertices on either shore of $`B`$ have external degree two in $`S_j`$.
- At most $`2T_B`$ vertices in $`B`$ have external degree one in $`S_j`$, where $`T_B\ge1`$.
- The sufficient bounds from the spectral path-cover lemma hold at $`d=d_B`$, $`\lambda=\lambda_B`$, $`u=u_B`$, $`t=T_B`$ and $`f=2(a-1)`$.

There are $`a`$ pairwise edge-disjoint Hamilton cycles whose respective external edge sets are exactly $`S_1,\ldots,S_a`$ if and only if each family $`S=S_j`$ satisfies all three tests:

1. The graph of external edges $`S`$ has maximum degree at most two and contains no cycle.
2. In every block, the sum of external degrees on the left shore equals that on the right shore.
3. Compress each nontrivial path component of $`S`$ to one undirected edge between the blocks of its endpoints. The resulting multigraph on **all** the blocks is connected. Retain loops and multiplicities.

The first two tests are on the actual external edges. The third is on the graph *after* suppressing all forced passages through vertices of external degree two. It is not enough to contract the blocks directly.

## Proof

**Necessity.** A Hamilton cycle uses at most two external edges at any vertex. An external cycle would already use both edges at all of its vertices, so it would have to be the entire Hamilton cycle. But then every vertex would have external degree two. The capacity bounds rule this out: each shore has at least $`d_B>u_B`$ vertices.

The equality of external degree sums follows by subtracting the two full degree sums on each balanced block. Every internal cycle edge contributes equally on the two shores. The Hamilton cycle traverses every external path without interruption, because internal vertices of such a path already use both of their edges. Compress each such traversal to one edge and each intervening internal segment to its block. The resulting closed walk uses every compressed edge. Each block has to appear: a Hamilton cycle that spans several blocks cannot cover an entire block without visiting any of its vertices with exactly one external edge. Indeed, if there were no such vertex, all vertices not saturated by external edges would have both cycle edges inside the block. There are such vertices by the capacity bound, so they would force a separate cycle. This proves connectedness on the full block set.

**Sufficiency.** Write $`p_L,p_R`$ for the counts of external-degree-one vertices in a block. Write $`s_L,s_R`$ for the counts of external-degree-two vertices. The degree-sum equality gives
```math
p_L-p_R=2(s_R-s_L).
```
The compressed degree of the block is $`p_L+p_R`$, where a loop counts twice. This is even, and connectedness ensures it is positive. Take an Euler tour of the compressed graph, with a direction of traversal for each edge. Orient the corresponding external path in the same direction. Consecutive edges of the Euler tour pair the endpoint of the arriving path with the endpoint of the departing path in that block. These endpoints are distinct vertices. Every terminal is used once, including both terminals of a loop.

Remove the $`s_L+s_R`$ saturated vertices from this block for the current family only. The remaining shore imbalance is $`s_R-s_L`$. The number of left-left pairs minus the number of right-right pairs is $`(p_L-p_R)/2`$, regardless of the Euler tour. Thus the spectral path-cover lemma applies to precisely these prescribed pairs on the remaining support. The removed vertices are already covered by the interiors of external paths. Concatenation in Euler order produces a single 2-regular connected spanning subgraph, hence a Hamilton cycle.

Process the families in order. The internal edges used by earlier cycles have maximum degree at most $`2(a-1)`$ in each block. Forbid them in the current routing lemma. The external families were already edge-disjoint. This gives the packing.

## A failing direct contraction

Take three blocks in cyclic order. In every block choose two distinct left vertices and two distinct right vertices as terminals. Connect the two left terminals by a length-two external path through a fresh right vertex in the next block. Connect the two right terminals through a fresh left vertex in that next block. Use distinct vertices for these middle positions and all terminals.

Every block has two degree-one vertices and one degree-two vertex per shore. Directly contracting blocks yields a connected quotient, even if each actual edge is oriented left to right. But after suppression, every path is a loop at its endpoint block. The compressed quotient is disconnected. No Hamilton cycle uses exactly these external edges, even if each block is a complete bipartite graph with arbitrarily large equal shores.

## Relevance and limit

The criterion reduces a global spanning problem to edge selection at a bounded interface. After selecting the external families, their internal routing needs no search for a compatible port assignment. The [older quotient construction](BALANCED-QUOTIENT-PACKING.md) could choose its ports when it built the host. The [fixed-port routing lemma](SPECTRAL-PORT-ROUTING.md) treated the special case of external degree at most one.

This is not a density-to-block decomposition theorem. In particular it does not prove that an arbitrary graph of average degree $`\Omega(\log\log n)`$ has such blocks and usable external families. See [Erdős #585](https://www.erdosproblems.com/585) and the [current extremal upper bound](https://doi.org/10.1016/j.aim.2025.110228).
