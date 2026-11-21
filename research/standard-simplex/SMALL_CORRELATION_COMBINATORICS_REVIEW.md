# Independent review of the small-correlation argument

Reviewed 21 November 2026. The combined proof in `SMALL_CORRELATION.md` passes this mathematical review, with the analytic dependencies stated in that file. I read `CORE_COERCIVITY.md` and checked every step of the assembled argument against the previously reviewed first-moment, weighted-Hermite, potential and tail estimates. This review does not establish novelty and does not turn the partial theorem into a resolution of the full Standard Simplex conjecture.

The exact conclusion reviewed is: for each fixed integer `q>=3`, a positive threshold depending only on `q` exists such that regular-simplex partitions uniquely maximize balanced Gaussian noise stability for every correlation in that interval and every ambient dimension at least `q-1`. No quantitative value for that threshold is supplied.

## 1. Core coercivity with unequal masses

The crucial dual comparison uses the balancing prices for the **uniform-mass** problem. A fractional partition of masses `p_i=1/q+e_i` is feasible for its own linear assignment problem. Evaluating the unequal-mass dual at the uniform balancing prices therefore gives

```math
\sqrt F\le\mathcal V(Q)+\lambda(Q)\cdot e
\le\mathcal V(Q)+L\|Q-Q_*\|_F\|e\|.
```

No existence, regularity or extremal classification for the unequal-mass optimizer is needed. Near `Q_*`, the uniform prices vanish at the regular covariance and are Lipschitz by the previously justified implicit-function argument.

After squaring, the quadratic covariance deficit contributes `-beta d_Q^2`. The mixed term is bounded by `beta d_Q^2/4+(4c^2L^2/beta)||e||^2`, while the coefficient `L^2||e||^2` is made at most `beta/4`. This leaves exactly the asserted lower bound

```math
G=\varepsilon+C\|e\|^2
\ge\frac\beta2 d_Q^2+\|e\|^2\ge0.
```

This argument remains valid when the core first-moment sum exceeds the balanced optimum: `epsilon` is permitted to be negative and is bounded below by a quadratic mass error. The later use of `|epsilon|<=(1+C)G` follows from `epsilon=G-C||e||^2`; it does not silently assume `epsilon>=0`.

The polar symmetric part `H=(AA^T)^(1/2)` satisfies the displayed identity

```math
\|H-sI\|_F^2=(\sqrt F-c)^2+2c\sqrt F(1-u).
```

The spectral estimate on `1-u` is valid eigenvalue by eigenvalue, and the chosen neighborhood controls the remaining scalar term. Thus the bound by a finite multiple of `G` is valid.

## 2. The elementary rotation estimate

For the left polar decomposition `A=HO`, the orthogonal factor `O` maximizes `Tr(AW^T)` over orthogonal `W`. Comparing with `W=I`, and writing `A=S+J` with `S` symmetric and `J` skew-symmetric, gives

```math
\mathop{\mathrm{Tr}}(S(I-O^T))
\le\mathop{\mathrm{Tr}}(J(O^T-I)).
```

The left side equals one half of `Tr(S(I-O)(I-O)^T)`. Under `S>=(s/2)I`, it is at least `s||O-I||_F^2/4`. Frobenius Cauchy–Schwarz on the right therefore proves `||O-I||_F<=4||J||_F/s`, with the zero-distance case immediate.

Consequently the squared distance from the fixed regular matrix is bounded by `2KG+32||J||_F^2`. Combining this with the exact identity `2D=epsilon+||A-sI||_F^2` gives the claimed core coercivity. Every occurrence of a possibly negative `epsilon` stays inside a valid inequality; the final rearrangement has a positive coefficient `1+2K`.

The proof uses only the local neighborhood and the credited balanced covariance estimate. It does not assume that the core is balanced or already aligned. Its error terms are exactly the squared mass and skew errors that the tail estimate supplies.

## 3. The global comparison uses one chosen simplex

An alleged competitor meeting the regular-simplex benchmark has first-moment deficit at most `rho(1-1/q)`. This follows directly by retaining degrees zero and one in the Hermite expansion and bounding every higher-degree eigenvalue by `rho^2`. The total Hermite mass of the ordinary cell indicators is one, and their degree-zero mass is `1/q`.

The proof then chooses the polar-aligned simplex from the global moment estimate. It does not substitute the existence of a possibly different nearby simplex from the earlier stability theorem. The quantitative estimate gives closeness of the original moment matrix to this exact chosen reference. This alignment is maintained in the conditioning, core cutoff, potential estimates and final identity.

