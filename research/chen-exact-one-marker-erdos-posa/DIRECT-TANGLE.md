# Direct packing tangle: no fractional relaxation is needed

This is a shorter route to the parity-free result. It replaces
Sections 1, 2 and the low-rank weight counting in Section 4 of
[the first proof](PARITY-FREE-HALF-INTEGRAL.md). The rooted
grid-to-clique construction and residual-flow exchange are
unchanged. The tangle construction itself also applies to
prescribed-parity paths; the two routing outcomes still need
parity work.

Let `tau` be the minimum hitting-set size for eligible paths,
and assume that a routing of t different demands with vertex
congestion at most two does not exist. We induct on t for the
parity-free theorem; the base t=1 is immediate. Let f(t-1)
be the previously established hitting-set bound. Fix a
large constant Theta>=8t+2 such that a tangle of order Theta
controls an (8t+1)-square grid minor as in Graph Minors XVI.
Assume

    tau > max(3 Theta, Theta+(t-1) f(t-1), 5t).

## Low-order cuts have a unique component containing eligible paths

Let S have size less than Theta. At most t-1 components of
G-S can contain any eligible path, because otherwise the
paths chosen one per component form an integral routing of
different demands. If each positive component had a hitting
set of size at most f(t-1), their union together with S would
contradict the displayed bound. So a component C has
transversal larger than f(t-1), and by induction has a
congestion-two routing of t-1 different demands. No other
component can contain an eligible path, since its path would
be disjoint from that routing. Thus all eligible paths avoiding
S lie in one component.

Orient a separation (A,B) of order less than Theta with its
small side first, meaning that A minus B does not contain
this unique component. This is a tangle. Indeed no three
small sides cover the graph: the union of their separators
has size less than 3 Theta and is not a hitting set. Any
eligible path avoiding that union is entirely in the large
side off the separator for each of the three orientations,
so none of its vertices is in their small sides. No one
small side is spanning either. This orientation argument
uses only connectedness of eligible paths and the inductive
hitting-set bound for the same path constraint.

## Replace low-rank weight by a small hitting set

Take the controlled grid and pick the target set Z with
one target in each selected distinct row and column as in
the first proof. Attach private leaves for demand endpoints
after finding the grid. Let M be the terminal-to-Z gammoid
on those leaves.

If a set U of terminal leaves has rank d<4t, Menger supplies
a separator of size d between U and Z. Replace deleted leaves
by their original neighbors, giving a separator S in the
original graph of size at most d. At least one selected row
is disjoint from S and contains its target. The full clean
row lies on the large side of the controlled-grid tangle.
In particular its component in G-S is the unique component
which contains eligible paths: the separation with that
component on one side would otherwise place the clean row
on the small side. No surviving original endpoint of U
belongs to that component, since S separates U from Z.
Consequently S hits every eligible path with at least one
endpoint in U.

## Finish the matching selection

Take a maximal independent union I of whole pairs in M.
If it contains t pairs, use the grid-to-clique argument of
the first proof. Otherwise |I|<=2t-2. In M/I, discard those
selected pairs and all pairs with a loop endpoint. The
selected endpoints and the loops together lie in the
closure of I in M and thus have rank |I|. All discarded
demands' eligible paths are hit by a set of size at most |I|
by the preceding lemma.

All remaining pairs are nonloop parallel pairs in M/I.
If their endpoint union U has rank below t in M/I, it has
rank at most |I|+t-1 in M. Another application of the lemma
hits all remaining demands with at most |I|+t-1 vertices.
The two hitting sets have union size at most 5t-5, a
contradiction. Hence choose t independent representatives
in M/I, and apply the residual-flow exchange. It routes the
prescribed mates at vertex congestion two.

Taking f(t) to be the maximum in the displayed bound,
rounded up, finishes the induction without any fractional
packing or approximation theorem. This directly associates
the controlled grid with the path family being hit, not
merely with an arbitrarily chosen high-treewidth region.
