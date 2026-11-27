# A linear independence bound for critical graphs avoiding a path and isolates

For integers ell >= 2 and k >= 2, every k-vertex-critical
(P3 + ell P1)-free graph G satisfies

    alpha(G) <= max(ell+1, (ell-1)(k-1)),
    |V(G)| <= k max(ell+1, (ell-1)(k-1)).

For ell >= 3, the term (ell-1)(k-1) in both bounds can be
replaced by (ell-1)(k-1)-1. For example ell=3 and k=4 gives
alpha(G)<=5 and |V(G)|<=20. These statements do not assert
traceability.

## Relation to earlier work

[Abuadas, Cameron, Hoang and Sawada](https://arxiv.org/abs/2206.03422),
Lemma 2.1, prove independence number strictly less than
(k-1)^2(ell+3) and derive finiteness in Theorem 2.9.
Their proof also supplies the starting maximum-stable-set
decomposition below. The stronger count uses the full clique
branches, not just their representatives. The elementary search
for references located that finiteness theorem, not the linear
bound or the equality exclusions proved here.

## Counting colors that occur on a connector

Let I be a maximum independent set, of size s >= ell+2.
Every vertex outside I has an I-neighbor. Place each vertex with a
unique I-neighbor i into the branch of i, and include i itself.
Place all other vertices in the connector set X. Each branch is a
clique: two nonadjacent vertices with unique neighbor i, together
with i and ell other representatives, would induce the forbidden
graph. The branches are pairwise anticomplete: an edge between
light vertices of the branches of i,j forms a three-vertex path
with i, and we can choose ell isolates in I-{i,j}. A representative
has no neighbors in other branches by their definition.

Every connector is complete to all but at most ell-1 branches.
Otherwise form a three-vertex path centered at the connector, with
its neighbors chosen from two touched branches. If at least two
branches are complete, use two complete ones, leaving at least ell
incomplete ones. If fewer than two are complete, use every complete
branch and fill the remaining positions with touched branches.
There are at least two touched branches because a connector has two
neighbors in I. This leaves s-2 >= ell incomplete branches. In
either case one nonneighbor from each of ell remaining incomplete
branches supplies the isolates.

Let d be the smallest branch size. Delete one vertex v of a
minimum branch and properly color G-v with K=k-1 colors. All K
colors occur in N(v), by vertex criticality. The d-1 adjacent
vertices in v's branch use d-1 distinct colors; each of the other
K-d+1 colors occurs on a connector. A color that occurs on any
connector meets at most ell-1 branches, since it needs a nonneighbor
in each, and appears only once in each. Each of the s-1 other
branches has at least d vertices, and so uses at least one such
color. Thus

    s-1 <= (ell-1)(K-d+1).

The only way this allows s>(ell-1)K is if d=1 and
s=(ell-1)K+1. Every color then occurs on a connector, and the
capacity of all K colors is exactly s-1 branch vertices. All branches
must be singletons. In every coloring obtained by deleting a branch
vertex v, each color occurs on exactly ell-1 other branch vertices.
Every connector in that class must omit exactly those ell-1
vertices from I, and so must be adjacent to v. This applies with
every v in I, contradictory because connectors have omissions and
at least one connector exists (G is connected). This proves the
independence bound. Any proper k-coloring gives the order bound.

## Excluding the next equality for every ell >= 3

Put r=ell-1>=2. It remains to exclude s=rK when s>=ell+2.
The capacity inequality s-1<=r(K-d+1) forces d=1. Deleting
a singleton branch leaves at most rK branch vertices because
every color appears on a connector. The branch union originally
has at most s+1 vertices, so all branches are singletons
except possibly a single two-vertex clique.

If such a clique exists, delete a singleton branch vertex v.
There are exactly rK surviving branch vertices, and each
color class meets exactly r distinct branches. Thus every
connector is complete to v: its omission budget of r branches
is already exhausted on survivors. Varying v proves every
connector complete to all singleton branches, impossible
since a connector's color appears in r>=2 surviving branches
while only one branch is not a singleton.

All s branches are therefore singletons. In a coloring after
deleting v in I, the K colors partition the surviving rK-1
vertices of I into K-1 parts of size r and one part of size
r-1, and every color appears on a connector. Every connector
has a nonempty omission set in I, since it shares its color
with at least r-1>=1 surviving representatives. If its omission
set has size at most r-1, delete a vertex it omits. In this
coloring its share of surviving omissions is at most r-2,
too small for even the smallest part. Hence every connector
omits exactly r representatives.

For any v, all connectors omitting v must use the unique
smaller part after deleting v. Their omission sets are
therefore identical: each consists of v and the r-1 vertices
in that color part. Thus the distinct omission sets are
pairwise disjoint. Choose any of them and two of its members
(which exist since r>=2). Those two representatives are
nonadjacent and have identical neighbors in X, because every
connector either omits both or sees both. They have identical
open neighborhoods in G. Two such vertices violate criticality:
in a coloring after deleting one of them, reinsert it with
the color of the other. This excludes s=rK and completes
the strengthened bound simultaneously for every ell>=3.
