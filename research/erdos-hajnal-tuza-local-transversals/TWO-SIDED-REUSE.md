# Two-sided witness reuse forces common residual points

Partial progress on [Erdős #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
Unlike the one-sided expansion dichotomy, this couples witnesses obtained by pivoting from the two opposite edges of one minimum pair.

Use \(r=5t+z\), \(1\le z\le t/4\), \(m=t+s\), \(\delta=z-3s+2\), \(L=r-m\) and the disjoint primary cuts from [Witness expansion with slack](WITNESS-EXPANSION-WITH-SLACK.md). The primary witnesses are \(E_i\); let \(X=A\cap B\). Do the secondary selection both from \(A,E_i\) (cuts in \(U_i\)) and from \(B,E_i\) (cuts in \(V_i\)). A witness may occur at multiple pivots on either side.

Take a secondary edge \(F\) from the \(A\) side, reused at \(k\) pivots, and \(G\) from the \(B\) side, reused at \(j\) pivots. Assume these two pivot sets intersect. Write \(B_a=L/a+\sqrt{L\delta}\). If
\[
B_k+B_j<t+s-2z-5\delta,
\]
then \(F\cap G\cap X\ne\varnothing\).

In particular, for \(z=o(t)\) this holds eventually whenever each of the two reuse counts is at least ten. At \(r=5t+1\), it holds for \(t\ge6\) and both counts at least ten. At this exact jump, the two sets of primary indices cannot cover \(X\): each pivot is a singleton \(x\), and every secondary edge avoids every singleton at which it is reused on its side. More generally, the union of the actual \(E_i\cap X\) residues of the two pivot sets cannot cover \(X\).

## Proof

Put \(D_F=F\cap(B\setminus A)\), \(D_G=G\cap(A\setminus B)\).
The reused-edge estimate in the one-sided proof and its reflection give
\[
|D_F|\ge t-\delta-B_k,\qquad |D_G|\ge t-\delta-B_j.
\]
Fix one common pivot \(i\). The edge \(F\) uses at most \(s+\alpha_i\le z\) points in \(U_i\); the reflected four-edge estimate gives \(|D_G\setminus U_i|\le\delta\). Thus \(F,G\) meet in at most \(z+\delta\) vertices of the \(A\)-wing. Reflecting again gives the same bound in the \(B\)-wing.

Suppose now that \(F\cap G\cap X=\varnothing\). Then \(F\ne G\): otherwise this common edge would meet \(A\) in at most \(z+\delta\) vertices, whereas every secondary edge meets \(A\) in at least \(m\), and \(z+\delta<m\). Neither secondary edge equals \(A\) or \(B\). For the non-pivot base edge, this follows because it contains the nonempty set \(E_i\cap X\) which the secondary edge must avoid. Therefore the four edges \(A,B,F,G\) have empty intersection and union of size at least \(3r-2\). Writing \(W_F=F\setminus(A\cup B)\) and \(W_G\) similarly, this gives \(|W_F\cup W_G|\ge r+m-2\). On the other hand
\[
|W_F|\le L-|D_F|,\qquad |W_G|\le L-|D_G|.
\]
Consequently
\[
 |W_F\cap W_G|\le 2t+\delta-|D_F|-|D_G|
                  \le 3\delta+B_k+B_j .
\]
Since \(F,G\) are distinct, meet in no point of \(X\), and meet in at most \(2(z+\delta)\) points on the wings, their common exterior has at least \(m-2(z+\delta)=t+s-2z-2\delta\) vertices. The hypothesis gives a strict contradiction. Finally, for \(z=o(t)\) we have \(L=(4+o(1))t\), \(\delta=o(t)\); the sum of two reuse errors for counts at least ten is at most \((4/5+o(1))t\). At \(z=1\) the error sum is at most \(4t/5<t-1\) for \(t\ge6\).

This cross-intersection rule is a restriction on the clustered-wing branch. It does not yet show that its surviving residual families on \(X\) are impossible.
