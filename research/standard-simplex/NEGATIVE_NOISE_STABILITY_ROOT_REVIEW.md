# Root review of quantitative negative noise stability

Date: 21 November 2026. Reviewed `NEGATIVE_NOISE_STABILITY.md` and
`WEIGHTED_DISTANCE.md` in full against the previously reviewed negative
theorem. The root worker supplied the earlier localization lemma and
some of the proposed corollary's constant choices. This is a check of
the final manuscript and its assembly, not a claim of independent
authorship of every ingredient.

Verdict: the all-partition quantitative bound, its mass coefficient,
and its sharpness statements pass. The claim remains restricted to a
correlation interval depending on the number of cells. No full-conjecture
count or global-priority assertion follows from this review.

## The weighted metric bound

For the near normal region, twice the squared fiber mass is bounded by
$`8\phi(0)e^{1/16}`$ times its weighted cost. This coefficient is less
than $`64/15<5`$. For the far region, weighted Cauchy--Schwarz gives
coefficient $`2\sqrt{8/7}<4<5`$. Thus the sum of the two masses has
square at most five times the total normal cost.

The tangent Cauchy--Schwarz step introduces precisely
$`(8/7)^{(r-1)/2}`$. The resulting constant is
$`C_r=5(8/7)^{(r-1)/2}`$, including the zero-dimensional tangent case.
Conditioning absolute transfers onto the score space preserves the
nonnegative integral used here and requires no moment hypothesis.
Each disagreement belongs to exactly one unordered pair; the symmetric
difference sum counts it twice. Cauchy--Schwarz over the
$`M_q=\binom q2`$ pairs therefore gives exactly

```math
\left(\sum_i\gamma_d(A_i\triangle C_i)\right)^2
\le4M_qC_rW_\alpha.
```

## Extending localization to positive deficit

The new proof does not reuse the no-worse-competitor hypothesis without
justification. For $`0\le\Delta\lt at`$, the exact signed expansion and
proportional balancing give

```math
E^2-2LtE-at-2t^2\le0,
\qquad
E\le K_et+\sqrt{at}\le(K_e+1)a.
```

Here $`t\le a`$ is essential and is ensured by the final threshold.
Dropping $`E^2`$ gives $`F\ge c^2-3a\ge c^2/2`$. The balanced
fractional moment matrix has deficit at most

```math
K_F'a,
\qquad K_F'=1+K_F+2L=3+2L(K_e+1).
```

Restoring the moment change and then selecting the actual matrix's
polar-nearest regular matrix gives the stated constant

```math
C_*=2L^2(K_e+1)^2+2C_{\mathrm g}K_F'.
```

The choices of $`a`$ make both actual moment distance and full mass
error at most $`\delta_0/4`$. The fixed tail radius and all absorption
constants are therefore the same as in the negative theorem. The noise
quadratic form is still evaluated in the original ambient space.

The localized estimate then gives

```math
\Delta\ge\tfrac12E^2+
\frac{v}{4M_qC_r}t\,d_{\mathscr S}(\mathcal A)^2.
```

Taking the infimum over regular partitions only decreases the distance
from the chosen polar simplex. It does not replace that simplex in any
intermediate cost or hypothesis.

## The other branch and the mass coefficient

For every partition, the global balancing estimate and Hermite remainder
give

```math
\Delta\ge E^2-2LtE-2t^2
\ge\tfrac12E^2-Bt^2,
\qquad B=2L^2+2.
```

In the branch $`\Delta\ge at`$, the additional restriction
$`t\le a/B`$ implies $`Bt^2\le\Delta`$, hence
$`\Delta\ge E^2/4`$. Separately,
$`d_{\mathscr S}\le2`$ gives $`\Delta\ge(a/4)t d_{\mathscr S}^2`$.
Averaging produces the mass coefficient $`1/8`$ and distance coefficient
$`a/8`$. The near branch already has the stronger mass coefficient
$`1/2`$, so the final choice

```math
\nu_q^-=\min\{a/8,v/(4M_qC_r)\}
```

works in both branches without an extra factor of two in its near term.
All thresholds are positive and depend only on the number of cells.

## Negative-correlation sharpness

The reflected-strip modification preserves every mass, so its
degree-zero difference vanishes. The derivative bound for the convolved
signed indicator is valid at negative correlation with absolute value
$`t`$. Reflection makes the potential zero on the tie hyperplane, which
gives the stated normal-distance bound for the linear increase.

The full negative noise operator is indefinite. The draft correctly
uses

```math
\Delta=2J_t-t\|M_{\mathcal A_u}-M_{\mathcal C}\|_F^2+\mathcal R
\le2J_t+Ht^2W_\alpha
```

instead of discarding its full quadratic form. Substitution of the two
strip integrals gives the coefficient
$`(2K_0+H\widehat t_q)p_D\phi(0)`$ multiplying $`tu^2`$.

Every convex comparison cell has an interval on each selected normal
line. The modified cell's one-zero-one pattern forces disagreement of
length at least $`u`$ on that line. This applies after arbitrary label
permutations and rotations into unused coordinates. The Gaussian lower
density and Fubini give the uniform lower distance bound, while direct
comparison with the original simplex gives the displayed upper bound.

The family consequently has distance of order $`u`$ and deficit of order
$`tu^2`$ throughout the stated interval. This proves sharpness of the
squared-distance power and of the correlation scale. It makes no claim
that the mass coefficient or threshold is optimal.

## Scope

The corollary includes all measurable partitions, arbitrary masses and
empty cells, in every permitted ambient dimension. It reuses the
credited first-moment input and the bounded source comparison for the
negative theorem. It is not an additional named-conjecture resolution.
No numerical sampling or Lean work was used.
