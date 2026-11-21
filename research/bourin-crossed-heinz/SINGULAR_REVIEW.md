# Independent semidefinite endpoint review

Reviewer: algebra research lane, 21 November 2026. The argument in `SINGULAR_ENDPOINT.md` passes. Its conclusion is a neighborhood depending on the fixed matrix pair, not the full conjecture or a uniform parameter interval. The semidefinite extension was proposed and drafted by the combinatorics lane; this review independently checks its equality and differentiation steps.

After the common kernel is removed, the sum is positive definite. With the support projections and the notation of the draft,

```math
L=JS,qquad I-J^2=(P_A-P_B)^2geq0.
```

Thus $`|L|leq S`$. If a Ky Fan sum has equality, every maximizing projection for $`|L|`$ also maximizes for $`S`$, and the positive difference $`S-|L|`$ annihilates its range. Commutation with both positive matrices then gives $`(I-J^2)P=0`$. The kernel of $`P_A-P_B`$ is the direct sum of the common range and common kernel of the two support projections. The common kernel is zero here. This independently confirms $`P_AP=P_BP=P`$, including arbitrary choices inside a repeated cutoff eigenspace.

The selected singular values are positive, even if lower singular values vanish. Moreover $`LP=L^*P=SP`$, so the polar factor of $`L`$ is the identity on every selected subspace. The usual first-order singular-value formula therefore reduces to the real trace against the derivative written in the draft. It does not require differentiability of the square root at a zero eigenvalue below the selected levels. Compactness of the full maximizing family, rather than one chosen projection, gives a strict negative derivative when no such projection is annihilated by $`D`$.

For the logarithm regularization, the only divergent term is $`\log\delta\,(P_B-P_A)`$. Its trace against $`PD`$ vanishes by cyclicity and $`(P_B-P_A)P=0`$. Applying the positive-definite integral at $`A+\delta I,B+\delta I`$ changes its lower limit to $`\delta`$ exactly. The nonnegative integrand has a finite limiting integral because the regularized trace has a finite limit. Its kernel criterion is unchanged for every positive integration variable, so the limit vanishes exactly when $`DP=0`$.

In that equality case, the common-support condition makes the fixed block positive definite, while the complementary block may be singular. Tian–Xu's prior operator-norm theorem permits that singular complement and prevents any singular value from crossing the fixed cutoff. This proves the global equality alternative, including ties. The case of an initial strict gap requires only continuity. The identity $`C_{1-t}=C_t^*`$ and the finite number of Ky Fan sums give the two simultaneous endpoint neighborhoods.

No numerical check or external theorem beyond the inputs identified in the proof is used here. The proof correctly avoids assigning the interior limit the conventional endpoint value $`S`$ when those matrices differ.
