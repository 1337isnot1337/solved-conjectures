# Atomless mass on a Lipschitz graph

Suppose that $`P_n`$ is a sequence of $`n`$ planar sites with no four on a circle, and that the sum of all pinned positive-distance counts is $`(1/3+o(1))n^2`$. Apply arbitrary translations and positive dilations to each set. Let $`\mu`$ be any subsequential vague limit of the uniform site measures in the resulting coordinates. Then $`\mu`$ gives zero mass to the nonatomic part of every graph with Lipschitz constant strictly less than one in some orthonormal coordinates. This includes straight lines. There is no upper bound on the number of collinear sites. The conclusion also permits escaped mass and atoms elsewhere in the limiting measure.

The estimate concerns limits of the original finite configurations. Conditional distributions of three possibly coincident points on a limiting circle alone need not encode the carrier information used below. The unrestricted positive gap in [Erdős Problem 654](https://www.erdosproblems.com/654) remains open. [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## A weight symmetric in the three base labels

Choose a uniform ordered multiplicity-three circle $`(X,Y_1,Y_2,Y_3)`$, with pin $`X`$. The three bases are exchangeable. Every pin–base law has total variation distance $`o(1)`$ from two independent uniform sites, since all but $`o(n^2)`$ pin–base pairs belong to a triple. The law of a specified base pair restricted to a side whose bisector contains at most $`K`$ pins is bounded by $`O(K)`$ times the independent-pair law, by counting its possible pins. [Counting details](BISECTORS.md)

Pass to weak limits in the one-point compactification, preserving the normalized finite coordinates used in the statement. If the pin and any base are finite in the limit, the common radius bounds both other bases. Suppose the graph carries positive nonatomic mass, and let $`H`$ be a compact subset of positive mass on that graph containing no atom of $`\mu`$. At almost every $`a\in H`$ the relative mass of $`H`$ in balls around $`a`$ tends to one. We may also take $`a`$ with arbitrarily small record radii $`R`$ satisfying

```math
\mu(B(a,s))\le (s/R)^3\mu(B(a,R))\qquad(s\ge R),
```

where these balls are closed. Indeed $`\limsup_{s\downarrow0}\mu(B(a,s))/s^3=\infty`$ almost everywhere. The exceptional set is null by covering its bounded portions with $`O(s^{-2})`$ squares, after restricting to uniform constants and a uniform starting radius. The closed-ball mass ratio is upper semicontinuous away from zero and tends to zero at infinity. Taking maxima over successively longer intervals bounded away from zero gives record radii tending to zero.

Fix $`\tau=1/100`$ and a continuous function $`\psi:[0,\infty)\to[0,1]`$ equal to one on $`[0,1/2]`$ and zero on $`[1,\infty)`$. Weight each quadruple by

```math
w(x,y)=e^{-\lVert x-a\rVert/R}
\psi\!\left(\frac{\lVert x-y\rVert}{\tau R}\right).
```

This has the same value for each base of a given circle. It extends continuously by zero if either argument escapes to infinity. For all finite $`x,y`$, one has $`w(x,y)\le e^\tau w(y,x)`$. Write $`Z=\iint w(x,y)\,d\mu(x)d\mu(y)`$. Cover $`B(a,R)`$ by $`O(\tau^{-2})`$ pieces of diameter at most $`\tau R/2`$. Cauchy–Schwarz applied to the masses of a partition subordinate to this cover gives $`Z\gg\tau^2\mu(B(a,R))^2>0`$. At fixed $`R`$, the finite weighted normalizing masses tend to $`Z`$.

For every $`\varepsilon>0`$ a sufficiently small record radius gives weighted probability at least $`1-\varepsilon`$ that the **four limiting coordinates** all lie in $`H`$. In fact, the weighted mass from pins at distance greater than $`MR`$ from $`a`$ is bounded by

```math
\mu(B(a,R))^2\sum_{j\ge\lfloor M\rfloor}e^{-j}(j+2)^6
```

for $`M\ge2`$, using the record bound and the independent pin–base law on annuli of width $`R`$. For the other pins, all bases with positive weight lie in $`B(a,(M+1)R)`$. Apply the independent pin–base law with each of the three base labels. The contribution to any coordinate lying outside $`H`$ is at most a constant times

```math
\mu(B(a,(M+1)R))\,\mu(B(a,(M+1)R)\setminus H).
```

At fixed $`M`$ this is $`o(\mu(B(a,R))^2)`$ by density and the record bound. First choose $`M`$, then $`R`$. Such weighting avoids a boundary error when swapping a pin and base and preserves exchangeability among all base labels.

If all four points lie on $`H`$, at least two of the three base labels have coincident coordinates. A circle about a graph point meets a graph of slope bound strictly less than one at most once on either side of its pin. This follows by subtracting squared distances at two ordered abscissae on either side and using the Lipschitz bound. The assertion also holds at zero radius.

## Carriers of coincident labels

Write $`s_n`$ for the maximum collinearity. The [one-line bound](COLLINEAR-MASS.md) gives $`s_n=o(n)`$ on the putative near-extremal sequence. Fix an arbitrarily small error $`\delta>0`$, measured as a fraction of all finite quadruples. There is $`c>0`$ such that, outside this error in the limiting law, every side with coincident endpoints in $`H`$ has both endpoints exclusively on its own carrier containing at least $`c n^{2/3}`$ sites. Here and below a statement combining finite attributes and limiting coordinates means that the attributes are recorded as discrete flags before taking a further joint subsequence.

To see this, a side of bisector richness at most fixed $`K`$ has limiting law dominated by $`O(K)\mu\otimes\mu`$ on finite coordinate pairs, so it cannot coincide in $`H`$. For axes richer than $`K`$, and carriers smaller than $`c n^{2/3}`$, the small- and intermediate-carrier bounds give at most

```math
O\big(n^2(B/K^2+B^{-1/3}+c)+nB\big)
```

pin–pair incidences. First choose $`B`$ large, then $`K`$ large, then $`c`$ small. Each incidence accounts for at most one centered triangle. There are $`O_c(n^{1/3})`$ carriers of size at least $`c n^{2/3}`$, and the sites common to two carriers number $`O_c(n^{2/3})`$. Their total probability as any quadruple label is $`o(1)`$. [Carrier estimates](CARRIER-SCALES.md)

On each such large carrier assign its sites that do not lie on another large carrier. Distinct assigned sets are disjoint. Remove every orientation whose assigned sets have total size more than $`\epsilon_n n`$, where $`\epsilon_n=\sqrt{s_n/n}\to0`$. There are at most $`1/\epsilon_n`$ removed orientations. At any fixed pin, at most one carrier of a given orientation can contain a reflected pair about that pin. Otherwise two distinct parallel carriers would supply four sites reflected across the same perpendicular through the pin, forcing a circle through the four. Each such carrier supplies at most $`s_n`$ ordered pairs. Thus the total removed pin–pair incidence count is $`O(ns_n/\epsilon_n)=o(n^2)`$. [Reflected-pair argument](BISECTORS.md)

Let $`J`$ be the union of the assigned sets on the retained large carriers. Call a base label matched if it is an endpoint of a side **with both endpoints in the same retained assigned set**. Matching is a finite property, symmetric in the three labels. By the foregoing estimates, under the weighted law at least two labels are matched with probability at least $`1-\eta`$, for any prescribed small $`\eta>0`$ and all sufficiently large indices of the subsequence. Indeed first choose the spatial localization with error much less than $`\eta`$, then the unweighted carrier error $`\delta`$ much less than $`\eta Z`$. On the limiting event of four graph coordinates some side has coincident endpoints, and the three possible sides cost at most the sum of their errors. Since matching flags are finite and the three labels are exchangeable, this conclusion transfers back to the finite weighted probability.

## Comparing the sizes of the source and target carriers

Write $`p=\Pr_w(X\in J)`$ for the normalized finite weighted law. Up to $`o(1)`$ every pin–base event can be computed by weighting the independent site law, since $`Z>0`$ is fixed. The weight comparison under a swap and the matched-label probability give

```math
p\ge e^{-\tau}\Pr_w(Y_1\in J)-o(1)
\ge e^{-\tau}\tfrac23(1-\eta)-o(1).
```

Moreover, even after requiring $`X\in J`$, exchangeability gives $`\Pr_w(X\in J,\ Y_1\text{ matched})\ge\tfrac23(p-\eta)`$. On this event let $`s`$ be the size of the pin's assigned set and $`t`$ the size of the matched label's assigned set. For any $`A>1`$, swapping independent pin and site gives

```math
\Pr_w(X,Y_1\in J,\ t>As)
\le\frac{e^\tau}{1+e^\tau}\Pr_w(X,Y_1\in J)+o(1)
\le\frac{e^\tau}{1+e^\tau}p+o(1).
```

Indeed the reversed event is disjoint, and its weighted independent-pair mass is at least $`e^{-\tau}`$ times that of the displayed event. With $`\eta=1/100`$ these inequalities leave a fixed positive weighted probability for $`X\in J`$, $`Y_1`$ matched and $`t\le As`$. The bound is uniform in $`A>1`$.

The regime $`s>At`$ contributes $`O(n^2/A+ns_n)`$ unweighted incidences over all source and target sets. For nonperpendicular source and target lines, a target pair's midpoint is the projection of at most one pin on the source line, so each source–target choice contributes at most $`t^2\le st/A`$. The sets on each side are disjoint and their sizes sum to at most $`n`$. For perpendicular source and target lines, each pin has a prescribed target orientation and at most one active target of that orientation, giving the $`ns_n`$ term. Choose a fixed $`A`$ large enough in terms of $`Z`$. Since weights are at most one, a positive fraction of all $`n^2`$ ordered pin–base pairs must then be matched from one retained carrier to another of comparable size $`A^{-1}s\le t\le As`$.

Group retained carriers by dyadic assigned-set sizes. Let $`a_j`$ denote the fraction of all sites in group $`j`$. Comparable source and target groups differ by at most a fixed $`d=d(A)`$. For any $`u>0`$ the products $`a_i a_j`$ of neighboring groups with either group mass below $`u`$ sum to at most $`2(2d+1)u`$. The mass of ordered pin–base pairs in those groups is bounded by that sum. Choose $`u`$ sufficiently small. At most $`1/u`$ remaining groups have positive mass above the cutoff. Some pair of comparable groups must therefore account for $`\Omega(n^2)`$ reflected partners. The pair of group indices may vary with $`n`$.

Let $`T`$ be the lower endpoint of the smaller chosen size band. Each source and target set then has between $`T`$ and $`C_A T`$ sites. Here $`T\to\infty`$, since each retained carrier initially had at least $`c n^{2/3}`$ sites and lost at most $`O_c(n^{1/3})`$ intersections. The number of sources and targets tends to infinity since each group has positive mass and $`s_n=o(n)`$. There are $`\Theta(n/T)`$ source lines, and at most $`\epsilon_n n/T=o(n/T)`$ sources in one orientation. The [reflected-partners theorem for two line families](REFLECTIONS-BETWEEN-LINES.md) applies and bounds the count by $`o(n^2)`$. This is the required contradiction.

The argument excludes nonatomic slope-bounded graph portions at every scale with a nonzero vague site limit. To derive the unrestricted Erdős gap from this obstruction one still has to force such a portion or dispose of concentration on successively finer atomic clusters. In the fixed-collinearity proof, uniform domination of all base-pair laws provided the farthest-site sampling step and pair separation across those clusters. Those estimates have not been established in the unrestricted case.

## Review and scope

An independent project reviewer verified the localization weight, its change under pin–base exchange, the two carrier-size exclusions, and the diffuse-orientation hypothesis in the reflected-partners theorem. The stated conclusion also permits varying rotations and reflections because they preserve incidences, circle occupancy and distances. This is a structural restriction on any sequence approaching the one-third barrier.
