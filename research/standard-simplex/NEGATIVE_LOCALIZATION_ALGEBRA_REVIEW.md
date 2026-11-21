# Independent review of negative-correlation localization and tails

Reviewer: algebra lane, 21 November 2026. Reviewed files: `NEGATIVE_LOCALIZATION.md` and `NEGATIVE_POTENTIAL_TAIL.md`, with their stated inputs from `CORE_COERCIVITY.md` and `FIRST_MOMENT_STABILITY.md`.

Verdict: the displayed localization, potential, and weighted tail deductions pass. This review does not establish a complete negative-correlation optimality theorem or a prior-status claim. The assembly must still combine them with the weighted remainder and choose constants in the stated order.

## 1. The balancing operation

For fractional labels, each function lies between zero and one because the functions are nonnegative and sum to one. The first Gaussian Hermite projection therefore gives

```math
\sum_i|m_i|^2
\leq\sum_i\int f_i^2\,d\gamma_d
\leq1.
```

This is independent of ambient dimension. A row bound follows either from this inequality or from Cauchy–Schwarz in a unit direction.

In the balancing construction, every donor denominator is positive and at least $`1/q`$. A donor retains the nonnegative factor $`1-e_i/p_i=1/(qp_i)`$. The total discarded function has integral equal to the total excess mass. Receiver proportions are nonnegative and sum to one, so the new functions remain a partition and have masses exactly $`1/q`$.

The sum of the norms of all donor moment losses is at most $`qH`$. The total receiver moment change has no larger norm sum, by the triangle inequality for the common redistributed vector. Hence

```math
\|M-N\|_F
\leq q\|e\|_1\leq q^{3/2}\|e\|.
```

The row-span assertion is exact: both donor and receiver moments are linear combinations of the original rows. No transport through a high-dimensional tail is used.

## 2. Fractional applicability of the balanced inputs

The balanced covariance bound used here is not restricted by the labels being fractional. For normalized scores with rows $`n_i/\sqrt{F_N}`$, their payoff under those labels is

```math
\sum_i\int f_i(x)\frac{n_i\cdot x}{\sqrt{F_N}}\,d\gamma_d(x)
=\sqrt{F_N}.
```

For any price vector, this payoff is at most the corresponding Gaussian maximum plus the prescribed mass-price term. Taking the infimum over prices proves the feasible-assignment inequality directly, including singular score covariance. The subsequent covariance and polar arguments use only that inequality and the moment matrix.

The zero-moment case is compatible with the quoted global constant: the previously derived $`C_{\mathrm g}`$ can be taken at least one, so the squared distance $`c^2`$ from zero to any regular moment matrix satisfies its bound.

Since both moment norms are at most one,

```math
|F-F_N|\leq2\|M-N\|_F.
```

This verifies the global estimate $`F\leq c^2+2L\|e\|`$ without assumptions on assignment prices near singular covariances.

## 3. Localization from a hypothetical competitive partition

For indicator partitions the total squared Hermite mass is one. Consequently the absolute remainder after degrees zero and one is at most $`t^2`$ for $`0\lt t<1`$. The comparison with the regular benchmark gives

```math
\|e\|^2-t(F-c^2)\leq2t^2.
```

Substituting the global mass-error bound yields

```math
\|e\|^2-2Lt\|e\|-2t^2\leq0.
```

Its positive root is exactly $`(L+\sqrt{L^2+2})t`$. The same noise comparison gives $`F\geq c^2-2t`$. These prove the stated $`K_e`$ and $`K_F`$ bounds.

The triangle inequality through the balanced moment matrix yields equation (11). Passing from that comparison simplex to the polar simplex of the original $`M`$ is justified: all regular moment matrices have norm $`c`$, and polar alignment maximizes their inner product with $`M`$. An extension in $`d\geq q-1`$ handles deficient rank. Squaring with the two-term inequality and using $`t^2\leq t`$ gives precisely the displayed $`C_{\mathrm{loc}}`$.

