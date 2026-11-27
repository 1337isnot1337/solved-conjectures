# The carrier-size exponent for pin–pair incidences

There are planar sets of arbitrarily large size $`n`$ without four cocircular sites, with maximum collinearity $`O(n^{2/3})`$, supporting $`\Omega(n^2)`$ pin–pair incidences whose carrier contains $`\Theta(n^{2/3})`$ sites and whose bisector contains $`\Omega(n^{1/3})`$ pins. Every circle being counted here contains exactly two sites of the set. This attains the carrier-size exponent in the [single-side incidence estimate](CARRIER-SCALES.md). The corresponding circles have no third base.

## Sites and coordinates

Fix an integer $`p\ge2`$, put $`t=4p^2`$, and fix a transcendental real number $`d`$. Take the source set

```math
X=\{(a+di,i):1\le a\le t,\ 1\le i\le p,\ a,i\in\mathbb Z\}.
```

For $`j=1,\ldots,p`$, let $`v_j=(1,j-d)`$ and $`v_j^\perp=(d-j,1)`$. Place $`7t+1`$ additional sites on the carrier $`H_j`$ parallel to $`v_j`$ by taking

```math
B_j=\{b v_j/|v_j|^2+\lambda_jv_j^\perp:
-3t\le b\le4t,\ b\in\mathbb Z\}.
```

The translations $`\lambda_j`$ will be chosen outside a finite family of proper real polynomial zero sets, as justified below. They ensure disjointness of all site sets and that the resulting set $`P=X\cup\bigcup_jB_j`$ has $`n=pt+p(7t+1)`$ sites. A line meets $`X`$ in at most $`t`$ sites, since it either is horizontal or meets each of its $`p`$ rows at most once. Any line other than one of the $`H_j`$ contains at most $`p`$ additional sites. A line equal to $`H_j`$ contains at most $`7t+1+(p-1)`$ additional sites. Hence maximum collinearity is $`O(t)`$, and each $`H_j`$ has between $`7t+1`$ and $`O(t)`$ sites.

## No four sites on a circle

The sources alone have no four cocircular sites. A quadruple with three collinear sites cannot lie on a circle. For four lattice labels $`(a,i)`$ without three collinear, the four rows $`(1,a,i)`$ have a one-dimensional left nullspace, spanned by a rational vector $`w`$ all of whose coordinates are nonzero. The invertible shear to $`(a+di,i)`$ preserves the space of affine relations. Concyclicity would imply

```math
\sum w_{a,i}\bigl(a^2+2dai+(d^2+1)i^2\bigr)=0.
```

Transcendence forces $`w`$ to annihilate the evaluations of $`i^2,ai,a^2`$ as well. It would then annihilate every quadratic polynomial in $`(a,i)`$. A product of a line through two of the other three labels and a line through the third can vanish at those three while missing the fourth. This contradicts the nonzero coefficient of the fourth.

No two distinct source sites have difference parallel to $`v_j`$. Indeed their displacement has the form $`(A+dk,k)`$ for integers $`A,k`$. Its dot product with $`v_j^\perp`$ vanishes only if

```math
kd^2+(A-jk)d+(k-jA)=0,
```

which gives $`k=A=0`$.

All different targets have distinct directions. Choose the translations generically so that all site labels give distinct points. To see that this is possible, a specified point on a target moves nontrivially with its own translation, independently of the other targets and sources. Consider now any potential cyclic quadruple containing a target site.

* Three sites on a single target carrier are collinear.
* If a target contributes just one site, fix the other three at distinct points. If they are not collinear, their unique circle meets this site's line of variation in at most two points. If the other three are collinear, no circle contains them. More formally, when collinearity of the other three holds identically, the quadruple is harmless. Otherwise choose their translations with noncollinear positions, demonstrating that the concyclicity determinant is a nonzero polynomial.
* The remaining pattern is two points on one target and either two source sites or two points on another target. The pair bisector of two sites with labels $`b,b'`$ on $`H_j`$ is the fixed line $`v_j\cdot z=(b+b')/2`$. This line does not depend on $`\lambda_j`$. The other pair has a fixed nonparallel bisector, by the source-displacement fact or the distinct target directions. These bisectors therefore determine a prospective circumcenter independent of $`\lambda_j`$. The squared distance of a target site to that center is a nonconstant quadratic in $`\lambda_j`$, while the other pair has fixed radius.

Each prohibited concyclicity is either impossible or lies in a proper polynomial zero set. There are finitely many patterns, so the generic choices can satisfy them all.

## Counting separate pin–pair incidences

At a source pin $`x=(a+di,i)`$ the scalar projection $`v_j\cdot x=a+ji`$ is integral. Restrict to integers $`u`$ with $`p^2+1\le u\le t`$. For each $`j`$ and every row $`1\le i\le p`$, the choice $`a=u-ji`$ is in $`[1,t]`$. The bisector $`L_{j,u}`$ defined by $`v_j\cdot z=u`$ thus contains at least $`p`$ distinct pins.

For each $`1\le k\le t`$, the two labels $`u-k`$ and $`u+k`$ lie in $`[-3t,4t]`$. Their target sites form an unordered reflected pair across $`L_{j,u}`$. Different $`k`$ give different unordered pairs. Each fixed pair is assigned its $`p`$ separate source pins, with each site incidence counted once. Different $`j`$ give pairs in disjoint target sets, and different $`u`$ in the same target give distinct midpoints, hence different pairs. The count is at least

```math
p\,(t-p^2)\,t\,p = \Omega(n^2).
```

In particular the same lower bound counts incidences with at least $`K`$ equidistant pins for any $`2\le K\le p`$, including any such sequence tending to infinity.

The generic choice of translations can also ensure that every displayed pin-circle has exactly its two specified target sites. It intersects its own carrier in those two points. A third source site has fixed distance to $`x`$, whereas the squared distance from $`x`$ to the specified target site is a nonconstant quadratic in $`\lambda_j`$. A third site on $`H_l`$, $`l\ne j`$, has distance independent of $`\lambda_j`$ when the other translations are fixed, giving the same proper polynomial restriction. Finitely many such exclusions suffice. This last condition separates the single-side incidence count from the count of completed triangles in the open pinned-distance problem. [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)
