# Independent analysis review of the negative-correlation components

Review dated 21 November 2026. The analysis lane read and checked all three new component proofs before using them in [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md). The assembled theorem is authored in the analysis lane, so this note is not an independent review of that assembly. The separate root, algebra, and combinatorics reviews supply those checks. No formal verification or first-discovery claim is made.

## Files reviewed

| Component | Authoring lane | SHA-256 of reviewed mathematical text |
|---|---|---|
| [WEIGHTED_NOISE.md](WEIGHTED_NOISE.md) | Algebra | `548817b0354a92ed211b8fdce1606e189c0e4309142fa1aa1564f89a94582f89` |
| [NEGATIVE_LOCALIZATION.md](NEGATIVE_LOCALIZATION.md) | Root | `2a74fccafc71912d012a39a9d0e050e7e4635a9796cee351abaa782d12cb6de0` |
| [NEGATIVE_POTENTIAL_TAIL.md](NEGATIVE_POTENTIAL_TAIL.md) | Combinatorics | `91312d21d586f5d939705153b8cb2f55f242aeadbf4ca7534e4ab3d7d9cede0a` |

## 1. Weighted noise bound

The conjugation and Schur test are valid quadratic-form arguments. With $`\alpha=1/16`$, the test function $`p=e^{|z|^2/8}`$ and conjugating multiplier $`e^{\alpha|z|^2/2}`$ give the Gaussian exponent $`5/32`$. The Gaussian integration denominator is $`49/64`$, and the remaining exponent is exactly

```math
\frac1{32}+\frac5{98}-\frac18=-\frac{67}{1568}.
```

Thus the bound
$`T_{1/2}^E\preceq(8/7)^rM_{\exp(-|z|^2/16)}`$
has the stated direction. Compact truncation followed by the Gaussian $`L^2`$ contraction justifies extension to all square-integrable functions, without asserting boundedness of the unbounded conjugating multiplier.

The Hermite comparisons retain arbitrary unused coordinates. In the normal-degree decomposition, the coefficients $`4t^2`$, $`2t^2`$, and $`t^\ell`$ for normal degrees zero, one, and at least two are each valid for $`0\lt t\le1/4`$. Applying the score-tangent Schur bound to the coefficient functions preserves their original dependence on unused coordinates.

For the near region, the normalized Mehler identity gives
$`\sup_{|s|\le1}|H_\ell(s)|^2\le2^{\ell+1}`$.
The high-degree series is at most $`16t^2`$; adding the zero- and first-degree bounds gives $`22t^2a^2`$. The fiber mass bound $`a^2\le4\phi(0)b\le2b`$ produces the stated coefficient $`44e^{1/16}(8/7)^{r-1}`$. After the positive-semidefinite near/far split, both coefficients are bounded by $`88(8/7)^r`$.

The negative remainder is indefinite. The proof correctly takes absolute Hermite coefficients to compare its quadratic form with that of the positive remainder, and only then uses positivity for splitting and transfer sums. The partition corollary counts each unordered transfer twice and has the correct factor $`2(q-1)`$. It requires no balance condition.

**Verdict:** no gap or constant correction found.

## 2. Unrestricted-mass localization

The proportional balancing construction remains a fractional partition: the donor removal is nonnegative, receiver shares sum to the freed density, and every resulting mass is exactly $`1/q`$. Donor denominators are bounded below by $`1/q`$. Bessel's inequality bounds the entire moment matrix norm by one independently of ambient dimension.

The sum of donor and receiver moment changes is at most $`q\|e\|_1`$, giving

```math
\|M-N\|_F\le q^{3/2}\|e\|,
\qquad
|\|M\|_F^2-\|N\|_F^2|\le2q^{3/2}\|e\|.
```

No absolute first-moment bound for an arbitrary measurable subset is used. Such a bound with a linear mass factor would fail for small sets far in the tails; here the donor mass is uniformly bounded below and the full donor moment is what is scaled.

