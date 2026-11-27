# A fixed improvement on one third for average pinned distances

For a finite set in the Euclidean plane, a *pin* is a point from which distances are measured. For a finite planar point set $`P`$ and $`x\in P`$, let $`d_P(x)`$ be the number of distinct positive distances from $`x`$ to points of $`P`$.

**Theorem.** There exist absolute constants $`\eta>0`$ and $`n_0`$ such that, whenever $`P`$ has $`n\ge n_0`$ points and no three are collinear,

```math
\sum_{x\in P}d_P(x)>\left(\frac13+\eta\right)n^2 .
```

In particular some point determines more than $`(1/3+\eta)n`$ distinct distances. Erdős posed both conclusions in equations (5) and (3), respectively, on p. 168 of *Some combinatorial and metric problems in geometry* (1987), under the additional hypothesis that no four points are concyclic. A [subsequent proof](ARBITRARY-COLLINEARITIES.md) settles his proposed extension allowing arbitrary collinearities while prohibiting four concyclic points. [Original paper, pp. 167–168](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2)

A configuration close to the one-third bound would give many triples of points at equal distance from a pin. We first show that in a scaled limit these triples would have a strong probabilistic property. We then use the paraboloid lift to restrict the support of the limit and rule it out.

## From near equality to four pairwise independent points

Suppose the theorem fails. There is a sequence of sets with $`n\to\infty`$ and total pinned count at most $`(1/3+o(1))n^2`$. For every pin and every occurring positive radius, write $`t`$ for the number of points at that distance. Sums over $`t`$ count each pin and each of its radius classes separately. We have $`\sum t=n(n-1)`$. The sum $`\sum t(t-1)`$ counts ordered pairs of distinct base points together with an equidistant pin. At most two pins lie on the perpendicular bisector of any pair. Thus

```math
\sum(t-3)^2
=\sum t(t-1)-5\sum t+9\sum_{x\in P}d_P(x)
\le -3n(n-1)+9\sum_{x\in P}d_P(x)
=o(n^2)
```

Here the final upper bound follows from the assumed bound on the sum of the pinned counts, and the left side is nonnegative. For every positive integer $`t\ne3`$, one has $`t\le4(t-3)^2`$. Therefore all but $`o(n^2)`$ ordered pairs consisting of a pin and another point belong to classes of size three.

Choose uniformly an ordered quadruple $`(X,Y_1,Y_2,Y_3)`$ in which the three base points enumerate a whole class of size three about $`X`$. There are $`2n(n-1)-o(n^2)`$ quadruples. A fixed ordered pin–base pair has at most two completions, the two orders of the other base points. A fixed ordered base–base pair also has at most two completions. Its pin must lie on the perpendicular bisector, and then the third base is uniquely determined. The array of counts for any two fixed coordinates is thus obtained from the constant array of two on ordered distinct pairs by deleting $`o(n^2)`$ entries counted with multiplicity. Every two-coordinate law differs by $`o(1)`$ in total variation from $`\mu_n\otimes\mu_n`$, where $`\mu_n`$ is uniform on $`P`$. The product law gives the diagonal mass $`1/n`$.

Let $`B`$ be a smallest closed disk containing at least two thirds of $`P`$. Rescale and translate to make $`B`$ the unit disk about the origin. The radius is positive for all sufficiently large $`n`$, and a minimizing disk exists since only finitely many subsets are involved. Put $`A=\mathbb R^2\setminus 3B`$. If $`Y_1\in A`$, then $`X`$ and $`Y_2`$ cannot both belong to $`B`$, since $`|X-Y_1|=|X-Y_2|`$. With the two-coordinate estimates and their one-coordinate marginals, this gives

```math
\mu_n(A)\le 2\mu_n(A)\big(1-\mu_n(B)\big)+o(1)
\le \frac23\mu_n(A)+o(1).
```

The mass outside $`3B`$ tends to zero. The joint quadruple laws are tight and have a weakly convergent subsequence. Its common marginal $`\mu`$ is supported on the closed disk $`3B`$. The law of every pair is exactly $`\mu\otimes\mu`$, by weak convergence of products and the uniform total-variation comparison. The closed equal-distance relation persists in the limit. The limit $`\mu`$ is not a point mass. Otherwise an open disk of radius $`1/2`$ about its atom would eventually contain more than two thirds of $`P`$, contrary to the defining minimality. Let $`K`$ be the support of $`\mu`$.

## The paraboloid lift

Define $`F(y)=(y_1,y_2,|y|^2)`$, let $`m`$ be its $`\mu`$-mean and let $`\Sigma`$ be its covariance matrix. Write $`V`$ for the range of $`\Sigma`$ and $`k`$ for its dimension. For $`y\in K`$, $`F(y)-m`$ belongs to $`V`$. Define $`G(y)=\Sigma^{-1/2}(F(y)-m)`$, taking the inverse on $`V`$. Then $`G`$ has mean zero and identity covariance on $`V`$.

At $`x=(x_1,x_2)`$ set $`a_x=(-2x_1,-2x_2,1)`$. Since $`a_x\cdot F(y)=|y-x|^2-|x|^2`$, the three whitened base lifts $`G(Y_i)`$ have equal projections onto

```math
e_x=\frac{\Sigma^{1/2}a_x}{|\Sigma^{1/2}a_x|}.
```

