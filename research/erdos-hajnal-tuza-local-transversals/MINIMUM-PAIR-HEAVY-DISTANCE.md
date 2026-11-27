# Heavy edges are forced in the minimum-pair graph

A further structural condition for [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The minimum-rank obstruction propagates along the graph
of minimum-intersection pairs; it is not just a statement
about all edges of the family taken together.

Let \(\mathcal F\) satisfy the local span condition and
\(\tau(\mathcal F)>t\), with minimum pair intersection
\(m=t+s\), \(t>s\ge1\), and saturated rank \(r=5t+3s-2\).
Call a vertex **shared** if it belongs to at least two
edges of \(\mathcal F\), and an edge **heavy** if it
contains at least \(2t+2\) shared vertices. Form the graph
whose vertices are edges of \(\mathcal F\), adjacent
when they meet in exactly \(m\) points. If
\[
 r<5t+1+\left\lfloor(t-1)/3\right\rfloor,
\]
then every adjacent pair in this graph is at distance
at most \(2t+1\) from a heavy edge, measured from the
nearer endpoint. If \(s\ge2\), distance one suffices
and that assertion does not need the strict inequality
on \(r\).

## Minimum pairs generate more minimum pairs

Given a minimum pair \(A,B\), put \(X=A\cap B\). For
any \(s\)-set \(S\subset X\), take an edge \(E\) avoiding
\(X\setminus S\), which has size \(t\). A disjoint \(s\)-cut
exists since \(m>2s\). The
[petal inequality](NEAR-THRESHOLD-PETALS.md), §2,
then gives \(|E\setminus(A\cup B)|\ge3t+2s-2\).
Since \(|E\cap X|\le s\) and \(E\) meets each of \(A,B\)
in at least \(m\) points, the equality
\(r=5t+3s-2\) forces
\[
 |E\cap A|=|E\cap B|=m,\qquad E\cap X=S.
\]
Thus the witness is adjacent to both old edges. The
union of its two overlaps consists of \(2m-s=2t+s\)
shared vertices. This proves the assertion for \(s\ge2\).

## Light components cannot realize the closure

It remains to take \(s=1\), \(r=5t+1\). Every edge has
at least \(2t+1\) shared vertices, by the rank lower
bound for 3-wise intersecting families after deleting
private vertices. Suppose all edges at distance at
most \(2t+1\) from the starting pair are light. Both
starting edges have projections to the shared vertices
of size exactly \(2t+1\). Their projections together
cover a set \(M\) of size \(3t+1\). Their two complements
in \(M\) are disjoint \(t\)-sets.

Any minimum adjacent light pair whose projections are
complements in \(M\) of disjoint \(t\)-sets can generate
a new complement as follows. Choose any \(t\)-set \(T\)
in their common \(t+1\) points. The witness avoiding \(T\)
is adjacent to both. If it is light, the union of its two
overlaps consists of exactly its \(2t+1\) shared vertices.
Since each old projection can omit no additional
points while meeting this witness in \(t+1\) points,
the new projection is exactly \(M\setminus T\).

Starting with the two old omissions, take a new
omission block \(R\) disjoint from them, leaving a
single spare point. In any such state of three disjoint
\(t\)-blocks, hold two fixed and use the rule to swap
any element of the third with the spare. This takes
one new edge adjacent to two of the current edges.
To place any desired \(t\)-set into one designated
block, use at most two swaps per desired element:
if the element is not spare, first swap it out of
its current block; then swap it in for a wrong
element of the designated block. All newly used
edges are at distance at most \(1+2t\) from the original
pair, so they are light by the supposition. We can
restart this argument for each desired omission.

In particular, generate the four distinct omissions
in the [minimum-rank span witness](MINIMUM-RANK-RIGIDITY.md)
whose union is \(M\) and whose common intersection has
size \(\lfloor(t-1)/3\rfloor\). Their representative
original edges have no common vertex: outside \(M\)
they are private because the generated projections
include all of their shared vertices. These four edges
have union at most \(3r-3\) by the strict inequality on
\(r\), a contradiction. A heavy edge must therefore be
within the claimed distance.

This supplies a restriction on the placement of
higher-rank edges in the extremal structure. It does
not show that a nearby heavy edge is itself impossible.
