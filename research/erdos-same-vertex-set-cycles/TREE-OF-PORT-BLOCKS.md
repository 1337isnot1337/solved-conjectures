# Spanning port routing across a tree of blocks

A graph need not be a global bipartite expander to route spanning paths with prescribed endpoints. This note gives a sufficient certificate for blocks connected only along a tree. It uses [fixed-host port routing](TWO-LAYER-PORT-ROUTING.md) inside the blocks.

## Statement

Partition a bipartite host into balanced blocks indexed by a finite tree $`Q`$. For each tree edge, the host provides external edges joining its two blocks. The external edges used as candidates form a matching over the whole host. Extra host edges need not satisfy these conditions; they will not be used.

Prescribe $`a`$ families of pairs, with $`1\le t_j\le T`$ pairs in family $`j`$. Within a family all endpoints are distinct. The union of its endpoints has $`t_j`$ vertices on each shore of the full graph. Different families may share endpoints. Each tree edge must provide at least $`a(3T+1)`$ candidate edges of each of the two orientations, where orientation only records which block contains the left endpoint.

For a block $`B`$ of tree degree $`q_B`$, assume its internal graph permits every balanced prescribed path cover of at most
```math
K_B=T+\left\lfloor (T+2)q_B/2\right\rfloor
```
pairs, even after deleting any internal edge set of maximum degree at most $`2(a-1)`$. For instance, [two-layer routing](TWO-LAYER-PORT-ROUTING.md#theorem) implies this if a spanning spectral subgraph of the block meets its bounds at $`u=0,t=K_B,f=2(a-1)`$.

Then the host has $`a`$ pairwise edge-disjoint spanning path covers with the prescribed pairs.

## Constructing the routes

Fix one family, with $`t=t_j`$. Root the block tree at the block of one endpoint of a designated pair. Let each pair follow the unique tree path between its two endpoint blocks. For one pair the path may have length zero. Prepend a depth-first closed walk of the full tree to the designated pair's route. This makes that route visit every block. In what follows it can take extra back-and-forth steps. A walk here is a list of blocks to visit, not a walk on actual host vertices.

For an edge $`e`$ of the tree let $`U_e`$ be its child subtree. Let $`c_e`$ count pairs separated by the cut, and $`\delta_e`$ count left endpoints minus right endpoints in $`U_e`$. The preliminary routes cross $`e`$ exactly $`c_e+2`$ times: once per separated pair and twice on the depth-first walk. Moreover $`c_e\equiv\delta_e\bmod 2`$. Both quantities have the parity of the number of terminals in $`U_e`$.

If $`c_e+2<|\delta_e|`$, add back-and-forth steps on $`e`$ to the designated route until there are exactly $`|\delta_e|`$ crossings. This is possible because the designated route has already visited both ends of every tree edge. The final number $`s_e=\max(c_e+2,|\delta_e|)`$ of crossings satisfies $`s_e\le t+2`$. Since $`|\delta_e|\le t`$, its division into
```math
\frac{s_e-\delta_e}{2}\text{ ports on the left of the child block},\qquad
\frac{s_e+\delta_e}{2}\text{ ports on its right}
```
uses at most $`t+1`$ crossings of either orientation. The orientation here is physical shore, not the direction a route takes through the edge. These choices make the terminal imbalance plus the crossing-port imbalance zero across $`U_e`$. Internal tree edges of $`U_e`$ always contribute opposite signs at their two ends, so they cancel.

Discard all candidate edges incident with any prescribed endpoint of any family, at most $`2aT`$ edges in total because the candidates form a matching. For each tree edge and orientation, at least $`a(T+1)`$ candidates remain. Select a distinct candidate for each crossing occurrence in all families. Their endpoints are distinct everywhere. Thus every route visit has two distinct ports, or has one port and its prescribed terminal. A route of zero length uses its two distinct terminal vertices in one block.

Within a block, pair terminals and crossing ports according to consecutive route segments. The numbers of left and right ports, including the prescribed terminals there, are equal. To see this, sum the port imbalance over each child subtree. It is zero by the crossing counts. Subtracting those equalities from the parent-subtree equality, or from the global equality at the root, gives zero on a single block.

Every block has at least one pair: a tree with more than one vertex has at least two crossings on every edge, and a one-block tree contains the prescribed endpoints. The number of pairs in $`B`$ is at most $`\lfloor(2t+(t+2)q_B)/2\rfloor\le K_B`$. Apply the internal certificate to each block. Earlier families' internal paths have maximum combined degree at most $`2(a-1)`$, so their edges can be forbidden. Join the local paths in the order of their routes, using each selected external edge once. Every local path and every selected external edge belongs to one intended global path. Local paths in a family partition each block. Hence no global route repeats a vertex, even if its walk repeats a block. The full paths partition the host, and the covers are edge-disjoint between families.

## Consequence and limit

Bounded-degree trees give a fixed port-capacity overhead, independent of the number of blocks. The host can have cuts of bounded size separating arbitrarily large blocks. For two Hamilton cycles with no prescribed pairs, [the fixed-interface theorem](FIXED-INTERFACE-COMPRESSION.md) needs only two distinct candidate edges per orientation per tree edge in a global matching. One bidirected copy of the tree serves each cycle.

This certificate does not extract the blocks or the matching interfaces from arbitrary density. It gives a class of non-global expanders in which prescribed spanning routing survives arbitrarily many sparse cuts. It is a partial structural result for [Erdős #585](https://www.erdosproblems.com/585).
