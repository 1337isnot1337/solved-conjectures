# Geodesic congestion and squared bipartization distances

For a fixed cut, let $`B`$ be the bipartite crossing graph and $`M`$ the monochromatic edges, with capacities $`p_u p_v`$ from positive vertex masses of sum $`N`$. Suppose all monochromatic edge mass can be routed through **shortest** $`B`$-paths between its endpoints, with congestion one. Write $`\ell_{uv}=d_B(u,v)+1`$, $`a=\sqrt2-1`$, and $`\kappa=2-\sqrt2`$. Then
```math
 \sum_{uv\in M}p_up_v\left[(\ell_{uv}-\kappa)^2+a^2\right]\le N^2. \tag{1}
```
If all monochromatic edges lie on one side of the cut, then the stronger bound is
```math
 \sum_{uv\in M} p_up_v\bigl(\ell_{uv}-(3-2\sqrt2)\bigr)^2\le N^2. \tag{2}
```
Thus in odd girth at least $`g`$, a maximum cut admitting the routing has deletion mass at most $`N^2/[(g-\kappa)^2+a^2]`$; the denominator improves to $`(g-(3-2\sqrt2))^2`$ with all defects on one side. The constants approach the conjectured $`N^2/g^2`$, uniformly in $`g`$. This is not the exact triangle-free conjecture, nor the $`\sum p_up_v\ell_{uv}^2\le N^2`$ auxiliary question of [Ferudun, §7](https://arxiv.org/html/2606.28041v1).

## Two side-by-side budgets

Write $`X,Y`$ for the two cut sides with masses $`x,y`$, and $`b(v)=\sum_{w\in N_B(v)}p_w`$. Each routed path $`P`$ has even length $`2k`$, and one can split a demand among different shortest paths. Let $`F_P`$ be its routed mass. Assign weight $`t_P(v)=1`$ at internal vertices and $`1/2`$ at endpoints, so the number of route-edges incident to $`v`$ is $`2t_P(v)`$. Unit capacity implies the two separate budgets
```math
 \sum_P F_P \sum_{v\in P\cap X}\frac{t_P(v)}{b(v)}\le\frac{x}{2},
 \qquad
 \sum_P F_P \sum_{v\in P\cap Y}\frac{t_P(v)}{b(v)}\le\frac{y}{2}.
```
Vertices with zero crossing degree are not on a routed path.

A vertex of $`B`$ has at most two neighbors on any shortest path: two positions at distance more than two could be joined through that vertex to shorten the path; bipartiteness puts all its path neighbors in positions of the same parity. This also holds for vertices on the path since it has no chord. Hence
```math
 \sum_{v\in P\cap X} b(v)\le2y,\qquad
 \sum_{v\in P\cap Y} b(v)\le2x.
```
For a path with endpoints in $`X`$, the two side sums of $`\sqrt{t_P(v)}`$ are $`k-1+\sqrt2=k+a`$ and $`k`$. Cauchy–Schwarz on each side, separately, bounds the corresponding sums of $`t_P(v)/b(v)`$ below by $`(k+a)^2/(2y)`$ and $`k^2/(2x)`$. For endpoints in $`Y`$, the roles reverse. Thus the $`X`$-budget after multiplication by $`2y`$ bounds the appropriate sum of squares by $`xy`$; the $`Y`$-budget does the same. Adding and doubling gives (1), since
```math
 2[(k+a)^2+k^2]=(2k+a)^2+a^2=(\ell_{uv}-\kappa)^2+a^2,
 \qquad 4xy\le N^2.
```
If endpoints are always in $`X`$, the $`X`$-budget alone bounds the sum of $`(k+a)^2`$ by $`xy`$. Multiply by four to obtain (2).

## Trees and a sufficient condition for the unshifted bound

If the crossing graph of a maximum cut is a forest, each demand lies within one tree and the unique path is shortest. After removing one crossing edge, the global switching inequality bounds all demand routed through it by that edge's capacity. A demand cannot join distinct $`B`$-components, since flipping a whole component would then improve the cut. Thus the routing hypothesis holds for **every** product-weighted maximum cut whose crossing graph is a forest. This provides a weighted all-girth result; for triangles excluded and $`g\le11`$, see the stronger exact forest transfers in [RECIPROCAL-ODD-COVER.md](RECIPROCAL-ODD-COVER.md).

For a route in a tree, a vertex off the path has at most one neighbor on it, and on-path endpoints have only one. Therefore
```math
 \sum_{v\in P} b(v)\le N+\mu(P\setminus\{u,v\}).
```
The same budgets, summed over both sides, then give the additional exact estimate
```math
 \sum_{uv\in M}\frac{p_up_v(\ell_{uv}-\kappa)^2}
 {N+\mu(P_{uv}\setminus\{u,v\})}\le N/2 .
```
In particular, the full unit-constant distance bound holds if every demand path has interior mass at most $`N[2(1-\kappa/g)^2-1]`$. This condition is useful when no single demand path spans almost all the vertex mass; when it fails, the shifted distance estimates still apply.

The shortest-path qualification is essential to this proof. Unit routing without that qualification gives no two-neighbors-on-a-route assertion, and maximum-cut optimality alone does not give unit routing in general, as shown by the [multiflow barrier](MULTIFLOW-BARRIER.md).

[Coordination issue #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
