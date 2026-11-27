# Robust parts in the ordinal pentagon problem

This is a finite-pattern lemma for the uncountable blocks, not a
resolution of the original ordinal conjecture.

Let $`\kappa`$ be an infinite regular cardinal. Disjoint sets $`A`$ and
$`B`$ of size $`\kappa`$ are **robustly linked** if every pair of
$`\kappa`$-sized subsets of $`A`$ and $`B`$ has an edge between them.

## Exact finite-pattern criterion

Let $`F`$ be a finite simple graph and let $`H`$ be a simple graph. There exists an $`F`$-free graph
with disjoint vertex sets $`A_i`$ of size $`\kappa`$ indexed by the vertices
of $`H`$, with $`A_i,A_j`$ robustly linked for every edge $`ij`$ of $`H`$, if and
only if $`H`$ has an orientation with the following property: for every
graph homomorphism $`h:F\to H`$, the orientation pulled back along $`h`$
contains a directed cycle. Here graph copies are not required to be
induced, and a homomorphism is allowed to identify nonadjacent
vertices.

### Extracting orientations

For a robust pair $`A,B`$, call $`A\to B`$ persistent if for every
$`B'\subseteq B`$ of size $`\kappa`$, fewer than $`\kappa`$ vertices of $`A`$
have fewer than $`\kappa`$ neighbors in $`B'`$. Persistence survives
shrinking either part to size $`\kappa`$.

If $`A\to B`$ is not persistent, refine the pair to $`A',B'`$ of size
$`\kappa`$ such that each vertex in $`A'`$ has fewer than $`\kappa`$
neighbors in $`B'`$. Then $`B'\to A'`$ is persistent. Otherwise there
would be further $`A'',B''`$ of size $`\kappa`$ where each vertex has
fewer than $`\kappa`$ neighbors across. Alternate selections from
$`A''`$ and $`B''`$ for $`\kappa`$ stages, avoiding the neighborhoods
of all previously selected opposing vertices. Regularity of $`\kappa`$
ensures every selection is possible. The two selected sets are an
anticomplete rectangle, a contradiction.

For a finite subgraph of $`H`$, process its edges in turn,
shrinking the two parts of each edge if needed. Persistence
survives refinement, so all oriented edges of that finite
subgraph are persistent on the resulting parts.

If a homomorphism $`h:F\to H`$ pulls back this orientation to an
acyclic one, select the vertices of $`F`$ in topological order. Keep a
separate size-$`\kappa`$ reserve for each unselected vertex, in the
part given by $`h`$. When selecting a vertex, exclude previously used
vertices and the fewer than $`\kappa`$ exceptional candidates for each
of its outgoing neighbors' current reserves. Choose any remaining
candidate and intersect each outgoing reserve with its neighborhood.
All these reserves stay of size $`\kappa`$. Incoming edges were handled
when their sources were selected. The argument works when several
vertices use the same part: the reserves need not be disjoint, and
the selections are distinct. The result is a copy of $`F`$.

For infinite $`H`$, the orientation property follows by
propositional compactness. For each map from the finite vertex
set of $`F`$ that preserves edges, the condition involves only
finitely many edge-direction variables. Any finite collection
of these conditions is satisfied by the orientation of the
finite subgraph containing their images, just established.
Only the orientations, not the refined sets, are combined by
compactness.

### Realizing an orientation

Conversely, use a copy of $`\kappa`$ for each part. For every arrow
$`i\to j`$ of $`H`$, join the vertex of label $`a`$ in part $`i`$ to the
vertex of label $`b`$ in part $`j`$ exactly when $`a<b`$. Put in no other
edges. Every required pair is robust because its size-$`\kappa`$
subsets have unbounded labels. A copy of $`F`$ would project to a
homomorphism into $`H`$ with all arrows increasing the labels, which
is impossible around any directed cycle.

## Consequence for the pentagon

The part graphs that admit such a $`C_5`$-free realization are
exactly the triangle-free graphs that can be oriented so that
every five-cycle is directed cyclically.

To see why triangles are impossible, consider a triangle with
vertices $`a,b,c`$ and the closed walk $`a,b,c,a,b,a`$ representing
a homomorphism from $`C_5`$. If the triangle is transitively oriented,
this pullback is acyclic, as is every orientation pulled back from
a transitive triangle. If it is cyclically oriented, reverse or
rename the labels so the arrows are $`a\to b\to c\to a`$.
The first four steps of the walk then follow arrows and the last
goes against one, so the pullback on the five distinct cycle
vertices is acyclic as well. Both cases force a copy of $`C_5`$.

In a triangle-free simple graph, a closed walk of length five is a
simple cycle: a repeated vertex would split it into two shorter
closed walks, one of odd length, which must be a triangle.
Accordingly, in this case the only pullbacks to test are the
five-cycles themselves, and a directed cycle in the pullback
requires all five edges oriented cyclically. In particular, among
any three disjoint uncountable sets in a $`C_5`$-free graph, some
pair contains uncountable anticomplete subsets (first restrict the
three sets to size $`\aleph_1`$).

This does not assert that the pair can retain its original ordinal
types, and it does not allow countably many successive refinements.
Those are the obstacles to using the lemma on all the columns in
the original conjecture. The result is a constraint on any proposed
robust block construction, not a conclusion about the full
ordinal.
