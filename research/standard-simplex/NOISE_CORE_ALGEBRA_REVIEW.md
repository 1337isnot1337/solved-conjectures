# Independent review of the noise, core and tail estimates

Reviewed 21 November 2026 against the complete `NOISE_COMPARISON.md`, `CORE_COERCIVITY.md`, and `TAIL_CONTROL.md`. All three auxiliary arguments pass this review under their stated hypotheses and the explicitly credited first-moment input. This is not a prior-status audit or an assertion of the full Standard Simplex conjecture.

## Weighted higher-Hermite estimate

The normalized probabilists' Mehler formula has the exponent `t s^2/(1+t)` and prefactor `(1-t^2)^(-1/2)` used in the note. At `t=1/2` on the unit interval, it bounds each squared Hermite polynomial by `2^(ell+1)`. The normal degrees zero and one each retain at least two total powers of the noise parameter after removing total degrees zero and one. Normal degrees at least two contribute the geometric series at most `16 rho^2`. The resulting constant before the fiber mass estimate is 18, and that estimate gives 36. Splitting the near and far parts with positivity gives the claimed constant 72. No ambient-dimension factor enters, and no zero-mean hypothesis was inadvertently used.

The partition-transfer identity and Cauchy--Schwarz supply `2(q-1)` because every unordered pair occurs in two cell sums. Thus the coefficient `144(q-1)` in the total remainder is correct.

## Potential and alignment

For independent Gaussian scores, the standardized mean difference is `rho sqrt(2) (n_ij dot x)/sqrt(1-rho^2)`. The probability-difference integrand is nonnegative by the decreasing inverse Mills ratio. Its derivative on the chosen unit square has the stated positive lower bound. The constant `b_q=2^(2-q) phi(1) phi(2)` and the conversion to `rho min(n_ij dot x,1)` are therefore valid uniformly in tangent coordinates.

For polar alignment, the square-root distance identity and its bound by `r ||Q-Q_*||_F^2` also hold at zero eigenvalues. The assignment cost satisfies `D<=epsilon+c_q^2(1-u)`, yielding the displayed global coercivity constant. The identity `||M-M_C||_F^2=2D-epsilon` has the correct sign.

## Core coercivity with imperfect masses and rotation

Evaluation at the uniform-mass balancing price gives the correct upper bound on the unequal-mass assignment value. In the chosen neighborhood both quantities being squared are nonnegative. Young's inequality consumes `beta/4` and the small mass-error term consumes another `beta/4`, leaving `beta/2` in (6). The error quantity `G` is nonnegative even when `epsilon` is negative.

The polar square-root estimate controls distance from the regular orbit. To fix the rotation, positive definiteness of the symmetric part yields

```math
\frac{s}{4}\|O-I\|_F^2
\le\left|\mathop{\mathrm{tr}}\bigl(J(O^T-I)\bigr)\right|
\le\|J\|_F\|O-I\|_F.
```

The factor four and the resulting coefficient 32 in the squared distance bound are correct. Combining this estimate with the exact moment identity gives the proposed mass-and-skew coercivity lemma, without requiring an unrestricted first-moment extremum. Conditioning onto the polar row space is used only for moments and masses, as required.

## Tail estimates and the sharp compact slope

For the normal tail, the augmented second moment is exactly `r p_1(a)+m_1(a)`. For the tangent tail, the normal-fiber mass and moment squares are bounded by `4 B(y)` and `2 B(y)`. Cauchy--Schwarz in the tangent variables therefore gives `6 p_(r-1)(a)+4 m_(r-1)(a)`. The factor two used to combine the two tail regions is valid and slightly loose. All terms tend to zero for fixed `r`.

The conditioned pair-transfer function has a fixed sign in each regular cell, so conditioning preserves its absolute value, not merely an upper bound. This justifies preservation of both transfer costs and potential loss. The resulting mass and moment error estimate has the correct factor `2(q-1)` and controls the skew error of the core by symmetry of the full aligned moment matrix.

