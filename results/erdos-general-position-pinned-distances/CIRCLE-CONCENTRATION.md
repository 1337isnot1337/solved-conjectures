# A fixed circle cannot carry a positive fraction of near-extremal sites

Let a finite planar set have $`n`$ points. On any circle $`C`$, count ordered triples of sites $`(x,y,z)`$ with $`x,y`$ on $`C`$, $`z`$ off $`C`$ and $`|x-y|=|x-z|`$. For every $`\epsilon>0`$ the count is $`O_\epsilon(n^{15/8+\epsilon})`$, uniformly in the set and circle. An elementary application of the Pach–Sharir incidence theorem already gives $`O(n^{2-1/258})`$. There is no condition on circles or collinearities in this mixed incidence estimate.

As a consequence, assume each positive-radius circle centered at a site contains at most three sites. If $`m`$ sites lie on one circle, the sum $`D`$ of the numbers of pinned positive distances satisfies

```math
3D-n(n-1)\ge \tfrac12\big(m(m-1)-O_\epsilon(n^{15/8+\epsilon})\big).
```

In particular a near-extremizer for Erdős's local capacity-three question can put only $`o(n)`$ points on any circle. The argument does not yet give a uniform positive gap for all configurations. [Original question, printed p. 168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2)

## The double covers

Use complex coordinates on the unit circle. Write $`u,v`$ for a pin and an on-circle base, and $`z`$ for a nonzero off-circle base. The center, if present, has at most two corresponding values of $`v`$ for each $`u`$ and contributes $`O(n)`$. Set $`r=|z|`$. The equal-distance equation is

```math
v^2-A_z(u)v+u^2=0,\qquad A_z(u)=z+(1-r^2)u+\overline z u^2.
```

This follows by multiplying the two squared distances by $`uv`$ and using $`\overline u=1/u`$ and $`\overline v=1/v`$. Consider this quadratic over the rational function field $`\mathbb C(u)`$. Its discriminant is

```math
D_z(u)=(z-(1+r^2)u+\overline z u^2)(z+(3-r^2)u+\overline z u^2).
```

The first factor is $`\overline z(u-z)(u-1/\overline z)`$ with distinct roots. The second differs from it by $`4u`$, so the root $`z`$ has multiplicity one in $`D_z`$. This holds even when the second factor has a double root. Thus the quadratic defines a branched double cover. For any fixed $`z`$ there are at most four nonzero off-circle parameters $`w`$ for which $`D_z/D_w`$ is a square rational function, since $`w`$ is a simple root of $`D_w`$ and would have to be a root of $`D_z`$. Call those ordered parameter pairs exceptional.

For a nonexceptional pair $`z,w`$, the two radicands give distinct nontrivial square classes. Their composite extension over $`\mathbb C(u)`$ has degree four, with the two sign changes independent. The locus parametrized by a variable $`u`$ and independent choices of roots $`v`$ of the first quadratic and $`v'`$ of the second is consequently irreducible. More explicitly its coordinate algebra over $`\mathbb C[u]`$ is free of rank four because the quadratics are monic in different variables. The injection into its generic fiber, which is the degree-four field, proves it is an integral domain. Project to the $`(v,v')`$ plane and take the closure. Its image closure $`\Gamma_{z,w}`$ is an irreducible curve. Eliminating $`u`$ via the resultant of the two quadratics in $`u`$ gives a polynomial of degree at most four in each of $`v,v'`$. The resultant is nonzero: for a generic $`v`$ there are at most two $`u`$, then at most two $`v'`$ for each. Equivalently the two polynomials cannot share a root over $`\mathbb C(v,v')`$. Thus the curve has bidegree at most $`(4,4)`$.

The ordered pair $`z,w`$ can be read back from this curve. At $`v=0`$ the only finite $`u`$ is zero. At $`u=\infty`$ the leading coefficient in the $`u`$ equation would be $`1-\overline z v`$, nonzero at $`v=0`$. Thus this fiber contains no additional limiting point supplied by a pole of $`u`$. At $`u=0`$ the two independent equations give $`v=0`$ or $`z`$, and $`v'=0`$ or $`w`$. All four choices are in the irreducible incidence locus, including at the fiber, by the monic coordinate algebra argument. The finite intersection of the projected curve with $`v=0`$ therefore has exactly one nonzero second coordinate, $`w`$. Interchanging the coordinates recovers $`z`$. This also follows by taking the closed incidence variety in projective $`u`$ over the affine $`(v,v')`$ plane: its projection is closed, and any point with $`v=0`$ has $`u=0`$. In particular distinct nonexceptional ordered pairs give distinct curves.

## Counting

For any fixed pin $`u`$, let $`s_u`$ count the distinct off-circle noncentral sites $`z`$ for which at least one circle site $`v`$ solves the distance equation. There are at most two such $`v`$ per pair $`u,z`$. In the sum of $`s_u(s_u-1)`$ the exceptional ordered pairs contribute $`O(n^2)`$ since there are at most $`4n`$ of them. For each of the other ordered pairs counted at $`u`$, select on-circle witnesses $`v,v'`$. The resulting point is on $`\Gamma_{z,w}`$. For fixed $`z,w,v,v'`$ at most two pins can yield the same incidence: the equation in $`u`$ for $`v`$ has degree two with nonzero leading coefficient $`1-\overline z v`$ because $`|v|=1`$ and $`|z|\ne1`$.

