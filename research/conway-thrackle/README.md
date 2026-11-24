# Conway’s thrackle conjecture

**Status (2026-11-24).** The conjecture remains open in this investigation.
This checkpoint proves a sufficient condition for shortening both even
cycles of a putative figure-eight counterexample when the one-path
operation can be blocked on both sides. It leaves the existence of a
suitable pair of paths in a general drawing open. There is no
independent review, Lean verification, or priority claim.
[Tracking issue #325](https://github.com/1337isnot1337/solved-conjectures/issues/325).

## Exact target and primary sources

A thrackle is a plane drawing of a finite simple graph by simple arcs such
that two different edges meet exactly once, at their common endpoint if
incident and at a proper crossing otherwise. As usual the drawing can be
taken with no three arcs crossing at the same interior point. Conway's
conjecture says that its number of edges is at most its number of vertices.
It would prohibit every bicyclic connected subgraph in such a drawing.

Woodall recorded the problem in *Thrackles and deadlock* (1971), pp. 335–347.
The formulation and attribution are documented by
[Lovász–Pach–Szegedy](https://cims.nyu.edu/~pach/publications/thrackle.pdf).
For the full conjecture it suffices to exclude thrackles consisting of two
even cycles sharing exactly one vertex, by Woodall's reduction as described
in the introduction and §2 of
[Fulek–Pach](https://math.nyu.edu/~pach/publications/thrackle101909.pdf).
A four-cycle has no thrackle drawing, so each cycle in the reduced
problem has length at least six.

The October 2026 work of Simon gives an upper bound with coefficient
$4/3$. The October 2026 preprint on continual graph memory reports a
verifier-accepted bound with coefficient $29/22$. The source check on
2026-11-24 looked for full resolutions using the original name, exact
plane-drawing statement, and even figure-eight formulation. It located
neither a full proof nor a refutation. The reported bounds remain
above the conjectured coefficient.
[Simon](https://arxiv.org/abs/2610.31589),
[Continual Graph Memory](https://arxiv.org/abs/2610.02945).

The usual three-edge removal is described in §3.1, Lemma 1 of
Misereh and Nikolayevsky, citing Cairns and Nikolayevsky. A single move
requires a triangle free of other vertices. The ProofAtlas summary
describes both the issue of blocked removal triangles and the open
challenge of legal edge-block surgery. The argument below uses a pair
of geometric removals with a joint condition on what survives.
[Misereh–Nikolayevsky](https://dmtcs.episciences.org/articles/3883/download),
[ProofAtlas research summary](https://www.proofatlas.ai/collaboration/conways-thrackle-conjecture/).

## Paired shortening

Let $A$ and $B$ be the two even cycles and let $v$ be the shared vertex.
Choose a three-edge path $P_A$ on $A$ and a three-edge path $P_B$ on $B$,
each avoiding $v$, including at its endpoints. On a path
$u_0u_1u_2u_3$ let $x$ be the crossing of its first and third edges.
Cut those two edges at $x$. The middle edge and the parts from
$x$ to $u_1$ and $u_2$ form a Jordan curve $C$. Work on the sphere by
adding the point at infinity. Define $D$ to be the open disk bounded by
$C$ on the side that avoids $u_0$ and $u_3$. The two remaining tails
meet at $x$ and form a simple arc $R$ from $u_0$ to $u_3$.
They depart from the two complementary branches at $x$ on the same
side of $C$ and have no further meeting with $C$. This proves that
the disk choice is well defined. Use the subscript $A$ or $B$ to
distinguish the two constructions.

Delete the two internal vertices of each chosen path. Call all other
original vertices surviving. Suppose both $D_A$ and $D_B$ contain
no surviving vertex. Assume one of the following conditions.

- $R_A$ and $R_B$ have just one crossing.
- $R_A$ and $R_B$ have three crossings, and two crossings bound a
  disk with one boundary segment from each arc. Its interior is
  disjoint from both arcs and contains no surviving vertex.

Then the drawing can be shortened by two vertices on each cycle,
preserving the thrackle property and the shared vertex. In particular,
a shortest thrackled even figure-eight cannot have a pair of paths
satisfying these conditions. Its failed single removals may still
have blockers among the vertices deleted by the other move.

### Crossings with unchanged edges

After retaining each new arc and deleting its triangle boundary,
all endpoints of an unchanged edge $e$ lie outside each disk. No
endpoint of $e$ can lie on a triangle boundary because the only
original vertices on that boundary are precisely the two deleted
vertices. Parity of intersection with a Jordan curve gives an even
number of proper crossings with the boundary.

Consider one replaced path $P$ and its new arc $R$. If $e$ is
disjoint from $P$ as a graph edge, it had three proper crossings
with $P$. At most two can remain on $R$ because $R$ uses pieces of
just two former edges. The boundary therefore accounts for an even,
positive number of the three crossings, exactly two. The remaining
one is the required crossing with $R$.

Otherwise $e$ meets one of the path's two endpoints. Its other
endpoint cannot be on the path because the path is on one of the
cycles of length at least six, its internal vertices have degree
two, and the path avoids the shared vertex. Originally $e$ had two
proper crossings with the path. At most one proper crossing can
remain because one constituent edge of $R$ was already incident
with $e$. Evenness again forces exactly two crossings on the
boundary, leaving just the common endpoint on $R$.

The new arcs can be made smooth near their respective original
crossings $x_A,x_B$ without changing their meetings with other
edges. There is no third edge through either crossing. Unchanged
edges retain all their old crossings with one another.

### Crossings of the new arcs

For two drawings $Q,Q'$ meeting only transversely at interior
points, write $i(Q,Q')$ for the number of crossings modulo two.
We use this only for objects with no common endpoints or vertices,
except for the traversals' own self-crossings. The two old paths
were vertex-disjoint and crossed nine times. Since the other
path's endpoints survive, $i(C_A,P_B)=0$. Crossing points along
$P_A$ partition between its retained arc and its boundary, so
$i(R_A,P_B)=1$. The endpoints of $R_A$ survive and are outside
$D_B$, so $i(R_A,C_B)=0$. Partitioning the crossings along $P_B$
now gives $i(R_A,R_B)=1$.

Each new arc is made from two of the original edges, so the
two new arcs have at most four crossings. Thus the only possible
counts are one and three. In the first case the pair is already
valid.

In the three-crossing case under the disk hypothesis, its boundary
has a subarc from $R_A$ and a subarc from $R_B$, both running
between the same two crossings. An unchanged edge $e$ has both
endpoints outside this disk and crosses its boundary zero or twice.
It crosses each new arc at most once away from common endpoints.
The endpoints of the new arcs cannot lie on the disk boundary
because both boundary segments run between interior crossings,
and neither arc may otherwise enter the disk. Thus an unchanged
edge either avoids both boundary segments or has one crossing
with each of them.

Move the $R_A$ segment across the disk, placing it just past the
$R_B$ segment and reconnecting in small crossing neighborhoods.
The rest of the two arcs stays in place. The disk has no other
portions of either arc, so this cancels those two crossings
without adding self-crossings or changing the third crossing.
Each unchanged edge formerly crossing the moved segment now
crosses it once near that edge's crossing with the $R_B$ boundary
segment. Every other unchanged edge still avoids the moved
segment. To see this last assertion, take a narrow collar on the
opposite side of the $R_B$ segment and use transverse
neighborhoods at its finitely many crossings. The remaining
unchanged arcs are compact and disjoint from the closed part of
the segment outside those neighborhoods. The collar can avoid
them. This is the usual vertex-free bigon move with its effect on
all other intersections accounted for.

The resulting graph has both even cycles shortened by two edges
and two vertices. The two replacement arcs are graph edges with
disjoint endpoints, so the resulting families of meetings are
exactly the thrackle conditions. A plane drawing is obtained from
the sphere by removing any point off the drawing. Even if one
cycle formerly had length six, the deduction is valid and would
give an impossible thrackled four-cycle, excluding those
hypotheses from that original drawing.

## Remaining obstruction

For a proof by descent the missing step is to find a suitable
pair in every remaining even figure-eight, or to exclude
drawings for which no such pair exists. The argument proves that
if the only blockers of each of two removals are vertices deleted
by the other, no unchanged edge can obstruct the combined move.
The surviving obstruction then lies in the three-crossing
configuration of the two replacement arcs and the vertex
positions around it. No claim is made that reciprocal blockers
must occur or that a clean empty disk always exists.
