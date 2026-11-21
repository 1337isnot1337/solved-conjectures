# Independent combinatorics review: weighted Gaussian noise remainder

Reviewed 21 November 2026. The complete source reviewed was [WEIGHTED_NOISE.md](WEIGHTED_NOISE.md), SHA256:
548817b0354a92ed211b8fdce1606e189c0e4309142fa1aa1564f89a94582f89.

**Finding:** the stated bound and partition-transfer corollary pass. No mathematical correction is requested. This is an audit of the auxiliary estimate, not an optimality theorem or a priority claim.

## Schur comparison and domains

I recomputed the Gaussian exponential integral with correlation $`1/2`$, weight exponent $`\alpha=1/16`$, and Schur function $`p=e^{|z|^2/8}`$. The combined exponent is $`5/32`$, the denominator is $`49/64`$, and

```math
\frac1{32}+\frac5{98}-\frac18=-\frac{67}{1568}.
```

Thus the conjugated symmetric kernel has Schur ratio at most $`(64/49)^{r/2}=(8/7)^r`$. The integral defining that ratio is finite. Applying the Schur inequality to compactly supported functions, then truncating the original $`L^2`$ function, proves the claimed form inequality. No unbounded multiplier is silently treated as a bounded operator. The final inequality is a form inequality, not a pointwise output estimate.

The zero-dimensional convention is correct. Tensoring with the identity uses the bound on each unused-coordinate fiber and preserves those coordinates.

## Hermite coefficients

The total-degree remainder and score-space smoothing are diagonal in a common product Hermite basis. If score degree is $`m`$ and unused-coordinate degree is $`k`$, the bound
$`t^{m+k}\le4t^2 2^{-m}`$ holds for every present total degree $`m+k\ge2`$. The cases $`m=0,1`$ require the total-degree restriction and are handled explicitly.

After separating the normal coordinate, the three rows are correct:

- Normal degree zero: $`4t^2 2^{-m}`$.
- Normal degree one: $`2t^2 2^{-m}`$, using $`m+k\ge1`$.
- Normal degree at least two: $`t^\ell2^{-m}`$.

Unused coordinates retain their full functions and the identity bound; they are not replaced by conditional expectations. Singular or zero-dimensional tangent factors cause no exception.

## Near and far normal regions

The normal fiber mass inequality is valid for every measurable function between zero and one and requires no balance or smoothness. On $`|s|\le1`$, the normalized Mehler identity implies $`M_\ell^2\le2^{\ell+1}`$. Therefore the degree-at-least-two sum is at most $`16t^2`$ for $`t\le1/4`$, and the three normal contributions total $`22t^2a^2`$.

Applying $`a^2\le2\int |s||h|\,d\gamma_1`$ gives the coefficient $`44`$. Restoring the normal exponential weight costs precisely $`e^{1/16}`$. The positive-remainder near/far split doubles the coefficients, giving $`88e^{1/16}c_{r-1}`$ and $`8c_r`$. Since $`e^{1/16}\le16/15<8/7`$, both are bounded by $`88c_r`$.

For the far part, the form bound applies to the far-supported function itself, and $`|h|^2\le|h|`$ converts its weighted squared norm to the required cost. Boundary points $`|s|=1`$ have zero Gaussian measure.

## Negative signs and transfers

The estimate for the negative remainder first uses

```math
\left|\sum_{j\ge2}(-t)^j\|P_jh\|_2^2\right|
\le\sum_{j\ge2}t^j\|P_jh\|_2^2.
```

Only the positive operator on the right defines the seminorm used for splitting and for the transfer sum. The argument never applies a positive-form inequality to an indefinite remainder.

In the partition corollary, each cell has at most $`q-1`$ transfers and each unordered pair is counted twice. This gives exactly the factor $`2(q-1)`$, hence $`176(q-1)(8/7)^r`$. The normals may differ by pair but lie in the same fixed score space; the same weight and constant apply to all of them.

## Independent check of the mechanism

Before reading the source I obtained a less sharp bound by comparing $`R_t\preceq16t^2T_{1/4}`$ and dropping only the noise operator in the unused coordinates. The Mehler diagonal in the score space is

```math
K_{1/4}(z,z)=(15/16)^{-r/2}e^{|z|^2/5}.
```

Its weighted integral is finite because $`1/16+1/5<1/2`$. Splitting at $`|s|=1`$, using the diagonal kernel Cauchy inequality on the far part, and the fiber mass inequality with a bounded normal kernel on the near part also gives a constant depending only on $`r`$ times $`t^2`$ times the same weighted cost. This independently confirms the tail-smoothing mechanism; the audited Schur argument above supplies the smaller explicit constant.

## Scope

The estimate is in the original ambient Gaussian space and applies for both signs of correlation. It does not assert that conditioning preserves noise stability, does not localize unbalanced competitors by itself, and does not prove any complete Standard Simplex statement. Those steps require separate arguments.

