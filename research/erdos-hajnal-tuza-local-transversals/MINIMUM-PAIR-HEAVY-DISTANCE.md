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
at most six from a heavy edge, measured from the
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
most six from the starting pair are light. Both
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
Write the three original blocks as \(P,Q,R\) and the
spare as \(x\). Choose \(p\in P,q\in Q,u\in R\).
Starting each time from the same state, one swap gives
each of \(P-p+x,\ Q-q+x,\ R-u+x\). Their union covers
everything except \(p,q,u\). The strict threshold
assumption at \(r=5t+1\) implies \(t\ge4\). For the
fourth block, take \(x,p,q,u\) and any \(t-4\) other
points of \(P\). Starting again from the original state,
put \(x\) in the designated block \(P\) in one swap.
Putting \(q\) and \(u\) there each takes at most two
more swaps: first move the desired point to the spare
position, then swap it in for a point outside the
target. Keep every already-correct point in \(P\).
The first auxiliary block \(R\) takes one step from
the starting pair, and the longest subsequent sequence
takes five swaps. Thus the maximum distance is six,
and all the used edges would be light.

The four omissions are distinct, cover \(M\), and
their common intersection is exactly \(\{x\}\).
The corresponding original edges have outside-\(M\)
parts of size \(3t\), disjoint because they are private.
Their intersection is empty and their union has size
\(3t+4(3t)=15t=3r-3\), a contradiction. A heavy edge
must therefore be within the claimed distance.

This supplies a restriction on the placement of
higher-rank edges in the extremal structure. It does
not show that a nearby heavy edge is itself impossible.