No existence of a minimizing partition is needed. Every deduction assumes only the inequality against the regular benchmark for one hypothetical competitor.

## 4. The core and the retained mass term

The small-$`t`$ restrictions give each of the full moment and mass errors at most $`\delta_0/4`$. The weighted tail bound gives the same upper bound for the corresponding tail errors. Thus the core errors are at most $`\delta_0/2`$, inside the local lemma's hypotheses.

The polar score space contains all actual moment rows. Conditioning onto it therefore preserves all relevant moments and masses. In polar coordinates the full square moment matrix is symmetric. The core skew part is exactly the negative tail skew part.

For unrestricted masses the correct identity is $`e_{\mathrm c}=e-e_{\mathrm t}`$. The resulting estimate is

```math
\|e_{\mathrm c}\|^2+
\|\mathop{\mathrm{skew}}A_{\mathrm c}\|_F^2
\leq2\|e\|^2+2\eta_q(R)W_{\mathrm t}.
```

Combining the local coercivity inequality with the exact core first-moment identity gives equation (16) with the factor $`2K`$ on both error terms. Restoring the tail by quadratic Young gives the stated

```math
K_m=2(1+\tau)K,\qquad
K_*=2(1+\tau)K+(1+\tau^{-1}),
\qquad \tau=\kappa/8.
```

The coefficient inequality follows from
$`(1+\kappa/8)(2-\kappa)=2-3\kappa/4-\kappa^2/8\leq2-\kappa/2`$.
The original mass error is not discarded. Its positive degree-zero contribution can later absorb the $`tK_m\|e\|^2`$ term, provided the assembly imposes the corresponding smallness condition on $`t`$.

## 5. Independent check of the negative potential

In the score representation for a point in $`C_i`$, subtracting the smallest mean gives $`\mu_i=0`$, $`\mu_j=\theta`$, and all other means between zero and $`M`$. There is no use of $`j`$ being a most likely winner.

The probability-difference bracket is nonnegative on the entire real line by the decreasing inverse Mills ratio. On $`v\in[M+1,M+2]`$, its derivative with respect to the mean increment is at least $`\phi(M+2)^2`$ for every increment between zero and $`\theta`$. The remaining distribution functions are all at least one half. Integration gives exactly the constant $`2^{2-q}/(2\pi)`$ before the exponential factor.

For $`t\leq1/16`$,

```math
(M+2)^2\leq8+\frac{4t^2}{1-t^2}|z|^2
\leq8+\frac4{255}|z|^2
\leq8+\frac{|z|^2}{16}.
```

Also $`\theta\geq ts`$. Thus the asserted global lower bound has the correct sign, normalization, and Gaussian weight. The compact-core gradient limit also has the stated positive sign for $`T_{-t}(1_{C_j}-1_{C_i})`$. Reflection makes the potential vanish on the tie hyperplane, so integrating the uniform gradient estimate gives the sharp normal slope.

## 6. Independent check of the weighted tail

The far-normal estimate is weighted vector Cauchy–Schwarz with reciprocal weight $`e^{\alpha|z|^2}`$. The near-normal estimate first uses the one-dimensional mass inequality, paying only $`e^\alpha`$ because $`|s|\leq1`$. Its remaining weighted Cauchy–Schwarz integral is precisely $`B_r(R)`$. The near part is empty in dimension one when $`R>1`$.

Both reciprocal-weight tail integrals tend to zero because $`\alpha=1/16<1/2`$. The final two-term square estimate explains the factor two in $`\eta_r^\alpha`$. The partition sum counts each unordered transfer twice and yields the displayed factor $`2(q-1)`$. Conditioning preserves absolute transfer costs because their signs are fixed on the two regular cells. It does not preserve noise stability, and the drafts state that distinction explicitly.

## Scope of this review

The algebra in these deductions is complete. The input balanced first-moment extremum and covariance estimate remain credited to their existing source. No unrestricted first-moment extremum is assumed. This review does not import a positive-correlation noise theorem into the negative comparison and does not claim a full Standard Simplex resolution.
