# Minimum-edge triangles cannot have a near-total common core

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This is a restriction on triangles in the graph of minimum
intersection pairs. It does not fix a fourth base edge or
assume anything about how the triple is distributed in another edge.

Suppose \(r=5t+z\), \(1\le z\le t/4\), the local span condition
holds, \(\tau>t\), \(m=t+s\) is the minimum pair intersection,
and \(\delta=z-3s+2\). If \(E_1,E_2,E_3\) are distinct edges with
all three pair intersections of size \(m\), write
\(c=|E_1\cap E_2\cap E_3|\) and \(d=t-c\). Then
\[
t\le 5s+3\delta+6d+3d_+ .
\]
In particular, when \(t>5s+3\delta\), every such triangle has
\[
c\le t-\frac{t-5s-3\delta}{9}.
\]
At the first jump this is \(c\le(8t+5)/9\) for \(t\ge6\).
Thus a sunflower of three edges whose pair intersections all
have the minimum size is excluded in this whole range.

## Proof

Let \(C=E_1\cap E_2\cap E_3\), and
\(Q_{ij}=(E_i\cap E_j)\setminus C\).
The three \(Q_{ij}\) are disjoint and each has size \(s+d\).
Put \(S=3(s+d)\). We have \(d\ge-s\).
If \(c=0\) the displayed conclusion is immediate. If
\(S+(-d)_+\ge t\), then \(d\ge0\); for \(d<0\) this quantity
is \(3s+2d\le3t/4<t\). Hence in this case
\(t\le3s+3d\) and the conclusion is again immediate.
We now have \(c>0\) and \(S+(-d)_+<t\).

Choose an edge \(D\) missing \(\min(c,t)\) points of \(C\).
It differs from each \(E_i\), and \(|D\cap C|\le(-d)_+\).
Choose \(H\) missing every \(Q_{ij}\) and \(D\cap C\),
using the remaining forbidden points from \(C\) first,
up to a total of \(t\). Such an edge exists by \(\tau>t\)
and the strict bound on \(S+(-d)_+\). It differs from every
\(E_i\), because it avoids at least one point of \(C\).
It also differs from \(D\): equality would force \(D\)
to avoid \(C\) and all \(Q_{ij}\), hence miss a pair
intersection \(E_i\cap E_j\), which is a transversal.
We have
\[
h=|H\cap C|\le(S-d)_+=3s+2d.
\]
No point of \(D\cap H\) lies in two of the \(E_i\)'s:
each such point belongs either to \(C\) or a \(Q_{ij}\).

For every \(i\ne j\), the four distinct edges
\(D,H,E_i,E_j\) have empty intersection. Their union
outside \(E_i\cup E_j\) must have size at least \(r+m-2\).
The \(D\)-exterior has size at most \(r-2m+s+d_+\),
because \(D\) meets the pair intersection in at most
\(|Q_{ij}|+(-d)_+=s+d_+\) points. The \(H\)-exterior
has size at most \(r-2m+h\). Thus
\[
|(D\cap H)\setminus(E_i\cup E_j)|
\le\delta-s+d_++h
\le\delta+2s+2d+d_+ .
\]
Every common point is counted in at least one of these
three outside intersections. Summing and using
\(|D\cap H|\ge m\) gives the claimed inequality.
When \(t>5s+3\delta\) it implies \(d>0\), and then
the asserted upper bound on \(c\) follows.

Together with the [trace-triangle obstruction](TRACE-TRIANGLES-WITH-SLACK.md)
this shows that minimum links cannot be modeled by
either near-total common cores or almost-disjoint trace
triangles lacking a common vertex. The unrestricted
optimum remains open.

## Repeated minimum traces force heavy exterior overlap

As a corollary of the complementary-witness method,
suppose \(B,B'\) are distinct minimum neighbors of a fixed
edge \(A\) with the same trace \(Y=A\cap B=A\cap B'\).
Write
\[
\rho=|(B\cap B')\setminus A|.
\]
Then necessarily
\[
\rho\ge (t+s)/3-\delta .
\]
In particular at \(r=5t+1\), duplicate traces cannot be
realized by separate private exterior paddings or even
with sublinear exterior overlap.

Indeed take \(E_1,E_2,E_3=A,B,B'\); the common core
\(C\) is \(Y\) of size \(m\), and the only nonempty
pair-exclusive region is \((B\cap B')\setminus A\),
of size \(\rho\). If \(\rho+s\ge t\), the bound
already follows from \(s\le t/4\). Otherwise choose
\(D\) avoiding \(t\) points of \(C\), then \(H\)
avoiding \(D\cap C\), the whole pair-exclusive region,
and enough additional points in \(C\) to use \(t\)
forbidden points. Thus \(|D\cap C|\le s\) and
\(|H\cap C|\le\rho+s\). The two witnesses are distinct
by the pair-transversal rule and both differ from the
three original edges. Their intersection has no point
in two of those original edges.

For a pair of original edges with full intersection
size \(m+\eta\) (where \(\eta\) is either \(0\) or \(\rho\)),
the \(D\)-exterior is at most \(r-2m+s+\eta\), and
the \(H\)-exterior is at most \(r-2m+\rho+s\).
The empty-intersection four-edge union bound, outside
the chosen pair, is \(r+m+\eta-2\). Consequently at
most \(r-5m+\rho+2s+2=\rho+\delta\) common points of
\(D,H\) are outside the pair union. The three pair
unions count all common points outside at least once,
so \(m\le3(\rho+\delta)\), as required.
