# Independent review of tail transfer control

Reviewed 21 November 2026 against `TAIL_CONTROL.md` and its definitions in `NOISE_COMPARISON.md`. The tail lemma, conditioning identities, core mass/alignment error estimate and compact-core potential convergence pass this review. They are auxiliary estimates; this review does not claim the missing core-coercivity theorem or the Standard Simplex conjecture.

## 1. The Gaussian tail lemma

Rotate the chosen normal into the first coordinate, writing `z=(s,y)` and `a=R/sqrt(2)>=1`. The support split is valid: when `g_2` is nonzero, `|s|<=a` but `|z|>R`, so `|y|>a`. The equality boundary carries no relevant Gaussian mass.

For the part with `|s|>a`, vector Cauchy–Schwarz with measure `|g_1| dgamma` gives the augmented mass-and-moment estimate. Since `|g_1|<=1`, its coefficient is bounded by

```math
\mathbb E[(1+s^2+|y|^2)1_{\{|s|>a\}}]
=r p_1(a)+m_1(a).
```

The truncated normal weight is exactly one on that support, so its unweighted mass is `B_1`.

I checked both fiber inequalities for `g_2`. Splitting the absolute mass into `|s|<=1` and `|s|>1`, the one-dimensional mass inequality gives `A_n^2<=4phi(0)B_n`; the far part satisfies `A_f^2<=A_f=B_f`. The elementary inequality `(A_n+A_f)^2<=2A_n^2+2A_f^2`, with `8phi(0)<4`, then gives `A^2<=4B`.

For the signed normal moment, weighted Cauchy–Schwarz gives

```math
|N|^2\le B\int\frac{s^2}{\min(|s|,1)}|g_2|\,d\gamma_1
\le B\left(\mathbb E|G_1|+\mathbb E G_1^2\right)
\le2B.
```

The value assigned to the quotient at zero is irrelevant. No cancellation assumption is used.

The tangential augmented vector `(1,y)M(y)` and the scalar normal moment `N(y)` occupy orthogonal coordinates. Their two Cauchy–Schwarz bounds therefore add, giving exactly `6p_(r-1)(a)+4m_(r-1)(a)` times `B_2`. Finally, the factor two from combining `g_1` and `g_2` is accounted for in the displayed definition of `eta_r`.

For `r=1`, there is no tangential coordinate. The second part is empty, since the original tail support already has `|s|>R>a`; taking `p_0=m_0=0` is consequently valid. For every fixed `r`, the Gaussian tail probabilities and second moments tend to zero, proving `eta_r(R)->0`. Rotational invariance makes this uniform over the choice of normal. No ambient dimension larger than `r` enters.

## 2. Conditioning preserves the relevant signed transfers

The aligned subspace contains every original moment vector, including in the singular-Gram case after extension of the partial polar isometry. Its orthogonal complement has zero original first moments. Gaussian product structure then proves the stated masses and first moments of the conditioned fractional partition.

For a fixed pair `i,j`, the transfer on a fiber above `z` has a fixed sign: it is nonnegative when the regular label is `j`, nonpositive when that label is `i`, and zero for every other regular label. Thus its conditional absolute mean equals the absolute value of its conditional mean. This is stronger than the usual Jensen inequality and is exactly what justifies the equality of transfer costs.

The normals, the truncation `|z|<=R`, the untruncated normal cost, and the simplex noise potentials all depend only on `z`. The latter statement follows because the regular cells are cylindrical and the Gaussian noise operator respects the orthogonal product decomposition. Hence their linear transfer integrals are preserved exactly. The draft correctly leaves the nonlinear noise-stability term on the original indicators and does not claim that conditioning preserves it.

## 3. Tail errors and core alignment

On each tail transfer, the preceding lemma bounds the squared augmented mass-and-moment vector by `eta_r(R)` times its truncated transfer cost. Summing `h_i^E=sum_(j!=i) g_ij` first uses the vector inequality

```math
\left|\sum_{j\ne i}a_{ij}\right|^2
\le(q-1)\sum_{j\ne i}|a_{ij}|^2.
```

Each unordered transfer appears twice in the subsequent sum over cells. The resulting coefficient is therefore exactly `2(q-1)eta_r(R)`.

The bound `W_t<=1` also holds pointwise before integration. If the regular label at `z` is `k`, the sum of absolute conditioned transfers is `sum_(i!=k) f_i(z)=1-f_k(z)<=1`; the truncated normal weights can only reduce it.

