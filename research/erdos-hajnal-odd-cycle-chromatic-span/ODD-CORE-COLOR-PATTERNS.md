# An odd connector cycle admits at most two full-interface color patterns

Use the [five-singleton reduction](FOUR-CHROMATIC-FIVE-BRANCHES.md).
Let Q be any odd cycle in the connector graph X. There is one
because X cannot be bipartite. Consider the full-interface color
patterns, each specified by a singleton w of I and a partition
of I-{w} into two pairs. Extend the pattern only to Q at first.

**Claim.** At most two such patterns extend to Q. Consequently
at most four connectors lie outside the vertex set of any odd
cycle in a four-vertex-critical graph with this interface.

## Counting the patterns

For a connector its omission set consists of its nonneighbors
in I and has size at most two. Since an odd cycle needs three
colors, every pattern that extends to Q must use both of its
paired colors there. Each pair therefore occurs as an exact
omission set on Q. The third color uses only connectors whose
omission includes w. A connector with no omissions prevents
all patterns; a connector with a singleton omission forces w
and hence the matching is fixed, since its two pairs are the
exact omissions not using w.

Suppose instead all omissions on Q have size two. Let F be the
simple graph on I of its distinct omission pairs. If a pattern
exists, F comprises the two paired edges and a nonempty star
with center w, with one to four spokes. The candidate patterns
are exactly the vertices whose deletion leaves two independent
edges in F, before imposing the proper-coloring test on Q.

With one spoke, F is the disjoint union of a three-vertex path
and an edge, and there are two candidates. With two spokes of
the star hitting different paired edges, F is a five-vertex
path and only its middle vertex works. With at least three
spokes, the center is the only possible deletion: every other
deletion leaves the center with degree at least two. The
remaining shape is a triangle and a disjoint edge, where each
of the three triangle vertices is formally a candidate.

In this last shape the connectors of Q of the disjoint-edge
type are independent if any pattern works, because they all
share that paired color. If all three candidates work, the
connectors of all three triangle-edge types together are
also independent. Two with the same type always receive the
same color, and any two different triangle-edge types share
a vertex; that vertex as w gives both the singleton color.
Then Q is bipartite, which is false. Thus at most two
patterns extend to Q in every case.

## From patterns to indispensable vertices

Fix a connector x outside Q. A 3-coloring after deleting x
still uses three colors on X because Q survived. Each color
therefore covers at most two vertices of I, and its pattern
on the five vertices must be of the form 2,2,1. It is one
of the at most two patterns extending to Q.

For a fixed pattern, every connector has either a forced
unique color or no possible color. A 3-coloring is prevented
either by an unassignable vertex or by an edge with two
ends forced to the same color. At least one of these obstructions
exists in G, which is not 3-colorable. Only deleting that
vertex, or one of the endpoints of the edge, can make the
pattern usable. There are thus at most two indispensable
vertices for any one pattern, and at most four outside Q.

For an induced odd cycle Q in the forbidden class, |Q|<=9:
if |Q|>=11, three consecutive vertices induce P3, and the
remaining antineighborhood on Q contains a path of order at
least six with three independent vertices. Taking a shortest
odd cycle thus bounds the connector count by 13 and the
whole graph by 18. This is only an order bound for this
remaining four-chromatic configuration; the original
traceability question has no chromatic-number restriction.
