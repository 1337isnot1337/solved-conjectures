# Prior resolution in the Lambie-Hanson construction

**Priority conclusion:** do not claim a new solution to Erdős's
exact-$`\aleph_1`$ almost-bipartite graphs conjecture. It is already an
immediate consequence of Chris Lambie-Hanson's published
construction. The higher-shift proof in this directory is a
different theorem about arbitrarily large chromatic cardinals.

## The missing deduction from the existing paper

Erdős, [On the combinatorial problems which I would most like to see
solved](https://www.renyi.hu/~p_erdos/1981-16.pdf), §VII (p. 16 in the
Rényi archive reprint), conjectured that for each $\epsilon>0$ some
graph of chromatic number exactly $\aleph_1$ satisfies
$h_G(n)<n^{1+\epsilon}$ for all positive integers $n$. Here $h_G(n)$
is the worst minimum edge-deletion budget to make an $n$-vertex
subgraph bipartite.

Lambie-Hanson, [On the growth rate of chromatic numbers of finite
subgraphs](https://arxiv.org/abs/1902.08177), Adv. Math. 369 (2020),
107176, DOI [10.1016/j.aim.2020.107176](https://doi.org/10.1016/j.aim.2020.107176),
constructs a graph $G$ for each function $f:\mathbb N\to\mathbb N$
and proves in §4:

* $\chi(G)=\aleph_1$, with no extra set-theoretic hypothesis.
* Its edge set is partitioned into $E_j$ for $j\in\mathbb N$.
* Every $(V(G),E_j)$ is a forest (Claim 4.1(1)).
* For each $k$, the graph on the union of $E_j$ with $j\ge k$
  has no odd cycle of length at most $f(k)$ (Claim 4.1(2)).

Those are stronger premises than the paper's headline bound on
finite-subgraph chromatic numbers. For an $n$-vertex subgraph with
$n\le f(k)$, delete the first $k$ edge layers. Each layer contributes
at most $n-1$ edges because it is a forest. The remaining subgraph
has no odd cycle (any cycle would have length at most $n$). Hence
```math
 h_G(n)\le k(n-1)\qquad(n\le f(k)).
```

For any function $g:\mathbb N_{\ge1}\to\mathbb N$ with $g(n)\to\infty$,
choose $f(k)$ at least as large as every $n$ with $g(n)\le k$; this is
a finite set for each $k$, and an arbitrary positive value works
when it is empty. Taking $k=g(n)$ proves
```math
 h_G(n)\le (n-1)g(n)\qquad(n\ge1),\qquad \chi(G)=\aleph_1.
```
In particular $g(n)=\lceil n^\epsilon\rceil-1$ gives the strict
original bound at every $n$. This is an explicit reading of the
existing proof, not a claim that its author stated this corollary
as a theorem. The crucial input is edge-layer structure, not the
headline chromatic-growth statement alone.

## Priority and search notes

* The October 2026 [Plasma AI proof](https://github.com/plasma-ai/erdos-111)
  concerns the different lower-bound assertion $h_G(n)/n\to\infty$.
  No priority is claimed for that direction either.
* Erdős–Hajnal–Szemerédi
  [1982](https://www.renyi.hu/~p_erdos/1982-11.pdf), Theorem 3(a),
  has a $2n^{3/2}$ bound at arbitrarily high chromatic cardinal;
  its Theorem 3(b) uses more than two colours after deletion.
* The July 2026 [working report](https://erdosproblemaday.com/report/111)
  mentions Lambie-Hanson, but only assesses the headline
  chromatic-growth conclusion and does not extract Claim 4.1.
  This illustrates why the construction itself had to be checked.
* The separate result in this directory is the orientation-based
  upper bound $C_k n^{1+1/k}$ for the ordinary $k$-shift, including
  the unit-coefficient all-orders bootstrap. It witnesses the power
  bound for chromatic numbers above any fixed cardinal; it is not
  needed for the historical exact-$`\aleph_1`$ result and is not being
  presented as resolution of a new named conjecture.
