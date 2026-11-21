# Independent review of delaying-wall accounting

21 November 2026. Reviewed [the delaying-wall note](delaying-wall-accounting.md), SHA-256 `65a3ebdccf3b0a9d4faccf5e6c455a9923bfc14b5d6f15959d41aeb1004a2369`, and [the target audit](target-and-prior-audit.md), SHA-256 `937a4b28a977fd75991d90a5d2d6dce4a386098e0f7343ee5fef37053d1ac207`.

The abstract inequality, its stated good-time application, and both counterexamples pass this written review. They do not determine the critical construction speed. This review adds no completed bounty and does not report Lean verification or a sponsor decision.

## 1. The finite accounting inequality

For a point first constructed at index $`j`$ and first spent at index $`k`$, nestedness gives $`j\le k`$. The active indices form a subset of $`\{j,\ldots,k-1\}`$; they need not comprise the whole interval. With prefix weight sums $`P_i`$, their total weight is at most $`P_{k-1}-P_{j-1}`$.

The suffix construction coefficients telescope to $`\sqrt{P_m-P_{j-1}}`$. The subtracted prefix retirement coefficients telescope to $`\sqrt{P_m}-\sqrt{P_{k-1}}`$. Thus the asserted pointwise bound is exactly

```math
\sqrt{y-x}\le\sqrt{T-x}+\sqrt y-\sqrt T,
\qquad 0\le x\le y\le T.
```

The function $`z\mapsto\sqrt z-\sqrt{z-x}`$ is decreasing for $`z\ge x`$, including the endpoints by continuity. This proves the inequality. The cases of immediate retirement and no retirement require no separate assumption. All sets have finite measure, so integration preserves the finite inequality. No geometry or probabilistic independence enters this lemma.

## 2. The source-dependent geometric application

The application retains the completeness and good-time hypotheses of Bressan–Talamini, [arXiv:2610.36919v1](https://arxiv.org/abs/2610.36919). I read Proposition 2.1, the common-boundary identity used in Proposition 4.1, and the Section 4.2 comparison. I do not independently re-prove the paper's SBV regularity or weighted double-bubble theorem.

The density-one sets used for retirement are nested under the monotone burned-set evolution. A density-one point is absent from the reduced boundary. Hence the retired set and active wall are disjoint at each chosen time, and permanent retirement is justified by nestedness rather than by a drawing of a smooth wall.

For the vector of weighted characteristic functions, the Frobenius norm of the distributional derivative squares and sums the component jump densities. The good-time common-boundary property ensures that a point belonging to more than one reduced boundary is active wall in each corresponding component. Consequently a free-front point contributes its single coefficient $`\sqrt{w_i}`$, while a common wall contributes the square root of the sum of its active weights. This gives the equality preceding the source note's equation (4). Applying the abstract lemma and $`\mathcal H^1(\gamma(t_i))\le\sigma t_i`$ is then valid because every construction coefficient is positive.

For two unit weights the construction coefficients are $`\sqrt2-1,1`$ and the retirement coefficients are $`1,\sqrt2-1`$. The resulting signs in equations (5) and (6) are correct: retirement reduces the available wall term and increases the required free-front length.

At a quadratic first crossing, apply the double-bubble monotonicity statement with actual total area $`v=A(t+T/2)`$, comparison total area $`v_0=c(t+T/2)^2`$, and comparison first-chamber area $`m_0=ct^2`$. The required ratio is at most $`1/4`$ for $`0\lt t\lt T/2`$. Integration and Proposition 2.1 give

```math
(c+\sigma\mu-\sqrt c\,K)T^2
\ge A(0)+\int_0^{T/2}d(t)\,dt
 +(\sqrt2-1)\int_{T/2}^T d(t)\,dt.
```

Thus the sign and normalization of the added retirement term are correct. Its integrated time profile cannot be replaced by the terminal length without a separate estimate. No such estimate is proved in the reviewed note.

## 3. The admissible slit

The segment at distance $`a=1+2\ell/\sigma`$ is completed at $`a-1`$. Before that time, the initial unit disk cannot reach the segment's supporting line. Dynamic construction therefore creates no earlier route through an unfinished portion, and the later minimum-time calculation agrees with the fixed-segment problem.

Every path from the disk to $`(a+b,0)`$ crosses the supporting line outside the closed segment. At a crossing height $`|y|>\ell`$, its two parts have combined length at least

```math
\sqrt{a^2+y^2}-1+\sqrt{b^2+y^2}.
```

This is increasing in $`|y|`$. Passing arbitrarily close to a tip gives the matching infimum. The source correctly avoids asserting attainment at the forbidden tip or from the boundary of the open initial disk.

With $`b=\ell^2/(2a)`$, the two squarings in the strict half-length comparison are legitimate: every side being compared is positive, and $`(a/\ell)(b/\ell)=1/2`$ makes the remaining difference $`1/4`$. The segment is strictly inside the reference circle because its radius squared exceeds $`a^2+\ell^2`$ by a positive quantity. That circle is not mistakenly treated as an already constructed enclosing barrier.

The two arrival traces also check. On the left, direct distance from the disk applies. On the right, the shorter route around the two tips has limiting time $`T_0+\ell-|y|`$. This dominates the left trace. Apart from the measure-zero equality endpoints, both sides are reached precisely on the two terminal subsegments of combined length

```math
d(t)=2\min\{\ell,\max\{0,t-T_0\}\}.
```

The completed but unspent interval and the eventual spent length therefore have the stated values. This example defeats a uniform pointwise half-length pruning bound, while leaving possible estimates that also assume eventual containment untouched.

## 4. The unburned island

Placing a circle sufficiently far away lets its entire boundary be constructed before any contact, for every fixed positive construction speed. The interior remains unburned, while the connected exterior is eventually reached around the whole circle. No arc has burned material on both sides, so the density-one retirement measure stays zero. After the fire surrounds the circle, it is a boundary of a bounded complementary component, not of the unbounded component.

Thus zero density-one retirement does not imply the source's outer-boundary condition. Both closure bars in that condition are retained in the corrected source. The example is a valid obstruction even though it does not contain the fire.

Filling holes would change both the area and the relevant retired-wall set. The reviewed note leaves the corresponding front evolution and a useful retirement-time estimate as explicit obligations. Neither the abstract lemma nor the two examples supplies those missing geometric results.
