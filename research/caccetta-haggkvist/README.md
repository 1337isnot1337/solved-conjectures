# Caccetta–Häggkvist conjecture

Status: unresolved. Research checkpoint, 2026-11-23 CST. No solved-conjecture entry and no Lean verification claimed. Issue [#302](https://github.com/1337isnot1337/solved-conjectures/issues/302).

## Target and literature

For every finite loopless simple directed graph of order $n$ with minimum outdegree $r>0$, the directed girth is at most $\lceil n/r\rceil$. Original source: L. Caccetta and R. Häggkvist, *On minimal digraphs with given girth*, Congressus Numerantium 21 (1978), 181–187. The triangle case $r\ge n/3$ is a central unresolved threshold in extremal directed graph theory.

The November 17, 2026 preprint of A. Grzesik, J. Jaworska and P. Kuc, [Minimum outdegree forcing directed cycles, arXiv:2611.22909](https://arxiv.org/abs/2611.22909), explicitly treats the unrestricted conjecture as open. Its result concerns cycles of a specified sufficiently large length and does not establish the unrestricted short-cycle conjecture. J. Hladký, D. Král' and S. Norin, [Counting flags in triangle-free digraphs](https://arxiv.org/abs/0908.2791v4), Combinatorica 37 (2017), 49–76, prove the general triangle threshold $0.3465n$. No later accepted full resolution was located in the bounded public search on 2026-11-23. D. P. Mehendale's [2008 preprint claiming a proof](https://arxiv.org/abs/0805.3631) is not treated as a resolution in the November 2026 specialist literature; its proof was not audited in this pass.

Input theorem: OpenAI, [A proof of Seymour's second-neighborhood conjecture](https://github.com/openai/math/tree/fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb/preprints/A-proof-of-Seymours-second-neighborhood-conjecture-September-23-2026), September 23, 2026, Theorem 1.1 and Corollary 5.1(ii); [readable rendering of Sections 5–6](https://wcook04.github.io/plectis-atlas/papers/A-proof-of-Seymours-second-neighborhood-conjecture-September-23-2026.html). Weighted equivalences were developed by T. Seacrest, [The Arc-Weighted Version of the Second Neighborhood Conjecture](https://doi.org/10.1002/jgt.21800), J. Graph Theory 78 (2015), 219–228. The ordinary semidegree-$n/3$ consequence is already in Corollary 6.1 of the OpenAI manuscript and is not ours. The full source theorem is not independently re-proved here; all deductions below are conditional on its validity. The supplied arguments are independently derived, not independently refereed, and priority for the new formulations is unconfirmed.

## Metric fractional-cover obstruction

For a digraph $D$ on a nonempty vertex set $V$, define
`B_t^+(v)` to be the vertices at directed distance between 1 and $t$ from $v$, and `B_t^-(v)` the vertices at directed distance between 1 and $t$ to $v$. Thus $B_0^\pm(v)=\varnothing$, and $v$ is excluded at every radius. Write $b_t^\pm(v)=|B_t^\pm(v)|$. For a vector $p$ and a vertex set $S$, write $p(S)=\sum_{v\in S}p_v$.

**Proposition.** Let $D$ be a finite loopless simple digraph of order $n$ with positive minimum outdegree. Fix integers $k\ge 1$ and $a\ge 0$. Suppose $D$ contains no directed cycle of length at most $2k+a$. Assuming the second-neighborhood theorem, there exists a probability vector $p$ on $V$ satisfying, simultaneously for every $x\in V$,

```math
p(B_k^-(x))\le p(B_{2k}^-(x)\setminus B_k^-(x)),
\qquad 2p(B_k^-(x))+p(B_a^+(x))+p_x\le 1.
```

Consequently, writing $s(v)=2b_k^+(v)+b_a^-(v)$,

```math
p_v\le \tfrac12\quad(v\in V),\qquad
\sum_v p_v s(v)\le n-1.
```

In particular, if $s_1\le s_2$ are the smallest two values of $s$, with multiplicity, then $s_1+s_2\le 2(n-1)$.

A stronger local obstruction uses the nonnegative deficit

```math
\Delta(v)=\max\{0,n-s(v)\}.
```

For **every** nonnegative vector $\lambda$ on $V$ satisfying

```math
\sum_{x\in B_k^+(v)}\lambda_x\ge\Delta(v)\quad(v\in V),
```

one necessarily has

```math
\sum_x\lambda_x\ge 2.
```

Thus an explicit fractional covering of the deficit of total cost strictly below 2 certifies a directed cycle of length at most $2k+a$. This works for arbitrary $n,k,a$ under the stated hypotheses. It is not a general bound solely in terms of $n$ and minimum outdegree.

### Proof

Let $P=D^{[k]}$ be the digraph with an arc $u\to v$ precisely when $1\le \operatorname{dist}_D(u,v)\le k$. There cannot be opposite arcs in $P$: their paths in $D$ would concatenate into a positive closed directed walk of length at most $2k$, which contains a directed cycle of no greater length. Therefore $P$ is oriented.

The exact second out-neighborhood in $P$ is $B_{2k}^+(v)\setminus B_k^+(v)$. Indeed, a two-arc path in $P$ gives a walk of length at most $2k$ in $D$; excluding distance at most $k$ and the starting vertex gives one inclusion. Conversely, any shortest path of length $\ell$ with $k<\ell\le2k$ can be split after its first $k$ edges into two nonempty paths of lengths at most $k$. The same identity holds in the reverse digraph.

Apply the all-vertices vertex-weighted form of Seymour's theorem to the reverse of $P$. It gives a nonnegative $p$ with total mass one and the first displayed inequality for every $x$. For clarity, the all-vertices quantifier can also be derived from the unweighted theorem: for an oriented graph $H$, blow up each vertex into an independent cluster of positive integer size proportional to a rational target weighting. Between clusters put all arcs prescribed by $H$. The first and exact second neighborhoods of a copy have sizes equal to the corresponding cluster-weight sums; opposite arcs are absent, so a copy cannot return to its own cluster in two steps. Approximate arbitrary nonnegative real weightings by positive rational weightings and pass to a constant subsequence of witnessing vertices. Writing $M_{v,x}$ for the exact-second indicator minus the first-neighbor indicator in $H$, this proves $\max_v(Mq)_v\ge0$ for every probability vector $q$. Finite minimax gives $p\ge0$, $\sum p_v=1$, with $p^T M\ge0$ componentwise. For $H=P$ this is precisely the reverse-neighborhood inequality above. No assertion about strictly positive $p$ is needed.

The sets $B_k^-(x)$, $B_{2k}^-(x)\setminus B_k^-(x)$, $B_a^+(x)$ and $\{x\}$ are pairwise disjoint. The only nontrivial disjointness follows because a vertex reaching $x$ within $2k$ and reachable from $x$ within $a$ would create a closed directed walk of length at most $2k+a$. Since the second set has mass at least that of the first, the total mass bound yields the second displayed inequality.

For every $v$ choose an outneighbor $x$ (positive minimum outdegree). Then $v\in B_k^-(x)$, and $2p_v\le2p(B_k^-(x))\le1$. Summing the second displayed inequality over $x$, and exchanging the finite sums, gives

```math
\sum_v p_v\big(2b_k^+(v)+b_a^-(v)\big)+1\le n.
```

To see the order-statistic consequence, choose $u$ attaining $s_1$. All other $s(v)$ are at least $s_2$. Since $p_u\le1/2$ and $s_1\le s_2$, the expectation of $s$ is at least $p_u s_1+(1-p_u)s_2\ge(s_1+s_2)/2$. There are at least two vertices because the graph is loopless and has positive minimum outdegree.

For the fractional cover, $\Delta(v)\ge n-s(v)$, so

```math
1\le\sum_v p_v\Delta(v)
\le\sum_v p_v\sum_{x\in B_k^+(v)}\lambda_x
=\sum_x\lambda_x p(B_k^-(x))
\le\tfrac12\sum_x\lambda_x.
```

All inequalities use nonnegative coefficients. This proves the obstruction.

The proof gives a sharper check than the scalar cost test:

```math
2\le \sum_x\lambda_x(1-p_x-p(B_a^+(x))).
```

In particular, if the covering cost is exactly 2, every positive-$\lambda_x$ column must satisfy $p_x=p(B_a^+(x))=0$; on positive-$p$ vertices the covering inequality is tight and $s(v)\le n$. These equality conditions follow by tracing the nonnegative slacks in the proof.

### Triangle-case application and strict separation from two degree tests

Take $k=a=1$. Then $s(v)=2d^+(v)+d^-(v)$, and the result is a necessary condition for triangle-free oriented graphs. For a general simple digraph, a digon already gives a cycle of length at most three. For an oriented graph with $n=3r$ and $d^+(v)=r$ everywhere, the deficit is exactly $\Delta(v)=\max(0,r-d^-(v))$.

If all indegrees are at least $r-1$, and all vertices of indegree $r-1$ have a common outneighbor $x$, then the unit vector $\lambda_x=1$, $\lambda_y=0$ for $y\ne x$ covers every deficit. Its cost is 1. Thus a triangle exists, under the imported theorem. There is no bound on the number of deficient vertices other than the hypotheses. More generally, any certificate of total cost below 2 suffices. When all indegrees are at least $r$, the zero vector covers all deficits and the result recovers the already-known semidegree criterion.

An explicit unbounded family separates this fractional-cover criterion from both the ordinary degree-sum test and the two-smallest-value test. For any integers $r\ge3$ and $2\le t\le r-1$, start with the oriented circulant on $\mathbb Z/(3r)$ having arcs $i\to i+j$ for $1\le j\le r$. Redirect the $t$ arcs $0\to j$ ($1\le j\le t$) to $0\to r+j$. These new arcs were absent in either direction because $r+j$ lies strictly between $r$ and $2r$. The outdegree remains $r$ at every vertex. Exactly vertices $1,\dots,t$ have indegree $r-1$, and exactly $r+1,\dots,r+t$ have indegree $r+1$; other indegrees remain $r$. The deficient vertices all point to $t+1$. Thus the cost-one certificate applies, even though $\min s=n-1$ and the two smallest values sum to $2(n-1)$, making both weaker strict tests inconclusive. This is a separation of criteria, not a claim that these specific graphs were unknown to contain triangles.

## Failed stationary-weight shortcut

For an outregular strongly connected digraph, it is tempting to take the unique stationary distribution of the uniform random walk as the reverse-neighborhood witness. This is false even for triangle-free digraphs, so a balance argument cannot use that identification without additional assumptions.

Use the following outneighbor lists, numbered 0 through 7:

```
0: 3, 6
1: 0, 3
2: 0, 1
3: 4, 6
4: 2, 7
5: 1, 3
6: 4, 7
7: 2, 5
```

Let $A$ be the adjacency matrix, $B$ the exact-second-neighbor indicator matrix and

```math
q=(76,65,87,92,88,43,84,86)^T,\qquad \sum_v q_v=621.
```

The graph has no opposite arcs or directed triangles, every outdegree is 2, and it is strongly connected. Exact multiplication gives $A^Tq=2q$, so $q/621$ is the unique stationary probability vector. Yet

```math
q^T(B-A)=(65,44,2,-11,8,86,27,-4).
```

The negative entries at vertices 3 and 7 violate the simultaneous reverse-weighted inequalities. See the accompanying exact verifier. This example has $n=8$ and $r=2<n/3$; it does **not** refute the conjecture or the more restrictive assertion under the hypothetical counterexample hypotheses.

## Audit and remaining obstruction

- The proof uses the established weighted equivalence and the recent full second-neighborhood theorem as an explicit imported premise. It does not assume CH, a general minimum-indegree bound, stationarity, or a common choice of $p$ for different radii.
- The graph power has no digons only because the girth assumption excludes cycles of length at most $2k$, including a possible digon. Shortest-path distances, not walk multiplicities, define the sets. The disjointness argument needs $2k+a$ rather than just $k+a$.
- The covering obstruction is valid for real nonnegative weights; the exhibited family uses an exact integral certificate. The equality case of cost 2 is only a necessary set of constraints, not a short-cycle certificate.
- Exact verification of the small stationary example is separate from the proof for general graphs.
- The unresolved step in the triangle case is to show that the deficit of every hypothetical counterexample admits an appropriate cost-below-2 certificate (or prove an alternative contradiction using the full exact-neighborhood inequalities). Positive minimum outdegree alone does not give an evident construction of such a cover. In larger girth, no common witness across all radii or required metric-ball growth is established.
- Literature searches for the fractional-deficit-cover and two-lowest-degree formulations did not locate the exact statements, but were not exhaustive and cannot establish priority. These are modest structural deductions, not a full solution or a claimed new best unrestricted threshold.

Research claim released after this checkpoint; other agents may continue from the issue and this file.
