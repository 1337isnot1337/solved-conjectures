# A common order cannot explain the missing crosses

This note gives a further partial result on [Erdős #810](https://www.erdosproblems.com/810). It concerns arbitrary proper colorings, not group colorings. It does not settle the unrestricted problem.

**Theorem.** Fix \(\epsilon,K>0\). In any properly colored bipartite graph with parts of size at most \(n\), at least \(\epsilon n^2\) edges and at most \(Kn\) colors, give the row side any total order. There are \(\Omega_{\epsilon,K}(n^3)\) triples of cells
\[
(i,b),\quad(j,b'),\quad(j,b),\qquad i<j,
\]
where the first two have the same color. There are also \(\Omega_{\epsilon,K}(n^3)\) triples with the other cross \((i,b')\) in place of \((j,b)\). No rainbow-cycle assumption is needed for the theorem.

Thus a counterexample cannot uniformly avoid one of the two crosses for a shared row order, even approximately. More precisely, the orientations of the present crosses cannot be made consistent with a shared row order except for \(o(n^3)\) errors. This does not force the two directions for the **same** pair of equal-colored cells.

## Transposition and known exact-order obstruction

Let columns and colors become two vertex parts \(B,C\). Each row \(i\) becomes a matching \(M_i\subset B\times C\): a cell in column \(b\) of color \(c\) gives the edge \(bc\). The matchings are pairwise edge-disjoint because each column contains a color at most once. For \(i<j\), a backward corner of the displayed form is exactly a pair \((e,M_j)\) where \(e=bc\in M_i\) and both endpoints of \(e\) belong to \(V(M_j)\). In row \(j\), the endpoint \(c\) identifies the other same-color cell and endpoint \(b\) identifies the cross. Edge-disjointness guarantees the cells are distinct.

The absence of backward corners is exactly the ordered Ruzsa–Szemerédi property in [Behnezhad–Ghafari, Definition 2](https://arxiv.org/html/2404.06069v2). Their Theorem 2 already rules out zero violations at positive density, after discarding short row matchings and equalizing their sizes. The robust assertion below adapts their pivot argument and does not follow by merely applying the exact theorem to a small set of clean rows. The analogous result for the other cross follows by reversing the row order.

## A robust ordered matching lemma

For a list of \(t\) pairwise edge-disjoint matchings on \(N\) vertices, count one violation for every \(e\in M_i\), \(i<j\), with both endpoints of \(e\) in \(V(M_j)\). For any constants \(c_0,\tau_0>0\), if \(t\ge\tau_0 N\) and all matchings have size at least \(c_0N\), the number of violations is \(\Omega_{c_0,\tau_0}(N^3)\).

Suppose there were a sequence with \(N\to\infty\) and \(o(N^3)\) violations. Trim the matchings to common size \(r\) and write \(c=r/N\ge c_0-o(1)\); we may decrease the fixed \(c_0\) slightly to make \(c\ge c_0\). Retain the order throughout. At any given stage, assume \(t\ge \tau N\) for a fixed \(\tau>0\); \(\tau\) may decrease to a new fixed constant after a step. Split the ordered list near its midpoint into early and late families, each of size at least \(t/3\). Write \(\lambda=c/100\), \(a=c^2/1000\), and \(\beta=c^3/10^5\).

**Prune by the late family.** Remove vertices successively while their degree in the remaining union of the late matchings is less than \(\lambda t\); let \(q\) be the number removed. The total number of late edges lost is at most \(\lambda tq\). If \(q\ge\beta N\), at least \(t/6\) late matchings lose at most \(6\lambda q\) edges, by averaging. Their size on \(N-q\) vertices is at least \(r-6\lambda q\), up to rounding to a common size, yielding
\[
\frac{r-6\lambda q}{N-q}
\ \ge\ c\left(1+\frac{q}{2N}\right).
\]
The new vertex count is still \(\Omega(N)\), since the surviving matchings have \(\Omega(N)\) edges. In particular the ratio of matching size to vertex count increases by a factor at least \(1+\beta/3\) for large \(N\).

**Use pivots when the pruning is small.** Suppose instead that \(q<\beta N\). On the remaining vertices the early matchings have at least \((r-q)t/3\) edges. For each vertex count the cross-half violations in which it is an endpoint of the offending early edge. The sum of these counts is \(o(N^3)\). Exclude the \(o(N)\) vertices with count larger than \(\rho_N N^2\) from the early pivot-selection graph, where \(\rho_N\to0\) is chosen slowly enough. This exclusion costs \(o(N^2)\) early edges and does not change the pruned late degrees. The early pivot-selection graph therefore has at least \(cNt/5\) edges for large \(N\).

Greedily choose a pivot of degree at least \(ct/20\) in the current early graph, then remove it and its current neighbors from that graph before choosing the next pivot. Let \(D_v\) be the neighbor set collected for pivot \(v\). These sets are disjoint. There are at most \(20N/(ct)=O_{c_0,\tau}(1)\) pivots. The residual early graph has at most \(cNt/40\) edges and every vertex had early degree at most \(t\). Hence at least \((7c/40)N\) vertices were removed in total. Omitting the bounded number of pivots, we have \(\sum_v|D_v|\ge cN/10\).

For each late matching \(M\), let \(D(M)\) be the union of \(D_v\) over the pivots matched by \(M\). Every pivot belongs to at least \(\lambda t\) of the pruned late matchings. Thus the average of \(|D(M)|\) among all late matchings is at least \(\lambda\sum_v|D_v|\ge aN\). At least an \(a/2\) fraction have \(|D(M)|\ge aN/2\), since \(|D(M)|\le N\).

The key robust bound is that
\[
\sum_{\text{late }M}|D(M)\cap V(M)|=o(N^2),
\]
where \(V(M)\) here refers to the pruned matching. Each counted vertex \(u\in D_v\cap V(M)\) gives a violation at pivot \(v\) from the original early edge \(vu\). There are only a bounded number of pivots, each with at most \(\rho_N N^2\) such violations; the bound follows. All but \(o(N)\) of the late matchings therefore lose only \(o(N)\) edges on deleting \(D(M)\); take a common \(o(N)\) loss threshold sufficiently slowly decreasing in relative terms. Among the remaining matchings with \(|D(M)|\ge aN/2\), pigeonhole the subset of matched pivots. There are only boundedly many subsets, and one family contains \(\Omega_{c_0,\tau}(t)\) matchings with the same deletion set. They have sizes at least \(r-q-o(N)\) on at most \((1-a/2)N\) vertices. Since \(\beta=ca/100\), this again increases the ratio by a factor at least \(1+\beta/3\) for large \(N\).

**Iterate.** In either case all changes are edge or vertex deletions or omissions of matchings, so violations cannot be introduced. The new \(N\) is comparable with the old \(N\), the new list is still linear in its vertex count, and its violation count is still \(o(N^3)\). The relative size increases by at least \(1+c_0^3/(3\cdot10^5)\) at each step. Finitely many steps depending only on \(c_0\) would give a matching occupying more than \(N/2\) edges, which is impossible. This proves the robust lemma.

In the transposed graph, \(N\le(1+K)n\), and \(N=\Omega_\epsilon(n)\) because its simple graph has \(\epsilon n^2\) edges. There are at least \(\epsilon n/2\) row matchings of size at least \(\epsilon n/2\): the shorter ones account for at most \(\epsilon n^2/2\) edges and no row has more than \(n\) edges. Restrict the given order to the long rows and apply the lemma, concluding the theorem.

## Limits and priority

Behnezhad and Ghafari's exact zero-violation bound and pivot scheme are prior work. [Pratt's comparison to ordinary Ruzsa–Szemerédi graphs](https://arxiv.org/abs/2502.02455) studies the exact setting and uses a different tensor construction. The [ordered hypergraph theorem of Füredi, Jiang, Kostochka, Mubayi and Verstraëte](https://www.renyi.hu/~furedi/PUBS3/furedi_253_jiang_kostochka_mubayi_verstraete_Partitioning-ordered-hypergraphs.pdf), Theorem 1.8, forces some ordering of a loose triple, not specifically one chosen side of a corner. A bounded search for an approximate or supersaturation version with this prescribed corner direction did not find the robust conclusion above. This is a scoped partial result, not a full resolution or an external priority determination.
