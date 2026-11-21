# Independent algebra review of the small negative correlation assembly

Reviewer: algebra lane. Date: 21 November 2026.

Status: the mathematical assembly in [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md) passes this review. This is a review of the stated partial theorem, not a claim that the full Standard Simplex conjecture is resolved or that the partial theorem has priority over every prior source. The separate bounded negative-scope source audit addresses that question.

## Scope and dependencies

The reviewed claim is: for each fixed $`q\ge3`$, there is $`t_q>0`$ depending only on $`q`$ such that every measurable $`q`$-partition in every $`d\ge q-1`$ satisfies

```math
S_{-t}(\mathcal A)\ge S_{-t}(\mathcal C)
\qquad(0\lt t\le t_q),
```

with no mass constraint, and with equality precisely for a central regular-simplex partition up to the stated symmetries and null sets. The proof does not cover the rest of the negative interval.

I read the complete assembly, including its threshold choices and equality argument. The weighted remainder was independently derived in [WEIGHTED_NOISE.md](WEIGHTED_NOISE.md), and the localization and potential/tail inputs were reviewed in [NEGATIVE_LOCALIZATION_ALGEBRA_REVIEW.md](NEGATIVE_LOCALIZATION_ALGEBRA_REVIEW.md). The balanced first-moment and covariance inputs remain explicitly credited to the prior manuscript; this review does not reassign those results to the present work.

## Localization and the chosen simplex

For a competitor whose noise value is at most the regular value, the degree-zero term is exactly $`1/q+\|e\|^2`$. The first-degree term is $`-tF`$, and the remainder has absolute value at most $`t^2`$. Hence

```math
\|e\|^2-t(F-c^2)\le2t^2.
```

The proportional balancing operation gives a balanced fractional partition with moment matrix $`N`$ and $`\|M-N\|_F\le L\|e\|`$. It follows that $`\|e\|\le K_et`$, and the balanced covariance deficit yields a nearby regular moment matrix.

The assembly then chooses the polar simplex of the actual matrix $`M`$, rather than continuing with the intermediate simplex associated with $`N`$. Its Frobenius distance is no larger. Because the rows of $`M`$ sum to zero and have rank at most $`q-1`$, a polar isometry can be extended in every allowed dimension. Its score space contains all moment rows. The resulting square moment matrix is symmetric, which is the property needed for the core skew error.

## Core and tail errors

Conditioning the labels on the chosen score space preserves masses, moments, transfer costs and the linear potential term. The proof never claims that this operation preserves the noise quadratic form.

After replacing the tail by the regular labels, the core mass error is $`e_{\mathrm c}=e-e_{\mathrm t}`$. It is not set equal to $`-e_{\mathrm t}`$. The core error bound therefore correctly retains $`2K\|e\|^2`$ before the tail is restored.

With $`\tau=\kappa/8`$, the coefficient calculation is

```math
(1+\tau)(2-\kappa)
=2-\frac{3\kappa}{4}-\frac{\kappa^2}{8}
\le2-\frac{\kappa}{2}.
```

The radius condition consequently gives the stated estimate

```math
\|M-M_{\mathcal C}\|_F^2
\le(2-\kappa/2)D_{\mathrm c}
+K_m\|e\|^2+(b/2)W_{\mathrm t}.
```

The constants are selected in the required order: covariance/core constants, then a fixed radius controlling the weighted tails, then a correlation threshold controlling the potential approximation and the remainder. None depends on the competitor or the unused dimensions.

## Exact sign and constant check

For the original indicator differences, the exact identity is

```math
\Delta_-
=2J_t+\|e\|^2-t\|M-M_{\mathcal C}\|_F^2
+\sum_i\langle h_i,R_{-t,d}h_i\rangle.
```

Here $`R_{-t,d}=T_{-t}-P_0+tP_1`$. The negative remainder is indefinite; its absolute quadratic form is controlled by the positive spectral remainder. The partition-transfer estimate therefore applies in the original ambient space with

```math
H=176(q-1)(8/7)^{q-1}.
```

The compact and tail potential estimates give

```math
2J_t\ge(2-\kappa/4)tD_{\mathrm c}+2btW_{\mathrm t}.
```

Subtracting the moment estimate and the remainder bound leaves

```math
\Delta_-\ge
(1-K_mt)\|e\|^2+
t\left[
\left(\frac{\kappa}{4}-\frac{Ht}{\ell}\right)D_{\mathrm c}
+\left(\frac{3b}{2}-Ht\right)W_{\mathrm t}
\right].
```

The three relevant threshold conditions are $`t\le1/(2K_m)`$, $`t\le\kappa\ell/(8H)`$, and $`t\le b/(2H)`$. They imply exactly

```math
\Delta_-\ge
\frac12\|e\|^2+
t\left[\frac{\kappa}{8}D_{\mathrm c}+bW_{\mathrm t}\right]\ge0.
```

The positive degree-zero mass term is essential: it absorbs the unequal-mass error multiplied by $`t`$. No unrestricted first-moment extremum is assumed.

## Equality and logical completion

The argument starts with an arbitrary competitor whose value is at most the regular value. It does not assume that a minimizer exists. The resulting nonnegative lower bound rules out any strictly better competitor.

In an equality case, the bound forces $`e=0`$, $`D_{\mathrm c}=0`$, and $`W_{\mathrm t}=0`$. The weighted transfer cost then vanishes everywhere. Its weight is strictly positive away from finitely many score-tie hyperplanes, which are Gaussian null sets. Thus every transfer function vanishes almost everywhere and the original partition equals the chosen polar simplex up to null sets. This proves the claimed equality classification.

No mathematical correction was required.
