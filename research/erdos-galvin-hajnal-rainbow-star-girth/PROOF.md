# Erdős–Galvin–Hajnal’s rainbow-star girth problem

In [Erdős–Galvin–Hajnal (1975), Problem 7, p. 466](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=42),
the authors ask for countable graphs of arbitrarily large girth
with their property (P^*(G,aleph_0,aleph_0)).
By [Definition 6.3, p. 448](https://www.renyi.hu/~p_erdos/1975-24.pdf#page=24),
this means that some fixed edge labelling (lambda:E(G)	omathbb N)
has the following property: in every finite colouring of the vertices,
one vertex (v) has a neighbour of its own vertex colour along an edge
of label (i), for each (iinmathbb N). The same (v) must work
for every (i).

**Answer: no.** Every countable (C_4)-free graph and every such
labelling admit a two-colouring of the vertices in which each vertex
misses an incident label among the edges to vertices of its own colour.
Thus no witness has girth at least five. This threshold is sharp:
triangle-free witnesses already follow from the authors' Theorem 8.1.
Below we further show that a sharp witness at girth four can avoid
(K_{aleph_0,aleph_0}). All cycles and complete bipartite graphs
here mean ordinary subgraphs, not necessarily induced.

## 1. Missing-label colouring from finite common neighbourhoods

**Lemma.** Let (kge1) be an integer and (G) a countable simple
graph in which every (k)-element set of vertices has only finitely
many common neighbours. For every edge labelling
(lambda:E(G)	omathbb N) and arbitrary lists of (k) allowed
vertex colours at each vertex, one can choose a vertex colour from
each list such that each vertex misses an incident label among its
same-colour neighbours.

**Proof.** Enumerate (V(G)) in order type (omega), or in a finite
order if (G) is finite. After processing finitely many vertices,
we have assigned them colours (a(u)) from their lists and chosen
one label (i(u)) for each. The requirement at (u) is that all
neighbours (w) joined to it by label (i(u)) have colour different
from (a(u)). Maintain two invariants: the processed vertices satisfy
all requirements on edges joining them, and each unprocessed vertex
has at least one list colour still available after excluding all
colours prohibited by processed vertices.

Process the next vertex (v), giving it any still available colour
(a(v)). Consider the following exceptional neighbours of (v).

1. Previously processed neighbours of colour (a(v)). There are
   only finitely many.
2. Unprocessed neighbours whose only available colour is (a(v)).
   Each of them is already forbidden its other (k-1) list colours.
   For each of the (k-1) distinct forbidden colours, there is a
   previously processed neighbour witnessing that prohibition.
   These witnesses are distinct because each has one assigned
   colour. Together with (v) they form a (k)-set of neighbours
   of the exceptional vertex. There are finitely many choices of
   the (k-1) earlier witnesses, and each resulting (k)-set has
   finitely many common neighbours. This also applies at (k=1),
   with an empty set of earlier witnesses.

The exceptional edges incident with (v) therefore use finitely
many labels. Pick (i(v)) outside them and impose its requirement at
every corresponding neighbour. No processed neighbour has the
wrong colour along such an edge, and no unprocessed neighbour loses
its last available colour. Also (a(v)) already satisfies every
earlier requirement at (v). Both invariants persist. At the end
each requirement is satisfied, since its endpoints were processed
at finite stages. (square)

In a (C_4)-free graph, two distinct vertices have at most one
common neighbour. Apply the lemma with both lists equal to
({0,1}). This proves the negative answer. In fact the conclusion
holds as soon as the graph has no (K_{2,aleph_0}), whether or
not it has quadrilaterals. More generally, an edge-labelled graph
forcing a rainbow star in every (k)-colouring must contain
(K_{k,aleph_0}).

## 2. Triangle-free witnesses without an infinite biclique

We construct, for each integer (kge1), a countable labelled graph
(G_k) with the following properties.

* Every vertex colouring with at most (k) colours has a rainbow
  star, in the precise sense above.
* (G_k) is triangle-free and has ordinary chromatic number (k+1).
* (G_k) has no (K_{k+1,k+1}).

Start with (G_1=K_{1,aleph_0}) and give its edges all the different
labels. Suppose (G_k) has been constructed, and fix a proper
partition into (k+1) independent parts (I_1,ldots,I_{k+1}).
For (G_{k+1}), start with an independent root set (R) of size
(k(k+1)+1). For every ordered tuple of (k+1) distinct roots
((r_1,ldots,r_{k+1})) and every label vector
((i_1,ldots,i_{k+1})inmathbb N^{k+1}), take a disjoint copy
of (G_k). Keep its labels. Join every vertex in the copy of (I_j)
to (r_j) by an edge of label (i_j). There are no other edges.

This is a countable graph. No triangle can meet two roots (the
roots are independent), or use a single root (its neighbours inside
each copy lie in one independent part, and different copies have
no edges between them). Triangles inside a copy were already
excluded. Giving the roots one new colour and using the old proper
partition in each copy proves (chi(G_{k+1})le k+2).

Now take any vertex colouring using at most (k+1) colours.
Some (k+1) roots share one colour (a), by the chosen size of (R).
If one already has a rainbow star, we are done. Otherwise, for
each of those roots (r_j), let (i_j) be any missing label
among its neighbours of colour (a). In the specific copy indexed
by the tuple and label vector just chosen, every vertex has a
label-(i_j) edge to its assigned root (r_j), for some (j).
Thus no vertex of that copy has colour (a). The copy uses at most
(k) colours, so the inductive property supplies a rainbow star
within it. This proves the first assertion for (G_{k+1}), and
also shows ordinary proper colourings require at least (k+2)
colours.

Finally, a complete bipartite subgraph with at least two vertices
per side contains at most one root: two roots in opposite parts
would have to be adjacent, and two in the same part have no common
neighbour. Two vertices in different child copies have at most one
common neighbour (their possibly shared root), so the non-root
vertices on each side all belong to one copy. The two sides' copies
must coincide, since there is an edge across the sides between
non-root vertices. A (K_{k+2,k+2}) would therefore leave a
(K_{k+1,k+1}) inside a copy after removing the possible root,
contrary to the induction hypothesis. This completes the induction.

Take the disjoint union of all (G_k), with their shared label
palette (mathbb N). Every finite vertex colouring has a rainbow
star in the appropriate (G_k). The union is triangle-free and
(K_{aleph_0,aleph_0})-free, since a complete bipartite graph
with nonempty parts must be contained in one component, and no
one (G_k) contains it. By the first section the union contains
a quadrilateral. Its girth is consequently exactly four.

## 3. Which distinctions matter

* The obstruction works for every labelling with an infinite
  palette; it need not be a proper edge colouring.
* Having all labels somewhere in one vertex-colour class, the
  unstarred (P) of Definition 6.2, is strictly weaker. The original
  Theorem 9.21 gives arbitrarily high girth for that property.
* Neither the obstruction nor the two-colour corollary excludes
  the corresponding high-girth assertion for each fixed finite
  edge palette. Choosing an unused label outside a finite
  exceptional set needs the infinite palette.
* The positive girth-four threshold itself is already implicit
  in EGH's Theorem 8.1 with its cardinal parameter (lambda)
  equal to (aleph_0). The explicit finite-colour construction
  here supplies the additional balanced-biclique exclusions and
  avoids an infinite biclique in the union.
