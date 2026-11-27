# An edge with four isolates does not force path-perfectness

A 34-vertex counterexample comes from a proper-coloring
constraint on four variables with three possible labels.
This settles the edge-plus-isolates line of the single-forbidden-graph
classification when combined with the positive three-isolate theorem.

## Graph and exact path chromatic span

Make a clique B of twelve vertices b(i,c), one for each of
four indices i and three labels c. Make a clique A of four
vertices a(i), with a(i) seeing all of B except its own block
of three. Make an independent set X of eighteen vertices
x(i,j,c), one for each unordered pair of indices and each
label c. Each x sees all of A and all of B except b(i,c)
and b(j,c).

In any proper twelve-coloring of the core A plus B, the
vertices of B use all twelve colors distinctly, and a(i)
must repeat the color of a vertex b(i,c_i) in its own block.
Although the four colors actually repeated on A are distinct,
the labels c_i take only three values. Thus some i and j
have the same label c. The vertex x(i,j,c) cannot use any
of the twelve colors: the two colors it misses in B are
both present in A.

Conversely for any specified x(i,j,c), set c_i=c_j=c
and assign the two other indices the other two labels,
in either order. This is the only repeated label pair.
Each other x has a nonneighbor in B whose color is not
repeated in A, and can take that color. Since X is independent,
this gives a twelve-coloring of the graph minus the specified x.
Giving that last vertex its own color proves that the full
graph has chromatic number thirteen. Any simple path contains
at most seventeen vertices of X, because the core has sixteen
vertices and X is independent. Every path thus induces a
twelve-colorable graph, while the clique B gives path chromatic
span at least twelve.

## The forbidden graph

The vertices anticomplete to any edge that meets A lie in B.
They have independence number at most one. For an edge with
both endpoints in B, its antineighborhood is contained in
A plus at most one vertex of X: the missing pair identifies
at most one x. Since A is a clique complete to X, the
independence number is again at most one. The only remaining
edges join some b(i,c) to some x. Their antineighborhood is
contained in X and consists of at most three vertices, since
exactly three vertices of X miss b(i,c), corresponding to
the other three indices. There are no edges within X.
In no case is an independent set of four vertices anticomplete
to an edge. The graph is (P2 + 4P1)-free as claimed.

The prior two-block transversal construction cannot simply
be used here: if its two block sizes are at most three then
the independent set is not large enough to give the required
path obstruction, whereas a larger block allows an edge with
four anticomplete independent vertices. The overlapping
pair conditions above create eighteen private blocking
states on just sixteen core vertices while bounding every
individual omission count by three.
