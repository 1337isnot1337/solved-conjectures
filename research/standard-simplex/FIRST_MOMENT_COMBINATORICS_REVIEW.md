# Independent review of quantitative first-moment stability

Reviewed 21 November 2026. The argument in `FIRST_MOMENT_STABILITY.md`, including its added noise-localization consequence, passes this mathematical review. It proves a quantitative deduction from the credited covariance comparison. It does not prove the Standard Simplex conjecture, and this review is not a completed novelty audit for the quantitative deduction.

I read the local copy of the complete relevant proof in the [mxym/math all-cell first-moment manuscript](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), particularly its Lemma 2, equations (7)–(14), and return to measurable partitions. I checked the dimension and positive-mass scope of the imported [Milman–Neeman Gaussian multi-bubble theorem](https://annals.math.princeton.edu/2022/195-1/p02). I also read Definition 2.3, Lemma 2.8 and Section 8 of [Heilman 2014](https://arxiv.org/pdf/1211.7138v2) in the local primary PDF text. No formalization was executed or inspected.

## 1. Credited input and singular endpoint

Write `r=q-1`, `Q_*=P/r`, `C(t)=V(Q_t)`, and `W(t)=sum_e w_e(t)`. The flux and covariance derivative identities give

```math
tC'(t)=\frac12\left(C(t)-\frac{2W(t)}r\right).
```

With `h(t)=C(t)^2-c_q^2`, this becomes

```math
th'(t)=h(t)-D(t),
\qquad
D(t)=\frac2r W(t)C(t)-c_q^2.
```

The weighted identity

```math
W\sum_e w_e\ell_e^2-\left(\sum_e w_e\ell_e\right)^2
=\sum_{e\lt f}w_ew_f(\ell_e-\ell_f)^2
```

and `S_*^2=rc_q^2/2` reproduce the draft's exact expression for `D`. The perimeter input makes it nonnegative. At the regular covariance, symmetry makes the derivative in every centered trace-zero direction vanish, so `h(t)/t` tends to zero as `t` decreases to zero. Integrating `(h/t)'=-D/t^2` therefore gives the displayed deficit identity.

This calculation never differentiates at a singular endpoint `Q`. For every `t<1`, the path matrix is positive definite on `1^perp`; continuity of the balanced value gives the endpoint limit. Nonnegativity of the integrand then also justifies the improper integral. There is no assumption of bounded limiting prices, facet weights or derivatives at `t=1`.

The Gaussian multi-bubble theorem is used only on the auxiliary balanced polyhedral cluster in dimension `r`, with `q=r+1` cells of positive mass. The original measurable partition need not have finite Gaussian perimeter.

## 2. Uniform positive facet weights

The compact set `K_(1/2)` lies strictly within the positive cone on `1^perp`. Its score lists are affinely independent. The map from the score-space point to the `q-1` score differences is invertible. For any pair, one can prescribe that pair to tie strictly above the remaining scores. Thus its common winning facet contains a relatively open subset of a hyperplane and has strictly positive Gaussian area.

The source supplies the smoothness mechanism needed here. Gaussian orthant probabilities in invertible score-difference coordinates are smooth in covariance and thresholds. Their price Jacobian is the weighted graph Laplacian, positive definite in the zero-sum gauge because all pair weights are positive. Existence and uniqueness of the balancing price, followed by the implicit function theorem, give smooth prices locally. Uniqueness identifies these local branches globally. The same orthant derivatives give continuous facet weights.

Consequently the minimum of all facet weights over this compact set is strictly positive. Positivity at each point alone would not have sufficed without continuity and compactness; the draft establishes both. Every object used to define this minimum lives in dimension `q-1` and depends only on `q`.

## 3. The constant in the covariance deficit

For centered trace-zero `Delta`, I independently expanded the full distance matrix

```math
D_{ij}=\Delta_{ii}+\Delta_{jj}-2\Delta_{ij}.
```

The row-sum identities kill the mixed terms involving `Delta`, and its trace kills the remaining diagonal cross term. Dividing the full squared norm by two gives exactly

```math
\sum_{i\lt j}\delta_{ij}=0,
\qquad
\sum_{i\lt j}\delta_{ij}^2
=q\sum_i\Delta_{ii}^2+2\|\Delta\|_F^2.
```

A positive semidefinite trace-one matrix satisfies `ell_e^2<=2`, since `||e_i-e_j||^2=2` and its largest eigenvalue is at most one. Thus `(ell_e+ell_f)^2<=8`. The squared-distance differences along the radial path are exactly `t(delta_e-delta_f)`. With `M=q(q-1)/2`, the resulting chain is

```math
D(t)
\ge\frac2r\frac{\omega_q^2t^2}{8}
       \sum_{e\lt f}(\delta_e-\delta_f)^2
\ge\frac{M\omega_q^2}{2r}t^2\|\Delta\|_F^2
\qquad (0\le t\le1/2).
```

Integrating `D(t)/t^2` over an interval of length one half gives

```math
c_q^2-\mathcal V(Q)^2
\ge\frac{M\omega_q^2}{4r}\|\Delta\|_F^2
=\frac{q\omega_q^2}{8}\|\Delta\|_F^2.
```

The factor `q omega_q^2/8` is correct. The nonnegative perimeter deficit has only been discarded, not estimated. This gives a global covariance estimate despite using uniform geometric bounds only on the initial half of each path.

## 4. From original moments to regular score vectors

The moment rows sum to zero because the cells partition the whole Gaussian space. Dividing their matrix by `sqrt(F)` gives a centered Gram matrix of trace one. The original balanced labels are feasible for the assignment dual, even if they depend on coordinates outside the score span. Pointwise domination by the winning score holds in the full ambient space; no assumption that the original labels are functions of the score vector is needed.

The feasible assignment value is exactly `sqrt(F)`, so the covariance estimate gives

```math
\beta_q\|Q-Q_*\|_F^2
\le c_q^2-\mathcal V(Q)^2
\le c_q^2-F=\varepsilon.
```

For example, one can choose the small-deficit cutoff no greater than

```math
\min\{c_q^2/2,\;\beta_q/(4r^2)\}.
```

The operator norm is bounded by the Frobenius norm, so this ensures `Q>=P/(2r)` on `1^perp`. The moment matrix therefore has rank `r`.

The polar alignment is also correct in arbitrary ambient dimension. The rectangular matrix `U=Q^(-1/2)V` satisfies `UU*=P`, with the inverse taken only on `1^perp`. Hence multiplying the centered square-root difference by `U` preserves its Frobenius norm. Since `Q_*` is scalar on this subspace, scalar square-root estimates provide the stated local Lipschitz bound for `V-V_*`. Smooth prices on the positive neighborhood give their Lipschitz bound as well. No choice of ambient dimension enters either estimate.

## 5. Assignment loss and symmetric difference

Balancing cancels the mean price. Thus the expected loss of the original labels against the winning assignment is exactly

```math
\delta=\mathcal V(Q)-\sqrt F
\le c_q-\sqrt F
=\frac{\varepsilon}{c_q+\sqrt F}.
```

Every adjusted pair difference is a one-dimensional Gaussian whose variance is at least `1/r`; shifting it by the price difference does not change the bound on its density. If the largest and second-largest scores differ by at most `t`, at least one pair has absolute adjusted difference at most `t`. The union bound therefore gives the draft's `2M sqrt(r/(2pi)) t` estimate, without any independence assumption between pairs.

A wrong label outside this small-gap event has loss greater than `t`. Markov's inequality gives `P(wrong)<=C_q t+delta/t`, and taking `t=sqrt(delta)` yields the required square-root bound. When `delta=0`, the loss is zero almost surely and all pair ties are Gaussian-null, so the original label is the unique winner almost surely. This covers the endpoint without dividing by zero.

For two labelled ordinary partitions, the sum of their cellwise symmetric-difference probabilities is exactly twice their label disagreement probability. The factor two is absorbed in the finite constant. The optional fractional-partition extension is also valid: conditionally sample a label with probabilities `f_i(X)`. Its mismatch probability is `E[1-f_(winner)(X)]`, and the sum of the cellwise absolute differences equals twice that quantity.

## 6. Affine halfspace disagreement

The halfspace estimate follows by inserting the centered halfspace with normal `u`. Moving its threshold from zero to `b` costs at most the maximal density of `u dot X` multiplied by `|b|`, namely `|b|/(sqrt(2pi)|u|)`. The two centered halfspaces disagree with probability `angle(u,u_*)/pi`, as follows by projecting the Gaussian onto their span. This includes parallel and antiparallel normals.

Both normal lengths in the application have a positive lower bound depending only on `q`. Normalization to unit vectors is then Lipschitz, and the angle is bounded by a constant times their chordal distance. These observations give the stated bound by `C_q|u-u_*|`.

If the two winning labels are distinct, their mutual pair comparison must have opposite signs; ties again have zero measure. Summing the pairwise bounds therefore controls winner disagreement. No independence or joint density in dimension `d` is needed. The result depends only on the score differences in the at most `q-1` dimensional common score space.

Combining this with the assignment estimate gives the symmetric-difference bound. For deficits above the chosen cutoff, the trivial upper bound of two proves the result after enlarging the constant. This covers zero moment sum and every remaining singular Gram case. The conversion to the product `L^2` distance is exact because the square of the difference of two indicators is the indicator of their symmetric difference.

## 7. Added noise-localization consequence and scope

For an ordinary balanced partition, the total Hermite mass is one and its degree-zero mass is `1/q`. For `0<rho<1`, each degree at least two contributes a nonnegative amount bounded by `rho^2` times its Hermite mass. Therefore

```math
0\le R_\rho(\mathcal A)\le\rho^2(1-1/q).
```

The regular partition has first-moment sum `F_q`, so its noise stability is at least `1/q+rho F_q`. Combining this lower bound with the assumed benchmark and the competitor's upper bound gives precisely

```math
\varepsilon\le\rho(1-1/q)+\eta/\rho.
```

Applying the proved stability estimate yields the draft's localization formula. This does not establish exact noise optimality for any fixed positive correlation. It leaves room for a nearby competitor with larger higher-degree Hermite contribution.

The historical comparison is accurate: Heilman's Definition 2.3 uses the square root of the sum of squared indicator `L^2` distances, minimized over rotations and labels; Lemma 2.8 has exponent `1/8` for unrestricted three-cell partitions. Section 8 identifies the balanced higher-cell first-moment stability problem as a missing input, while also discussing additional obstacles. The new draft correctly does not claim that a geometric stability estimate alone supplies the required balanced feedback argument.

## 8. Review of the proposed sharpness construction

The mirrored-strip construction communicated after the main draft also works. Start with regular cones in their `r=q-1` dimensional score space. Choose a compact patch `D` of positive Gaussian measure in the relative interior of one `ij` facet. Because the patch avoids every other facet, there is a positive tube radius in which only the `i` and `j` scores can win. Let `n` be its unit normal pointing into cell `i`. The common facet lies in `n^perp`, so the Gaussian measure factors into its tangential marginal and the one-dimensional normal density `phi`.

Let `p_D` be the tangential Gaussian measure of the patch. Exchange the labels on the two strips `D x (-t,0)` and `D x (0,t)`, with `2t` smaller than the tube radius. Their measures agree exactly by reflection symmetry, so every cell retains mass `1/q`. The tangential moment changes cancel as well. The exact normal moment changes are

```math
m_i(t)=m_i-hn,\qquad m_j(t)=m_j+hn,
\qquad h=2p_D\bigl(\phi(0)-\phi(t)\bigr).
```

The original regular moments satisfy `m_i-m_j=c_q sqrt(2/r)n`. Therefore the exact deficit is

```math
\varepsilon(t)
=2h\left(c_q\sqrt{2/r}-h\right).
```

For sufficiently small positive `t`, this is positive and of order `t^2`, since `h/t^2` tends to the positive constant `p_D phi(0)`.

On each normal line above `D`, the modified cell `i` has membership pattern `1,0,1` on `(-t,0)`, `(0,t)`, `(t,2t)`. The intersection of any convex comparison cell with that line is an interval. If this interval meets both outer subintervals, it contains the whole middle one and incurs mismatch length at least `t`; otherwise it misses one whole outer subinterval and incurs the same lower bound. Endpoint conventions do not change these lengths.

For `t<=t_0`, the normal Gaussian density on those three subintervals is at least `phi(2t_0)`. Fubini thus gives, for every convex comparison cell `C_i`,

```math
\gamma(A_i(t)\mathbin{\triangle}C_i)
\ge p_D\phi(2t_0)t.
```

This applies to every regular-simplex comparison partition, irrespective of its rotation or labeling, since each individual cell is convex. In a larger ambient dimension, extend the modified partition cylindrically. Fubini over the full unrestricted orthogonal complement preserves the same lower bound. A comparison simplex may rotate into those extra coordinates; its intersections with the chosen normal lines are still intervals, so that possibility does not evade the argument.

The symmetric-difference distance is therefore bounded below by a positive constant times `sqrt(epsilon(t))`. No exponent greater than one half can hold uniformly, even for one fixed cell count. The corresponding product `L^2` exponent one quarter is sharp for the same reason. This is a sharpness statement for the quantitative first-moment theorem, not a further conjecture resolution.

## Disposition

No mathematical correction is requested. The proof establishes the proposed first-moment stability deduction under its credited analytic inputs, with a finite constant depending only on the cell count. The independent source-status question for this quantitative deduction remains separate. The draft and this review should remain research material unless that status and the intended publication scope are settled; neither is a resolution of the Standard Simplex conjecture.
