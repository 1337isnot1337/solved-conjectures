# Root review of the negative-correlation theorem

Date: 21 November 2026. Reviewed `NEGATIVE_CORRELATION.md`,
`WEIGHTED_NOISE.md`, and `NEGATIVE_POTENTIAL_TAIL.md` in full, and checked
their use of `NEGATIVE_LOCALIZATION.md` and the earlier first-moment
notes. The root worker authored the local core lemma and the negative
localization note. This review independently checks the new weighted
lemmas and the assembled argument, rather than claiming independent
authorship of those earlier inputs.

Verdict: the stated all-cell, dimension-independent small-negative-
correlation theorem passes. Its arbitrary-mass quantifier, including
empty cells, is supported by the proof. This is a proposed partial
theorem, not a complete resolution of Standard Simplex. Mathematical
review does not establish priority or external acceptance.

## 1. The weighted remainder

The Gaussian Schur calculation in `WEIGHTED_NOISE.md` is exact. For
$`\alpha=1/16`$, the conjugating weight and positive test function give
the denominator $`49/64`$ and exponent

```math
\frac1{32}+\frac5{98}-\frac18=-\frac{67}{1568}.
```

Thus the quadratic-form constant is $`(8/7)^r`$. The proof first uses
compactly supported functions and then truncates, so it does not assume
boundedness of the inverse Gaussian weight.

The Hermite coefficient comparisons retain the identity on unused
coordinates. Their normal-degree constants are respectively four, two,
and one before the normal sum. The Mehler bound gives the sum
$`16t^2`$ for degrees at least two, hence $`22t^2a^2`$ in the near
region. The one-dimensional mass bound, the near/far splitting, and
$`e^{1/16}<8/7`$ give the claimed single-transfer constant
$`88(8/7)^r`$.

The passage to a negative remainder uses its spectral absolute-value
bound by the positive remainder. Only the positive remainder is used as
a seminorm. Summing pair transfers introduces exactly $`2(q-1)`$,
giving $`H=176(q-1)(8/7)^r`$. No zero-mass assumption is used.

## 2. The negative potential, including losing competitors

For a point in the regular cell $`C_i`$, the negative-noise mean of
score $`i`$ is smallest. After shifting that mean to zero, all means lie
between zero and $`M`$ and the selected comparison mean is
$`\theta=\sqrt2\,t s/\sqrt{1-t^2}`$.

The probability-difference bracket in the potential note is nonnegative
on the whole line. On the interval from $`M+1`$ to $`M+2`$, its derivative
with respect to the comparison mean is at least $`\phi(M+2)^2`$.
This argument needs only $`0\le\theta\le M`$; the comparison cell need
not have the largest mean. The remaining probability factors each have
the stated lower bound.

The numerical exponent comparison

```math
(M+2)^2\le2M^2+8
\le\frac4{255}|z|^2+8
\le\frac{|z|^2}{16}+8
```

is valid for $`t\le1/16`$. Together with $`\theta\ge ts`$, it yields
the constant $`b=2^{2-q}e^{-8}/(2\pi)`$ and the same weight as the
remainder lemma. This is a global estimate; no far-tail competitor is
dropped.

On a fixed compact core, differentiating the Gaussian kernel gives the
first-order gradient with the positive sign required for the linear
increase. Reflection makes the potential zero on the tie hyperplane.
Integrating the normal derivative therefore gives relative error
control, including arbitrarily small normal distances.

## 3. Weighted tail control

The tail lemma's far normal region has unit truncated normal weight.
Weighted vector Cauchy--Schwarz therefore produces the finite tilted
Gaussian integral $`A_r(R)`$ directly. In the near region, the squared
normal-fiber mass is bounded by its first absolute normal moment.
The additional Gaussian weight changes the constant by at most
$`e^{1/16}`$.

The augmented vector containing mass, tangent moments, and normal moment
is bounded by $`(2+|y|^2)v(y)^2`$. This is exactly the factor cancelled
by the subsequent weighted Cauchy--Schwarz step. Both tilted tail
integrals tend to zero because $`\alpha<1/2`$. The dimension-one case
has no near part when $`R>1`$ and is covered explicitly.

The partition factor is again $`2(q-1)`$. Conditioning preserves the
absolute transfer costs because each transfer has fixed sign on the
two regular cells. It is not used to replace the noise stability.

## 4. Arbitrary masses and the actual polar simplex

The proportional balancing operation removes only an excess fraction
from donor labels; their masses are at least $`1/q`$. It produces a
balanced fractional partition with moment change at most
$`q^{3/2}\|e\|`$. The first-moment extremal and covariance estimates
apply directly to these fractional labels through the feasible-assignment
inequality.

For a hypothetical competitor no larger than the regular benchmark,
the signed Hermite expansion gives

```math
\|e\|^2-t(F-c^2)\le2t^2.
```

Combining this with the balancing bound gives the stated
$`O_q(t)`$ mass error and $`O_q(\sqrt t)`$ moment distance. The actual
moment matrix's polar regular simplex is Frobenius-nearest among all
regular moment matrices, so the intermediate balanced comparison does
not change the chosen orientation. The score space contains every
original moment row, including after a partial polar extension.

The core has mass error $`e-e_{\mathrm t}`$. Keeping this term gives
exactly the additional $`K_m\|e\|^2`$ in the restored moment estimate.
The full aligned square moment matrix is symmetric, so only the tail
contributes to its core skew part. The threshold in the theorem makes
both core neighborhood hypotheses valid.

## 5. The signs and final absorption

The exact original-space identity is

```math
\Delta_-
=2J_t+\|e\|^2-t\|M-M_{\mathcal C}\|_F^2
 +\sum_i\langle h_i,R_{-t,d}h_i\rangle.
```

The sign of the degree-zero term is positive and that of the degree-one
term is negative. The linear term $`J_t`$ is an increase because each
transfer moves from the least likely regular label to another label
under negative noise. Substituting the reviewed bounds gives

```math
\Delta_-\ge(1-K_mt)\|e\|^2
+t\left[
 (\kappa/4-Ht/\ell)D_{\mathrm c}
 +(3b/2-Ht)W_{\mathrm t}
\right].
```

The three corresponding restrictions in the fixed threshold give

```math
\Delta_-\ge\tfrac12\|e\|^2
+t(\kappa D_{\mathrm c}/8+bW_{\mathrm t})\ge0.
```

Every constant and the tail radius is fixed using only the number of
cells before a competitor or an ambient dimension is chosen. The proof
does not require existence of a minimizing partition.

## 6. Equality and source boundary

Equality forces zero mass error and zero core and tail transfer costs.
The exponential weight is everywhere positive, and the normal weights
vanish only on Gaussian-null tie hyperplanes. Thus the original
partition agrees almost everywhere with the chosen regular partition.
The argument applies to all competitors, including those initially
having empty cells; equality itself forces all masses to be equal.

The binding original source, Isaksson--Mossel Conjecture 1.4, has an
unrestricted-mass negative clause. I checked that clause in the locally
retrieved primary manuscript and separately checked the current
three-cell theorem in Heilman's author manuscript, Theorem 7.1. The
all-cell theorem here has a different quantifier scope from that prior
three-cell result. The separate negative-priority audit records the
remaining search and archive limits.

No finite numerical screen or Lean execution was used in this review.
The first-moment input remains the explicitly credited unrefereed prior
manuscript, whose written argument was checked in the earlier notes.