The core fractional partition equals the original conditioned partition on the core and the regular partition on the tail. It remains a genuine fractional partition. Its mass error is the negative of the tail error because the original and reference partitions have identical masses. Its actual moment matrix is `M_core=M_original-M_tail`; the tail matrix here is the moment of the perturbation, not the full original tail moment. This distinction is consistent throughout the draft.

All these moment matrices have centered row sums. Consequently left multiplication by the coordinate isometry `U^T` preserves their Frobenius norms. The polar choice makes `U^T M_original` symmetric positive semidefinite. Taking skew parts therefore gives

```math
\mathop{\mathrm{skew}}(U^T M_{\mathrm{core}})
=-\mathop{\mathrm{skew}}(U^T M_{\mathrm{tail}}).
```

The skew projection is a Frobenius contraction. Combining this with the mass-error identity proves equation (8), without assuming the core has balanced masses or is itself polar-aligned.

## 4. Compact-core potential convergence

For bounded measurable `F`, Gaussian convolution gives the differentiable formula

```math
\nabla T_\rho F(z)
=\frac{\rho}{\sqrt{1-\rho^2}}
\mathbb E\left[G F\left(\rho z+\sqrt{1-\rho^2}G\right)\right].
```

Changing variables to the argument of `F` makes the density and its linear prefactor smooth in `rho,z`. With `rho<=1/2` and `|z|<=R`, they have a common integrable bound of the form `C_R(1+|x|)exp(-c|x|^2)`. Their convergence as `rho` decreases to zero is uniform in `z` on this compact set. Boundedness of `F` therefore proves the asserted uniform convergence of `rho^(-1) grad T_rho F`, even though the indicators are discontinuous.

For `F=1_(C_i)-1_(C_j)`, the limiting vector is exactly the difference of the regular first moments, namely `ell_q n_ij`. Reflection in the `ij` tie plane swaps the two regular score vectors and fixes the others. It consequently makes `F` odd, and Gaussian convolution remains odd. The smoothed function is exactly zero on that plane.

For a point `z=sn+y` in `C_i`, `s>=0`. The segment from `y` to `sn+y` lies in the same radius-`R` ball. It need not stay in `C_i`, but the uniform gradient estimate holds throughout the ball, so that is immaterial. Integrating the normal derivative yields the lower bound with the factor `s`, including the endpoint `s=0`. This factor would not follow from uniform convergence of the function alone.

Summing over the signed core transfers proves `L_(rho,core)>=(1-delta)rho D_core`. The exact moment slope is retained. The all-location tail bound has a different constant and a truncated weight, and the draft does not interchange those bounds.

## 5. Checks of the imported weighted comparison

I also checked the algebraic inputs from `NOISE_COMPARISON.md` needed to interpret the tail note. The one-dimensional mass estimate follows by integrating the tail mass after subtracting at most `2phi(0)t` near zero. In the normal Hermite expansion, normal degrees zero and one contribute at most `rho^2` times their coefficient norms, while degree `l>=2` contributes at most `rho^l`. The displayed Mehler bound gives `M_l^2<=2^(l+1)`, so the geometric series is at most `16rho^2` for `rho<=1/4`; the two lower normal degrees bring this to 18. The fiber mass estimate and the near/far split give constants 36 and 72, respectively. No tangent-dimension factor is introduced.

For the simplex-potential bound, the difference of winning probabilities is the displayed one-dimensional integral. Its bracket is nonnegative because the inverse Mills ratio decreases. On `0<=z<=1` and `0<=theta<=1`, differentiation in `theta` gives the stated lower bound `phi(2)phi(1)`. The other scores have nonpositive means after normalizing the winning regular score, so their distribution factors are bounded below by `Phi(z)^(q-2)`. This proves the claimed positive constant; monotonicity in the losing score's mean handles `theta>=1`. The final truncation comparison is valid for every `0<rho<1`.

These checks confirm the tail estimate being imported. They are not a new review of the primary source's full multi-bubble theorem or an independent novelty audit for the auxiliary bounds.

## Disposition

No mathematical correction is requested. The remaining core-coercivity estimate and the absorption of all error terms are separate tasks. A resulting small-positive-correlation theorem would require its own complete argument and source comparison; the current auxiliary estimates alone do not imply the full Standard Simplex conjecture.
