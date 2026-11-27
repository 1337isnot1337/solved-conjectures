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
