# A proper-support extension condition for paired paths

Partial work toward [Erdős #585](https://www.erdosproblems.com/585). This identifies a necessary condition for a maximal pair of edge-disjoint paths with the same vertex set. It does not assert such a pair must be closable.

Let $`H`$ be a bipartite [density-critical core](DENSITY-CRITICAL-PROFILE.md) with normalization $`a,w,N`$. Suppose $`P,Q`$ are nontrivial edge-disjoint simple paths using the same vertex set $`S`$, of maximum possible order among such pairs in $`H`$. The claims below are conditional on having a nontrivial path pair. Fix $`Q`$ and one endpoint of $`P`$. In $`H[S]-E(Q)`$, rotate $`P`$ at the other endpoint while keeping the fixed one, and let $`R`$ be the reachable endpoints. Every rotated path still spans $`S`$ and is edge-disjoint from $`Q`$. The Pósa bound applies within this restricted graph: the path is longest there since it spans $`S`$. Thus the external neighbourhood of $`R`$ **within** $`H[S]-E(Q)`$ has size at most $`2|R|`$.

Put $`U=N_H(R)\setminus S`$. For each endpoint $`b`$ of $`Q`$ and each $`x\in N_H(b)\setminus S`$, maximality imposes

```math
N_H(x)\cap R\subseteq\{b\}.
```

Indeed, if $`x`$ also sees a reachable endpoint $`r\ne b`$, take the rotation ending at $`r`$. Appending $`x`$ via $`rx`$ to the red path and via $`bx`$ to the blue path extends both vertex sets to $`S\cup\{x\}`$; the two added edges are distinct and neither belonged to either old path. The case $`r=b`$ must be excluded, as it would try to use the same edge twice. In particular if $`b\notin R`$, the outside neighbourhood of $`b`$ is disjoint from $`U`$. More generally every outside vertex with two neighbours in $`R`$ must avoid both endpoints of $`Q`$.

For $`a w(N)>2`$, set $`\eta=2/(a w(N))`$. Edge deletion $`F=E(Q)`$ meets the degree budget of the preceding profile. With $`r=|R|`$, that profile gives the quantitative alternative:
- Either $`r`$ exceeds the range in which $`(C+1)r+\mathrm e^{\mathrm e}\le\exp[(\log(N+\mathrm e^{\mathrm e}))^{(1-\eta)/(C+1)}]`$;
- Or $`|U|>(C-2)r`$.

Here $`C`$ is any fixed integer at least three. For the second outcome apply the expansion to $`R`$ in $`H-E(Q)`$; at most $`2r`$ neighbours lie in $`S\setminus R`$, and removal of $`Q`$ does not affect edges to the outside. The original starting endpoint lies outside $`R`$, so $`R`$ is proper even when $`S=V(H)`$. 

This isolates an outside-neighbour condition that would force a larger **common** support, in contrast to a one-colour booster. It is not legitimate to form two independent large endpoint sets by rotating $`P`$ with $`Q`$ fixed and rotating $`Q`$ with $`P`$ fixed and then assume arbitrary endpoints remain compatible: the rotated paths can use some of the same formerly unused edges. Nor does the size lower bound on $`U`$ ensure it meets the outside neighbours of a blue endpoint. Producing compatible rotation families or a different common-support extension is still required.

## Independent rotations can collide in arbitrarily large girth

There are simple bipartite examples of arbitrary girth where both initial paths span and their four endpoints are distinct, but a valid single rotation of each, tested against the other *original* path, gives two paths with a common edge.

First obtain a high-girth bipartite graph decomposed into two Hamilton cycles and one perfect matching. To construct it, use the [girth-raising argument for labelled Hamilton factors](HAMILTON-MODULES.md) with total degree five, starting from two labelled copies of a spanning bipartite cycle and a labelled perfect matching. When the chosen shortest-cycle edge belongs to a Hamilton label, use the usual opposite-direction switch within that Hamilton cycle. When it belongs to the matching, use a distant edge of the same matching, and exchange the two right-side endpoints of the two edges. The second operation preserves the matching. In both cases a new cycle using one new edge must traverse a long old connector; if it uses both new edges, it either traverses a long connector or contains two old paths joining the deleted-edge endpoints, each of length at least the current girth minus one. Thus the same lexicographic decrease applies, including length two in the initial multigraph. A sufficiently large side size ensures a distant edge in each of the required perfect matchings.

Take an edge $`uv`$ of the reserve matching. Break the red cycle at an edge incident to $`u`$, obtaining a red path with moving endpoint $`u`$. Break the blue cycle at an edge incident to $`v`$, obtaining a blue path with moving endpoint $`v`$. The fixed endpoint of the red path is not $`v`$, and that of the blue path is not $`u`$, because the graph is simple and $`uv`$ belongs to the reserve matching. The other two endpoints are of different bipartition colours, so all four endpoints are distinct. In the red path $`v`$ is an internal vertex and is not the predecessor of $`u`$; in the blue path $`u`$ is internal and is not the predecessor of $`v`$. Thus $`uv`$ can be used as a Pósa rotation edge for either path individually, avoiding the other original path. Both resulting paths contain $`uv`$. This is an obstruction to combining arbitrary certificates from separate rotation searches, not an assertion that no other compatible rotations are possible.
