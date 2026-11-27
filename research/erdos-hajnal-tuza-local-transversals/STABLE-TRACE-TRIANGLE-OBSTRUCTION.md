# A stable obstruction to small trace triangles

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
This strengthens [the linear-triangle obstruction](FORBIDDEN-LINEAR-TRACE-TRIANGLES.md)
from exact pair overlaps to a linear-sized range above them.

Suppose the local span condition holds, \(\tau>t\),
\(m=t+s\) is the minimum pair intersection, and
\(r=5t+3s-2\) is saturated in the near-threshold range.
For an edge \(A\), let \(E_1,E_2,E_3\) be minimum neighbors
whose traces \(Y_i=A\cap E_i\) have empty triple intersection.
Assume \(|Y_i\setminus Y_j|\ge s\) for distinct \(i,j\).
Write \(|Y_i\cap Y_j|=s+k_{ij}\) and \(K=k_{12}+k_{13}+k_{23}\).
The exact cut rule implies all \(k_{ij}\ge0\). Then necessarily
\[
t\le 5s+9K .
\]
In particular, for \(s=o(t)\), three such traces with all
three pair intersections \(s+o(t)\) cannot have empty triple
intersection. This holds for every edge \(A\).

## Shared exterior and a nearly forced edge

Put \(W_i=E_i\setminus A\), \(d_{ij}=|W_i\cap W_j|\),
\(C=W_1\cap W_2\cap W_3\), \(c=|C|\), and \(d=t-c\).
By [the distinct-trace exterior bound](DISTINCT-TRACE-EXTERIOR-OVERLAP.md),
\(t-k_{ij}\le d_{ij}\le t\), so \(d\ge0\).
The four edges \(A,E_1,E_2,E_3\) have empty intersection,
and therefore \(|W_1\cup W_2\cup W_3|\ge2r-2\).
Since each \(|W_i|=r-m\), this gives
\[
\sum_{i<j} d_{ij}\le 2t+c,\qquad d\le K .
\]

For each pair define \(Q_{ij}=(E_i\cap E_j)\setminus C\).
The \(Q_{ij}\) are pairwise disjoint because the entire
triple intersection of the three edges is \(C\). With
\(S=\sum_{i<j}|Q_{ij}|\), we have
\[
3(s+d)\le S
 =3s+K+\sum_{i<j}d_{ij}-3c
 \le 3s+K+2d\le3s+3K .
\]
Assume for a contradiction that \(t>5s+9K\).
Then \(S<t\) and \(c\ge t-K>0\). Choose an edge \(D\)
avoiding \(C\), using \(\tau>t\). This edge differs
from each \(E_i\) and their four-fold intersection is
empty. Put \(q_{ij}=|D\cap Q_{ij}|\).
Exact inclusion-exclusion for the union gives
\[
\begin{aligned}
3r-2
&\le \left|D\cup\bigcup_i E_i\right|\\
&=4r-\sum_{i<j}|E_i\cap E_j|+c-\sum_i|D\cap E_i|
   +\sum_{i<j}q_{ij}\\
&\le 3r-2+2d-\left(S-\sum_{i<j}q_{ij}\right).
\end{aligned}
\]
For the last inequality, use \(|D\cap E_i|\ge m\),
\(\sum|E_i\cap E_j|=S+3c\), and the parameter identity
\(r-3m+2=2t\). In particular some point of \(\bigcup Q_{ij}\)
belongs to \(D\), because \(S>2d\).

## An opposite witness

Choose \(H\) avoiding all the \(Q_{ij}\) and \(t-S\)
points of \(C\), possible since \(S\ge d\) and \(\tau>t\).
Then \(h=|H\cap C|\le S-d\). This edge is not \(D\),
which meets a \(Q_{ij}\), nor any \(E_i\), each of which
contains two nonempty \(Q_{ij}\).

For a fixed pair write \(|E_i\cap E_j|=m+\eta\).
The family \(E_i,E_j,D,H\) has empty intersection.
Outside \(E_i\cup E_j\) its union has size at least
\(r+m+\eta-2\). But outside that pair the \(D\)-exterior
has size at most \(r-2m+s+\eta+d\), since its
intersection with \(E_i\cap E_j\) lies in \(Q_{ij}\);
the \(H\)-exterior is at most \(r-2m+h\). Subtracting gives
\[
|(D\cap H)\setminus(E_i\cup E_j)|\le d+h-s\le S-s .
\]
As \(D\) misses \(C\) and \(H\) misses every \(Q_{ij}\),
no point of \(D\cap H\) belongs to two of the \(E_i\)'s.
Every common point is therefore outside the union of at
least one of the three pairs. Summing the last bounds,
\[
m\le |D\cap H|\le 3(S-s)\le6s+9K ,
\]
contradicting the assumed range. The proof excludes
near-linear triangles, but does not establish that every
hypothetical example must contain such a triangle.
