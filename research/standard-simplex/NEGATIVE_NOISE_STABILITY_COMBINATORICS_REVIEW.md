# Combinatorics review: quantitative negative-correlation stability

Reviewed 21 November 2026. The complete final source reviewed is [NEGATIVE_NOISE_STABILITY.md](NEGATIVE_NOISE_STABILITY.md), SHA256:
fc2abf6f65b69597b4426456ab96986e3c377e45f675366ec1f8c502bb7c0bc1.

**Finding:** the quantitative corollary, global mass-error penalty, and sharpness argument pass. No mathematical correction is requested.

The first complete read used source hash ee0b13e925af8eaf9f398e239668ffdf855dcfdee72acf44e5b0809b0c8e2f3f. I requested that the sharpness construction explicitly fix its facet patch in the $`r=q-1`$ dimensional score space before extending it cylindrically. The final source makes that clarification and states that the patch and width are fixed once for each $`q`$. I checked the amended passage and final hash. No inequality or proof step changed.

This review checks the assembled corollary. The combinatorics lane authored the weighted-distance lemma, which received the separate independent [algebra review](WEIGHTED_DISTANCE_ALGEBRA_REVIEW.md). The [algebra cross-check](NEGATIVE_QUANTITATIVE_ALGEBRA_CROSSCHECK.md) independently checks the global mass penalty and the negative sharpness upper bound. Earlier components and the negative theorem have their own written reviews.

## 1. The small-positive-deficit localization is proved separately

The corollary does not reuse the no-worse-competitor hypothesis without justification. For $`0\le\Delta\lt at`$, the original-space Hermite expansion gives

```math
E^2-t(F-c^2)\le at+2t^2,
\qquad E=\|e\|.
```

The proportional balancing construction is valid for arbitrary masses, including empty receiver cells. Its donor denominators are at least $`1/q`$. Together with the credited balanced first-moment bound, it gives $`F-c^2\le2LE`$. Solving the resulting quadratic yields

```math
E\le K_et+\sqrt{at}\le(K_e+1)a.
```

The last inequality needs $`t\le a`$. This is supplied by the chosen threshold because $`B=2L^2+2>1`$.

Dropping the nonnegative mass square gives $`F\ge c^2-a-2t\ge c^2-3a\ge c^2/2`$. The balanced matrix has deficit at most

```math
a+K_Ft+2L\sqrt{at}\le(1+K_F+2L)a=K_F'a.
```

The Frobenius-nearest property of the polar regular matrix then gives

```math
\|M-M_{\mathcal C}\|_F^2
\le2L^2E^2+2C_{\mathrm g}(c^2-F_N)
\le C_*a.
```

This is the regular simplex aligned with the actual moment matrix. The source does not substitute the intermediate alignment of the balanced matrix. Both neighborhood bounds follow from the explicit choices of $`a`$, and the lower bound on $`F`$ handles the normalization. A partial polar isometry may be extended since $`d\ge q-1`$.

The radius and tail constants are unchanged from the negative theorem. Its weighted tail estimate requires only the bounded transfer cost, not the sign of the deficit. The core hypotheses and the original-space remainder estimate therefore apply in this enlarged small-positive-deficit class. No existence of a minimizer is assumed.

## 2. Weighted distance and the near-branch lower bound

The same chosen regular simplex is used for the core, tail, moment, and weighted-distance comparisons. The core assignment cost satisfies $`D_{\mathrm c}\ge\ell W_{\mathrm c}`$. Thus the retained bound

```math
\Delta\ge\frac12E^2+
t\left[\frac{\kappa}{8}D_{\mathrm c}+bW_{\mathrm t}\right]
```

implies $`\Delta\ge E^2/2+tvW_\alpha`$, with $`v=\min(\kappa\ell/8,b)`$.

The weighted-distance constant is exactly
$`4M_qC_r`$, where $`M_q=\binom q2`$ and $`C_r=5(8/7)^{(r-1)/2}`$. Conditioning the absolute transfer density is permitted here because the cost is an ordinary nonnegative integral depending on the score coordinates. It does not replace the noise quadratic form by a conditioned one.

Taking an infimum only on the distance side gives

