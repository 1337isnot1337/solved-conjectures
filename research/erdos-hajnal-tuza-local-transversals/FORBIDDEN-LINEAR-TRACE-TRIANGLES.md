# Linear trace triangles are forbidden near saturation

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The earlier [linear-clique argument](LINEAR-TRACE-CLIQUES.md)
excluded large linear cliques. A second edge that avoids
the three pair-trace intersections actually excludes their
triangles when \(t>5s\).

Assume the local span condition, \(\tau>t\), minimum
pairwise intersection \(m=t+s\), \(r=5t+3s-2\), and
\(t>5s\). Fix an edge \(A\). There do not exist three
minimum neighbors \(E_1,E_2,E_3\) of \(A\) whose traces
\(Y_i=A\cap E_i\) satisfy
\[
|Y_i\cap Y_j|=s\quad(i\ne j),\qquad
Y_1\cap Y_2\cap Y_3=\varnothing.
\]
In particular at the first jump \(r=5t+1\), \(t\ge6\),
three \(m\)-point minimum traces with all pairwise
intersections singletons must share the **same** singleton.

## Proof

Suppose such a triangle exists and put \(P_{ij}=Y_i\cap Y_j\).
The \(P_{ij}\) are pairwise disjoint. By the exterior-core
and one-edge forcing argument in
[Linear trace cliques](LINEAR-TRACE-CLIQUES.md), the edges
\(E_i\) have pairwise intersections \(C\cup P_{ij}\),
where \(C\) is the same \(t\)-set disjoint from \(A\).
Choose \(D\) avoiding \(C\), using \(\tau>t\).
The forcing rule gives \(P_{ij}\subseteq D\) for every pair
and \(|D\cap E_i|=m\) for each \(i\). In particular,
\[
|D\setminus(E_i\cup E_j)|=r-2m+s .
\]

Now choose an edge \(H\) avoiding the union of the three
sets \(P_{ij}\) and any \(t-3s\) points of \(C\).
The avoided set has size exactly \(t\), so such an edge
exists. Put \(h=|H\cap C|\le3s\).
The edge \(H\) differs from \(D\), which contains all
the \(P_{ij}\), and from all \(E_i\), which each contain
two of them. For each \(i\ne j\), the common intersection
of \(E_i,E_j,D,H\) is empty, since \(D\) avoids \(C\)
and \(H\) avoids \(P_{ij}\). Thus the union of their
exterior parts beyond \(E_i\cup E_j\) has size at least
\(r+m-2\). The \(H\)-exterior has size at most
\(r-2m+h\), because \(|H\cap E_i|,|H\cap E_j|\ge m\)
and their common part in \(H\) is precisely \(H\cap C\).
Combining with the exact \(D\)-exterior size gives
\[
|(D\cap H)\setminus(E_i\cup E_j)|
 \le (r-2m+s)+(r-2m+h)-(r+m-2)
 =h-s\le2s .
\]
No point of \(D\cap H\) is in two of the \(E_i\)'s:
the only such points belong to \(C\) or a set \(P_{ij}\),
and one of \(D,H\) avoids each. Every point of \(D\cap H\)
therefore lies outside the union of at least one of the
three pairs of \(E\)'s. Summing the exterior bounds gives
\(|D\cap H|\le6s\), which contradicts \(m=t+s>6s\).

This is a local structural obstruction. It does not
prove that a hypothetical general counterexample must
have the forbidden trace triangle.
