# Shared-padding barrier above the minimum core rank

This advances [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019)
for a wider dense-core class. In particular it treats the
rank-plus-one parity core from [the larger-core note](LARGER-CORE-PADDING.md),
which has no fixed minimum-rank dense core. Padding may be
shared arbitrarily, and even three-wise intersection inside
the chosen core need not be assumed.

**Theorem.** Let \(\mathcal F\) be \(r\)-uniform with the local
span condition. Write \(r=5t+z\) with \(z\ge1\). Suppose
\(a\ge h\ge0\). Put \(D_0=\max(0,a-2h)\) and
\(J_0=\max(0,a-4h)\). If
\[
t\ge8z+4h+8D_0+4J_0
\]
and some fixed \((3t+1+a)\)-set meets every edge in at
least \(2t+1+h\) points, then \(\tau(\mathcal F)\le t\).

## Minimum pair and the core bookkeeping

Suppose \(\tau>t\). Take a minimum pair \(A,B\), let
\(X=A\cap B\), and use the
[near-threshold petal bounds](NEAR-THRESHOLD-PETALS.md):
\[
 |X|=t+s,\quad 1\le s\le\lfloor(z+2)/3\rfloor,\quad
 \delta=z-3s+2\ge0 .
\]
These apply since \(r\le(11t+1)/2\).
Put \(k=2t+1+h\), \(\gamma=a-h\), \(X_0=X\cap M\),
\(e=|X\setminus M|\), \(c=|M\setminus(A\cup B)|\), and
\(d_A=|A\cap M|-k,\ d_B=|B\cap M|-k\). Then
\[
 s=1+2h-a+e+c+d_A+d_B,\qquad e+c\le s-1+D_0 .
\]
Every edge omits at most \(t+\gamma\) points of \(M\).

Write \(\zeta=z+J_0\).
Fix a \(\zeta\)-set \(Z\subset X_0\) and extend it to a \(t\)-set
\(T\subset M\) with \(T\cap X_0=Z\), possible since
\(|X_0|\ge t+1-D_0\) and \(|M\setminus X_0|\ge2t+1+a-s\).
Pick \(U\) avoiding \(T\). The \(s\)-cuts
\(S\subseteq X_0\setminus Z\) have ground size
\(N=|X_0\setminus Z|\ge t+1-\zeta-D_0>2s\), so each has a
disjoint partner. For each \(S\) choose an edge \(E_S\)
avoiding \(X\setminus S\), with exterior petal
\(W_S=E_S\setminus(A\cup B)\). The bounds give
\[
 |W_S|\ge3t+2s-2,\qquad |W_S\cap W_{S'}|\le\delta
 \quad\hbox{when }S\cap S'=\varnothing .
\]

## Every petal must use the same edge's padding

Write \(E=E_S\) and \(R=M\setminus E\).
It contains \(X_0\setminus S\), so
\[
 t-e\le|R|\le t+\gamma,\qquad |R\cap T|\le \zeta+e+\gamma .
\]
Take a \((t-\zeta)\)-set \(P\subset M\setminus(R\cup T)\)
and choose \(F\) avoiding \(Z\cup P\). There are enough
points for \(P\), since \(|R\cup T|\le 2t+\gamma\).
All three of \(U,E,F\) omit \(Z\). Their common set
\(Q\) inside \(M\) has size at most
\[
 |M|-|T\cup R\cup P| \le 1+a+2e+\gamma+2\zeta=:Q_0 .
\]
Let \(C=(U\cap E\cap F)\setminus M\) and \(j=|C|\).
If \(j\le t-Q_0\), choose an edge \(D\) avoiding
\(Q\cup C\) and as many points of \(Z\) as possible
with at most \(t\) forbidden points. We have
\(Q_0+\zeta\le1+3h+4D_0+2(z-1)/3+3\zeta\le t\).
Thus \(D\) omits at least \(\zeta-j\) members of \(Z\)
when that is positive. The collected edges have empty
intersection, core union at most \(|M|-\zeta+j\), and
outside union at most \(4(r-k)-2j\). The last estimate
also holds if some of the chosen edges coincide: the
sum counts each point of \(C\) at least three times
with multiplicity. Consequently their span is at most
\[
 |M|-\zeta+4(r-k)-j=3r-3+a-4h-J_0-j\le3r-3 ,
\]
a contradiction. It follows that \(j\ge t-a-2e-\gamma-2\zeta\).

Any part of \((E\cap U)\setminus M\) not in \(W_S\) lies
in \((A\cup B)\setminus M\). The number of such points
is at most
\[
 r-|W_S|-(k-c)\le z-2s+1-h+c .
\]
Subtracting this from the lower bound on \(j\), using
\(s-e\ge1+2h-a+c\), gives
\[
 |W_S\cap(U\setminus M)|\ge t-z-2\zeta+1+6h-4a+c
 \ge b_0:=t-3z-2h-4D_0-2J_0+1>0 .
\]

## Contradiction from the disjoint-cut incidence bound

All these parts lie in \(U\setminus M\), of size
\(L\le3t+z-1-h\). The Kneser incidence inequality from
the petal note, with cut ground size \(N\) and pair
intersection bound \(\delta\), gives
\[
 L\ge\frac{b_0^2}{(1-s/N)\delta+(s/N)b_0}
 \ge\frac{b_0^2}{z}.
\]
Here \(b_0\le N\) and \(\delta+s\le z\).
But with \(d=2h+4D_0+2J_0-1\) and \(t-8z\ge2d+2\),
\[
\begin{aligned}
b_0^2-z(3t+z-1-h)
 &= (t-z)(t-8z)-2d(t-3z)+d^2+z(h+1)\\
 &\ge 2t+(4d+h-1)z+d^2>0,
\end{aligned}
\]
since \(d\ge-1\) and \(t\ge8z\). This is the required contradiction. Notice that the
same fixed \(U\) was used for every \(S\).

For the parity core \(a=2,h=1\), the theorem forbids
arbitrary shared-padding improvements throughout
\(8z+4\le t\) despite failure of minimum-rank rigidity.
If there is no extra core width beyond \(a=2h\), the bound
is \(8z+4h\le t\); for wider cores the displayed linear penalty
accounts for the additional room in the minimum-pair intersection.
The unrestricted conjecture remains open: a general
near-threshold family has not been shown to admit any
such fixed near-minimum dense core.
