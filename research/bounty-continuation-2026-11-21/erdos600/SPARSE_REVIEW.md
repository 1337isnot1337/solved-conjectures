# Independent review of the Erdős 600 sparse-insertion reduction

21 November 2026. Reviewed source: `agents/demath_zzz/erdos600-sparse-insertion-gap.md`, SHA256 `b783c4d77345acfc951dbf5ad16ed453d461a1d0ca83a6859091092391839622`.

The mathematical deductions pass this review. They are necessary restrictions on a hypothetical bounded-gap sequence, not a proof of the required lower limit. No new completed target follows.

## Simultaneous insertion

The cut retains at least half the useful nonedges and excludes a triangle with three inserted edges. For one candidate pair, at most $`2r`$ old edges are activated. Each old edge belongs to at most $`2\Delta`$ activation sets. The additional two-insertion triangle conflicts contribute at most $`2\Delta`$. Thus the stated conflict-degree upper bound is valid; overcounting conflicts only weakens it.

In an independent candidate family, every new edge keeps its original positive codegree. Every old edge gains at most one triangle. These two facts check both ends of the booksize restriction. The greedy independent-set lower bound and its use for an extremizer follow without requiring the new edges to form a matching.

## Degree restriction and connectedness

The deletion operation must remove the edges orphaned by deleting the minimum-degree vertex. Their number is at most $`(r-1)\delta/2`$, because the induced neighborhood has maximum degree at most $`r-1`$. Those orphaned edges have no triangle after the vertex deletion, so their removal creates no further losses. A distinct maximum-degree vertex loses at most $`r`$ incident edges. Cloning it in the remaining admissible graph proves the displayed gain inequality, with the correct orphan-edge cost.

For bounded gap $`g_r(n)\le K`$, this inequality gives the asserted maximum-degree bound. Combining it with the insertion bound gives $`|B_r(G)|=o(n)`$. The dependence on the bounded-gap and extremizer hypotheses is essential and is retained in the source.

If the graph is disconnected, connecting a vertex in one component to the whole neighborhood of a maximum-degree vertex in another component creates exactly the asserted new triangles. An old edge gains a triangle only when both endpoints lie in that neighborhood. Existing edges incident to the chosen vertex in the other component gain none. The construction adds $`\Delta(G)`$ edges and respects the relaxed cap. Since the extremal average degree tends to infinity, disconnected extremizers cannot persist along a bounded-gap sequence.

## Density and the remaining gap

The near-quadratic lower bound follows by substituting a progression-free set of size $`m^{1-o(1)}`$ into the already documented tripartite construction. [Elkin's primary paper](https://arxiv.org/abs/0801.4310) states a stronger explicit bound of this form. This input supplies a lower bound, not structural information about every extremizer.

For $`KG(3k,k)`$, disjoint vertices have exactly one common neighbor, while vertices meeting in $`j\ge1`$ elements have $`\binom{k+j}{k}`$ common neighbors. The degree, vertex count, and Stirling exponent in the source follow directly. The fixed independent blow-up preserves the claimed obstruction for every fixed relaxed cap. These examples explicitly refute a proposed $`O(n^{3/2})`$ density shortcut.

The common-neighbor moment identity gives no lower bound on the mass in the small positive-codegree range. Restricting to an induced subgraph can create new useful nonedges, so deleting the exceptional pairs' endpoints cannot justify a claim that the remaining graph has none. The source correctly leaves the extremal-density theorem unproved. No limit assertion, formal verification, priority claim, or award decision is certified by this review.
