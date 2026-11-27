# Leaf colors in omission trees

This is a continuation of the [separator reduction](PATH-THREE-THREE-ISOLATES.md)
for induced `P3 + 3P1`. It proves that every vertex-critical
`(P3 + 3P1)`-free graph of chromatic number at most seven satisfies
`c(G-S) <= |S|+1` for every vertex set S. This is a necessary
condition for a spanning path, not a proof of traceability.

Use the notation of the reduction. In an inclusion-minimal cut
violating the inequality, there are at least two stub-free trees
in the omission multigraph, and no such tree has fewer than
four vertices. Let a *leaf connector* denote the exceptional
connector of a branch with singleton exception set anywhere in
the multigraph. There is at most one such branch per connector.
All these branches are cliques of the same size d.

## A cut-independent color restriction

Let x be a leaf connector. A private failure for its leaf gives
p=d-1 unused colors on S: another leaf extends, forcing p>=d-1,
while the failing leaf forces p<d. All other leaf connectors are
singleton color classes; x is not.

Consider a branch B next to a leaf of a stub-free tree. If B has
at most d vertices, its constraint is implied by the neighbor
leaf: at p=d-1 the singleton leaf connector can color a vertex
of B; at p>=d the unused colors suffice. Thus B has at least
d+1 vertices. If B has degree two in the tree, its exception set
is {x,y}, where x is the connector to the leaf. In the private
failure of that leaf, x is nonsingleton. At most one class can
be contained in {x,y}, and B cannot fit. Contradiction. It follows
that no leaf of either tree has a degree-two neighbor. In
particular, neither tree is a path, and each has at least
three leaves. There are at least six distinct leaf connectors.

There is also a restriction on edges of S: two leaf connectors
u,v in different stub-free trees must be adjacent in G. Otherwise
take a private failure of a third leaf. The classes {u} and {v}
are singleton there, so merge them. This frees one unused color.
No branch loses more than one available class, since the branch
supports of u and v are disjoint. Restrict any previously
successful matching to the classes that survived, and use the
new color if necessary. The failing leaf now fits with d unused
colors. This would color the whole graph with K=chi(G)-1 colors.

## Excluding a bad cut at chi at most seven

Write L for the total number of leaf connectors. The private
failure of a leaf has at least L classes on S: L-1 singleton
classes plus the nonsingleton class of its own connector. Together
with the unused d-1 colors this gives K>=L+d-1>=6.

Suppose K=6. Then L=6, d=1, and the two required trees each have
exactly three leaves. A tree with three leaves has a single
vertex of degree three and all other nonleaves have degree two.
Since a leaf cannot neighbor a degree-two vertex, each tree
is a three-leaf star.

In every private leaf failure there are exactly six classes,
no unused color, and every nonleaf connector lies in the
nonsingleton class of the unique failing leaf connector.
The set of nonleaf connectors is nonempty, independent, and
anticomplete to every leaf connector, by taking each private
failure in turn. There are no branches outside the two stars:
every class of a private leaf failure includes a leaf connector,
and all six leaf connectors are complete to any such exterior
branch, which therefore could not extend at p=0.

Each star center has size two. The lower bound d+1 gives two;
in a private failure at one of its leaves, the center has only
two usable singleton classes, because the nonsingleton class of
the failing leaf connector contains a nonleaf connector and
hence is not contained in the center's exception set.

If there are two nonadjacent leaf connectors within a star,
use one class for that pair and a singleton class for each of
the four other leaf connectors. Place the entire independent
set of nonleaf connectors into the class of one leaf connector
of the opposite star. Now p=1, so all leaves fit. Each center
still has at least one singleton incident connector, and the
unused color plus this singleton class color its two vertices.
This colors the whole graph, a contradiction.

Otherwise the six leaf connectors form a clique, by the
cross-tree adjacency result above. For a private failure
of either center there are necessarily six classes and p=0.
But there is at least one nonleaf connector, which must share
a class with a leaf connector. That leaf cannot extend. This
contradicts privacy and finishes the exclusion at K=6.

This argument does not settle the higher-chromatic cases:
at K>=7 private failures can have classes containing no leaf
connector. Nor does the cut inequality on its own settle the
remaining forbidden-graph classification or Erdős Problem 640.
