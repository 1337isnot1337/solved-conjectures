# Erdős–Galvin–Hajnal’s half-overlap hypergraph problem

**Candidate answer: yes in ZFC.**
[Research issue #1040](https://github.com/1337isnot1337/solved-conjectures/issues/1040).

[Problem 11 of Erdős–Galvin–Hajnal (1975), §15](https://www.renyi.hu/~p_erdos/1975-24.pdf)
asks whether, for every indicated finite \(n\), there is a
\(2n\)-uniform hypergraph of size \(\aleph_2\) and chromatic
number above \(\aleph_0\) in which any two different edges
meet in at most \(n\) points. The construction below gives
exactly \(\aleph_2\) vertices, exactly \(\aleph_2\) edges,
and chromatic number exactly \(\aleph_1\) for every \(n\ge2\).

## The strong-coloring input

By [Shelah, Theorem 1.1 of *Colouring and non-productivity
of \(\aleph_2\)-C.C.*](https://shelah.logic.at/files/198837/572.pdf),
there is in ZFC a function \(h:[\omega_2]^2\to\omega_2\)
such that for every set \(R\subseteq\omega_2\) of size
\(\aleph_2\), \(h([R]^2)=\omega_2\). This is the
singleton instance of his stronger
\(\operatorname{Pr}_1(\omega_2,\omega_2,\omega_2,\omega)\).
Compose \(h\) with any surjection \(\omega_2\to[\omega_1]^n\)
to obtain a function \(F\) taking every value of
\([\omega_1]^n\) on the pairs of every such \(R\).

## The rectangle construction

Use the ambient set \(V=\omega_2\times\omega_1\).
For every \(a=\{\alpha,\beta\}\in[\omega_2]^2\), include
exactly one edge
\[
                        E_a=a\times F(a).
\]
Each edge has size \(2n\). Two different edges have different
row pairs, so their row pairs meet in at most one row.
Their intersection therefore has size at most \(n\).
There are exactly \(\aleph_2\) edges. Every row contains
a vertex of some edge, so the union of the edges has
cardinality \(\aleph_2\) too.

Now let \(c:V\to\omega\) be any countable coloring
(a coloring of the support could be extended arbitrarily
to the whole ambient set). For each row \(\alpha\), choose
a color \(j_\alpha\) and an \(n\)-set
\(S_\alpha\subseteq\omega_1\) such that
\(c(\alpha,x)=j_\alpha\) for all \(x\in S_\alpha\).
Such a color and set exist since the row is uncountable.
There are only \(\aleph_1\) possible pairs
\((j_\alpha,S_\alpha)\). Since there are \(\aleph_2\)
rows, some pair \((j,S)\) is chosen on a set \(R\) of
\(\aleph_2\) rows. The strong coloring gives
\(a=\{\alpha,\beta\}\in[R]^2\) with \(F(a)=S\).
The entire edge \(E_a=a\times S\) has color \(j\).
Thus there is no proper countable vertex coloring.

For \(n\ge2\), coloring a vertex by its column gives
a proper \(\aleph_1\)-coloring, since every edge uses
at least two distinct columns. Thus the chromatic
number is exactly \(\aleph_1\).

The construction is for the whole range of \(n\), not an
individual uniformity. It does not assert pair intersections
below the half-overlap threshold.

## Why \(\aleph_2\) is the first possible order

This lower bound was already available from the original paper
(Corollary 2.2); a direct proof is short. In any \(2n\)-uniform
hypergraph with pairwise overlap at most \(n\), each
\((n+1)\)-set is contained in at most one edge. Close a countable
set under adjoining that unique edge whenever it exists,
iterating for \(\omega\) steps. The result is countable and
closed under edge completion: the triggering set is finite.

If there are at most \(\aleph_1\) vertices, make a continuous
chain of countable closed sets covering them, starting with
the empty set. Color each successive difference injectively
by \(\omega\). For an edge, let \(D\) be the last difference
it meets. If it had at least \(n+1\) vertices below \(D\),
closure would put the entire edge below \(D\). Thus at least
\(n\) of its vertices are in \(D\). For \(n\ge2\) these vertices
receive at least two colors. This proves countable colorability
below \(\aleph_2\).
