# A further hereditary class is path-perfect

Every graph with no induced copy of one edge and three isolated
vertices is path-perfect. This is a structural result toward
classifying single forbidden induced subgraphs that force
path-perfectness; it is not the unrestricted odd-cycle bound of
Erdős and Hajnal. The proof combines a toughness argument with a
separate treatment of two-vertex cuts.

## Critical graphs and toughness

It suffices to prove that each vertex-critical graph in the
class has a spanning path: any induced subgraph contains a
vertex-critical induced subgraph of the same chromatic number.
Let G be such a graph. The cases of chromatic number at most
three are immediate: the vertex-critical graphs are a vertex,
an edge, and odd cycles (a graph that is not bipartite contains
an odd cycle, which forces the induced critical graph to have
exactly that cycle's vertices). We may therefore assume minimum
degree at least three.

A vertex-critical graph is connected and has no cut vertex:
proper colorings of the sides of a one-vertex cut can be
permuted to agree at the separator. A two-vertex cut leaves
exactly two components. Indeed each side allows a nonempty
subset of the relations “equal” and “different” for the two
separator colors in a coloring with one fewer than the
chromatic number of G. If the subsets share a relation,
colorings glue. Otherwise two sides force opposite relations,
and just their induced union with the separator already needs
the full chromatic number. This union cannot be proper.

We claim that G is 1-tough: if a vertex set S disconnects G,
the number of components of G-S is at most |S|. This already
holds for at most three components by the preceding facts.
If G-S has at least four components, all must be singletons:
otherwise an edge in one together with a vertex in each of
three others induces the forbidden graph.

Let I be this independent set of singletons and R its union
of neighborhoods, a subset of S. Every vertex in R misses at
most two vertices of I, since an edge to a neighbor in I and
three nonneighbors in I would be forbidden. For each i in I
consider its set of nonneighbors M_i in R. These sets are
pairwise incomparable: if the neighborhoods of distinct
nonadjacent vertices were comparable, a coloring after deleting
the vertex with the smaller neighborhood could be extended
using the other vertex's color. Thus no M_i is empty. Moreover
each one-element M_i uses a distinct member of R that cannot
appear in any other M_j. If a is the number of one-element
sets and b the number of all other sets, each of those b sets
has at least two members among the remaining |R|-a vertices.
Each such vertex belongs to at most two of the sets, so
2b <= 2(|R|-a). Hence |I|=a+b <= |R| <= |S|, as required.

If G is at least 3-connected, add a universal vertex. The
result remains 1-tough and remains free of the forbidden graph,
which has no universal vertex. It is now at least 4-connected.
[Xu–Li–Zhou's theorem](https://arxiv.org/abs/2303.09741) gives
a Hamiltonian cycle in this augmented graph. Deleting the new
vertex from that cycle gives a spanning path of G.

## The remaining connectivity-two case

Fix a two-vertex cut x,y. Its two components C and D each
have an edge, since a singleton component would have degree
at most two. Each component has independence number at most
two: an independent triple in either, together with an edge
in the other, induces the forbidden graph. By 2-connectivity
each of x and y has a neighbor in each component, and distinct
neighbors can be chosen for x and y in either component. If
the union of their neighborhoods in one component were a
singleton, deleting that singleton would leave vertices of
the component separated from the rest of G.

We use three results of
[Jedličková–Kratochvíl, §3.1](https://arxiv.org/html/2403.03668v1#S3.SS1)
for a connected graph of independence number at most two:
their Theorem 3.1 describes when two vertices are endpoints of
a spanning path, Theorem 3.2 allows a spanning path starting
at any nonarticulation, and Theorem 3.3 gives a cover by two
disjoint paths starting at any two prescribed distinct vertices.
In particular, if either C or D has a spanning path between
distinct neighbors of x and y, then G has a spanning path.
For example, connect the two path pieces covering D via x,
a spanning path of C, and y.

We may assume neither component has such a path. In particular
neither is a clique, because its distinct chosen neighbors
could be the ends of a spanning path.

### A component has an articulation vertex

In a connected graph of independence number at most two, an
articulation separates it into two cliques. It is complete to
at least one of the cliques, or two missed vertices and the
articulation would be an independent triple. There is at most
one additional articulation, which can occur only at a unique
neighbor in the other clique when that clique has size at least
two. In this case the two articulations are adjacent, their
edge is a bridge, and deleting them leaves two nonempty
anticomplete cliques. In either case deleting all articulations
leaves two nonempty end cliques, each joined to the rest of
the component only at a single articulation.

Suppose C has articulations. If each of x and y has a neighbor
in at least one of its end cliques, their combined neighborhoods must
meet both end cliques, or the unique articulation of the missed
end would also be an articulation of G. Thus choose distinct
neighbors, of x and y respectively, in opposite ends. They
meet the conditions of Theorem 3.1 and give the path we want.

Otherwise suppose x has only articulation neighbors in C.
Choose an articulation a adjacent to x. Let J and K be the
two cliques of C-a, with a complete to J. The vertex y has a
neighbor in J and also in K: each end clique after deleting
all articulations needs a neighbor in x or y by 2-connectivity,
and only y can provide it. Traverse all of K up to a neighbor
of y, then take y, traverse all of J starting at a neighbor
of y, and finish at a and x. This spans C together with x and y.

If x has a nonarticulation neighbor in D, finish by attaching
a spanning path of D from that neighbor. If not, both C and D
have two nonempty end cliques anticomplete to x. At least one
end clique in C has size at least two. Otherwise each end
would consist of a singleton with just its articulation as
neighbor inside C, and its degree in G would be at most two
(it misses x and can only add y). Take an edge in the larger
end of C. A vertex in each of the two ends of D, together
with x, gives three independent vertices anticomplete to the
edge. This is forbidden, completing the case.

### Both components are 2-connected

Consider C, with X and Y the neighborhoods of x and y in C.
For each distinct a in X and b in Y, the failure of an
a-to-b spanning path in C implies by Theorem 3.1 that
{a,b} is a two-vertex cut of C. The union X ∪ Y cannot
have only two vertices: deleting them would leave at least
two components of C and another component containing D
in the original graph G, contradicting vertex criticality.

Because the union has at least three vertices, by interchanging
x and y if needed choose distinct a,a' in X and b in Y,
all different. Both a and a' are articulations of C-b.
As above, their joining edge is a bridge of C-b. The
Chvátal–Erdős theorem gives a Hamiltonian cycle of C.
Deleting b from that cycle gives a spanning path of C-b,
which must use the bridge a a'. So the cycle in C contains
that edge. Insert x on it using the two edges x a and x a',
obtaining a spanning cycle of G[C ∪ {x}]. Take a spanning
path of D ending at a neighbor of y (any vertex can be
an endpoint since D has a spanning cycle), append y, and
open the cycle of C ∪ {x} at a neighbor of y in C. This
gives a spanning path of G.

All cases are covered. In particular the proof requires neither
a general 1-tough Hamiltonicity theorem for this class nor a
bounded search of critical graphs.
