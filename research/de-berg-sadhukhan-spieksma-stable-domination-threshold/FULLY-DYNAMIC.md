# The same threshold with vertex deletions

The proof in [PROOF.md](PROOF.md) answers the original
insertion-only question. Its sharp maximum-degree threshold
also holds when vertices may be deleted with their incident
edges. The negative direction is immediate because an
insertion-only stream is allowed.

## Local repair for paths and cycles

Retain the same partition into blocks of size between L and
2L, with the exception of one block for any component with
fewer than L vertices. Suppose the update deletes v. Remove
v's block from the partition. The remaining vertices of this
block form at most two nonempty path fragments. A fragment
shorter than L can stay small if it has no edge to an outside
block. Otherwise also remove one neighboring block from the
partition. Such a neighboring block already has at least L
vertices: it was not a whole small component.

The rebuilt region consists of the original block minus v
and at most two neighboring blocks. A neighboring block
might serve both fragments, in which case it is processed
only once. Break this region into its path components and
repartition each into blocks of sizes L through 2L. A
component of the region with fewer than L vertices has no
edge leaving the region: it comprises only short fragments,
each of which either had no outside neighbor or was made
adjacent in the region to a block of size at least L. Such
a small component remains one block. Untouched blocks
preserve the invariant.

At most 6L vertices, including the deleted vertex and any
selected memberships there, can change their output status.
The original cut-count estimate applies verbatim to every
snapshot. Therefore the algorithm has a fully dynamic
stable approximation scheme at maximum degree two.

## The reduction itself also supports deletions

For arbitrary bounded maximum degree, delete a departing
vertex's entire path, one path vertex per translated step.
All its external edges disappear as their endpoints do.
Former neighbors may reuse released slots on later
arrivals. No retained edge is changed. The same offset
identity and local projection hold at every completed
snapshot. In particular the transfer bound counts both
additions and removals.

## Single-edge updates on a fixed vertex set

The degree-two algorithm also supports this model. For an inserted
edge between different blocks, remove and recompute the two
endpoint blocks. The affected vertices form a path or a whole
cycle, so the same repartition step preserves the size invariant.
If the endpoints are in one block, its vertex set stays intact
and only its local solution is recomputed. For deleting a cut edge
no block changes. An internal edge deletion splits a block into
at most two path fragments (or opens a whole cycle to a path);
repair short fragments by borrowing adjacent blocks as above.
At most 6L vertices are affected. The cut-count approximation
proof is unchanged. The [sharp path lower bound](SHARP-RECOURSE.md)
also carries over to one-edge insertion.

The negative direction works on bipartite subcubic graphs with
single-edge insertions and an initially edgeless fixed vertex set.
Take the bipartite hard stream in [PROOF.md](PROOF.md) and
preallocate four isolated vertices for every original vertex.
Activate each arriving gadget by inserting its three internal edges
and at most four external edges. Every intermediate graph is a
subgraph of the final subcubic bipartite graph. At completed
checkpoints, dormant gadgets are sets of isolated vertices, all
forced into each dominating set and disjoint from the active graph.

In the published [hard window](https://arxiv.org/html/2412.13358v1#S3.Thmtheorem5)
there are at most N dormant original vertices and at least 3N
active original vertices, where N is the last layer size. Thus
the number of forced dormant selections is at most 4N, and
the active optimum is at least 3N by the gadget identity.
Deleting the forced dormant selections from an output of relative
error eta leaves a relative error of at most (7/3) eta on the
active graph. Projecting to the original graph amplifies the
relative error by at most six, for an overall factor of at most
14. A projected membership change either comes from one of the
at most seven edge steps, or from the newly activated original
vertex, whose formerly dormant selections were not projected.
A bound of r changes per edge step therefore gives at most
7r+1 changes per completed original step. The published lower
bound only uses this hard window. Choosing eta one fourteenth
of that paper's positive tolerance yields linear recourse already
in the fixed-vertex edge-insertion model.
