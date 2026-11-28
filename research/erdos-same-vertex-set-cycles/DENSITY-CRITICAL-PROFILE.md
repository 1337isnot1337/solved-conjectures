# A density-critical profile at the log-log scale

A reduction for the open [Erdős #585](https://www.erdosproblems.com/585), not a resolution. It avoids requiring a globally joined subgraph or a spanning cycle, approaches that face the [cube-cover](CUBE-COVER-OBSTRUCTION.md) and [nonspanning](NONSPANNING-NECESSITY.md) obstructions.

Put $`w(x)=\log\log(x+\mathrm e^{\mathrm e})`$ and $`P(x)=(x-1)w(x)`$ for $`x\ge1`$, so $`P(1)=0`$. Start in a simple bipartite graph with an edge, using a cut that retains at least half the original edges if necessary. Choose an induced subgraph $`H`$ with at least two vertices maximizing $`e(H)/P(|V(H)|)`$. Write $`N=|V(H)|`$ and $`a=e(H)/P(N)>0`$. In particular $`a`$ is at least the same ratio for the entire bipartite graph, and every nonempty set $`U\subseteq V(H)`$ satisfies $`e_H(U)\le aP(|U|)`$.

## Incidence budget and resilient vertex expansion

For a nonempty proper set $`S`$ of size $`s`$, its incident edge count (count each edge once) is

```math
e(H)-e_H(V(H)\setminus S)
\ge a\big(P(N)-P(N-s)\big)\ge asw(N).
```

The second inequality follows by expanding $`P(N)-P(N-s)`$ as $`sw(N)+(N-s-1)(w(N)-w(N-s))`$. Applying this with singletons gives $`\delta(H)\ge a w(N)`$. This argument counts all edges touching $`S`$, improving the factor of two lost if using only minimum degree and a double count.

Let $`F`$ be an edge deletion, with at most $`\eta a s w(N)`$ deleted edges touching $`S`$, where $`0\le\eta\lt1`$. Write $`T=S\cup N_{H-F}(S)`$. All remaining edges touching $`S`$ lie inside $`T`$, so

```math
P(|T|)\ge(1-\eta)s w(N).
```

This holds simultaneously for all proper nonempty $`S`$ when $`\Delta(F)\le\eta a w(N)`$. It does not require that $`H-F`$ be regular, and the local bound on $`F`$ does not depend on edges away from $`S`$.

In particular, for an integer $`C\ge1`$, whenever

```math
(C+1)s+\mathrm e^{\mathrm e}
\le\exp\!\left[(\log(N+\mathrm e^{\mathrm e}))^{(1-\eta)/(C+1)}\right],
```

one has $`|N_{H-F}(S)|>Cs`$. Otherwise $`P(|T|)\le((C+1)s-1) w((C+1)s)<(1-\eta)s w(N)`$, contradicting the profile. The range is smaller than a fixed power of $`N`$, but the discarded-degree budget can be a constant fraction of the minimum-degree guarantee.

## Cut budget

For a nontrivial bipartition with shore sizes $`s,N-s`$, the same density comparison on both shores gives

```math
e_H(S,V(H)\setminus S)\ge a\left[
 w(N)+(s-1)(w(N)-w(s)) +(N-s-1)(w(N)-w(N-s))
\right].
```

Thus, before deletion, edge connectivity is at least $`a w(N)`$. The correction for the smaller shore is sensitive to scale; for example, for $`s\le N^\alpha`$ with fixed $`0<\alpha<1`$, its difference $`w(N)-w(s)`$ is at least $`\log(1/\alpha)-o(1)`$. The estimate does not force large-set joinedness.

## Use in a rotation approach

The [standard Pósa rotation lemma](https://arxiv.org/abs/math/0612751) gives the following consequence. Fix one endpoint of a longest path in $`H-F`$, and let $`R`$ be all other endpoints obtainable by rotations keeping the first endpoint fixed. The reachable endpoints have at most $`2|R|`$ external neighbours. Assume the uniform maximum-degree condition on $`F`$ above. The fixed endpoint lies outside $`R`$ (the longest path has at least one edge), so the incidence budget applies to $`R`$. With $`r=|R|`$,

```math
(3r-1)w(3r)\ge(1-\eta)r w(N)
\quad\Longrightarrow\quad
r>\tfrac13\left(\exp[(\log(N+\mathrm e^{\mathrm e}))^{(1-\eta)/3}]-\mathrm e^{\mathrm e}\right).
```

The bound gives many potential endpoints even after bounded-degree deletions, including removal of previously reserved cycles if the degree budget permits. It supplies no edge between the two endpoint clouds and no guarantee that different rotated paths use compatible edge sets; obtaining simultaneous closure remains the main problem.

## Scope

If the candidate $`O(n\log\log n)`$ upper bound is false, this selection gives a sequence of bipartite witness-free graphs with $`a\to\infty`$ and all the preceding estimates. Their orders tend to infinity, since $`e(H)`$ is bounded for each fixed order. This reduction does not enforce bounded degree ratio or high girth simultaneously. It is an application of the density-minimality idea behind sublinear expander extraction; see the [main #585 paper, Appendix A](https://arxiv.org/html/2404.07190v1). The point of the normalization here is the explicit resilient small-set vertex profile at the conjectured density scale, rather than a claim that the standard extraction method is new.

## Vertex separators, matching cuts and treewidth

Partition the vertices into $`A,B,X`$ with $`A,B`$ nonempty and no edges between them. Put $`u=|A|+|X|`$, $`v=|B|+|X|`$, $`k=|X|`$. Since $`e(H)\le e_H(A\cup X)+e_H(B\cup X)`$ and $`u+v=N+k`$, criticality gives the exact necessary inequality

```math
(k-1)w(N)\ge (u-1)(w(N)-w(u))+(v-1)(w(N)-w(v)).
```

In particular there is no cut vertex. If $`u`$ is at most $`\exp[(\log(N+\mathrm e^{\mathrm e}))^\theta]-\mathrm e^{\mathrm e}`$, where $`0<\theta\lt1`$, then $`|A|\le\theta(k-1)/(1-\theta)`$. This quantifies the fact that a small separator cannot isolate a much larger but still small set.

The same comparison bounds the order of both shores of a matching cut. If $`s`$ is its smaller shore, the cut budget is at most $`s`$. For $`a w(N)\ge1`$ and $`s>1`$, the cut inequality above therefore gives $`w(N)-w(s)\le1/a`$. Equivalently,

```math
s+\mathrm e^{\mathrm e}\ge
\exp[(\log(N+\mathrm e^{\mathrm e}))^{\mathrm e^{-1/a}}].
```

A singleton matching cut is excluded outright when $`a w(N)>1`$. Thus available matching cuts in a high-density critical core can be very large, even though the cube-cover examples show that this type of cut cannot in general be forbidden.

The separator inequality also gives treewidth $`\Omega(N/(\log N\log\log N))`$ for the critical core. To see this, take a balanced separator $`X`$, with all components of $`H-X`$ of size at most $`N/2`$. If $`k\ge N/12`$ the desired size bound already holds. Otherwise collect components until their total first reaches $`N/4`$; their union $`A`$ has size at most $`3N/4`$, and the remaining union $`B`$ has size at least $`N/6`$. Thus $`u,v\le 5N/6`$, and both differences from $`w(N)`$ are at least

```math
\frac{N}{6(N+\mathrm e^{\mathrm e})\log(N+\mathrm e^{\mathrm e})}
```

by the derivative of $`w`$. Substituting gives $`k=\Omega(N/(\log N\log\log N))`$. A tree decomposition of width $`t`$ has such a separator of size at most $`t+1`$: assign each vertex to one containing bag, choose a weighted centroid of the decomposition tree, and take its bag. Connectedness of the bag sets for vertices ensures that no component outside the centroid bag crosses between different tree branches. This proves the treewidth claim. A large treewidth controls minors, not the presence of the required degree-four subgraph; no cycle-pair inference is made.
