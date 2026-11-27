# Arbitrary odd girth and the finite forbidden graphs

This supplement to [Erdős–Galvin–Hajnal’s rainbow-star girth
problem](PROOF.md) shows a sharp contrast: the full countably
infinite palette forces quadrilaterals, but does not force any
odd cycle of bounded length or any infinite complete bipartite
graph. We use the finite-palette-profile idea in the proof of
[Erdős–Galvin–Hajnal, Theorem 8.6, pp. 458–459](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=34),
with finite templates and a sparse rather than complete blow-up.

**Theorem.** For every positive integer (g) there is a
countable (K_{aleph_0,aleph_0})-free graph of odd girth
greater than (g), and an edge labelling into (mathbb N),
such that every finite vertex colouring has a vertex with
infinitely many same-colour neighbours in each edge label.

Consequently, for a finite graph (F), a countable (F)-free
graph can have the original property (P^*(G,aleph_0,aleph_0))
**if and only if (F) is nonbipartite**. The same criterion
holds for a finite family of forbidden finite graphs, with
nonbipartiteness required of every member. In these statements,
containment is as an ordinary, not necessarily induced, subgraph.

## Construction for at most (k) vertex colours

Fix a positive integer (k). By
[Erdős’s high-girth, high-chromatic graph theorem](https://doi.org/10.4153/CJM-1959-003-9),
there is a finite graph (B) of girth greater than (g) and
chromatic number greater than (2^k-1). Orient every edge of
(B) arbitrarily. Replace each (uin V(B)) by a disjoint
countably infinite independent set (V_u). For each oriented
edge (u	o w) encode the following requirements separately:
for every nonempty (Ssubset V_u) with (|S|le k), and every
map (phi:S	omathbb N), choose infinitely many distinct
vertices of (V_w) as copies of the code ((S,phi)).
Allocate disjoint sets of vertices to different codes for this
oriented edge. This is possible because there are countably many
codes. For any vertex (x) allocated to a code, join it to the
vertices (sin S) by edges of labels (phi(s)).
Put in no other edges between (V_u) and (V_w); put in no
edges at all for nonadjacent template vertices. Codes for
different incoming template edges may reuse the same target
vertex, since the source fibres, and hence the edges, differ.

The projection to (B) is a graph homomorphism. An odd cycle
of length at most (g) would project to an odd closed walk of
the same length, and any odd closed walk contains a simple odd
cycle no longer than itself (split at any repeated interior
vertex and keep an odd subwalk until simple). Thus the host has
odd girth greater than (g). Moreover, every vertex of the
target fibre (V_w) has at most (k) neighbours in the source
fibre (V_u) for each oriented pair. Hence the host excludes
(K_{aleph_0,aleph_0}): from any such biclique pick infinitely
many vertices on each side in a single fibre, using the finiteness
of (B). Those fibres must be adjacent and distinct, but a vertex
in the target could not see the infinite source side. In fact
the same argument excludes (K_{a,a}) with (a=k|V(B)|+1).

## The palette argument

For a vertex colouring with at most (k) colours, let (P(u))
be the nonempty set of colours appearing in the entire fibre
(V_u). There are at most (2^k-1) such profiles. Since (B)
has higher chromatic number, some oriented edge (u	o w)
has (P(u)=P(w)). Choose one vertex (sin V_u) of each
colour in this shared profile and let (S) be their set.
Suppose every vertex fails the desired conclusion. For each
(sin S) choose a label (phi(s)) occurring only finitely
often on its edges to vertices of its own colour. Infinitely
many vertices (xin V_w) realize the code ((S,phi)).
Each has the colour of its unique representative (sin S),
and the edge (sx) has label (phi(s)). But the forbidden
exceptions for the finitely many (s)'s together allow only
finitely many such (x). This contradiction proves the
assertion for at most (k) vertex colours.

Take a disjoint union of these hosts over all (kge1),
using the same label palette. Odd girth and the infinite-biclique
exclusion are preserved. Any finite vertex colouring restricts
to a colouring of one appropriate component. This proves the
theorem.

If (F) is nonbipartite, choose (g) at least the length of
one of its odd cycles; the resulting host is (F)-free. For
a finite family, choose (g) large enough for every member.
Conversely, the missing-label lemma in [the main proof](PROOF.md)
forces (K_{k,aleph_0}) for every finite (k) in any countable
witness to (P^*(G,aleph_0,aleph_0)). Every finite bipartite
graph is a subgraph of one of those complete bipartite graphs.
This gives both directions of the characterization.
