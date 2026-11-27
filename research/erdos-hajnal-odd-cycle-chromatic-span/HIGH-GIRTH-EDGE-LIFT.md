# High-girth lifts preserving a critical path obstruction

A finite graph of chromatic number four can have path chromatic span
three at arbitrarily large girth. More generally, chromatic edge
criticality and failure of traceability survive the same girth
amplification. The lift is an iteration of the standard Hajós join.
The useful point here is that every path through original vertices
projects to a path in the unexpanded graph. This is not a solution to
[Erdős–Hajnal's Problem 640](https://mathweb.ucsd.edu/~erdosproblems/erdos/newproblems/OddCycleOfLargeChromaticNumber.html),
whose universal chromatic bound remains open.

## Lift of an edge-critical graph

For k at least three, let G be k-edge-critical with no isolated
vertices, and let Q be
any k-edge-critical graph without isolated vertices of girth at
least g. Such a Q exists by Erdős's high-girth, high-chromatic
probabilistic theorem: start with a graph of girth at least g
and chromatic number at least k, delete edges as long as the
chromatic number remains at least k, and discard isolated vertices.
Deletion of a single edge reduces chromatic number by at most one,
so the resulting graph has chromatic number exactly k. Choose
an edge st of Q.

For each edge uv of G, orient it arbitrarily to distinguish u
and v. Replace it by a fresh copy of Q minus st, identify s with
u, and add an edge from its t to v. The different gadget interiors
are vertex-disjoint and only meet the original vertex set in
their specified interfaces. In any (k−1)-coloring of Q minus st,
s and t have the same color; if they differed, it would color Q.
Thus in the lift any (k−1)-coloring would give u and v different
colors for each original edge, contradicting the choice of G.

In fact every edge deletion of the lift allows k−1 colors.
Suppose the deleted edge belongs to the gadget corresponding
to uv. Color G minus uv with k−1 colors. In this coloring u and v
must have the same color, and every other gadget can be colored by
copying a (k−1)-coloring of Q minus st and permuting its colors to
agree with the designated endpoint.

If the deleted edge is the final edge from t to v, do the same in
the damaged gadget: no condition at v remains. Otherwise let ab
be the deleted internal edge and color Q minus ab instead. The
edge st is still present there, so s and t have different colors.
Permute colors so s has u's color. Then t differs from v, as
required for the final edge in the lift. Hence the lift is
k-edge-critical. It is also k-vertex-critical because it has no
isolated vertices. To see that there are no isolates, both
original graphs have minimum degree at least k−1 by edge
criticality, and each copy of Q loses only the edge st.

A cycle wholly within a gadget has length at least g. A simple
cycle meeting multiple gadgets must traverse at least one from
one original endpoint to the other: it cannot enter and leave
the interior through the same interface vertex without closing
there, and there are no edges left directly between original
vertices. Every route from s to t in Q minus st has length at
least g−1, since adding st closes such a route into a cycle in Q.
The last edge to v therefore makes every complete traversal at
least g edges long. The entire lift has girth at least g.

## Paths project, and cut obstructions also survive

List the original vertices encountered by a simple path in the
lift, in traversal order. Between consecutive original vertices
the path stays in a single gadget, because the interiors of
different gadgets have no edges between them. A traversal
between distinct ports of a gadget therefore projects to an
edge of G. The projected vertices are distinct, so their list is
a simple path in G. In particular a Hamiltonian path in the lift
would give a Hamiltonian path in G. For cycles involving at least
three original vertices the same argument works cyclically.

If G minus a set S has more than |S|+1 components, the same
cut is a certificate in the lift. No gadget can connect two
distinct components of G minus S: its surviving original
ports belong to at most one such component. Each original
component still has a vertex, so the lifted graph minus S
has at least as many components.

For k=4 apply the construction to the previously known
[13-vertex edge-critical witness](https://erdosproblemaday.com/report/640#explicit-13-vertex-path-witness).
The three-hub cut leaves five components. The resulting
high-girth graph is 4-vertex-critical and nontraceable, so
every path span is 3-colorable. Its chromatic number forces an
odd cycle; the path obtained by deleting one edge of that cycle
still spans the cycle's vertices, and thus has chromatic span
at least three.

Consequently no graph H containing a cycle can be a single
forbidden induced graph that forces path-perfectness: take g
greater than the order of H. In fact no **finite family of
cyclic graphs** can force path-perfectness by forbidding all
of them. This does not rule out a weaker upper bound on
chromatic number as a function of path chromatic span within
an H-free class, as asked in Cameron–Clow Conjecture 7.5.

## Source check

[Cameron–Clow](https://arxiv.org/html/2506.19100v1) give the
path-span definition and record earlier nontraceable critical
graphs. [Erdős's original probabilistic theorem](https://old.renyi.hu/~p_erdos/1959-06.pdf)
supplies Q; the critical-edge equality constraint is the standard
ingredient underlying Hajós constructions. Searches for
“nontraceable,” “no Hamiltonian path,” “critical,” “arbitrarily
large girth,” and “path-perfect” did not identify this
path-projection use of the lift or the cyclic-forbidden-family consequence.
No claim is made that the equality gadget itself is new.
