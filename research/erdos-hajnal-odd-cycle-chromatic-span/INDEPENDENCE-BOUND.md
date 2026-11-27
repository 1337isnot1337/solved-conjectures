# A linear independence bound for critical graphs avoiding a path and isolates

For integers ell >= 2 and k >= 2, every k-vertex-critical
(P3 + ell P1)-free graph G satisfies

    alpha(G) <= max(ell+1, (ell-1)(k-1)),
    |V(G)| <= k max(ell+1, (ell-1)(k-1)).

For ell=3 and k=4 the first bound strengthens to alpha(G)<=5,
and hence |V(G)|<=20. These statements do not assert traceability.

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

## The four-chromatic six-branch boundary

Suppose ell=3, k=4 and s=6. The inequality forces d=1.
Deleting a singleton branch gives three colors, all appearing
on connectors. They can color at most six surviving branch
vertices. Thus the original union of the six branches has at
most seven vertices: either all singleton, or one two-vertex
branch and five singleton branches.

In the latter case, delete any singleton branch vertex v.
Every connector color appears in exactly two of the surviving
branches, so every connector is complete to the deleted
singleton branch. Vary v over the five singleton branches.
Every connector would then be complete to all five, although
its color must appear in two distinct surviving branches, a
contradiction.

All six branches are therefore singletons. For each deletion
of a branch vertex v, the three colors split the other five
branch vertices into parts of sizes 2, 2 and 1. In particular
every connector misses at least one branch vertex. It cannot
miss exactly one, since deleting that vertex gives a coloring
in which its color still needs to appear at a branch vertex.
Hence every connector misses exactly two. Write down its
unordered pair of misses.

Fix v. Any pair containing v must have its other endpoint
in the unique one-vertex color part, so each vertex belongs
to at most one distinct pair. The pairs form a matching.
Each deletion coloring uses two of the pairs as two-vertex
parts and meets the last surviving vertex with the one-vertex
part. The connector in the color of the one-vertex part must
omit it as well, proving that the pairs cover all six vertices.
In a deletion coloring the connectors with the same omission
pair must have the same color: the two pairs not incident
with v are the two-vertex parts, and the incident pair uses
the one-vertex part. Therefore each of the three connector
groups is independent. Assign each group a different color
and give both vertices of its omitted pair the same color.
That properly colors all of G with three colors, a contradiction.
