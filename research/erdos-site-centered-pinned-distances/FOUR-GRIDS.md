# Distributed locally capped sets with quadratically many rich active bisector incidences

For arbitrarily large $`n`$ there are planar sets $`P`$ with all of the following properties.

- Each site-centered circle has at most three sites and **every** circle in the plane has at most four.
- Each line contains $`O(\sqrt n)`$ sites.
- For every fixed $`K,B`$, the two-sided active-bisector excess $`R_{K,B}(P)`$ is at least $`(1/64-o(1))n^2`$. Parallel axes alone supply this bound.
- These sets have mean pinned count strictly above one third by a fixed positive proportion for large $`n`$ and thus do not disprove the conjecture.

Here $`a_e`$ is the number of pins completing a base pair $`e`$ to an occupied site-centered triple. The excess first discards any $`B`$ reflected pairs per axis and then discounts the first $`K`$ completions of every remaining pair. The example rules out a subquadratic upper bound on this excess from dispersion and local capacity alone, even immediately beyond the published global cap of three. It also supplies triples for a positive proportion of all ordered pin–base pairs. [Local question](https://github.com/1337isnot1337/solved-conjectures/issues/969) · [Global-cap-three theorem](https://github.com/1337isnot1337/solved-conjectures/pull/968)

## Construction

Use complex coordinates. Choose $`t>1`$ transcendental, let $`i^2=-1`$ and set

```math
\gamma=-1/2+it,\qquad s=1/\gamma,\qquad \zeta=\gamma/(\gamma+1).
```

Here $`|\zeta|=1`$, $`\zeta\ne1`$, $`|1-\zeta|\ne1`$ and $`1-\zeta=\zeta s`$. For $`m\ge2`$ let $`I=\{1,\ldots,m\}`$ and $`J=I+I=\{2,\ldots,2m\}`$. The four clusters are

```math
X=\{ia+\gamma b:a,b\in I\},
```

```math
Y=w+\{u+isv:u,v\in I\},
```

```math
V=-\bar w+\{-j-\overline{is}\,v:j\in J,\ v\in I\},
```

```math
Z=\zeta w+\zeta\{j+is k:j,k\in J\}.
```

We choose $`w=R A`$ with $`|A|=1`$ of generic phase and $`R`$ sufficiently large, separately for each finite $`m`$. The four disjoint grids have total size $`n=8m^2-5m+1`$.

For $`x=ia+\gamma b\in X`$ and $`y=w+u+isv\in Y`$ define

```math
y'=2\operatorname{Re}x-\bar y=-\bar w-(u+b)-\overline{is}\,v\in V,
\qquad z=x+\zeta(y-x)=\zeta w+\zeta\big((u+b)+is(v+a)\big)\in Z .
```

The first map reflects across the vertical line through $`x`$ and the second rotates about $`x`$. Thus $`y,y',z`$ are equidistant from $`x`$. For each $`b`$ there are $`m`$ pins on this vertical axis and $`m^2`$ distinct pairs $`\{y,y'\}`$, independent of $`a`$. Once the local cap below is verified, every one of the $`m`$ pins is an active completion of each of the $`m^2`$ pairs. The excess is therefore at least $`m(m^2-B)(m-K)`$ for large $`m`$. The asserted constant follows from $`n/m^2\to8`$.

## Individual grids

Each grid is a translated, rotated, reflected or scaled subset of the rank-two grid with generators $`i,\gamma`$: multiplication by $`s`$ sends these to $`is,1`$. Any line intersects each rectangular index grid in at most $`2m-1`$ sites by projection onto an index coordinate on which the line is nonconstant. Distinct sites have distinct index pairs.

No individual grid has four concyclic sites. Its Gram coefficients are $`1,t,t^2+1/4`$, which are linearly independent over the rationals. For four integer index pairs the circle determinant (columns $`1,x,y,\|(x,y)\|^2`$ in the grid metric) is a rational linear form in those three coefficients up to the change-of-coordinate determinant. If a noncollinear quadruple were concyclic, the determinant would vanish identically in every quadratic metric. After an invertible rational affine transformation send three of the index pairs to $`(0,0),(1,0),(0,1)`$ and write the fourth as $`(a,b)`$. The three metric coefficients then have multipliers $`a(a-1),2ab,b(b-1)`$. These cannot all vanish at any fourth distinct site. A line can meet a Euclidean circle in at most two points, so no collinear degeneracy produces an exception.

## Site-centered capacity

The macroscopic cluster offsets are $`0,A,-\bar A,\zeta A`$. Choose $`A`$ so they are distinct, the three nonzero offsets contain no antipodal pair, and the additional finite conditions below hold. At a pin of $`X`$, distinct sites within any one *other* cluster have distinct distances. Indeed the difference of the two squared distances is affine in $`R`$ with leading coefficient proportional to the projection of their nonzero fixed difference on that cluster's offset, which is a nonconstant rotating direction as $`A`$ varies. Exclude its finitely many zero phases for every pair. Distances to the pin's own cluster have bounded size, so each remaining radius at such a pin has at most one site from each of the three other clusters.

At a pin in any other cluster, the three distances between its macroscopic offset and the other offsets can be chosen pairwise different. Writing $`A=e^{i\phi}`$, distances between two direct rotations of $`A`$ are constant, with values $`1`$ and $`|1-\zeta|`$ distinct when those comparisons occur. The squared distances to $`-\bar A`$ from $`A`$ and from $`\zeta A`$ are respectively $`2+2\operatorname{Re}(A^2)`$ and $`2+2\operatorname{Re}(\zeta A^2)`$, different nonconstant functions since $`\zeta\ne1`$. These formulas check the claim at each possible base pin after finitely many phase exclusions. For sufficiently large $`R`$ a single radius from that pin can therefore meet only one target cluster, while all radii within its own cluster stay bounded. The preceding no-four bound within each grid proves the site-centered cap.

At any pin in $`Y`$, distances to the individual sites in $`X`$ are distinct after excluding finitely many orthogonality phases. The same holds for individual sites in $`Z`$, since the nonzero offset difference $`(\zeta-1)A`$ rotates with $`A`$. Distances in these two lists have distinct macroscopic scales. Every pin of $`Y`$ therefore sees at least $`m^2+(2m-1)^2=(5/8+o(1))n`$ distinct distances. At least a $`1/8+o(1)`$ proportion of pins belongs to $`Y`$, and each of the other pins sees at least $`(n-1)/3`$. This gives the fixed positive average gap claimed above.

## Excluding five on an arbitrary circle

A circle meeting more than one cluster cannot take three points of any one cluster for sufficiently large $`R`$. The finitely many noncollinear triples there have bounded circumradii independent of $`R`$, while the minimum separation between clusters tends to infinity. No circle can meet all four clusters either. Upon dividing coordinates by $`R`$, the four distinct limiting offsets are not concyclic: the three nonzero offsets determine the unit circle, which misses zero. The corresponding determinant is nonzero and stays so for all sufficiently large $`R`$.

It remains to check a circle meeting three clusters. These triples of offsets are noncollinear by the phase exclusions. For any fixed choice of one site from each cluster, its circumcenter after division by $`R`$ tends to the circumcenter $`c`$ of the three offsets, by continuity. If two distinct sites from a cluster with offset $`u`$ lie on the circle along an unbounded sequence of $`R`$, their fixed difference $`v\ne0`$ must satisfy $`\operatorname{Re}((c-u)\bar v)=0`$, by subtracting the two squared-distance equations and dividing by $`R`$. Only finitely many choices of sites are involved.

If all three offsets have modulus one, their circumcenter is zero. At each cluster the direction of $`c-u`$ rotates with $`\phi`$, so a generic phase excludes a second site in each one. For a triple consisting of $`0,A,\zeta A`$, all three radii $`c-u`$ rotate together and are nonzero, giving the same conclusion. For a triple consisting of zero, a direct rotation of $`A`$ and $`-\bar A`$, write its two nonzero offsets as $`U=e^{i\eta}e^{i\delta}`$ and $`V=e^{i\eta}e^{-i\delta}`$. The angle $`\eta`$ is constant modulo $`\pi`$ while $`\delta`$ varies with $`\phi`$. Its circumcenter is $`c=e^{i\eta}/(2\cos\delta)`$. The two radius vectors $`c-U,c-V`$ have directions $`\eta+2\delta`$ and $`\eta-2\delta`$ modulo $`\pi`$, as follows by subtracting $`U,V`$. These directions are nonconstant, so a generic phase again rules out a second site in either nonzero cluster. Only the zero cluster can contribute two sites. Every three-cluster circle thus has at most four sites. Two-cluster circles also have at most four by the first paragraph. This proves the global cap.

The global cap is attained when $`m\ge2`$: choose two reflected pairs with the same vertical axis but from different horizontal carriers. The height difference is nonzero, and solving on the axis for equal squared distances from the two pairs gives their common circumcenter. That center is outside the site set by the local cap. In particular the construction pinpoints where the global-cap-three reflection argument breaks.

Lund, Sheffer and de Zeeuw’s §3.4 construction translates subsets of a symmetric ellipse and counts pairs with coincident perpendicular bisectors. It does not require a pin on those axes completing each reflected pair to a full size-three radius class. Lund and Petridis bound bisector energy of Euclidean sets; that energy counts reflected pairs of pairs, independently of any third base or site pin. Here pin completion, the sharp cap of four on arbitrary circles, and the cap of three on site-centered circles hold simultaneously. [Lund–Sheffer–de Zeeuw, Theorem 2.2 and §3.4](https://arxiv.org/pdf/1411.6868#page=11) · [Lund–Petridis](https://arxiv.org/abs/1810.00765)

The starting question and the source-matched no-four-cocircular proof are linked above. A bounded search on local pinned multiplicity, rich perpendicular bisectors and oblique grid constructions located the bisector-energy literature and the older single-carrier examples; their respective hypotheses or incidence statistics differ from the simultaneous **active** completions in these four grids. The two-sided obstruction here is a research example for the original question, not an additional solved conjecture. [Bisector energy](https://arxiv.org/abs/1411.6868) · [Older one-axis examples](../erdos-654-arbitrary-collinearities/BISECTORS.md)

## Exact checks

The [standard-library verifier](check_four_grids.py) uses rational coordinates for three finite examples and exhausts all circumcenters through each site, including those outside the point set. For $`m=2,3,4`$ the sets have 23, 58 and 109 sites, with local/global circle maxima 3/4 in each. They realize 16, 81 and 256 designated full triples and vertical-axis residuals $`R_{1,2}`$ of 4, 42 and 168. Their total pinned counts are 456, 2,977 and 10,646. Both ordinary Python and python -O give the same values. The construction with a transcendental parameter proves the result for arbitrarily large $`m`$.
