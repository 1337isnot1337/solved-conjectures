# Simon's Le Roy complete-monotonicity conjecture

## Independent mathematical audit

Reviewer: the algebra research lane. Date: 2026-11-20.

This audit concerns `CANDIDATE_PROOF.md`, initially committed at
`151879adb34feaad7b7ffa6e3d9859c2e3d3abc1`, and the subsequently clarified
version with GitHub content blob `aadfe66ee7d2659bad50a86b983318fdec65167a`.
The clarification makes the compound-Poisson density identity pointwise.

**Mathematical conclusion:** the full analytic interval argument passes the
review below. The independent shorter construction using Dufresne's 2010
Theorem 6.3 also passes. This is a mathematical review, not a certification
that the conjecture has no earlier resolution. The newly located 2010
theorem must be disclosed in the priority assessment.

### Review of the explicit manuscript

I subsequently read every section of `EXPLICIT_PROOF.md` at commit
`4f78ff027035b80c238165db1aefbe86ab071059`. That written proof also passes.
The probability measures in equation (7) have the stated normalization;
the summable-mean bound proves that their independent sum is finite; and
the finite product in equation (11) has the correct orientation. The
independent gamma variable cancels the extra gamma factor. The two beta
variables then extend existence to every parameter at least thirteen
thirtieths, including the equality case handled separately. Triplication
and exponential integrability give the exact Le Roy function. The upper
endpoint of the counterexample interval is correctly obtained by solving
the scalar violation at one sixty-fourth. Its integer certificate is
equivalent to the certificate checked below. No mathematical correction
is required. The explicit manuscript credits Dufresne's construction and
leaves the prior-resolution assessment separate.

## Source and scope

