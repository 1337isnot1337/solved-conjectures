# Erdős’s book threshold conjecture

**Status: partial.** At every fixed book threshold, the successive gap is \(n^{1-o(1)}\) or larger infinitely often. At the first threshold it is \(n^{2-o(1)}\) or larger infinitely often even among powers of two. The original two limits are not implied.

## Exact question and prior work

Let \(e(n,r)\) be the least edge count which forces an edge with at least \(r\) common neighbors in an \(n\)-vertex simple graph all of whose edges lie in triangles. For fixed \(r\ge2\), [Erdős, *Some problems on finite and infinite graphs*, pp. 226–227](https://www.renyi.hu/~p_erdos/1987-28.pdf) asks whether \(e(n,r+1)-e(n,r)\to\infty\) and whether \(e(n,r+1)/e(n,r)\to1\). This is [Erdős #600](https://www.erdosproblems.com/600), not the fixed-density problem studied by [Fox and Loh](https://arxiv.org/abs/1106.0290).

Write \(F_r(n)=e(n,r)-1\), the maximum edge count when all edge books have between \(1\) and \(r-1\) pages, and write \(g_r(n)=F_{r+1}(n)-F_r(n)\). Two classical bounds, both recorded in the original source, are
\[
n^2\exp(-C_0\sqrt{\log n})\le F_2(n)\le F_r(n)=o(n^2)
\]
for a constant \(C_0\) and fixed \(r\ge2\). The lower bound is the Ruzsa–Szemerédi construction from Behrend's progression-free sets. For the upper bound, the graph has \(O_r(n^2)\) triangles, so the triangle removal lemma supplies \(o(n^2)\) edges meeting them all. Because each edge lies in at least one triangle and each removed edge meets at most \(r-1\) triangles, the total number of edges is \(o(n^2)\).

## A telescoping gap at every fixed threshold

Take an \(F_r(n)\)-extremizer and add one independent false twin of a maximum-degree vertex. For each original edge, the only possible new common neighbor is the new vertex. Each new edge has as many common neighbors as its old counterpart: the original and duplicate are nonadjacent, hence neither can contribute a common neighbor of its counterpart edge. Thus all edge book sizes in the enlarged graph are between \(1\) and \(r\), and the new vertex contributes at least \(2F_r(n)/n\) edges. Consequently
\[
F_{r+1}(n+1)\ge (1+2/n)F_r(n).
\]
Set \(a_r(n)=F_r(n)/n^2\). Rearranging this exact inequality gives
\[
a_r(n)-a_r(n+1)\le \frac{g_r(n+1)+a_r(n)}{(n+1)^2}.
\]
Sum from \(n=N\) to infinity, since \(a_r(n)\to0\) and \(0\le a_r(n)\le1/2\). The result is the tail bound
\[
\sum_{m>N}\frac{g_r(m)}{m^2}\ge a_r(N)-\frac{1}{2N}.
\tag{1}
\]
An infinite left side is allowed.

In particular, for **every fixed \(r\ge2\)** and every \(C>C_0\), there are arbitrarily large \(m\) with
\[
g_r(m)\ge m\exp(-C\sqrt{\log m}).
\]
Otherwise the left-hand side of (1) is at most a constant times
\[
\int_N^\infty \frac{\exp(-C\sqrt{\log x})}{x}\,dx
= O_C((1+\sqrt{\log N})\exp(-C\sqrt{\log N})),
\]
as follows by substituting \(u=\sqrt{\log x}\). This is smaller than \(a_r(N)-1/(2N)\) for large \(N\), a contradiction.

## A stronger first-threshold gap on dyadic orders

If every old edge has just one common neighbor, duplicate all vertices, replacing each old edge by the complete bipartite graph between its two independent clone classes of size two. Every edge of the enlarged graph has exactly two common neighbors. Hence \(F_3(2n)\ge4F_2(n)\). For \(b_k=F_2(2^k)/2^{2k}\), this implies
\[
\frac{g_2(2^k)}{2^{2k}}\ge b_{k-1}-b_k,\qquad
\sum_{k>K}\frac{g_2(2^k)}{2^{2k}}\ge b_K.
\tag{2}
\]
The second inequality uses \(b_k\to0\). If the normalized gap were everywhere below \(\exp(-C\sqrt{\log(2^k)})\) eventually, summing over \(k>K\) would give \(O_C((1+\sqrt K)\exp(-C\sqrt{K\log2}))\). The lower bound on \(b_K\) rules this out, proving
\[
g_2(n)\ge n^2\exp(-C\sqrt{\log n})
\]
for arbitrarily large powers of two \(n\).

This construction also explains why a universal same-vertex-set near-lossless extraction from the next threshold is too strong. In the doubled graph each old triangle contributes an edge-disjoint \(K_{2,2,2}\) block. A subgraph with each retained edge in exactly one triangle keeps at most six of the twelve edges per block. Indeed let \(B,C\) be two of the three parts; if there are at most two retained edges between them, there are at most two triangles because these edges cannot be reused. If at least three of the four \(BC\) edges are used by distinct edge-disjoint triangles, color the three edges of a length-three \(BC\) path by their chosen vertex in the remaining part. Consecutive edges have different colors (else one edge is reused), so their colors alternate. The middle path edge then lies in a second triangle through the outer triangles' common vertex in the remaining part, a contradiction. The argument applies to any three edges of \(K_{2,2}\) and all retained edges must be covered by a triangle. The doubled graph can have \(n^{2-o(1)}\) edges. This does not show that extremizers for the next threshold resist near-lossless extraction, or that the ratio conjecture fails.

## Long intervals of large gap at the first threshold

The one-order increment has a simple bound:
\[
0\le F_r(m+1)-F_r(m)\le \frac{r+1}{m+1} F_r(m+1)\le \frac{r+1}{2}m.
\tag{3}
\]
For the upper bound remove a minimum-degree vertex \(v\) of an extremizer on \(m+1\) vertices. Delete also any edge whose only triangle used \(v\). These extra deletions destroy no triangle remaining after removing \(v\). Their number is at most the number of edges in \(G[N(v)]\), which is a graph of maximum degree at most \(r-1\) because the edge from \(v\) to any of its neighbors has at most \(r-1\) common neighbors. Thus at most \((r+1)d(v)/2\) total edges were lost. The minimum degree is at most \(2F_r(m+1)/(m+1)\). The lower bound follows by adding an isolated vertex.

Write \(\gamma_N=N^2\exp(-C\sqrt{\log N})\) for one of the arbitrarily large dyadic orders with \(g_2(N)\ge\gamma_N\). Since both \(F_2\) and \(F_3\) are nondecreasing, (3) bounds the one-step absolute change of \(g_2\) by the larger of their increment bounds, not their sum. For any integer \(m\) with \(|m-N|\le \lfloor\gamma_N/(8N)\rfloor\), all the intermediate orders are at most \(2N\), so \(|g_2(m)-g_2(N)|\le 4N|m-N|\le\gamma_N/2\). Therefore there are arbitrarily large intervals of consecutive orders of length \(\Omega(N\exp(-C\sqrt{\log N}))\) on which \(g_2(m)\ge \tfrac12 N^2\exp(-C\sqrt{\log N})\) uniformly. These intervals need not cover all large orders.

## Priority and remaining tasks

The [discussion](https://www.erdosproblems.com/forum/thread/600) and the [July 2026 working report](https://www.erdosproblemaday.com/report/600) already record the full blow-up and small-order consequences. The new step here is telescoping the normalized densities, including the maximum-degree single duplication at every threshold, not the blow-up construction itself. The original chapter, Fox–Loh, the public wiki and catalog, the discussion, the working report, and searches for successive book thresholds, cloning, and the exact two limits did not uncover an earlier subsequence-gap bound of this form. That priority check is necessarily bounded.

The additive question asks for **all sufficiently large orders**, not merely an unbounded subsequence, and the ratio question needs a same-order comparison not provided by (1) or (2). Coordination: [#892](https://github.com/1337isnot1337/solved-conjectures/issues/892).
