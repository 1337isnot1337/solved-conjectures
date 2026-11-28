# Hamburger–Szegedy chord-density conjecture

Tracking issue: [#1121](https://github.com/1337isnot1337/solved-conjectures/issues/1121). This is a partial theorem for [Erdős #642](https://www.erdosproblems.com/642), not a solution to it.

## Exact target and source check

Does an absolute constant in the edge threshold guarantee a cycle with at least as many chords as vertices? A chord merely joins two nonconsecutive vertices of the cycle. The chords need not form a connected graph. This separates #642 from [Erdős #585](https://www.erdosproblems.com/585).

[Chen, Erdős, and Staton](https://www.sciencedirect.com/science/article/pii/S0095895696900052) gave the early $`O(n^{3/2})`$ upper bound and proved the separate nested-cycle result. [Draganić, Methuku, Munhá Correia, and Sudakov](https://doi.org/10.1002/rsa.21207) published an $`O(n(\log n)^8)`$ upper bound. The [catalogue discussion](https://www.erdosproblems.com/forum/thread/642) records tighter parameter checks, not a linear bound. [Draganić and Girão](https://arxiv.org/abs/2601.08769) force almost linearly many chords relative to cycle length at constant minimum degree. Their theorem is not a linear-chord theorem, and their Conjecture 5.1 has a different density and chord target. Girão's [November 2026 seminar](https://www.maths.ox.ac.uk/events/past/633%3Fpage%3D5) still describes the full statement as conjectural. The [formal-statement index](https://cairn-commons.com/problems/erdos-642) also lists it as open. Searches of the two repository catalogues, issues and PRs found no matching claim before #1121.

## A local alternative for every bipartite host

Let $`G`$ be a simple bipartite graph on $`n`$ vertices with minimum degree $`d\ge3`$. There is a cycle $`C`$ and a nonempty set $`A`$ on one shore of $`C`$ with all three properties:

1. Every neighbor of every vertex of $`A`$ is on $`C`$.
2. $`|N_G(A)|\le2|A|-1`$.
3. $`C`$ has at least $`\sum_{v\in A}(d_G(v)-2)`$ chords.

For the first two facts use a maximal lollipop as in [Dvořák, Martins, Thomassé, and Trotignon](https://arxiv.org/html/2502.04726v2), Section 2. Choose its cycle $`C`$ with maximum length on the lollipop's fixed support. Their Lemma 4 shows that every endpoint of a Hamilton path of $`G[V(C)]`$ starting at the root has all its neighbors on $`C`$. Start from the path that follows $`C`$ starting at this root. Use all usual Pósa rotations that fix the root, and take their reachable endpoints as $`A`$. The original path has odd length, since $`C`$ is bipartite. All endpoints in $`A`$ therefore lie on the same shore, opposite the root.

For the neighborhood bound, write $`A^-,A^+`$ for the predecessors and successors of $`A`$ on the original path. A vertex $`x\notin A\cup A^-\cup A^+`$ has its original path edges in every reachable path. Otherwise the first removal of an original edge at $`x`$ would give a new endpoint among its two ends, neither of which is in $`A`$. If such $`x`$ had a neighbor $`v\in A`$, choose a reachable path ending at $`v`$. The edge $`xv`$ cannot be on that path, since it is not an original path edge at $`x`$. Rotating about $`x`$ would make its next vertex a reachable endpoint, contradicting the original-edge property. This also applies to the root when it is a pivot. Thus $`N_G(A)\subseteq A^-\cup A^+`$, since $`A`$ is independent and its neighbors are on $`C`$. The initial endpoint is in $`A`$ but has no successor, which gives the bound. The third fact follows because each vertex of $`A`$ has exactly two cycle edges and no chord is counted at two vertices of $`A`$.

Consequently, if $`G`$ has no cycle with at least as many chords as vertices, some nonempty $`A`$ on one shore satisfies
```math
|A|<n/(d-2), \qquad |N_G(A)|\le 2|A|-1.
```
The set $`U=A\cup N_G(A)`$ has size less than $`3n/(d-2)`$ and spans at least $`d|A|`$ edges. Thus its average degree is strictly greater than $`2d/3`$. This gives two sufficient conditions for a positive answer on a fixed host. Either every one-shore set below the stated size expands to at least twice its size, or every vertex set of size below $`3n/(d-2)`$ has induced average degree at most $`2d/3`$. Neither condition asks for large-set joinedness.

In a $`C_4`$-free host, there is also a necessary order bound for failure. Every pair of neighbors of one vertex of $`A`$ occurs for at most one such vertex. Thus $`|A|\binom d2\le\binom{|N_G(A)|}{2}<2|A|^2`$. Combining the inequalities gives $`n>d(d-1)(d-2)/4`$. This is a fixed-host obstruction, not an improvement to the published general upper bound.

## A spectral consequence with a comparatively weak ratio

Suppose $`G`$ is $`d`$-regular with $`m=n/2`$ vertices per shore. Put $`\tau=\lambda/d`$, where $`\lambda`$ is the second singular value of its biadjacency matrix. Suppose $`\tau<1/\sqrt2`$. The normalized size $`x=|A|/m`$ in the local alternative satisfies
```math
x\ge a(\tau):=\frac{1-2\tau^2}{2(1-\tau^2)}.
```
In fact, write $`y=|N_G(A)|/m`$. All $`d|A|`$ incident edges go to that neighborhood. The centered expander mixing bound gives
```math
x(1-y)\le \tau\sqrt{x(1-x)y(1-y)}.
```
For $`x\ge1/2`$ the assertion is immediate. Otherwise $`y\le2x<1`$, so square, cancel, and use $`y\le2x`$ to obtain $`1-2x\le2\tau^2(1-x)`$. This is the desired inequality.

Write $`z=|V(C)|/(2m)`$. The density of chords relative to vertices on this cycle is at least
```math
\max\left\{\frac{(d-2)a(\tau)}{2z},\,\frac d2((1+\tau)z-\tau)-1\right\}.
```
The first term counts incident edges at rotation endpoints. For the second, each shore of the cycle has size $`zm`$. Centered mixing gives at least $`dm[z^2-\tau z(1-z)]`$ edges on that pair of shores. Subtract the cycle edges and divide by its length.

In particular, the conjectured witness exists in this fixed host whenever
```math
\frac{(d-2)a(\tau)}2\ge\frac{\tau+4/d}{1+\tau}.
```
The increasing term in the maximum reaches one at the right-hand threshold on $`z`$. Below that threshold the decreasing term is at least one. As a convenient sufficient condition, for $`d\ge28`$ one can take
```math
\tau^2\le\frac{d-4}{2(d-3)}.
```
Indeed the left-hand side of the preceding threshold then is at least $`1/2`$, and $`\tau<1/\sqrt2`$ and $`d\ge28`$ make the right-hand side at most $`1/2`$.

This uses only neighborhood concentration and the edge count on the cycle. It does not assume that the host itself is Hamiltonian or that it meets a strong spectral Hamiltonicity theorem.

## Remaining gap

A graph of high average degree has a bipartite subgraph of at least half that average degree, and pruning yields a proportional minimum-degree bound. But it need not satisfy the local sparsity, small-set expansion, or spectral assumptions above. In a potential counterexample the Pósa endpoint set is a small concentrated set with high retained degree. Iterating naively on its support can lose a constant fraction of the minimum or average degree per step. A resolution still needs a way to use that concentration without repeated degree loss, or a different argument.