Gaussian convolution differentiates as in the displayed gradient formula. On a fixed compact core the differentiated kernels converge in a uniformly dominated weighted `L^1` norm. Reflection in a regular score-tie hyperplane exchanges precisely the two labels and fixes the other scores. Integrating the uniformly convergent normal derivative from that hyperplane is therefore valid even arbitrarily near a tie and retains the factor of normal distance. This avoids an unjustified absolute Taylor error near the interface.

## Combination to be checked in a final proof

The displayed estimates admit the following consistent order of choices. Let `kappa` be the core coercivity constant. Choose positive `eta,delta` such that

```math
(1+\eta)(2-\kappa)<2(1-\delta).
```

Bound the full moment perturbation by `(1+eta)` times its core square plus `(1+1/eta)` times its tail square. Core coercivity supplies the strict cost coefficient above, while all mass, skew and tail moment errors have coefficient tending to zero with the cutoff radius. Choose that radius large enough to absorb these errors into the uniform tail potential. Finally choose the noise parameter small enough for the sharp compact slope and to absorb the higher-Hermite remainder, using `W_core<=D_core/ell_q`.

The local hypotheses must be checked for the chosen polar-aligned simplex, rather than an unrelated simplex furnished by an existence statement. A direct way is to combine the global aligned assignment bound `D<=C_q epsilon` with the regular Gaussian score-margin estimate; it gives symmetric-difference distance at most `C_q sqrt(epsilon)` for that same simplex. On a fixed compact core this controls both the mass and moment perturbations. The noise benchmark makes `epsilon=O_q(rho)`. These observations support the proposed combination, but the final theorem should state its quantifiers, its order of constants, its comparison with prior small-correlation results, and the treatment of every ambient dimension separately.

No mathematical correction was identified in the three reviewed notes. No numerical or formal verification was used.

## Addendum: the assembled small-correlation argument

I subsequently read the complete `SMALL_CORRELATION.md`. Its assembly passes this review, with the same stated first-moment dependency and pending prior-status boundary.

The constants are chosen in a valid order: the global and local moment constants depend only on `q`; the mixing parameter is fixed from the local coercivity constant; the tail radius then controls both the local-neighborhood error and the tail absorption coefficient; the compact potential threshold is chosen for that fixed radius; and the final noise threshold is the minimum of positive quantities depending only on those choices. There is no dependence on the ambient dimension or on the competing partition.

The benchmark assumption gives `0<=epsilon<=rho(1-1/q)` by the correct nonnegative Hermite-tail bounds. Global polar alignment yields closeness of the full moment matrix to the particular comparison simplex used throughout. The moment-plus-tail argument then puts that same core in the local neighborhood. It does not replace the comparison simplex by an unrelated near-optimal one. The partial polar extension in a singular case is legitimate, and the subsequent small-neighborhood bounds ensure the local core has the invertibility required by its lemma.

The mass and skew errors together are bounded by the single tail error quantity in (13). With `tau=kappa/8`, the coefficient of the core cost is at most `2-kappa/2`. Substitution in the exact original-space noise identity gives exactly

```math
\rho\left[
\left(-\frac{\kappa}{4}+\frac{H\rho}{\ell}\right)D_{\mathrm c}
+\left(-\frac{3b}{2}+H\rho\right)W_{\mathrm t}
\right].
```

The final threshold therefore gives the claimed negative bound `-rho[(kappa/8)D_core+b W_tail]`. The higher-Hermite estimate is applied to the original cell indicators before conditioning. Only costs, masses and moments are transferred to the fixed-dimensional score subspace, so no equality of conditioned and original noise stability is assumed.

The equality argument is valid. Off the finite union of score-tie hyperplanes, every positive transfer between different regular labels has positive cost in either the core or the tail. Vanishing of both costs forces the conditioned labels to be the regular indicator labels almost everywhere. A conditional expectation of an indicator equal to zero or one forces the original indicator to have that same value almost everywhere on the corresponding fibers. Thus the claimed equality class follows for every `d>=q-1`.

The proved mathematical scope, if the credited input is accepted, is a positive low-correlation interval for every fixed number of cells, with a dimension-independent threshold. It leaves the rest of the Standard Simplex conjecture open. This addendum makes no novelty claim.
