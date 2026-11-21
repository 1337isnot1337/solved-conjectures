# Review of the Hwang padding-limit monotonicity argument

Independent review, 20 November 2026 (America/Chicago). I found no mathematical gap in [the monotonicity note](hwang_matching_monotonicity.md). The conclusion is strict first-derivative positivity for every finite doubly stochastic core on `0<t<=1/2`; it does not prove Hwang's convexity conjecture.

## Checks

- **Weighted alternating-path identity.** The sign is positive for vertices in opposite bipartite classes. Superposition and switching cancel configurations unless the component joins the specified vertices. Every surviving path has odd length. Its edge activity is the product of its edge weights, while the two remaining matchings contribute `Z(G-V(P))^2`. The one-edge path contributes strictly positively whenever that edge has positive weight. Thus the strict inequalities in equation (5) have the stated direction.
- **Finite denominators and zero entries.** Every matching partition function is at least one. A doubly stochastic row and column each have a positive incident edge, so all monomer probabilities lie in `[1/(1+z),1)`. Consequently `w(x)=x/(1-x)` is finite and positive. Zero matrix entries are omitted edges and cause no division by zero. The proof does not need connected support or a uniform gap below one.
- **Reduction of the scalar inequality.** At fixed `s=x+y`, the admissible product `p=xy` is an interval. Its upper endpoint is `x=y`; its lower endpoint occurs at `x=a` or `y=a` when `s<=a+1`, and at `x=1` or `y=1` when `s>=a+1`. Since the quadratic coefficient of `N_b(s,p)` is `2z>0`, the stated endpoint checks control every feasible pair. The polynomial boundary checks at one do not divide by the vanishing denominator.
- **Endpoint formulas and discriminant.** The exact symbolic checker verifies equations (8)–(13). The quadratic's leading coefficient increases to `-1` on `[1/2,1]`, so it stays negative. Also `T''` decreases to `2`, whence `T'` increases to `-4`; therefore `T` decreases from `T(1/2)=-1`. This proves the strict negativity of the discriminant for every `b<1`, and the unbalanced endpoint is negative on the entire real line.
- **Averaging.** After multiplying the vertex inequalities by positive `w`, row and column sums of one allow the two sums to be written as the `a_ij`-weighted sum of the scalar left side. Applying the scalar certificate gives `0<...<=2mc(b-u_bar)`. The two average monomer probabilities agree because every matching occupies the same number of vertices in the two parts. Hence `u_bar<b` follows with strict inequality.
- **Derivative and domain conversion.** Direct differentiation gives `F'/F=(1+t)/(t(1-t)) (E|M|-mt)`. The substitution `b=1-t` maps `0<t<=1/2` exactly to `1/2<=b<1`, and `z=t/(1-t)^2` maps it to `0<z<=2`. No claim is made at the singular parametrization endpoint `t=0`; there the limiting derivative is zero.

The script `python3 hwang_matching_monotonicity.py` passes its exact scalar identities and twelve weighted matching checks. These confirm the algebra and indexing; the proof is the general argument above.

## Finite-padding corollary

The subsequently added finite-padding consequence is valid. The expansion at zero gives `F_A'(0)=0` and `F_A''(0)=||A||_F^2>0`. Continuity supplies an interval `[0,epsilon]`, with `epsilon<1/2`, on which the second derivative stays positive. Normalized `C^2` convergence then makes `p_M''` positive on that interval for every sufficiently large `M`. The identity `p_M'(0)=0` follows from the zero line sums of the radial direction, so integration gives `p_M'(t)>0` near zero. On `[epsilon,1/2]`, strict positivity and compactness give a positive minimum of `F_A'`; normalized `C^1` convergence preserves the sign there. Multiplication by the positive normalization `d_(m+M)` does not affect either derivative sign.

The threshold depends on the fixed core `A`; no uniform or effective threshold is obtained. The conclusion concerns first derivatives on the half interval only. It does not imply the full boundary-monotonicity problem or half-interval convexity.

## Curvature warning checked independently

Differentiating again gives the displayed curvature formula, and at `t=1/2` this is `36 Var(K)-4m-4(m-EK)`. Thus the occupancy bound alone does not control curvature.

For the cycle core, the matching partition function has the exact transfer form


```math
Z_{C_{2m}}(z)=\lambda_+(z)^{2m}+\lambda_-(z)^{2m},
\qquad
\lambda_\pm(z)=\frac{1\pm\sqrt{1+2z}}2.
```


For fixed positive `z`, the ratio of root magnitudes is less than one. Differentiating the dominant-root expression gives the stated limits for occupancy and variance. At `z=2`, their ratio tends to `(1+sqrt(5))/10<1/3`, so the proposed stronger variance lower bound fails for all sufficiently large cycle cores. This does not contradict either the proved first-derivative statement or Hwang's conjecture.

No independent priority audit was performed in this review. The result should remain an uncounted research theorem unless a separate source audit establishes its novelty; it is not a full named conjecture resolution.
