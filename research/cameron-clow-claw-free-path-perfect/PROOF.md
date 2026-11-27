# Cameron–Clow’s claw-free path-perfect conjecture

The claw-free assertion in [Cameron and Clow, Problem 7.1](https://arxiv.org/html/2506.19100v1#S7) is false.
There is a claw-free vertex-critical graph of chromatic number four
with no Hamilton path. Thus its maximum path-span chromatic number
is three. In particular the least t in Problem 7.1 is three: the
$`K_{1,2}`$-free graphs are disjoint unions of cliques, and so are
path-perfect; $`K_{1,1}`$-free graphs are edgeless.

Here “3-critical” refers to **edge coloring** in a connected
simple subcubic graph: its chromatic index is four, and deleting
any edge makes it three-edge-colorable. We use two preservation
lemmas as stated in [Chen and Shan, Lemmas 2.6–2.7](https://arxiv.org/pdf/2606.27131).
Both operations below preserve simplicity in our applications.

- Replacing a vertex by a triangle and attaching its old
  neighbors to distinct triangle vertices preserves 3-criticality.
- For disjoint 3-critical graphs, choose edges $`u_1v_1`$ and $`u_2v_2`$
  with $`\deg(u_1)+\deg(u_2)\le5`$. Delete the chosen edges,
  identify $`u_1,u_2`$, and add $`v_1v_2`$. The result is 3-critical.
  This is the standard edge-coloring Hajós join.

## A two-terminal obstruction

Let J be the graph obtained by subdividing one edge of a
four-vertex complete graph once. It is 3-critical. There are
seven edges on five vertices, so three matchings of size at most
two cannot cover them. For an explicit edge-deletion check,
name the subdivided edge ab and its new middle vertex u, and
write c,d for the other vertices. Deleting au, cd, or ac
represents all edge orbits under interchanging a,b and c,d.
For those three deletions respectively, the remaining edges
have these valid three-colorings, with each row listing the
color classes:

| Deleted edge | Color 1 | Color 2 | Color 3 |
| --- | --- | --- | --- |
| au | bu, cd | ac, bd | ad, bc |
| cd | au, bd | bu, ac | ad, bc |
| ac | au, bd | bu, cd | ad, bc |

Replace the degree-two vertex u of J by a triangle
on p, q, r, with the two external edges at p and q.
Now take a Hajós join of this graph with a fresh copy of J
along pq and one edge incident to the fresh degree-two vertex,
identifying p with that vertex. The identified degrees are
three and two. This replaces pq by a second diamond on four
new vertices, whose two degree-two ends are attached to p and q.
Call the resulting 11-vertex 3-critical graph A.

The vertex r still has degree two, with neighbors p and q.
The graph obtained from A by removing r, p and q consists
of two disjoint diamonds, each attached only through p
and q. In particular any p–q path in A minus r meets at
most one of the diamonds. It cannot dominate the internal
edges of the other.

## Three branches force too many trail endpoints

Take another J as the host. Choose three different edges
of its diamond, orienting each from either endpoint, which
has degree three. For example, with the vertex names used
above, choose ac, ad and bd, oriented from a, a and b.
For each chosen host edge xy, take a fresh copy of A and
form a Hajós join with its edge rp, identifying x with r.
Each such pair of degrees is three and two. All host
degrees are restored after each join. The unprocessed host
edges are untouched, as are the attachment edges of every
finished branch.

The resulting graph F is subcubic and 3-critical. It has
35 vertices and 52 edges. It has three disjoint branches
isomorphic to A minus r, each with exactly two boundary
edges whose branch ends are p and q.

There is no edge-dominating trail in F, where edge-dominating
means every graph edge has an endpoint among the visited
vertices. Such a trail must visit each branch to dominate
its internal edges. A trail has only two ends, so at least
one branch contains neither endpoint. The trail therefore
enters and exits that branch using both boundary edges,
which are available only once each. There can be only
one visit interval. Because the ambient graph is subcubic
and the two ends are outside, the visited vertices in the
branch have used degree two in the trail. Thus the visit
interval is a simple p–q path. It meets at most one of the
two diamonds and misses all internal edges of the other,
contrary to edge domination.

## Disproving claw-free path-perfectness

Now take the line graph $`G=L(F)`$. It is claw-free: the
neighbors of a line-graph vertex lie in the union of the
two cliques of edges incident to its two endpoints. The
chromatic number of G is four, and deleting any vertex
lowers it to three by 3-criticality of F.

A Hamilton path in G would list the edges of F, with
successive edges meeting. Take their successive common
vertices. If a common vertex differs from the next, use
the intervening edge to travel between them; if they agree,
skip that step. The used edges are distinct, so this gives
a trail. Every listed edge meets at least one common vertex,
so the trail is edge-dominating. This contradicts the
preceding paragraph. Thus G has no Hamilton path. Every
path misses some vertex, so its induced span is at most
three-colorable; a degree-three vertex of F supplies a
triangle in G and hence a path with a three-chromatic span.

Further triangle replacements in F preserve 3-criticality
and the absence of edge-dominating trails. In fact a
dominating trail after one replacement would visit the new
triangle, and its contraction would dominate every old edge.
The construction therefore gives an infinite family of
claw-free counterexamples. It does not disprove the
unrestricted Gyárfás bound for path spans of chromatic
number three, and does not resolve Erdős–Hajnal #640.
