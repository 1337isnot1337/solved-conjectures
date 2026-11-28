# Aharoni–Holzman–Krivelevich–Meshulam fractional plank conjecture

**Research status.** The conjectured sharp lower bound holds in every even dimension, and the whole problem reduces to dimension three. This is not a proof for arbitrary odd dimension.

## Source and statement

Aharoni, Holzman, Krivelevich and Meshulam, [*Fractional Planks*](https://www.math.tau.ac.il/~krivelev/38.pdf), Discrete Comput. Geom. 27 (2002), 585–602, Conjecture 3.4, ask whether $`\tau^*(S)\ge2/n`$ for every convex set $`S`$ packed in the unit cube $`[0,1]^n`$. Packed means touching every facet, so a compact packed set has every coordinate projection equal to $`[0,1]`$. A fractional cover is a collection of nonnegative measurable functions $`f_i:[0,1]\to[0,\infty]`$ such that $`\sum_i f_i(x_i)\ge1`$ for all $`x\in S`$; its total width is $`\sum_i\int_0^1 f_i(t)\,dt`$. The quantity $`\tau^*(S)`$ is the infimum of the total widths. This is a coordinate-normal problem, not Bang's full affine plank conjecture.

A measure matching is a finite positive measure supported on $`S`$ whose coordinate marginals have densities bounded by one. Its total mass lower bounds $`\tau^*(S)`$ by integrating any fractional cover. The paper gives the converse duality as well. We work first with compact convex packed $`S`$.

## Two dimensional input

Every compact convex $`T\subset[0,1]^2`$ with both coordinate projections equal to $`[0,1]`$ supports a probability measure whose two marginals are uniform. This is also the capacity-one case of B. Côté and R. Wang, [*The upper copula capacity*](https://arxiv.org/html/2611.25237v1), Theorem 2, which gives a direct proof and an explicit construction in Appendix B. Alternatively combine the planar ordinary coordinate-plank theorem (noted in Aharoni et al. just after Conjecture 1.1) with their Theorem 3.1, where the integrality-gap factor $`n/2`$ is one, and their compact-set measure matching duality. The degenerate planar case is a diagonal or antidiagonal segment and immediate.

## Combining disjoint blocks

Partition the coordinate indices into nonempty disjoint blocks $`G_1,\ldots,G_m`$. Suppose that for each block $`G`$, the packed convex projection $`\pi_G(S)`$ supports a probability law with all its coordinate marginal densities bounded by $`b_G`$. Lift that law to a probability on $`S`$. For example, the inverse-image fibers of the projection are nonempty compact sets with closed graph, so the usual compact-valued measurable selection theorem gives a Borel section. One may avoid a selection theorem entirely: approximate the given law by finite supported laws on $`\pi_G(S)`$, lift the finitely many points arbitrarily, and take a weakly convergent subsequence of the lifted laws in the compact space of probability measures on $`S`$. Projection is continuous, so the limit lifts the desired law.

Choose independent random vectors $`X^G\in S`$ with these lifted laws, and set
```math
 b=\sum_G b_G,\qquad Y=\sum_G \frac{b_G}{b} X^G.
```
Convexity gives $`Y\in S`$. For $`j`$ belonging to block $`G`$, the term $`(b_G/b)X_j^G`$ has a density bounded by $`b`$, and the sum of all other terms is independent of it. Convolution with any probability law preserves this upper density bound. Thus every marginal of $`Y`$ has density at most $`b`$, and the law of $`Y`$ divided by $`b`$ is a measure matching of mass $`1/b`$.

For $`n=2m`$, pair the coordinates. The planar theorem gives $`b_G=1`$ for each pair, so $`b=m`$, proving
```math
 \tau^*(S)\ge\frac1m=\frac2n.
```
The bound is sharp, for example for the standard simplex treated in Section 3 of Aharoni et al. For noncompact convex sets touching every facet, take finitely many facet-touching points in the set and apply the compact result to their convex hull. If packing instead means that only the closure has the full coordinate spans, take a finite compact convex hull whose coordinate spans are at least $`1-\varepsilon`$, use affine renormalization in each coordinate and then let $`\varepsilon\downarrow0`$.

For odd $`n`$, one triple and the rest pairs show that the conjecture in dimension three implies it in every remaining dimension: use $`b_G=3/2`$ for the triple and $`1`$ for each pair. The compact matching of mass $`2/3`$ in dimension three is equivalent to the conjectural lower bound there by the original duality and attainment results. Without this input one may instead take $`(n-1)/2`$ pairs and a singleton with $`b_G=1`$, proving $`\tau^*(S)\ge2/(n+1)`$. Thus no separate dimensions beyond the triple need to be attacked.

## Open part and priority

The missing triple input is not the existence of **uniform** marginals on the entire interval: that fails already for standard simplices and the packed octahedron discussed by Côté–Wang, Example 3. The actual goal permits densities bounded by $`3/2`$. Searches for later treatments of Conjecture 3.4, even-dimensional projection/block arguments and the three-dimensional case found the original lower bound and the recent planar result, but not the even-dimensional deduction above or a general solution. This is a priority check, not an assertion of exclusivity.