The partial-polar-isometry extension is legitimate because the ambient dimension is at least `q-1`. It produces a score subspace containing all original moments even if the initial Gram is singular. The subsequent small moment-distance estimate places the core inside the invertible local neighborhood, so no singular inverse is taken in the core lemma.

## 4. Conditioning and the core hypotheses

Conditioning the indicators onto the aligned score subspace preserves masses and first moments there; the original moments have zero perpendicular coordinates. The fixed sign of each pair transfer on a given regular cell makes conditioning commute with its absolute value. Thus the transfer costs and the linear potential term are preserved exactly.

The proof does not identify the original noise value with that of the conditioned fractional partition. The higher-Hermite term is bounded for the original indicators in the original ambient dimension. This distinction is necessary and is respected throughout.

The tail estimate gives

```math
\|e_{\mathrm t}\|^2+\|M_{\mathrm t}\|_F^2
\le\eta_q(R)W_{\mathrm t},\qquad W_{\mathrm t}\le1.
```

The fixed tail choice makes the discarded moment norm at most `delta_0/4`. The benchmark and correlation restriction make the full aligned moment distance at most `delta_0/4`. Therefore the core moment distance is at most `delta_0/2`; its mass error is at most `delta_0/4`. These are stronger than the two required local bounds.

The full aligned square moment matrix is symmetric, so the core skew part is precisely the negative tail skew part. The core error term is consequently bounded by `eta_q(R)W_t`. This is why a quadratic, rather than linear, dependence on core mass and rotation errors is sufficient.

## 5. Constant order and restoration of tail moments

The choices are noncircular. The covariance and core-coercivity constants are fixed first. They determine the auxiliary parameter `tau=kappa/8` and `K_*`. A sufficiently large tail radius then makes `eta_q(R)` small. Only after fixing that radius is the compact-core potential threshold chosen. The final correlation threshold is a positive minimum of finitely many positive quantities depending only on `q`.

Restoring the tail moment uses

```math
\|u+v\|^2\le(1+\tau)\|u\|^2+(1+\tau^{-1})\|v\|^2.
```

The coefficient of the core assignment cost is

```math
(1+\kappa/8)(2-\kappa)
=2-3\kappa/4-\kappa^2/8\le2-\kappa/2.
```

The radius bound makes the restored tail coefficient at most `b/2`. Hence equation (15) of the assembled proof follows with the displayed constants. No dimension-dependent norm conversion occurs: the rectangular-to-square coordinate map is a Frobenius isometry on centered rows.

## 6. Final absorption and equality

The exact balanced noise identity has no degree-zero perturbation term. The core potential retains coefficient `(1-kappa/8)rho`, the tail potential retains coefficient `b rho`, and the weighted higher-Hermite error is bounded by

```math
H\rho^2(D_{\mathrm c}/\ell+W_{\mathrm t}).
```

Substitution therefore gives the coefficients

```math
-\kappa/4+H\rho/\ell
\quad\hbox{and}\quad
-3b/2+H\rho.
```

The final two explicit correlation restrictions make these at most `-kappa/8` and `-b`, respectively. The assembled inequality is consequently

```math
S_\rho(\mathcal A)-S_\rho(\mathcal C)
\le-\rho\left(\frac\kappa8D_{\mathrm c}+bW_{\mathrm t}\right).
```

This is applied only to a partition meeting the simplex benchmark; every partition below the benchmark already satisfies the desired upper bound. Thus the proof is exhaustive, without assuming existence of an optimizer.

For equality, both nonnegative costs vanish. Away from finitely many Gaussian-null comparison hyperplanes, each incorrect transfer has strictly positive normal weight. The conditioned fractional labels must therefore equal the regular indicators almost everywhere. An indicator whose conditional expectation is zero or one agrees almost surely with that conditional value. Equivalently, its conditional absolute difference from the corresponding regular indicator integrates to zero. This returns equality to the original, possibly higher-dimensional partition.

Orthogonal invariance shows that every regular-simplex partition attains the same noise value. The alignment argument supplies the converse up to rotations, labels and null sets. There is no claim at `rho=0`, where all balanced partitions have the same noise value.

## Disposition

No mathematical correction is requested. Together with the prior covariance comparison and the explicitly reviewed auxiliary estimates, the argument proves the stated interval of small positive correlations for each fixed cell count, with a threshold independent of ambient dimension. All larger positive correlations, the negative-correlation assertion and the full named conjecture remain outside its scope. The literature and priority comparison is independent of this review and must precede any claim that this partial theorem is new.
