# Mathematical review of the pinned-distance bound

**Review date.** 26 November 2026. A second project research agent independently reconstructed the argument from its proposed counting and covariance strategy. This review reconstructs the limiting normalization and the quartic classification, and supplies a second elementary diameter argument. This is an internal mathematical review of the written proof.

**Finding.** The argument establishes an absolute positive improvement over one third for the *mean* number of pinned distances in every sufficiently large planar set with no three collinear. It therefore answers Erdős's displays (3) and (5) in the affirmative in the original general-position setting. Display (3) concerns the maximum at one pin, and (5) concerns the sum over pins. General position on page 167 also excludes four concyclic points. Erdős separately proposed dropping the collinearity restriction on page 168. That relaxation was open at the time of this review. The [separate arbitrary-collinearity review](https://github.com/1337isnot1337/solved-conjectures/blob/f60dd0636c0a83fab066a925ebab1c1e888b77a2/results/erdos-general-position-pinned-distances/UNRESTRICTED-REVIEW.md) records its later resolution. The size of the positive improvement and the threshold for the cardinality are unspecified. [Erdős, 1987, pp. 167–168](https://combinatorica.hu/~p_erdos/1987-27.pdf) · [Problem 654 and its variants](https://www.erdosproblems.com/654).

## Counting the six pair marginals

Let $`P_n`$ be a sequence of counterexamples with increasing cardinality $`n`$. Write $`M`$ for the sum of the pinned distance counts. For each pin and each of its occupied positive radii, let $`t`$ count the other points at that radius. Every ordered base pair has at most two equidistant pins, since those pins lie on its perpendicular bisector. Thus

```math
\sum t=n(n-1),\qquad \sum t(t-1)\le 2n(n-1).
```

If $`M\le(1/3+o(1))n^2`$, then

```math
0\le \sum(t-3)^2
  =\sum t(t-1)-5\sum t+9M=o(n^2)
```

in the sense that the nonnegative sum is bounded above by a quantity of order $`o(n^2)`$. For every positive integer $`t\ne3`$, one has $`t\le4(t-3)^2`$. Consequently nearly all of the $`n(n-1)`$ pin–neighbor incidences belong to classes of size three.

Choose $`(X,Y,Z,W)`$ uniformly among the ordered quadruples with pin $`X`$ and $`(Y,Z,W)`$ a listing of **all three** points of one such class. There are $`T=2n^2+o(n^2)`$ quadruples. Fixing a pin and one base vertex allows at most two completions. Fixing two ordered base vertices also allows at most two completions, one for each possible pin, with the third base vertex uniquely determined. The same count applies to each of the six coordinate pairs. On the $`n^2`$ ordered pairs, every multiplicity is at most two, and the total deficit from the constant multiplicity two is $`2n^2-T=o(n^2)`$. After normalizing, each pair marginal has total variation distance $`o(1)`$ from the product of two uniform empirical measures.

## Normalization and weak limits

Take a smallest-radius closed disk containing at least $`2n/3`$ points. Its radius is positive for large $`n`$ and its minimum is attained, since one can take the minimum of the enclosing radii of finitely many subsets. By a similarity make this disk the closed unit disk $`B`$, and let $`\mu_n`$ be the empirical measure there and in the rest of the plane. Set $`A=\mathbb R^2\setminus 3B`$. On $`Y\in A`$, the simultaneous events $`X\in B`$ and $`Z\in B`$ are impossible by $`|X-Y|=|X-Z|`$ and the triangle inequality. Applying the pair estimates separately to $`(Y,X)`$ and $`(Y,Z)`$ gives

```math
2\mu_n(A)\mu_n(B)\le\mu_n(A)+o(1).
```

Hence $`\mu_n(A)=o(1)`$. After passage to a subsequence, the empirical measures and joint quadruple laws converge weakly. The limit $`\mu`$ is supported in $`3B`$. If it were concentrated at $`a`$, the open disk of radius $`1/2`$ about $`a`$ would eventually contain more than $`2n/3`$ points, contradicting minimality. Every limiting coordinate pair has law $`\mu\otimes\mu`$, and the three pin distances still agree because their equality is closed. All moment calculations below use this compactly supported limit.

## Collisions and covariance

For each atom $`a`$, the event $`X=Y=a`$ forces $`Z=W=a`$. Its probability is $`\mu(\{a\})^2`$, which already accounts for the entire probability of $`Y=Z=a`$. By pairwise independence, coincident base vertices outside the at most countably many atoms have probability zero. Thus whenever $`X\ne Y`$, the three base vertices are pairwise distinct almost surely.

