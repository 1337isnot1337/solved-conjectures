# de Berg–Sadhukhan–Spieksma’s stable domination threshold

In the insertion-only vertex-arrival model, Dominating Set
admits a stable approximation scheme on graphs of maximum
degree at most two. On subcubic graphs, some fixed
approximation ratio strictly greater than one already
requires linear worst-case recourse. This gives the
dichotomy for every fixed maximum degree and answers
the second domination question in the
[authors’ concluding remarks](https://arxiv.org/html/2412.13358v1#S5).
Their separate question about a one-change linear
approximation in arrival degree is [#995](https://github.com/1337isnot1337/solved-conjectures/issues/995).

Here a stable approximation scheme, for every fixed
positive error tolerance, maintains a dominating set
within that relative error of the optimum at each
prefix, and changes only a bounded number of
memberships per arrival, independently of graph size.
New edges are revealed only between the arriving
vertex and earlier vertices.

## A path gadget for every fixed maximum degree

Fix a maximum degree bound $`\Delta\ge4`$, and put
$`k=\Delta-2`$. Replace each arriving vertex by a path on
$`3k-2`$ vertices. With positions numbered from
zero, designate the positions $`0,3,6,\ldots,3(k-1)`$ as
ports. Each endpoint port can accommodate two external
edges; each other port can accommodate one. Thus there
are exactly $`k+2=\Delta`$ slots. Connect each old edge
by an edge between the assigned ports of its endpoints.

For a single four-vertex path the offline operation is the
[known vertex stretching](SOURCES.md#earlier-gadget-and-what-is-new).
The key for recourse is that the replacement works online. For each original
vertex take a fixed order of the available slots.
Whenever an edge is revealed, give it the first unused
slot at each endpoint. On an original arrival, append
the path vertices in path order; reveal each newly
incident edge when its new endpoint is appended.
Previously present edges are not reassigned. The
resulting stream has maximum degree at most three at
every intermediate step, and each original arrival
has exactly $`3k-2`$ translated steps.

Let $`\gamma`$ denote the minimum dominating set size.
For every completed prefix with $`n`$ original
vertices, the new graph $`G'`$ satisfies

```math
\gamma(G')=\gamma(G)+(k-1)n.
```

**Projection.** Given any dominating set of the translated
graph, mark an original vertex if its path contains at least
$`k`$ selections. Every path needs at least $`k-1`$:
its $`2(k-1)`$ nonports do not have external
neighbors, and each selection covers at most two nonports.
If a path has exactly $`k-1`$ selections, all of them
must cover exactly two nonports; their covered pairs
must be disjoint. The first endpoint port covers only one
nonport, so it cannot be selected. The first nonport
must therefore be covered by a selection from its own
consecutive pair of nonports, which covers both. The
next port would repeat that coverage, so it too cannot be
selected. Induction over the consecutive nonport pairs
shows that there is one selected nonport per pair and
no selected port at all. This also excludes the final
endpoint port, which covers only one nonport.

With just $`k-1`$ selections, the path cannot be
dominated internally: each selected vertex covers at
most three path vertices and $`3(k-1)<3k-2`$. Hence some
port of this path has an external selected neighbor.
That outside neighbor is a port of another path,
which must contain at least $`k`$ selections by
the previous paragraph. The marked set thus dominates
the original graph. Its size is at most the size of the
translated set minus $`(k-1)n`$.

**Lift.** Given an original dominating set, select all
$`k`$ ports on each path of a selected vertex.
They dominate that entire path and all its external
neighbors. On any other path, a port is already
dominated from outside. Delete this one port temporarily.
The two path pieces on either side have lengths
divisible by three, including possibly zero. Split each
into consecutive triples and select each middle vertex.
This uses exactly $`k-1`$ selections and dominates
every remaining path vertex. Adding up gives the reverse
inequality in the displayed formula.

## The stability lower bound transfers

Projection is local: toggling one translated selection
can change the marked status of at most one original
vertex. Thus the symmetric difference between consecutive
projected solutions is no larger than the sum of the
translated recourse in the corresponding $`3k-2`$
steps. This includes newly arrived original vertices:
marking one requires a translated addition.

If a translated solution is within factor $`1+\eta`$
of optimum, the projected solution has size at most

```math
(1+\eta)\gamma(G)+\eta(k-1)n
\le [1+(1+(k-1)(\Delta+1))\eta]\gamma(G).
```

The last inequality uses $`n\le(\Delta+1)\gamma(G)`$, since one
vertex dominates at most $`\Delta+1`$ vertices. All the
bounds apply independently to every completed prefix.

Now take $`\Delta=4\text{ and }k=2`$. The published
[Theorem 3.5](https://arxiv.org/html/2412.13358v1#S3.Thmtheorem5)
gives a positive relative error tolerance for which
linear worst-case recourse is necessary on graphs of
maximum degree four. Its hard stream comes with a
size-based recourse barrier, so the same conclusion
holds after replacing vertices by four-vertex paths,
scaling the tolerance by one sixth and the recourse and
input size by constant factors. In particular a subcubic
scheme, or even a sublinear-recourse algorithm at that
fixed smaller tolerance, would contradict the theorem.

**Bipartite hard instances.** The original hard graphs
are bipartite. For each such hard stream fix a proper
four-edge-coloring of its final graph, which exists by
Kőnig’s line-coloring theorem. At each vertex assign
colors 1 and 2 to the first path endpoint and colors 3
and 4 to the last endpoint. An old edge then always
joins equal-index ports. Color the paths in opposite
orientations on the two sides of the original graph.
This makes every translated edge bipartite. The
assignment specifies the construction of a particular
hard stream, not advance information for its algorithm.
The original Theorem 3.5 lower bound on its prescribed
stream uses only domination, approximation and bounded
changes and still holds for projected solutions. Thus
the lower bound also holds on bipartite subcubic streams.

## A stable approximation scheme at maximum degree two

Fix a positive integer L. Each component is a path, an
isolated vertex, or a cycle. Partition it into consecutive
blocks; each block has between L and 2L vertices, except
that a component of size less than L is one small block.
Maintain an exact minimum dominating set on the subgraph
of each block, ignoring edges between blocks, and output
their union.

An arriving vertex can extend one path endpoint, join
two path endpoints, close a path to a cycle, or be
isolated. An old neighbor with a spare degree slot
cannot be an interior vertex of an old path or any vertex
of an old cycle. Remove from the partition just the one
or two blocks at the touched endpoints, and combine
their vertices with the new vertex. When this region is
nontrivial, it is a path or an entire new cycle. If it has
fewer than L vertices, the touched blocks must be whole
small components and the region is a whole small
component. Otherwise split it into consecutive blocks of
sizes between L and 2L: the smallest possible number of
blocks can absorb the remainder since the upper limit
is twice the lower limit. For a whole cycle use any
starting point. This restores the invariant and touches
at most $`4L+1`$ vertices, so recomputing only their
solutions changes at most $`4L+1`$ memberships.

There are at most $`n/L`$ edges between blocks.
Indeed any component with a cut has only large blocks,
and each cut is one of at most as many cuts as blocks
in that component. For an optimal original dominating
set, ignoring a cut can leave at most one of its
endpoints newly undominated: a deleted edge has this
effect only when exactly one endpoint was selected.
Adding the potentially affected endpoint of each cut
yields a dominating set of the disjoint blocks.
Consequently their exact combined optimum is at most
$`\gamma(G)+n/L\le(1+3/L)\gamma(G)`$, as $`\gamma(G)\ge n/3`$. Choose $`L\ge\max(1,3/\varepsilon)`$.
The change bound then depends only on epsilon, as
required.

The two directions give the full threshold. The finite
tests in [verify.py](verify.py) are only checks of the
gadget and block implementation, not the proof.