Take a common real rational parameter for the circle omitting one point outside the finite set. Its complexification is fractional linear on each coordinate. Apply the corresponding coordinate change on the two copies of the projective line; the bidegree stays bounded by $`(4,4)`$, and in the affine plane the total degree is at most eight. The actual circle parameters are now real. The complex curves for distinct pairs remain irreducible and distinct. If the transformed curve is not invariant under conjugation, its real points are in its intersection with its distinct conjugate and there are at most 64 of them. The other curves are real algebraic curves after scaling their defining equations. Each splits into boundedly many simple real arcs and exceptional points using its singular points, vertical tangencies and bounded-degree real algebraic decomposition. Isolated and splitting points contribute $`O(n^2)`$ in total; there are no vertical or horizontal curve components since both coordinates vary. Two distinct complex curves meet in at most 64 points by Bézout. Hence any 65 distinct points lie on at most one original curve and on boundedly many arcs. The arc pieces of each curve may be taken disjoint away from their finitely many endpoints.

Apply the Pach–Sharir point-curve incidence theorem with 65 degrees of freedom to at most $`n^2`$ real point pairs and $`O(n^2)`$ arcs. The incidence bound is

```math
O\big((n^2)^{65/129}(n^2)^{128/129}+n^2\big)=O(n^{3-1/129}).
```

Adding in the exceptional pairs yields the same upper bound on the second factorial moment. Cauchy–Schwarz now bounds $`\sum_u s_u`$ by $`O(n^{2-1/258})`$, which proves the mixed triple bound including the omitted center. [Pach and Sharir](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/on-the-number-of-incidences-between-points-and-curves/D82C6E430EE5402A3FE18C724A0C14B1)

## The four parameters of the family

The actual curves form an algebraic family of dimension at most four, yielding a stronger quantitative estimate by Sharir and Zahl. Homogenize both quadratic equations in the common variable $`u`$, and take their homogeneous resultant in $`u`$. At finite $`v,v'`$ a common root at infinity requires $`v=1/\bar z`$ and $`v'=1/\bar w`$. Even this point belongs to the original image closure. In the local coordinate $`t=1/u`$ the equation reads

```math
1-\bar z v-(1-|z|^2)vt+v(v-z)t^2=0.
```

Its derivative with respect to $`v`$ at $`t=0`$ is $`-\bar z\ne0`$. The local branches for $`z`$ and $`w`$ at this same $`t`$ give the required pair as a limit. Thus the resultant has precisely the irreducible affine curve as its vanishing set. Over the complex numbers it is a nonzero constant times a power of the irreducible defining polynomial.

In projective coefficient space the resultant is a rational function of the four parameters $`z,\bar z,w,\bar w`$ (regarded first as four complex variables). Its image closure has dimension at most four. For each possible bidegree and power, recovering the projective defining polynomial from its power uses the finite power map on the projective space of bounded-degree forms; equivalently, the polynomial root is unique up to scalar and the map is a morphism of projective varieties with finite fibers. Pullback along that map preserves the dimension bound. There are only finitely many degree strata. Use separate homogenization in each coordinate for the fixed Cayley transformation on the two projective lines, removing any constant choice of degree padding on each stratum. This coordinate transformation preserves dimension. For the real invariant curves one can either use reality of the resulting projective coefficient vector or take the real locus of the union of the complex coefficient family and its conjugate. The real dimension is at most the complex dimension four, and the family has bounded algebraic degree since all maps and strata are fixed independently of the point set. Distinct curves still have no common component.

With at most $`n^2`$ real points and $`O(n^2)`$ curves, Sharir–Zahl Theorem 1.3 gives the upper bound $`O_\epsilon(n^{11/4+\epsilon})`$ on incidences, using the term with exponents $`1/2`$ and $`7/8+\epsilon`$ at dimension four and absorbing the smaller Szemerédi–Trotter term. Families of smaller dimension also satisfy this bound in the balanced case (dimension one can be contained in a fixed larger family by taking cones). Isolated real intersections on curves not invariant under conjugation again contribute only $`O(n^2)`$. Cauchy–Schwarz and renaming the arbitrary epsilon give $`O_\epsilon(n^{15/8+\epsilon})`$ mixed triples. As a separate check, using the fixed 24-dimensional family of all bidegree-$`(4,4)`$ polynomial curves in the same theorem already gives $`O_\epsilon(n^{55/29+\epsilon})`$. [Sharir and Zahl, Theorem 1.3](https://arxiv.org/pdf/1604.07877#page=5)

## Site-centered circles

For the application, consider an ordered pair of distinct sites $`x,y`$ on the fixed circle. The distance circle about $`x`$ and through $`y`$ is distinct from the fixed circle, since $`x`$ is on it and cannot be its center. Thus at most two on-circle sites can share that distance. Any pair in a class of size three therefore requires an off-circle witness counted above. Put $`A_j`$ for the total number of pin–radius classes of size $`j`$. Under the site-centered capacity-three hypothesis, the single or double classes account for at least $`m(m-1)-O(n^{2-1/258})`$ ordered pairs; $`3D-n(n-1)=2A_1+A_2\ge(A_1+2A_2)/2`$. This gives the claim.

McDonald, McDonald, Passant and Sahay study the cardinality of the union of distances between two sets. Their Theorem 1.1 also restricts the occupancy of concentric circles by the other set. The estimate here counts equal distances sharing a pin on the first circle, allows any number of off-circle sites on a common concentric circle, and excludes on-circle third sites, which can give quadratically many triples in regular polygons. [Primary comparison](https://arxiv.org/pdf/2005.02951)

[Independent review](CIRCLE-CONCENTRATION-REVIEW.md) · [Exact checks](check_circle_concentration.py) · [Research issue #969](https://github.com/1337isnot1337/solved-conjectures/issues/969)