Let $`F(y)=(y_1,y_2,|y|^2)`$, let $`m`$ and $`\Sigma`$ be its mean and covariance under $`\mu`$, and let $`V`$ be the range of $`\Sigma`$, of dimension $`d`$. The centered lift of every support point belongs to $`V`$. On $`V`$ put $`U(y)=\Sigma^{-1/2}(F(y)-m)`$ and $`a(x)=(-2x_1,-2x_2,1)`$. For each support point $`x`$, the random variable $`a(x)\cdot F(Y)=|Y-x|^2-|x|^2`$ has positive variance. Constancy would extend to the support, where evaluating at $`y=x`$ would force the whole support to equal $`\{x\}`$. Thus

```math
v(x)=\frac{\Sigma^{1/2}a(x)}{\lVert\Sigma^{1/2}a(x)\rVert}
```

is defined and continuous on the support. The three whitened base lifts have a common projection onto $`v(X)`$, with scalar coordinate $`s`$. Pairwise independence of $`X,Y`$ and identity covariance on $`V`$ give $`\mathbb E s^2=1`$. For their centroid $`C`$, pairwise independence of the bases gives $`\mathbb E\lVert C\rVert^2=d/3`$. Since $`C\cdot v(X)=s`$, one obtains $`1\le d/3\le1`$. This proves full rank and $`C=s v(X)`$ almost surely.

For each support point $`x`$, there are joint samples satisfying these identities with $`X,Y`$ arbitrarily close to $`x`$, by their product law. The other two bases then approach $`x`$ by equidistance. Continuity gives $`F(x)-m`$ parallel to $`\Sigma\,a(x)`$. The derivatives of $`F`$ in both planar coordinate directions are perpendicular to $`a(x)`$, so the support is contained in the critical locus of

```math
q(x)=(F(x)-m)^T\Sigma^{-1}(F(x)-m).
```

## Critical locus and diameter

The terms of degrees four and three of $`q`$ have the form $`a|x|^4+(b\cdot x)|x|^2`$ with $`a>0`$. Substituting $`x=z-b/(4a)`$ removes the cubic term. An orthogonal change diagonalizes the remaining quadratic term. At a critical point, with $`h=|z|^2`$, one therefore has $`(4ah+2b_i)z_i=-u_i`$ for $`i=1,2`$. Away from the two possible poles, $`h=\sum_i u_i^2/(4ah+2b_i)^2`$ has finitely many solutions, since clearing denominators gives a nonzero polynomial with a nonzero term of degree five. Each exceptional $`h`$ also gives at most two solutions if either coordinate is fixed by a nonzero coefficient. The only infinite case has $`b_1=b_2`$ and $`u_1=u_2=0`$. Its locus is the union of a circle and its center.

In that last case, let the circle have radius $`R>0`$. For distinct circle points $`x,y`$ with $`|x-y|\ne R`$, the circle about $`x`$ through $`y`$ misses the center and meets the support circle in at most two points. Such a pair $`(X,Y)`$ therefore has probability zero, by the distinct-base result. If the support circle carries positive mass, Fubini produces a point $`x`$ on it such that its circle mass is concentrated on $`x`$ and on the at most two circle points at distance $`R`$ from $`x`$. The support is finite in every case.

Finally, in a finite non-singleton support every ordered pair of distinct support points has positive probability. Every endpoint of a diameter must therefore have at least three diameter neighbors. Translate one endpoint to zero and normalize the diameter to one. Its three distinct unit neighbors lie on an arc of angle at most $`\pi/3`$, by their mutual chord bounds. Order them $`y_1,y_2,y_3`$ along that arc. The middle one is $`y_2=(\lambda y_1+(1-\lambda)y_3)/t`$ with $`0<\lambda<1`$ and $`0<t<1`$. For any other support point $`z\ne0`$, the inequalities $`|z-y_i|\le1`$ for $`i=1,3`$ give $`z\cdot y_i\ge |z|^2/2>0`$. Hence $`z\cdot y_2>|z|^2/2`$ and $`|z-y_2|<1`$. The sole diameter neighbor of $`y_2`$ is zero, a contradiction.

The contradiction excludes every sequence with $`M/n^2\to1/3`$ from above or below, and the counting inequality yields $`M\ge n(n-1)/3`$. Together these statements give a uniform positive asymptotic gap. A smaller positive constant gives the strict inequalities in the two source displays.

## Finite cross-check

The independent review also ran the exact integer counting checks on all 4,675 subsets of the $`4\times4`$ integer grid with at least three points and no collinear triple. The 736 subsets containing a radius class of size three supplied 4,944 ordered quadruples. Two further configurations exercised an eight-point radius class and a diameter endpoint with three neighbors. These checks corroborate the finite counting and diameter steps. The weak-limit argument is verified above by mathematical reasoning.
