# Cohen ceiling for arbitrarily slow edge bipartization

This reuses the [ground-slice method for chromatic growth](COHEN-CEILING.md) for the distinct invariant in [Erdős Problem 111](https://www.erdosproblems.com/111). For a finite graph let its bipartization cost be the least number of edges that must be deleted to obtain a bipartite graph. Let $h_G(n)$ be the maximum cost over $n$-vertex subgraphs.

**Proposition.** In every one-Cohen extension there is a nondecreasing $g:\omega\to\omega$ tending to infinity such that
```math
h_G(n)\le n g(n)\text{ eventually}\quad\Longrightarrow\quad \chi(G)\le 2^{\aleph_0}.
```
The estimate is sharp over CH, using Lambie-Hanson's earlier construction. This is an obstruction to arbitrary chromatic lifting for sufficiently slow superlinear profiles, **not** a new proof of the original limit question.

Use the already reported [Plasma AI linear-bipartization theorem](https://github.com/plasma-ai/erdos-111/tree/de72caf0e388): if $H$ is not countably colorable, $h_H(n)/n$ tends to infinity. In the ground model, for each such $H$, take a threshold function $T_H(k)$ such that $h_H(n)>kn$ for all $n\ge T_H(k)$.

Let $F$ be an increasing ground-unbounded function in the Cohen extension, obtained by taking successive maxima of the Cohen function and adding the index. Put $`g(n)=\min\{k:F(k)>n\}`$. This is nondecreasing and tends to infinity. For each ground $H$ of uncountable chromatic number, there are infinitely many $k$ with $F(k)>T_H(k)$. At $n=F(k)-1$ we have
```math
h_H(n)>kn\ge ng(n).
```
The sizes $n$ tend to infinity through these witnesses, and the old finite witnesses survive the extension.

Now write any extension graph of prescribed order as the union of the old edge slices $G_p$ for conditions $p$ in the Cohen filter, as in the companion note. If $G$ satisfies the eventual bound, each actual slice has a countable coloring in the ground: any uncountably chromatic slice would supply the violating finite subgraphs just found. The tuple of the slice colorings has at most $|\omega^\omega|=2^{\aleph_0}$ possible values and is a proper coloring of $G$.

For sharpness over CH, the [construction in Lambie-Hanson (2020), §4](https://arxiv.org/pdf/1902.08177#page=7) gives, for each finite scale function $s(k)$, an $\aleph_1$-chromatic graph whose edge rank $k$ is a forest and whose ranks at least $k$ have no odd cycles of length at most $s(k)$. Indeed each vertex has at most one downward neighbor of a given rank, and a finite cycle at that rank would have a highest vertex with two. For an $n$-vertex subgraph with $n<s(k)$, deleting ranks below $k$ costs at most $kn$, and leaves a bipartite graph. Choose $s(k)$ increasing so that $g(n)\ge k+1$ for $n\ge s(k)$. For any $n$, choose the least $k$ with $n<s(k)$. If $k>0$ then $g(n)\ge k$ by the preceding scale; if $k=0$ the remaining graph already is bipartite. This proves the stated bound at all sizes. This positive argument is a direct consequence of the published rank construction.

The priority searches combining Cohen, Komjáth–Shelah, the bipartization profile and the exact #111 formulation found the old scale construction and the linear-cost theorem, but no explicit qualitative ceiling for this cardinal-lifting variant. Without the prior linear-cost theorem the first threshold argument here does not apply.
