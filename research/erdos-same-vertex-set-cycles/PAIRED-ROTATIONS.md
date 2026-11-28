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
