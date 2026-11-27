# The four-chromatic five-branch boundary

A four-vertex-critical (P3 + 3P1)-free graph with independence
number five has five singleton branches in the decomposition
about *any* maximum independent set I. Equivalently, every
vertex outside I has at least two neighbors in I, and in fact
at least three. Along with the [linear independence bound](INDEPENDENCE-BOUND.md)
this reduces any four-chromatic counterexample to the
remaining path-perfectness question to this dense-interface
configuration. It does not decide whether a spanning path exists.

Use I, the connector set X, and the clique branches of the
independence-bound note. Each connector is complete to all but
two branches. Write d for the minimum branch size. The counting
inequality 4 <= 2(4-d) gives d<=2.

## There cannot be five branches of minimum size two

If d=2, delete a vertex of any minimum branch. The other vertex
of this branch gives one color a; the two remaining colors
each appear on X and therefore in at most two branches. Each
of the four other branches needs one of these two colors,
so all four have size exactly two. Thus all five branches
have size two. The color a does not occur on X: otherwise
three connector colors would color nine branch vertices
with capacity at most six. Each of the other colors occurs
in exactly two of the four surviving whole branches. Every
connector must therefore be complete to the branch of the
deleted vertex, since the two branches occupied by its
color are already incomplete. We can delete a vertex in
any branch, forcing X complete to all of them, a contradiction.

## With a singleton branch, there are at most six branch vertices

For d=1, delete a singleton branch vertex v. All three
colors then occur on X, so at most six branch vertices
survive. If the branch union originally has seven vertices,
each color uses two surviving branch vertices in distinct
branches. Thus every connector is complete to the deleted
singleton branch, and the same holds for every singleton
branch by varying v. There are at least three singleton
branches when there are seven branch vertices in total.
Any surviving singleton would then be complete to X and
could not use any of the three colors, a contradiction.

## Six branch vertices are impossible

Suppose the branches are four singletons and a two-vertex
clique D. Delete any singleton v. The five surviving branch
vertices have color parts of sizes 2,2,1, with any two-vertex
part in distinct branches. All three colors occur in X.

Every singleton is omitted by at least one connector: if
a singleton vertex were complete to X then its neighborhood
would contain that of any other singleton. The two vertices
are nonadjacent, so a 3-coloring after deleting the second
could be extended by giving it the color of the first.
This contradicts criticality.

For a connector omitting a singleton v, its color after
deleting v can occur at only one surviving branch vertex:
one of its at most two omissions is v. Consequently all
connectors omitting v have exactly two omissions, and their
second omitted branch is the same, called the partner of v.
It is the branch of the one-vertex color part in the deletion
coloring. Pairing of two singletons is mutual.

Thus the number of singletons partnered with D is zero,
two or four. Zero is impossible since the two vertices of
D have distinct colors and at most one could occupy the
one-vertex part; the other would require a pair with a
singleton. Four is also impossible: when a singleton is
deleted the one-vertex part is in D, so among the two
two-vertex parts one must pair two singletons.

In the remaining case call the ordinary singleton pair
a,b and the two singletons partnered with D c,e. Delete a.
The one-vertex part is b, and the two two-vertex parts
pair c,e with the two distinct vertices of D. A connector
can only belong to one of the three resulting colors, and
doing so forces its omission set to be, respectively,
{a,b}, {c,D}, or {e,D}. In the first case this uses the
mutual partnership of b; in the other cases both branches
are needed to supply the two nonneighbors. Thus the three
connector groups have distinct colors and each is independent.
Use the same coloring and now also color a with b's color.
Every connector of that color omits a, and a has no
neighbors in the other branches. This is a 3-coloring of G,
the final contradiction.

Hence all five branches are singletons. The proof that each
connector is complete to all but two branches now gives
at least three neighbors in I. A useful exact test in this
configuration is: if X is bipartite, G is 3-colorable; otherwise
every possible 3-coloring has color parts of sizes 2,2,1 on I.
For each choice of the singleton w and the two remaining
pairs, every connector's class is forced: either its missing
pair is one of the two chosen pairs, or it omits w and must
take the singleton class. The candidate passes exactly when
all connectors are assigned and all three forced groups are
independent. This is a test of colorability, not of traceability.
