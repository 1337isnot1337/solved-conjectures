# Structure of the remaining path-perfectness case

The remaining graph in the single-forbidden-graph classification
is a three-vertex path plus three isolated vertices. This note
reduces it to a restricted separator-and-coloring problem; it
does not assert the outcome.

## A cluster graph with at most two exceptions per connector

Let G be a vertex-critical graph avoiding the forbidden graph,
and let I be a maximum independent set of size s. The previously
credited independence-four result handles s <= 4, so assume s >= 5.
Every x outside I has a neighbor in I. If x has at least two
neighbors in I, call x a connector. Otherwise put it in the branch
C_i of its unique neighbor i, along with i itself.

Every C_i is a clique. Two nonadjacent vertices in C_i other
than i would form the path with center i, and three other
vertices of I would be independent and anticomplete to it.
Distinct branches are anticomplete. An edge between light
vertices in two different branches creates a path beginning at
one of their two representatives, while three other representatives
are independent and anticomplete to it.

Write S for the connectors. Every x in S is complete to all but
at most two branches. In fact x touches at least two branches.
If it has at least three incomplete branches and at least two
complete ones, take one vertex from each of two complete
branches as the neighbors of x on a three-vertex path. Choose
a nonneighbor from each of three incomplete branches as the
isolates. If x has at most one complete branch instead, choose
any two distinct touched branches for the path. At least three
of the s >= 5 other branches can be made incomplete by using
the complete branch as one of the two touched branches if
there is one. Again choose a nonneighbor in each of three
such branches. Both cases are forbidden.

This also applies to any minimal separator violating weak
toughness, not just the maximum-independent-set decomposition.
If an inclusion-minimal S leaves at least |S|+2 components,
adding back any member of S must merge at least three components.
The graph has no cut vertex by the standard coloring gluing
argument, so there are at least five components. Each component
is a clique because a connected nonclique contains an induced
three-vertex path and three other components provide the isolates.
The same two-exception argument applies to the components.

## Color states and omissions

Given a separator with clique branches and at most two incomplete
branches per connector, define E_C to be the set of vertices of S
that are not complete to branch C. A candidate coloring with
K = chi(G)-1 colors determines a partition P of S into independent
color classes, with p = K-|P| unused colors. A branch C is
extendible precisely when its vertices can match at least
|C|-p distinct existing color classes to distinct vertices,
where a class can be matched to a vertex only if they are
anticomplete. The remaining branch vertices can then take
distinct unused colors. Every matched class must be contained
in E_C.

The nonextendible partition sets for the branches form a minimal
cover of the valid partitions of S: they cover because the whole
graph is not K-colorable, and each branch has a private partition
obtained by deleting one of its vertices. There is at most one
branch with no exceptional connector, since two such branches
have nested nonextendible sets. For any fixed x, there is also
at most one branch with E_C={x}. Such a clique can use at most
one existing class, and it can use that class exactly when {x}
is a singleton class of P. Thus the sets for two branches with
the same singleton exception are nested by clique size.

Represent the exception incidences by a multigraph on the
branches. Each connector with two exceptions becomes an edge
between them, and each with one exception becomes a stub at
that branch. A connector with no exception is not represented.
A connected component with more branches than its edges plus
stubs must be a tree without stubs: connectivity requires at
least one fewer edge than vertices, and there is no room for
another edge or stub. Any candidate bad cut therefore requires
at least two of these tree components, counting an isolated
zero-exception branch as a tree. A tree consisting of two
branches and one edge is impossible by the singleton-exception
argument. Thus a putative violation must include at least one
larger tree of exceptional incidences.

This leaves two distinct tasks: decide whether enough tree
constraints can all be irredundant in the coloring-state cover,
and, even if not, find a spanning-path construction when weak
toughness holds. Weak toughness by itself is not in general
a certificate of traceability. The palette matching formulation
keeps the number of unused colors explicit; assuming it is
fixed across private witnesses is not justified.

## Further restrictions on every bad cut

In fact a bad cut cannot have a branch with no exceptional
connector, and every excess tree has at least four branches.
To see this, first note that there is at least one nontrivial
tree among the two required trees: there is at most one
zero-exception branch, and two-branch trees are impossible.
Each leaf of a nontrivial tree has exactly one exceptional
connector.

More generally, consider any two branches with singleton
exception sets, not necessarily with the same connector.
If their clique sizes are unequal, write d for the greater
size. Any partition extending to the larger branch must
have p >= d-1, enough unused colors for the smaller branch
with no other condition. That smaller branch would have no
private failure, a contradiction. Thus all singleton-exception
branches have the same size d. A branch with zero exceptions
requires p at least its size. If that size is at most d-1
then any singleton-exception branch implies its constraint;
if it is at least d then it implies every singleton-exception
constraint. Either contradicts minimality.

For a tree on three branches, its two leaves have size d.
Let their exceptional connectors be x and y, the only
exceptional connectors of the central branch as well.
If the central branch has at most d vertices, it fits
whenever both leaves fit: either p >= d or p=d-1 and
both x and y are singleton color classes. At least one
singleton class can then color a vertex of the center.
So the center would have no private failure.

If the central branch has at least d+1 vertices, take a
private failure of the leaf associated with x. The fact
that the other leaf fits gives p >= d-1. The private
failure gives p=d-1, y singleton, and x nonsingleton.
Then no color class except {y} can be contained in {x,y}.
The center has at most d available colors, so it also
fails. This is again a contradiction. Consequently the
exception multigraph of a minimal weak-toughness violation
must contain at least two stub-free trees, each with at
least four branches, and all their leaves have the same
clique size. These restrictions are independent of the
order and chromatic number of the host graph.
