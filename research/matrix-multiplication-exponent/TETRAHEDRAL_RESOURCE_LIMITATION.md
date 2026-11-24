# Limitation of a specified four-party resource calculation

Status: a scalar certificate for the operation list below. It is not a spectral point, not an obstruction to arbitrary tensor restriction, and not a lower bound on the actual tetrahedral overhead exponent.

Let $`2\le\tau\le9/4`$ be the matrix multiplication exponent bound used in a resource calculation. On the four labels $`I=\{A,B,C,D\}`$, assign logarithmic charges

```math
u(\varnothing)=u(\{i\})=0,\qquad
u(\{i,j\})=d_{ij}=\frac23,\qquad
u(S)=\frac2\tau\ (|S|=3),\qquad u(I)=1.
```

Charges add on products and scale with logarithmic dimensions. The tetrahedral source and complete-graph target then have charges

```math
\mathcal L(H_q)=\frac8\tau,\qquad
\mathcal L(K_q)=4.
```

The following operations all decrease or preserve this charge:

1. Project a subset unit to a smaller subset, join two intersecting subset units into their union, or contract a wire path.
2. Convert a three-party unit to a triangle using the square matrix multiplication bound $`\tau`$.
3. Distill a subset unit using a hypergraph minimum-cut rate, even allowing helper labels among the four labels.
4. Use any weighted graph rank upper bound from Zhou's completely positive covering program with the path inequalities.
5. Apply any intersecting unit uncrossing inequality, even at zero overhead.

For the first item, the needed inclusion and triangle inequalities are immediate; the union inequality follows from item 5 by discarding its nonnegative intersection charge. The second item has equality: a triangle has charge $`3(2/3)=2`$, while its unit resource of logarithmic size $`\tau`$ has charge $`\tau(2/\tau)=2`$.

For the third item, write $`u_k`$ for the charge of a $`k`$-element subset. For $`k=2,3,4`$, the sequence $`u_k`$ is nondecreasing and $`u_k/k`$ is nonincreasing. Fix a terminal set $`P`$ of size $`k\ge2`$ in any weighted hypergraph on $`I`$, and let $`\lambda_P`$ be its terminal minimum cut. Each singleton terminal cut $`\{p\}\mid I\setminus\{p\}`$ has capacity at least $`\lambda_P`$. Weight these $`k`$ cuts equally, with weight $`u_k/k`$ each. For a hyperedge $`H`$ of size $`\ell\ge2`$, their total crossing weight is

```math
\frac{u_k}{k}|H\cap P|
\le\frac{u_k}{k}\min(k,\ell)\le u_\ell.
```

The last inequality uses the decreasing ratio when $`\ell\le k`$ and monotonicity when $`\ell\ge k`$. Singleton hyperedges cross no cut and have charge zero. Summing with the hyperedge weights therefore proves

```math
\lambda_Pu(P)\le\sum_H w_Hu(H).
```

This verifies every such scalar mincut inequality on these four labels, without importing any helper-terminal tensor distillation theorem.

For the fourth item, the wire matrix $`D`$ has zero diagonal and off-diagonal entries $`2/3`$, so

```math
J-2D=\frac43I-\frac13J\succeq0.
```

It is therefore copositive, and $`D`$ obeys all triangle/path inequalities. Weak duality for Zhou's path-strengthened completely positive program gives $`\sum_{i<j}w_{ij}d_{ij}\le U_{\mathrm{CP}}^\Delta(w)`$ for every nonnegative weighted graph. Thus a full-unit resource charged by this graph bound always pays at least the graph's assigned charge. This invokes the program and its dual from Zhou, [arXiv:2610.34273v3](https://arxiv.org/html/2610.34273v3), Section 5, not a claim that $`D`$ is a tensor spectral point.

For the fifth item, nested subsets give equality. Apart from singleton intersections, the only nontrivial four-label case is two triples intersecting in a pair:

```math
u(ABC)+u(ABD)=\frac4\tau\ge\frac53=u(I)+u(AB),
```

since $`\tau\le9/4<12/5`$. For two pairs meeting in a singleton, the inequality is $`4/3\ge2/\tau`$; for a pair and triple meeting in a singleton, it is $`2/3+2/\tau\ge1`$. Both hold throughout the stated range. Consequently charging a positive uncrossing overhead cannot help violate this certificate either.

It follows that any resource derivation composed only of these operations requires additional full-unit charge at least

```math
4-\frac8\tau
```

to turn $`H_q`$ into $`K_q`$. The uniform face-triangle construction followed by creating the residual complete-graph wires at cost four attains exactly this value at the exponent level. Thus the resource calculation cannot improve the existing tetrahedral upper bound, even if uncrossing itself is supplied for free.

The certificate does not cover arbitrary tensors, arbitrary tensor covers, new coefficient-sensitive source maps, or auxiliary configurations with additional party labels. It must not be read as a lower bound on the true exponent $`\gamma`$. Its purpose is to identify exactly why recombining the listed four-party operations cannot close the remaining gap.