```math
\Delta\ge\frac12E^2+
\frac{v}{4M_qC_r}\,t\,d_{\mathscr S}(\mathcal A)^2.
```

No equality of cell masses or moment-row-space hypothesis is required for the distance lemma itself.

## 3. The far branch retains a global mass penalty

For every partition, the proportional balancing and Hermite remainder estimates imply

```math
\Delta\ge E^2-2LtE-2t^2
\ge\frac12E^2-(2L^2+2)t^2.
```

The Young inequality and the coefficient $`B=2L^2+2`$ are correct. In the branch $`\Delta\ge at`$, the threshold $`t\le a/B`$ gives $`Bt^2\le at\le\Delta`$, hence $`\Delta\ge E^2/4`$.

Independently, $`d_{\mathscr S}\le2`$ implies $`\Delta\ge(a/4)t d_{\mathscr S}^2`$. Averaging these two valid lower bounds gives exactly

```math
\Delta\ge\frac18E^2+\frac a8t\,d_{\mathscr S}^2.
```

The cases $`\Delta\lt at`$ and $`\Delta\ge at`$ cover all partitions because the already reviewed negative theorem supplies nonnegativity. The constants in (3) therefore establish the claimed global lower bound, including its mass term. Empty cells cause no exception; no polar localization is needed in the far branch.

## 4. Sharpness uses the negative remainder with the correct sign

The final construction fixes a compact positive-measure facet patch in the score space and a uniform tubular width away from the other facets. Both depend only on $`q`$. The two exchanged strips are reflections, so all masses remain exactly balanced. Cylindrical extension preserves the constants in every larger permitted dimension.

The bounded-function Gaussian derivative estimate applies at negative correlation in absolute value. Reflection makes the potential zero on the score-tie hyperplane. Integrating the resulting normal bound gives the stated

```math
J_t\le2K_0t\,p_D[\phi(0)-\phi(u)],
\qquad
W_\alpha\le2p_D[\phi(0)-\phi(u)].
```

The source does not assume that $`T_{-t}`$ is positive. For this balanced perturbation its exact identity is

```math
\Delta_t^-
=2J_t-t\|M_{\mathcal A_u}-M_{\mathcal C}\|_F^2
+\sum_i\langle h_i,R_{-t,d}h_i\rangle.
```

The first-moment square may be dropped for an upper bound because its coefficient is negative. The remaining indefinite term is bounded above by $`Ht^2W_\alpha`$. This gives

```math
\Delta_t^-
\le(4K_0+2Ht)t\,p_D[\phi(0)-\phi(u)]
\le(2K_0+H\widehat t_q)p_D\phi(0)\,t u^2.
```

All constants are uniform over the stated correlation interval and ambient dimensions.

For the distance lower bound, the modified cell has occupancy one, zero, one on three consecutive intervals of length $`u`$. An interval which does not meet both occupied pieces misses at least one whole piece. If it meets both, the filled middle gap and any missed endpoint portions have total disagreement at least $`u`$. Thus every interval differs by at least length $`u`$. This applies to the line section of every convex comparison cell, after any rotation or relabeling.

The Gaussian density on the three intervals is at least $`\phi(2u_0)`$. Integrating the line bound over the fixed patch and then the unused coordinates gives the asserted lower distance bound. Comparing with the original regular partition gives the upper bound with coefficient $`4p_D\phi(0)`$.

Therefore distance is of order $`u`$ and deficit is of order $`tu^2`$, with constants depending only on $`q`$. Holding a positive correlation magnitude fixed and sending $`u`$ to zero rules out any smaller distance exponent with a uniform positive coefficient. Holding a fixed nonzero strip width and sending $`t`$ to zero rules out a replacement correlation scale whose ratio to $`t`$ tends to infinity. The proof makes no sharpness claim for the mass coefficient.

## 5. Scope

The corollary holds for all measurable partitions with arbitrary masses in the stated small-negative-correlation interval, uniformly over ambient dimensions $`d\ge q-1`$. It uses the same explicitly credited balanced first-moment input and the already reviewed negative theorem. It neither settles the full Standard Simplex conjecture nor establishes priority beyond the separate bounded source audit.

No finite numerical screen or Lean verification was used in this review. No result-table entry or named-conjecture resolution count is added.

