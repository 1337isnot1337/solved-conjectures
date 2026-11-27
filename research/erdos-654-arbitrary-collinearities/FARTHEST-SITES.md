# Farthest sites and atomless limits in Erdős Problem 654

The full [catalogue question](https://www.erdosproblems.com/654) allows arbitrarily many collinear points. The result here concerns sequences with a fixed upper bound on the number of collinear points. It shows that even in this class a hypothetical sequence near the one-third bound must have atoms in every compact limiting measure obtained by rescaling the point sets. It does not exclude such atoms. [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## A measure obstruction

There is no atomless, compactly supported probability measure $`\mu`$ on the plane with the following joint law. Four random points $`X,Y_1,Y_2,Y_3`$ have common marginal $`\mu`$. Each $`(X,Y_i)`$ has law $`\mu\otimes\mu`$, and each $`(Y_i,Y_j)`$ for $`i\ne j`$ has law dominated by $`C\mu\otimes\mu`$ for some finite $`C`$. Almost surely the three bases are at the same distance from $`X`$. Pair domination and atomlessness imply that the four points are pairwise distinct almost surely.

### Small circles on a curve

First $`\mu`$ gives zero measure to any portion $`H`$ of a graph with Lipschitz constant $`L<1`$ in some orthonormal coordinates. We may take $`H`$ Borel. A circle about a point of that graph meets the graph at most once on either side of the center. For abscissae $`s<t<u`$, the increase in squared horizontal displacement from $`s`$ is $`(u-t)(u+t-2s)`$. The change in squared vertical displacement is at least $`-L^2(u-t)(u+t-2s)`$ by the Lipschitz bound. This proves strict increase on the right, and reflection handles the left.

Suppose $`\mu(H)>0`$. At $`\mu`$-almost every $`a\in H`$, the differentiation theorem for finite Borel measures on Euclidean space gives

```math
\mu(B(a,r)\setminus H)=o(\mu(B(a,r))).
```

Almost every such $`a`$ also admits radii $`r_j\downarrow0`$ with $`\mu(B(a,3r_j))\le27\mu(B(a,r_j))`$. Otherwise iteration would give $`\mu(B(a,r))\le C_a r^3`$ at all sufficiently small radii. The set of points with this bound has zero measure. To see this, restrict to a bounded region and uniform constants and starting radii, cover by $`O(r^{-2})`$ squares of side $`r`$, and bound the mass of each square meeting the set by a ball about such a point of radius $`2r`$. A countable union removes the uniform restrictions.

Write $`B=B(a,r_j)`$. Independence makes the event $`X,Y_1\in B\cap H`$ have probability $`(1-o(1))\mu(B)^2`$. On that event $`Y_2,Y_3\in3B`$ by the triangle inequality. For $`i=2,3`$, pair domination gives

```math
\Pr(Y_1\in B,\ Y_i\in3B\setminus H)
\le C\mu(B)\mu(3B\setminus H)=o(\mu(B)^2).
```

This leaves positive probability for three distinct points of $`H`$ on a circle centered in $`H`$, contradicting strict increase. In particular the measure gives zero mass to lines, circles and the boundary of its compact convex hull. For the last assertion, the boundary of a planar convex body outside its at most countably many corners has a tangent with locally arbitrarily small slope in suitable coordinates. This follows from monotonicity of the one-sided slopes of a convex graph at a differentiability point. Countably many such coordinate neighborhoods cover the noncorner points. A hull of dimension at most one is already excluded by the line conclusion.

### Sampling a farthest point

Independently sample a pin $`X`$ and $`m`$ sites $`T_1,\ldots,T_m`$ from $`\mu`$. For each $`j`$, sample $`Z_j`$ from the conditional law of $`Y_2`$ given $`(X,Y_1)=(X,T_j)`$. Use independent auxiliary randomness so that the other sites are independent of $`(X,T_j,Z_j)`$. Some $`T_j`$ is farthest from $`X`$. Then $`T_j,Z_j`$ tie for farthest from $`X`$ in the set consisting of all $`T_i`$ and $`Z_j`$.

For a finite set $`S`$, join two distinct sites if they are both farthest from some point of the plane. For $`S`$ in general position this graph has at most $`3h`$ edges, where $`h`$ counts its convex-hull vertices. In fact an interior site cannot maximize distance over $`S`$ by strict convexity of squared Euclidean distance. In the lift $`y\mapsto(y,|y|^2)`$, simultaneous maximizers are a face of the upper convex hull, supported by a plane of slope twice the center. No four cocircular sites and no three collinear sites imply that a nonvertical upper face has at most three vertices. The joined pairs are edges of the upper hull. Its projection is planar on the $`h`$ extreme sites, giving the stated bound. Independent samples from $`\mu`$ are in general position almost surely by the line and circle conclusions.

For each $`j`$ the pair $`(T_j,Z_j)`$ is dominated by $`C\mu\otimes\mu`$ and is independent of the other $`m-1`$ sites. Summing the farthest event over $`j`$ and replacing this pair by two independent ordinary sites therefore gives

```math
1\le C\,\mathbb E[\deg(T_{m+1})]
\le \frac{6C}{m+1}\mathbb E[h_{m+1}],
```

where the graph and the hull count now concern $`m+1`$ independent sites. By exchangeability the expected hull fraction is the probability that one distinguished site lies outside the hull of the others. That site lies in the interior of the convex hull of the support almost surely. Finite neighborhoods of support points already suffice to enclose it strictly in their convex hull, and an infinite independent sample eventually hits all those neighborhoods. Consequently $`\mathbb E[h_{m+1}]/(m+1)\to0`$, giving the contradiction.

## Application to finite point sets

Suppose a sequence of $`n`$-point sets with no four cocircular has $`D\le(1/3+o(1))n^2`$, where $`D`$ is the total pinned count, and every line contains at most a fixed $`M`$ points. Its uniform multiplicity-three quadruples have pin-base law within $`o(1)`$ in total variation of the product of the empirical measures. Their base-pair laws are dominated by $`(M/2+o(1))`$ times that product, since each ordered base pair has at most $`M`$ equidistant pins. The counting details are in [the bisector calculation](BISECTORS.md).

After any similarities for which the empirical measures converge weakly to a compactly supported $`\mu`$, the quadruple laws are tight and have a convergent subsequence. Independence, domination and the closed equal-distance relation pass to the limit. Hence $`\mu`$ must have an atom.

Rescalings with a compact non-Dirac limit do exist. Fix $`C>M/2`$ and choose $`b<1`$ with $`(1+C)(1-b)<1`$. Translate and dilate a smallest ball containing at least $`bn`$ points to the unit disk $`B`$. Put $`A=\mathbb R^2\setminus3B`$. If $`Y_1\in A`$, then $`X`$ and $`Y_2`$ cannot both lie in $`B`$. The pin-base independence estimate and the base-pair domination therefore give

```math
\mu_n(A)\le (1+C)\mu_n(A)(1-\mu_n(B))+o(1).
```

It follows that the mass outside $`3B`$ tends to zero. Minimality rules out a point-mass limit, since a disk of radius $`1/2`$ about its atom would eventually contain more than $`bn`$ points. The conclusion permits limits with a mixture of atoms or continuous and atomic parts. The argument gives neither a contradiction in those cases nor a uniform bound on the base-pair density when collinearities are unrestricted.