The balanced covariance and alignment inputs apply directly to fractional assignments. Their normalized score payoff is still the moment norm, so the feasible-assignment inequality does not need a deterministic purification theorem. Singular covariances are covered by the existing global alignment estimate.

For a competitor whose negative noise value is no larger than the regular value, the degree-zero difference is $`+\|e\|^2`$ and the degree-one difference is $`-t(F-c^2)`$. The total remainder difference has absolute value at most $`2t^2`$. Solving the resulting scalar quadratic gives exactly $`K_e=L+\sqrt{L^2+2}`$, and the balanced deficit is at most $`K_Ft`$.

The actual polar regular matrix is Frobenius-nearest among all regular moment matrices. It therefore inherits the bound obtained by first aligning the balanced auxiliary matrix. This justifies use of one fixed simplex both in localization and in the later skew-error estimate; the argument never replaces it by an unrelated existence simplex.

The unbalanced core identity is $`e_{\mathrm c}=e-e_{\mathrm t}`$. The proof retains its $`2\|e\|^2`$ contribution. The rectangular-to-square coordinate map preserves Frobenius norms, and the full aligned square matrix is symmetric. The derived core estimate and the subsequent Young inequality therefore give the stated $`K_m`$ and $`K_*`$. Since the mass-error term is multiplied by $`t`$ in the noise identity, it can be absorbed by the exact positive degree-zero term.

**Verdict:** no gap or constant correction found.

## 3. Negative potential and weighted tails

The independent-score representation has the correct sign. For $`x\in C_i`$ and negative correlation, the shifted score mean for $`i`$ is the smallest, and every competing mean lies in $`[0,M]`$. The probability-difference bracket is nonnegative by monotonicity of the inverse Mills ratio.

On $`v\in[M+1,M+2]`$, differentiation in the $`j`$-mean gives the stated positive bracket derivative even when $`j`$ is not the largest-mean score. The remaining distribution functions are at least $`1/2`$. The estimate

```math
(M+2)^2\le2M^2+8
\le\frac4{255}|z|^2+8
\le\frac1{16}|z|^2+8
```

is valid for $`t\le1/16`$. The constant $`b_q^-=2^{2-q}e^{-8}/(2\pi)`$ is therefore valid. Retaining the untruncated normal distance strengthens the capped form used in the assembly.

The compact-core gradient limit has the correct reversed signs. Its limit is $`m_i^{\mathcal C}-m_j^{\mathcal C}=\ell_qn_{ij}`$. A common Gaussian majorant on a fixed ball gives uniform convergence. Reflection makes the potential zero on the score-tie hyperplane, so integrating the normal derivative supplies a distance factor even near a facet; mere uniform convergence of the potential would not suffice.

For the tail lemma, the far-normal part has cap one and follows from weighted vector Cauchy–Schwarz. On the near-normal part, the normal mass bound controls the square of the fiber mass; a second weighted Cauchy–Schwarz step controls mass, normal moment, and tangent moment together. The integrability condition is $`\alpha<1/2`$, and the integrals tend to zero as the radius grows. When $`r=1`$, the near-normal tail is empty for $`R>1`$, as stated.

The conditioned transfer has fixed sign on each relevant regular cell. Thus $`|\mathbb E[g_{ij}\mid z]|=\mathbb E[|g_{ij}|\mid z]`$, which preserves the weighted costs. The factor $`2(q-1)`$ in the aggregate mass/moment estimate is correct. The note explicitly distinguishes preservation of score-space moments from full moments when the original row space is not contained in that score space. Polar localization in the application supplies the required containment.

**Verdict:** no gap or constant correction found.

## Scope of this review

The three components are analytic estimates; they are not a proof of the full Standard Simplex conjecture. Their use together proves only the small-negative-correlation partial theorem stated in the assembly, subject to its explicitly credited first-moment inputs. This review does not convert a bounded prior-work search into a claim of worldwide priority, and it does not verify any Lean source.

