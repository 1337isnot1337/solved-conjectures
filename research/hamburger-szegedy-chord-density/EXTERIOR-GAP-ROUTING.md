# Exterior routes for the rotation patch

This applies the [interlacement test](SHORTCUT-INTERLACEMENT.md) to the particular protected set produced by [rotation capture](README.md#a-local-alternative-for-every-bipartite-host). It also identifies why direct chord shortcuts cannot move its long gaps.

## The shore obstruction

In a bipartite host let $`A`$ be the captured endpoint set, put $`B=N_G(A)`$, and mark $`U=A\cup B`$ on the cycle. Both cycle neighbors of every vertex of $`A`$ belong to $`B`$. Therefore every gap of length at least two has both its ports in $`B`$, and has even length. The direct-chord shortcut test cannot replace any of them: there are no edges from $`B`$ to $`B`$. To use this protected set, allow new routes through vertices outside the old cycle.

For any cycle through $`U`$, decompose the cycle into its consecutive-mark paths in the *new* cyclic order. Give a path of length $`l`$ the toll $`\max(l-2,0)`$. The protected chord condition remains that the sum of these tolls is at most $`e(G[U])-2|U|`$. The proof is the same counting identity: each long path adds $`l-1`$ new vertices but removes one of the $`|U|`$ cycle edges that would otherwise be inside $`U`$.

## Optimal single-gap replacements by outside midpoints

For every long gap $`i`$ with endpoints $`b_i,b_i'`$ in $`B`$, list as its candidates all vertices outside the old cycle adjacent to both. Form a bipartite incidence graph between gaps and these candidate midpoints. A matching assigns distinct exterior length-two replacements to its selected gaps. Applying all replacements retains a single cycle, since the cyclic order of the protected marks does not change. The replacement tolls are zero. Maximum-weight matching, where gap $`i`$ has weight $`l_i-2`$, gives the largest saving achievable by these single-gap replacements. Weight is assigned to every edge incident with its gap.

There is a useful certificate when this saving is too small. For each integer $`j\ge1`$, let $`I_j`$ be the set of gaps of toll at least $`j`$. Let $`D_j=\max_{F\subseteq I_j}(|F|-|N(F)|)`$, using neighborhoods in the incidence graph. The minimum remaining toll after these replacements is exactly
```math
\sum_{j\ge1} D_j .
```
Indeed, the feasible gap sets are the independent sets of a transversal matroid. Its rank on $`I_j`$ is $`|I_j|-D_j`$ by Hall's theorem. A greedy maximum-weight basis has this many selected gaps in every weight prefix, since it is maximal independent in each prefix as it finishes that prefix. Summing over the integer weight levels yields the identity. The formula avoids the false inference that many available midpoints suffice if the same midpoint is shared by too many gaps.

For a $`C_4`$-free graph, an opposite-shore common neighbor of a pair of distinct $`B`$ ports is unique whenever it exists. If the two ports already share a neighbor in $`A`$, there is no exterior midpoint. A length-two gap already has toll zero and needs no replacement.

## Paired replacements can change the protected order

One can also replace two gaps by two paths, joining the four ports in either of the two nontrivial pairings of the [interlacement note](SHORTCUT-INTERLACEMENT.md). Require every new path to have all its internal vertices outside the original cycle. Require the two paths to be internally disjoint for each permitted type of a shortcut. Across distinct shortcuts require disjoint ports and disjoint internal-vertex sets, including all their offered paths. These hypotheses suffice to keep the new graph 2-regular and to make its components depend only on the interlacement matrix, not on path lengths.

In particular, if every permitted route has length two, each paired shortcut saves exactly the sum of its two removed gap tolls, regardless of its chosen type. The deterministic optimization in the earlier note applies without change. A high-girth host does not invalidate the resulting switch test. Rather, it constrains which length-two routes can be supplied. For example, whenever one paired replacement is available, the two old gaps and the two new paths form a simple cycle of total length $`l_i+l_j+4`$. Thus their saved toll is at least $`g-8`$ at girth $`g`$.

For arbitrary route lengths, subtract the sum of the two replacement tolls from the sum of the two old tolls. The same optimal extraction works when this net saving is nonnegative and independent of type. If the savings differ between types, a lower bound can be obtained by weighting the shortcut by its smaller nonnegative saving, when both savings are nonnegative. This does not assert exact optimization with varying type-specific weights.

The remaining gap in #642 is to force enough such routes, or use another way to discard expensive vertices. Rotation capture does not give exterior midpoints. No upper bound on the unrestricted extremal function is claimed.