Thomas Simon's [primary preprint](https://arxiv.org/pdf/2012.11018),
arXiv:2012.11018v2, Section 3, printed pages 5–6, states the equivalence
between complete monotonicity of the Le Roy function and the scalar
inequality for every positive parameter triple. Its published version is
[DOI 10.1080/10652469.2021.1913138](https://doi.org/10.1080/10652469.2021.1913138).
The direction under challenge is necessity. Sufficiency is already in the
source.

For the candidate's parameters, substitution of the cube of a variable into
Simon's scalar inequality gives exactly

```math
2w^{3\beta-1}\leq 1+w+w^2,\qquad 0<w<1.
```

There is no omitted extra hypothesis at these parameters. The separate
question about convexity of Simon's threshold is not included in this
claim. A current [MathDB threshold entry](https://mathdb.com/p/414157/convexity-of-the-le-roy-parameter-threshold)
reports a proof of that different assertion and expressly distinguishes the
complete-monotonicity equivalence. A catalog's status is supporting context,
not proof of worldwide priority.

## Review of the analytic interval proof

### Threshold and signed density

The threshold lies strictly between one third and one half. Failure at a
fixed interior value of the scalar variable persists to the right of one
third. At one half, the difference is the sum of a square and the fourth
power of the square root. It has a strictly positive minimum even on the
closed unit interval. Joint continuity then gives an admissible parameter
below one half. The admissible sets are nested and relatively closed, so
the infimum is attained.

For the proposed signed density, both endpoint powers at one exceed minus
one. The exponential controls the two zero endpoints. These estimates are
uniform on compact subsets of the parameter and positive-variable domain,
which justifies joint continuity.

The absolute-integrability calculation in Lemma 1 is valid on the stated
half-plane. After the substitution in the exponential variable, the three
integrals have exponents with real parts strictly above their convergence
boundaries. The polynomial identity is

```math
\Gamma(s+3)+(2\beta-3)\Gamma(s+2)+(\beta-1)^2\Gamma(s+1)
=\Gamma(s+1)(s+\beta)^2.
```

The beta denominators are both gamma functions at the argument
one greater than the desired denominator argument. The displayed square
cancels those two shifts exactly. There is no missing normalization factor.

### Uniform positivity at the two ends

At large positive arguments, positivity follows from positivity of the
quadratic polynomial for every argument at least four. This is uniform in
the full positive parameter range used.

For the small-variable limit, the substitution in equation (9) and its
Jacobian give the stated outside power and the factor with exponent
`beta - a`. That exponent is positive throughout the compact parameter
interval. Extend this factor by zero outside its integration domain. It is
then between zero and one. The proposed product dominator is integrable:
the exponent at the first zero endpoint is minus two thirds, the exponent
at the endpoint one is greater than minus one, and the remaining gamma
integral has exponent minus one third.

For each fixed pair of positive integration variables, convergence of the
bounded factor is uniform on the compact parameter interval. Applying
dominated convergence to the supremum of the difference therefore gives
uniform convergence, not just convergence for each parameter separately.
The limit simplifies to

```math
\frac{\Gamma(b-a)\Gamma(1-a)}{\Gamma(\beta-a)^2},
```

which has a positive minimum on the chosen interval. This proves the
uniform small-variable positivity needed later.

### Strict positivity at the infinitely divisible boundary

The gamma integral in equation (11) has the correct drift and compensation.
Near zero its jump density has order the reciprocal square of the jump
size, so the quadratic compensation makes the integral finite. At infinity
the density decays exponentially. At the threshold its numerator is
nonnegative by precisely the defining scalar inequality. The formula
therefore defines an infinitely divisible law on the real line.

The gamma asymptotic gives exponential Fourier decay with exponent
minus pi times the absolute Fourier variable divided by two. The residual
power is exactly three halves minus twice the parameter. This gives a
continuous, real-analytic density and its holomorphic extension to every
strictly smaller strip. The signed logarithmic change of variables of the
candidate density is a finite signed measure, by Lemma 1 at zero, and has
the same Fourier transform. Fourier uniqueness and continuity identify the
two densities at every real point.

The strict-positivity argument is sound. The jump numerator tends to one at
zero, so there is an interval of jump sizes with strictly positive density.
Removing half the finite jump measure on that interval leaves a legitimate
infinitely divisible law, after changing the drift. Its characteristic
function differs by a bounded factor, hence its density remains
nonnegative and real analytic. This density is bounded and uniformly
continuous, by Fourier inversion. Its convolution with the removed
compound-Poisson law is thus continuous, so the density identity is
pointwise.

If the original density vanished at one point, the one-jump term in the
nonnegative compound-Poisson expansion would force the remaining density
to vanish on a nonempty interval. Real analyticity would make it identically
zero, contradicting its integral one. This proves strict positivity on the
whole real line. The argument does not infer strict positivity merely from
nonnegativity or from absence of atoms.

### Perturbation and the required Laplace transform

The two uniform endpoint estimates leave one compact positive-variable
interval. Strict positivity at the boundary parameter gives a positive
minimum on that interval. Joint continuity preserves that minimum for a
small parameter neighborhood. Combining these three ranges proves
positivity for all positive variables on both sides of the threshold.

The signed density's Mellin transform normalizes to a probability law on
that neighborhood. Multiplication by three after taking a cube root gives,
by Gauss's triplication formula,

```math
\mathbb E[X_\beta^s]
=\Gamma(1+s)\frac{\Gamma(\beta)^2}{\Gamma(\beta+s/3)^2}.
```

The exponential series at a nonnegative argument is justified first by
monotone convergence. Its finite entire sum then justifies the absolute
integration of the exponential series at negative arguments. Consequently
the required Le Roy function is the Laplace transform of a positive finite
measure. This proves complete monotonicity on the full positive half-line.
Parameters below the threshold violate the proposed necessary condition.
The construction is an interval disproof of the whole universal claim.

The final interpretation in terms of failure of logarithmic infinite
divisibility is consistent with uniqueness of the signed gamma
Lévy representation. That interpretation is not needed for the disproof.

## Independent check of the Dufresne construction

Daniel Dufresne, *G distributions and the beta-gamma algebra*,
Electronic Journal of Probability 15 (2010), 2163–2199,
[DOI 10.1214/EJP.v15-845](https://doi.org/10.1214/EJP.v15-845),
[full primary PDF](https://emis.de/ft/42731), Theorem 6.3, printed pages
2187–2188, has an explicit converse. It constructs a probability Mellin
transform from exponentially tilted nonnegative laws with prescribed
rational Laplace transforms. It is not only a theorem about complete
monotonicity of a gamma-ratio function.

Set

```math
R_\beta(s)=
\frac{(s+\beta)^2(s+2)}{(s+1/3)(s+2/3)(s+1)}.
```

At the rational parameter thirteen thirtieths, exact partial fractions give

```math
R_{13/30}(s)=1+
\frac{3/40}{s+1/3}-\frac{49/75}{s+2/3}
+\frac{289/200}{s+1}.
```

This is the Laplace transform of a unit atom at zero plus the density

```math
e^{-t/3}\left(\frac3{40}-\frac{49}{75}e^{-t/3}
+\frac{289}{200}e^{-2t/3}\right),\qquad t>0.
```

The quadratic has positive leading coefficient and discriminant
`-599/90000`, so the density is strictly positive. Division by
`R(0) = 169/100` normalizes the measure. Its exponential tilts have Laplace
transforms `R(s+j)/R(j)` for all nonnegative integers `j`.

For completeness, their means are

```math
\frac1{j+1/3}+\frac1{j+2/3}+\frac1{j+1}
-\frac2{j+\beta}-\frac1{j+2}=O((j+1)^{-2}).
```

The means are nonnegative because these are nonnegative laws, and the sum
of the means is finite. Independent variables with these laws therefore
have an almost surely finite sum. The exponential of its negative is
strictly positive and has Mellin transform

```math
\frac{(1/3)_s(2/3)_s(1)_s}{(\beta)_s^2(2)_s},\qquad s\geq0.
```

This follows either from Dufresne's converse or directly from finite
products and the gamma-ratio asymptotic. Multiplication by an independent
gamma variable of shape two and rate one cancels `(2)_s`. The resulting
positive random variable has precisely `G_beta(s)/G_beta(0)`, as required
in the analytic proof. The subsequent triplication and exponential-series
identification are unchanged.

At `w = 1/4`, the proposed scalar inequality fails. The exact integer
certificate is

```math
21^5=4\,084\,101<4\cdot16^5=4\,194\,304.
```

This is equivalent to `21/16 < 2^(2/5)`. The strict discriminant inequality
and this strict scalar violation also persist in a parameter neighborhood;
the rational certificate is not an unsupported numerical experiment.

## Prior-work limit of this review

Dufresne's theorem predates Simon's conjecture and must be credited for
the shorter construction. Its explicit example at the end of Section 6
has three distinct denominator parameters and is not itself the Le Roy
specialization above. Whether the present specialization was already
written elsewhere requires the separate priority audit. This file does
not label the new application as a new theorem of probability.

The inspected primary source proves no necessary partial-sum condition for
an unbalanced gamma ratio merely by applying its balanced case. Dufresne's
Theorem 6.1(c) explicitly assumes equal numbers of numerator and denominator
gamma factors. A broader printed necessary-condition statement in the
introduction of Kadankova–Simon–Wang, arXiv:1908.03428v2, must not be used to
reject this self-contained positive construction without checking that
scope. The current proof does not use that statement.

The independent current searches for the exact Le Roy conjecture and a
Dufresne specialization located no earlier exact disproof. This is bounded
search evidence. The main prior-resolution audit and final classification
remain separate from this mathematical pass.
