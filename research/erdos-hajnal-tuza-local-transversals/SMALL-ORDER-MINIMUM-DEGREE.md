# The smallest hypothetical examples have minimum degree four

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
At the moving first jump, equality in the elementary order
bound forces every vertex to belong to at least four edges.
There is also an explicit bound on low-degree vertices if
the ground set is close to equality.

Suppose \(r=5t+1\), \(t\ge6\), the local span condition
holds, and \(\tau>t\). Let \(3t^2+12t+1+h\) be the number
of vertices incident to edges. At most \(4(2t+3)h\) of these
vertices have degree at most three. More sharply, at most
\((4+2/t)h\) are private (degree one), improving the
[private-vertex bound](SMALL-ORDER-NO-PRIVATE-VERTICES.md).

## A degree obstruction inside a primary petal

Fix a minimum pair \(A,B\), let \(X=A\cap B\), and choose
one primary singleton witness \(E_y\) per \(y\in X\).
Write \(U_y=E_y\cap(A\setminus B)\),
\(V_y=E_y\cap(B\setminus A)\), and
\(W_y=E_y\setminus(A\cup B)\). For each \(y\), choose
one secondary singleton witness per cut in \(U_y\)
for the pair \(A,E_y\), and one per cut in \(V_y\)
for \(B,E_y\). Refer to these as the two systems at
pivot \(y\).

The exterior petals of each such system cover all but
\(h\) vertices outside \(A\cup B\cup E_y\).
Indeed, for the pair \(A,E_y\) the omitted singleton cut
\(y\) can be assigned to \(B\), and the other \(t\) petals
cover \(3t^2\) points disjoint from its petal and from
\(A\cup E_y\). Thus the complement outside \(A,B,E_y\)
has size \(3t^2+h\). The same argument works on the
other side.

Take a vertex \(v\in W_x\), and consider \(y\ne x\).
A secondary edge containing \(v\) on either side
must omit \(y\), since its cut is in \(U_y\) or \(V_y\).
It cannot be \(E_x\): the [two-wing balance](TWO-WING-BALANCE.md)
between primary witnesses for \(x,y\) ensures both wing
intersections are at least \(\lceil(t-3)/2\rceil\ge2\).
For the same reason, **every** secondary edge containing
\(v\) has at least two points in \(X\). If it had just
one, it would be a standard singleton witness for
\(A,B\). Its cut would have to be \(x\), because its
exterior contains \(v\) and petals for different cuts
are disjoint. Two-wing balance would again preclude
either secondary role at \(y\ne x\).
Every edge has at least one point in \(X\), by the
pair-transversal rule.

If a secondary edge \(F\) occurs on both sides of the
same pivot \(y\ne x\), then \(|F\cap X|=t\).
Indeed the \(A\)-side witness has \(F\cap(B\setminus A)
\subseteq V_y\): its exterior relative to \(A,E_y\)
is disjoint from that of the singleton witness \(B\)
on cut \(y\). On the \(B\) side it has just one point
in \(B\cap E_y\), in \(V_y\). Thus \(|F\cap(B\setminus A)|=1\).
Since \(F,B\) are minimum adjacent, \(|F\cap X|=t\).
In this case \(y\) is the only point of \(X\) it omits,
so \(F\) cannot serve in either secondary system at
any other pivot.

Now suppose \(v\) has degree at most three, including
its primary edge \(E_x\). If both systems at every
\(y\ne x\) covered \(v\), they would have to use at
most two other edges. If one edge served both sides
at some \(y\), the only remaining edge would have
to serve both sides of each of the \(t-1\) other pivots.
This is impossible because \(t-1\ge2\). Thus all pivots
would use the two other edges on opposite sides.
Each would omit every \(y\ne x\), giving at most one
point of \(X\) and contradicting the previous paragraph.
Therefore some system at a pivot other than \(x\)
omits \(v\).

## Count low-degree vertices

There are \(2(t+1)\) systems and each has only \(h\)
omissions outside its pair and the third base edge.
The preceding proof charges every degree-at-most-three
vertex of the primary petals to at least one omitted
point. The primary petals themselves omit only \(h\)
points outside \(A\cup B\). Thus at most \((2t+3)h\)
low-degree vertices lie outside any minimum pair.

There are four edge-disjoint pairs in the minimum-pair
graph, where the graph vertices are hyperedges. Choose
distinct primary \(E_y\)'s for four different pivots.
At each of those pivots there are \(t\) distinct \(A\)-side
secondaries, none equal to a primary witness, \(A\), or
\(B\) (by the two-wing bound just used). Choose one new
secondary greedily for each, giving four distinct pairs
\((E_y,F_y)\) with no repeated hyperedge. A ground-set
vertex of degree at most three is absent from both
members of at least one of these four pairs. Summing
the outside bound over the four pairs proves the claim.

For a private \(v\in W_x\), **every** \(A\)-side system
at \(y\ne x\) omits \(v\), since \(E_x\) is not a valid
secondary there and no other edge contains it. Counting
these \(t\) charges per private vertex gives at most
\((t+1)h/t\) private vertices across the primary petals,
and at most \((2+1/t)h\) outside any pair after adding
the \(h\) unrepresented points. Two hyperedge-disjoint
minimum pairs suffice for degree-one vertices, yielding
\((4+2/t)h\) in total.

This does not exhaust the all-shared equality case.
It shows such an example needs a vertex-incidence
structure of minimum degree four as well as the
earlier unique exterior partitions.

## A sharper estimate for degree at most two

For each degree-at-most-two vertex in a primary petal \(W_x\)
there is at most one nonprimary edge available for the
secondary systems. If it does not serve both sides of any
pivot, then for every \(y\ne x\) at least one system omits
the vertex. If it serves both sides of a pivot \(y\), then
it serves neither side anywhere else. That forces at least
\(2(t-1)\) omissions. In both cases there are at least \(t\)
omissions among the \(2t\) systems at other pivots.
The total count is consequently at most \(2(t+1)h/t\)
such vertices in the primary petals, and at most
\((3+2/t)h\) outside any minimum pair.
Three hyperedge-disjoint minimum pairs suffice to cover all
vertices of degree at most two in this count. Hence there
are at most \((9+6/t)h\) globally.