This denominator is nonzero at every $`x\in K`$. Its square is the variance of $`|Y-x|^2`$, for $`Y`$ of law $`\mu`$. A zero variance would make $`|y-x|^2`$ constant on $`K`$ by continuity, hence zero since $`x\in K`$. This contradicts the fact that $`K`$ contains at least two points.

Set $`U=(G(Y_1)+G(Y_2)+G(Y_3))/3`$. Pairwise independence of the three base points gives $`\mathbb E|U|^2=k/3`$. Their common projection gives $`U\cdot e_X=G(Y_1)\cdot e_X`$. Since $`X`$ and $`Y_1`$ are independent and $`G`$ is isotropic on $`V`$,

```math
\mathbb E (U\cdot e_X)^2=1.
```

As $`k\le3`$, this forces $`k=3`$ and $`U=(U\cdot e_X)e_X`$ almost surely.

For each $`x\in K`$, the event that $`X`$ and $`Y_1`$ both lie within $`\varepsilon`$ of $`x`$ has positive probability, by their independence. On that event each $`Y_j`$ is within $`3\varepsilon`$ of $`x`$. Fix a sequence $`\varepsilon_j\downarrow0`$. For each $`j`$, choose an outcome in the corresponding positive-probability event for which the projection identity holds. Along these outcomes the pin and all three base points converge to $`x`$. Continuity gives $`G(x)=(G(x)\cdot e_x)e_x`$. Thus $`\Sigma^{-1}(F(x)-m)`$ is parallel to $`a_x`$. This vector $`a_x`$ is normal to the lifted paraboloid at $`F(x)`$, so $`x`$ is a critical point of

```math
Q(x)=(F(x)-m)^\mathsf T\Sigma^{-1}(F(x)-m).
```

## The support and the diameter obstruction

The degree-four part of $`Q(x)`$ is $`a|x|^4`$ for some $`a>0`$. Its degree-three part is $`|x|^2`$ times a linear form. If its linear factor is $`b\cdot x`$, translating $`x=z-b/(4a)`$ removes the cubic term, and an orthogonal change diagonalizes the remaining quadratic part. In the resulting coordinates the critical equations have the form

```math
(4as+2b_i)z_i=-u_i,\qquad i=1,2,\qquad s=z_1^2+z_2^2 .
```

For $`s`$ other than the two possible poles $`-b_i/(2a)`$, substitution gives $`s=\sum_i u_i^2/(4as+2b_i)^2`$. Clearing denominators produces a nonzero polynomial since the right side tends to zero as $`s`$ tends to infinity. There are only finitely many corresponding points. At a pole with precisely one zero coefficient, the other coordinate is fixed and the condition on $`s`$ permits at most two points. An infinite critical set therefore requires $`b_1=b_2`$ and $`u_1=u_2=0`$. In that case the critical set is contained in one circle together with its center. We have proved that $`K`$ is finite or is contained in one circle together with its center.

Almost surely on $`X\ne Y_1`$ the three base points are pairwise distinct even after taking the weak limit. For any atom $`z`$, the event $`X=Y_i=z`$ forces all three base points to equal $`z`$. Its probability $`\mu(\{z\})^2`$ already equals the probability of $`Y_i=Y_j=z`$ for $`i\ne j`$. The diagonal of two independent copies of $`\mu`$ outside its countably many atoms has probability zero. This proves the assertion.

Suppose first that $`K`$ is infinite and lies on a circle of radius $`R`$ together with its center. Choose two outer support points $`x,y`$ such that $`0<|x-y|\ne R`$. Such a pair exists because only two points of the outer circle can be at a given positive distance from $`x`$. Small neighborhoods of $`x,y`$ have positive measure and give positive probability that $`X,Y_1`$ both lie on the outer circle with $`0<|X-Y_1|\ne R`$. The circle about $`X`$ with this radius misses the center and meets the outer circle in at most two points. It cannot supply the required three distinct base points.

Finally, suppose $`K`$ is finite. For any distinct $`x,y\in K`$, the event $`X=x,Y_1=y`$ has positive probability. Hence at least three distinct points of $`K`$ are at distance $`|x-y|`$ from $`x`$. In particular all nonisolated vertices in its diameter graph have degree at least three. The following elementary planar diameter argument excludes this possibility. Every diameter endpoint is a vertex of its convex hull since a disk centered at the other endpoint contains $`K`$ and is strictly convex. Two diameter edges with disjoint endpoints must cross. Otherwise, on their convex quadrilateral they are opposite sides and the sum of the two diagonals is strictly greater than the sum of these sides, which already equals twice the diameter. If a diameter vertex $`v`$ has three neighbors $`a,b,c`$ in the cyclic order $`v,a,b,c`$, the middle neighbor $`b`$ has no further diameter neighbor. A chord from $`b`$ to a vertex distinct from $`v,a,c`$ can cross $`va`$ only if its other endpoint is on the open arc from $`v`$ to $`a`$ away from $`b`$, and can cross $`vc`$ only if it is on the disjoint open arc from $`c`$ to $`v`$. The chords $`ba`$ and $`bc`$ each miss the other outside edge. This rules out minimum degree three on the diameter endpoints and finishes the contradiction.

Consequently the infimum of the normalized sum over such sets has limit inferior strictly above one third. Taking any positive $`\eta`$ smaller than the gap gives the theorem and its conclusion for a single pin.
