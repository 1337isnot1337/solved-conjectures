# A forcing rule for linear cliques in minimum-pair traces

Partial progress on [Erdős Problem #616](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
The argument is for the saturated petal inequality, not a
resolution of the general extremal problem.

Let an \(r\)-uniform family satisfy the local intersection
hypothesis (every subfamily on at most \(3r-3\) points has a
common vertex), have transversal number greater than \(t\), and
have minimum pairwise intersection \(m=t+s\). Assume
\(r=5t+3s-2\) and \(t>s\ge1\). Fix an edge \(A\), and take
\(q\ge3\) other edges \(E_i\) with \(|A\cap E_i|=m\). Suppose
their traces \(X_i=A\cap E_i\) meet in exactly \(s\) points
pairwise, and have empty triple intersections. Then
\[
q(t+s)-s\binom q2\le r .
\]
In particular, a linear six-clique of such traces is impossible
whenever \(t>12s-2\). At \(r=5t+1\) this excludes six-cliques
for every \(t\ge11\), simultaneously for every choice of \(A\).

## The same exterior core occurs on every pair

For a fixed \(i\), take \(A,E_i\) as the minimum pair.
Any two other edges \(E_j,E_k\) are witnesses of the disjoint
\(s\)-cuts \(X_i\cap X_j\) and \(X_i\cap X_k\) in \(X_i\).
The petal calculations in
[Near-threshold petals](NEAR-THRESHOLD-PETALS.md), §2,
give
\[
|E_j\setminus(A\cup E_i)|\ge3t+2s-2,\qquad
(E_j\cap E_k)\setminus(A\cup E_i)=\varnothing .
\]
These estimates only use a minimum pair, the given witnesses
and \(r-5t-3s+2=0\); they do not need the earlier range for \(r\).
The first inequality is an equality, because
\[
r=|E_j\setminus(A\cup E_i)|+|E_j\cap A|+|E_j\cap E_i|-s
\quad\text{and}\quad |E_j\cap E_i|\ge m.
\]
Consequently \(|E_j\cap E_i|=m\). Each pair of exterior
sets \(E_i\setminus A\), \(E_j\setminus A\) thus intersects
in exactly \(t\) vertices. The second petal bound says that
this exterior overlap is contained in every third \(E_k\).
So all pairs share the same exterior \(t\)-set \(C\).
Outside \(C\), the exterior parts of the \(E_i\)'s are disjoint.

## A single edge must honour all pair-trace intersections

Take any \(D\) that avoids \(C\), possible since \(\tau>t\).
For distinct \(i,j,k\), the triple union \(H=E_i\cup E_j\cup E_k\)
contains exactly \(3m-3s=3t\) vertices of \(A\), because the
trace triple intersection is empty. Its exterior size is
\(3(r-m)-2t\). Now \(D\) meets each of \(E_i,E_j,E_k\)
in at least \(m\), and the only possible repeated counts
in these intersections are the three pairwise overlaps
in \(A\), of total size \(3s\). (Since \(C\) is nonempty,
\(D\) is not any \(E_i\).) Thus \(|D\cap H|\ge3t\) and
\[
|H\cup D|\le 3(r-m)-2t+r=3r-2.
\]
The four-fold intersection is empty because the \(E\)-triple
intersection is \(C\). The local hypothesis therefore forbids
union size at most \(3r-3\). We have equality, in particular
\(|D\cap H|=3t\). Equality forces each of the three
\(D\)–\(E\) intersections to have size exactly \(m\) and
all three pair-trace intersections to lie in \(D\).

This holds for every triple with the **same** \(D\). Each of
the \(\binom q2\) pair-trace intersections is therefore
contained in \(D\). These intersections are pairwise
disjoint by the absence of trace triple intersections.
No point of \(D\) is in three of the \(E_i\)'s, because
\(D\) avoids \(C\). Counting the union of the \(D\cap E_i\)
now proves
\[
r=|D|\ge q m-s\binom q2.
\]
Restricting to six traces gives \(r\ge6t-9s\), hence
\(t\le12s-2\).

The extra structure is the forcing rule before the final
count: *every* edge avoiding the common exterior core is
forced to contain *every* pair overlap of the linear trace
clique. This does not establish that a hypothetical
extremal family contains such a clique.
