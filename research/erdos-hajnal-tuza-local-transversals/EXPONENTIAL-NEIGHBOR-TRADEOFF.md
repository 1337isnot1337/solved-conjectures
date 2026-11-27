# Exponentially many neighbors with a controlled intersection gap

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
Each hypothetical near-threshold example has an exponential
number of simultaneous neighbors of every minimum pair if a small
additive gap above the minimum intersection is allowed. The gap
is a free parameter; the estimate is analytic and not a case search.

## Statement

Let \(r=5t+z\), \(1\le z\le t/1000\), and suppose an \(r\)-uniform
hypergraph obeys the local span condition and has \(\tau>t\).
Write \(m=t+s\) for the minimum pair intersection, and put
\(\delta=z-3s+2\). For any minimum pair \(A,B\) and any integer
\(1\le u\le t/20\), there are at least \((4/3)^u\) distinct
edges \(F\notin\{A,B\}\) such that
\[
m\le |A\cap F|,\ |B\cap F|\le m+\delta+u .
\]
In particular \(u=\lfloor t/20\rfloor\) forces exponentially
many common neighbors in an intersection interval of width at
most \((1/20+1/1000)t\). Taking smaller \(u\) gives a corresponding
exponent for a narrower interval. The theorem does not claim
exponential growth for fixing \(u\) or requiring exact minimum intersections.

## First-layer witnesses with a larger cut

Fix \(X=A\cap B\). Choose a standard witness \(E\) for an
\(s\)-cut of \(X\), and write \(U,V,W\) for its parts in the
\(A\)-wing, the \(B\)-wing, and outside \(A\cup B\), respectively.
Choose any \(S\subseteq X\setminus E\) of size \(s+u\); this is
possible since \(|X\setminus E|\ge t\) and \(s+u<t\).
For every \(u\)-set \(T\subseteq U\), choose a witness \(F\)
avoiding \((X\setminus S)\cup T\), a set of exactly \(t\) points.
It is not \(A,B,E\), since all three meet \(X\setminus S\).
Write \(U_F,V_F,W_F\) for its respective parts. Its
\(X\)-residue lies in \(S\), disjoint from \(E\cap X\),
so the local condition on \(A,B,E,F\) gives
\[
|W\cup W_F|\ge r+m-2.
\]
The standard witness bound \(|W|\le r-2m+s\) implies
\(|W_F|\ge 3m-s-2\). Write \(\alpha_F,\beta_F\) for the
nonnegative excesses of \(|A\cap F|,|B\cap F|\) above \(m\).
Inclusion-exclusion gives
\[
|W_F|=r-2m-\alpha_F-\beta_F+|F\cap X|,
\]
so \(\alpha_F+\beta_F\le\delta+u\). The same union estimate
and the bounds \(|W_F|\le r-2m+s+u,\ |W|\le r-2m+s\)
give \(|W\cap W_F|\le\delta+u\).

## Transfer the two-wing balance to the larger cut

Let \(a=|U\cap U_F|\), \(b=|V\cap V_F|\). We claim
\[
|a-b|\le 3\delta+2u+5z+\sqrt{7t\delta}.
\]
The argument pivots from \(A,E\), not from the larger-cut
edge \(F\), so the pivot slack stays small.
Set \(Y=A\cap E\), \(\alpha=|Y|-m\), \(k=s+\alpha\le z\),
and \(n=|U|\ge t\). For every \(k\)-set \(R\subseteq U\)
choose an edge \(G_R\) avoiding \(Y\setminus R\), and put
\(P_R=G_R\setminus(A\cup E)\). By the unchanged estimates in
[Two-wing balance](TWO-WING-BALANCE.md), we have
\[
|P_R\cap(B\setminus(A\cup E))|\le\delta,\qquad
|P_R\cap P_{R'}|\le2\delta\quad(R\cap R'=\varnothing).
\]
Let \(J=W_F\setminus W\), \(D=|J|\). Since \(G_R\) meets
\(F\) in at least \(m\) points (also true if equal), count
their common parts. Within \(A\), the count is at most
\[
|F\cap X|+|U_F|-a+|R\cap U_F|
  =m+\alpha_F-a+|R\cap U_F|.
\]
Within \(B\setminus A\) it is at most \(b+\delta\);
within \(W\) it is at most \(\delta+u\);
and all remaining common points are in \(P_R\cap J\).
Consequently, for \(Q=\mathbb E_R |P_R\cap J|\),
\[
Q\ge a-b-3\delta-2u-ka/n.
\]
Apply the Kneser indicator inequality from
[Near-threshold petals](NEAR-THRESHOLD-PETALS.md)
on the \(k\)-sets of \(U\), with the indicators of
membership of points of \(J\) in \(P_R\). The common
exterior bound at disjoint cuts gives
\[
Q^2\le D\bigl[(1-k/n)2\delta+(k/n)Q\bigr],
\qquad
Q\le Dk/n+\sqrt{2D\delta}.
\]
The bounds \(a\le n\), \(k\le z\), \(n\ge t\) and
\(D\le r-2m+s+u\le 7t/2\) imply the claimed one-sided
estimate. Exchanging \(A,B\) proves the opposite one.

The pair \(E,F\) intersects in at least \(m\) points, none in
\(X\), and at most \(\delta+u\) exterior points, so
\(a+b\ge m-\delta-u\). Under the stated ranges we get
\[
a\ge \tfrac12\bigl(t-4\delta-3u-5z-\sqrt{7t\delta}\bigr)>t/3.
\]
Indeed the losses are at most
\((4/1000+3/20+5/1000+\sqrt{7/1000})t<t/3\).
The standard witness also has \(|U|\le t+\delta\), so
\(a>|U|/4\).

## Count the edges

Every \(u\)-set in \(U\) has at least one eligible witness
\(F\) missing it. Each such \(F\) uses more than a quarter
of \(U\), so the fraction of \(u\)-sets of \(U\) it misses
is at most \((3/4)^u\), by sequential sampling without
replacement. Covering all the \(u\)-sets therefore takes
at least \((4/3)^u\) eligible edges. Every selected edge
has both intersection excesses at most \(\delta+u\), as
proved above. No fixed core, wing separation, or numerical
case is assumed.
