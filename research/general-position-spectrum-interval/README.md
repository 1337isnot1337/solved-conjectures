# The general position spectrum interval conjecture

**Partial result for Conjecture 4.30:** the complete orientation spectrum is an interval for every forest. More generally, the spectrum restricted to acyclic orientations is an interval for every distance-hereditary graph, and its upper endpoint agrees with the unrestricted upper endpoint. The lower endpoint can differ for cyclic graphs. We also give an exact formula and linear-time recurrence for the general position number of any oriented tree, as requested in the tree clause of Problem 5.2 of the [same paper](https://arxiv.org/html/2604.15909v1). The full interval conjecture for arbitrary graphs is not claimed.

## Source forcing

For an acyclic orientation, every directed shortest path is an induced path of the underlying graph: any chord would be oriented forward along the path (a backward chord forms a directed cycle) and would shorten it. In a distance-hereditary graph every induced path is an undirected geodesic, so every directed shortest path in every acyclic orientation is also an undirected geodesic.

Given an acyclic orientation $D$, make any one vertex $v$ a source by orienting all edges incident to it away from it. The result $D'$ remains acyclic. Among vertices different from $v$, any directed geodesic of $D'$ uses no $v$. Its arcs already existed in $D$, and because its length equals the undirected distance, it was a directed geodesic also in $D$. Thus any general-position set in $D$, with $v$ removed if present, is still in general position in $D'$. In particular,
```math
\operatorname{gp}(D')\ \ge\ \operatorname{gp}(D)-1.
```

One can transform any acyclic orientation into any other acyclic orientation $E$ by successively forcing vertices to be sources in **reverse** topological order of $E$. For any edge $u\to w$ of $E$, its desired tail $u$ is forced last among its endpoints, so it ends up pointing the right way. Start with an acyclic orientation of maximum general position number and end with one of minimum number. The sequence can increase by more than one, but decreases by at most one; it must therefore visit every intermediate integer.

The upper endpoint is also the unrestricted maximum. Indeed, Theorem 4.4 of the source characterizes that maximum as the order of a largest induced comparability graph $H$. Orient $H$ transitively, orient its complement acyclically, and direct all edges between the two parts out of $H$. The resulting acyclic orientation keeps $H$ in general position because every directed path with both endpoints in $H$ stays in $H$ and all its geodesics have length at most one. This upper-endpoint argument works for every graph, not just the distance-hereditary case.

Every orientation of a forest is acyclic and every forest is distance-hereditary, so this proves the full conjecture for forests, not just for spiders and caterpillars. The restriction is real in general: a directed four-cycle has general position number two, while no acyclic orientation of the four-cycle does. A non-directed-cycle orientation with general position number two would have exactly two extreme vertices, giving a spanning directed geodesic by the two-extreme lemma in [#874](https://github.com/1337isnot1337/solved-conjectures/issues/874); orienting the remaining chord backward creates the very cycle, and orienting it forward shortens the path.

## Exact formula for an oriented tree

In an oriented tree, every directed path is a geodesic. Order vertices by directed reachability. A set is in general position precisely when its induced reachability poset has no three-element chain (equivalently, it is a union of two antichains). The [Greene–Kleitman chain-partition theorem](https://doi.org/10.1016/0097-3165(76)90077-7) therefore gives
```math
\operatorname{gp}(D)
=\min_{\mathcal C}\sum_{C\in\mathcal C}\min(2,|C|),
```
where the minimum ranges over all partitions of the reachability poset into chains. Chains need not be disjoint as underlying paths; the partition is of their assigned vertices. This is an application of the cited poset theorem, not a new priority claim for that theorem.

The following recurrence evaluates the number directly in linear time without constructing the reachability relation. For a rooted oriented subtree with root $v$, keep the maximum size of a valid set for each state $(s,i,o)$: $s$ indicates whether $v$ is chosen, and $i,o$ are the largest numbers of chosen vertices on directed paths ending and starting at $v$, respectively. Length-zero paths are included. The nine possible states have $s\in\{0,1\}$, $i,o\in\{s,\ldots,2\}$ and $i+o-s\le2$. Impossible states have value minus infinity.

Start at a root alone with values 0 and 1 for $(0,0,0),(1,1,1)$. Attach child subtrees one at a time. For edge $u\to v$, combine an old parent state $(s,i,o)$ with any child state $(s',i',o')$ by replacing $i$ by $\max(i,s+i')$ and keeping $o$. For edge $v\to u$, keep $i$ and replace $o$ by $\max(o,s+o')$. Add the two state values, discarding the result if $i+o-s>2$, and maximize among all contributors to each new state. The outgoing and incoming extremal paths can concatenate because they are in different branches, unless one is the length-zero path. Any new cross-branch path must pass through $v$ and is therefore covered by this check. Every valid set decomposes into such child and parent states, so the recurrence is exact. The largest value at the full root is the answer, with a constant number of operations per edge.

For the entire tree spectrum, store the set of all nine-entry tables attainable by each partial rooted subtree, rather than minimizing individual entries. Combine each pair of tables with either orientation of the joining edge, and deduplicate. The set of maxima of the final tables is exactly the entire spectrum because the merge is deterministic once the two tables and the edge direction are fixed. There are at most $(n+2)^9$ tables per node or partial subtree and only $n-1$ merge steps, so this is a polynomial-time exact endpoint and spectrum algorithm. No efficiency claim is made for this straightforward polynomial bound on arbitrary large trees.

## Remaining obstacle

In a general graph, making a vertex a source can remove directed shortcuts through it. A longer path avoiding it can become newly shortest, creating a collinear triple not present before. Also, source forcing only reaches acyclic orientations from an acyclic start. Neither issue is bypassed by the proof above.

One more general safe case: if the forced vertex belongs to some maximum general-position set in the old orientation, removing it from that set preserves the rest even on arbitrary graphs. Any old geodesic through that vertex between two other selected vertices would already violate general position. Therefore selected-pair distances remain unchanged after forcing, and any new geodesic on the remaining selected vertices already qualified before. Finding a route to a minimum orientation with enough such safe moves is open.
