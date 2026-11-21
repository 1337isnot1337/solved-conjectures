# Root review of quantitative noise stability

Date: 21 November 2026. Reviewed `NOISE_STABILITY.md` against
`SMALL_CORRELATION.md`, `CORE_COERCIVITY.md`, and the strip construction.
The root worker authored the earlier core lemma, not the new corollary.
This review independently checks the corollary's use of that input and its
additional distance and sharpness arguments.

Verdict: the stated corollary and its constants pass. The conclusion is
dimension independent for each fixed number of cells. It remains confined
to a sufficiently small positive correlation interval, with the same
credited prior first-moment dependency. It does not add a full resolution.

## Localization and constants

The Hermite bound for an arbitrary balanced competitor is

```math
\Delta_\rho\ge\rho\varepsilon-\rho^2(1-1/q).
```

It does not require the competitor to beat the simplex. In the branch
$`\Delta_\rho\lt a_q\rho`$, the draft's choice
$`\widehat\rho_q\le a_q`$ gives

```math
\varepsilon<2a_q
\le\min\{c^2/2,\delta_0^2/(16C_{\mathrm g})\}.
```

Thus the original polar-aligned simplex satisfies the required moment
distance bound $`\delta_0/4`$. This is the same alignment used to remove
the full moment matrix's skew part; no unrelated minimizing simplex is
substituted. The fixed tail radius then gives the core moment and mass
bounds $`\delta_0/2`$ and $`\delta_0/4`$. They fit the local lemma's
separate neighborhood assumptions.

The earlier proof uses the benchmark assumption only to obtain this
localization. Its subsequent absorption argument applies unchanged and
gives

```math
\Delta_\rho\ge\rho(\kappa D_{\mathrm c}/8+bW_{\mathrm t})
\ge\rho\min\{\kappa\ell/8,b\}(W_{\mathrm c}+W_{\mathrm t}).
```

Conditioning is used for moments and transfer costs. The higher-Hermite
quadratic form and the noise value remain in the original dimension.
The corollary preserves this distinction.

## The partition metric

Each disagreement point contributes to exactly one unordered transfer
pair. Hence the sum of the cell symmetric differences is twice the
disagreement probability. For a slab width $`s\le1`$, there are
$`q(q-1)/2`$ possible unit-normal tie hyperplanes, each with Gaussian slab
measure at most $`2\phi(0)s`$. Outside the corresponding slab, a
disagreement has weight at least $`s`$. Therefore

```math
\mu\le q(q-1)\phi(0)s+W/s.
```

The choice $`s=\sqrt{W/A_q}`$ is valid because $`W\le1\lt A_q`$ for
$`q\ge3`$. The zero-cost case follows by a limit. This proves

```math
d_{\mathscr S}^2\le16A_qW.
```

The infimum over rotations and relabelings only decreases the distance
from the particular aligned simplex, so its direction is correct.
In the other branch, the universal distance bound $`d_{\mathscr S}\le2`$
gives coefficient $`a_q/4`$. Taking the minimum of these two coefficients
establishes the draft's global inequality for every balanced partition.
No minimizer-existence assumption is needed.

## Uniform sharpness

For the bounded signed cell indicator, differentiating the Gaussian
kernel gives the stated bound

```math
|\partial_n T_\rho F|
\le\rho\sqrt{2/\pi}/\sqrt{1-\rho^2}.
```

It is uniform in the evaluation point and ambient dimension. Reflection
across the facet makes the convolved difference zero on the facet, so
integrating the derivative produces a bound proportional to normal
distance. The two exchanged strips then have linear loss at most
$`2K_0\rho p_D[\phi(0)-\phi(t)]`$.

The full positive-correlation operator is positive semidefinite, which
gives $`\Delta_\rho\le2L_\rho`$ in the exact noise identity. Together with
$`1-e^{-t^2/2}\le t^2/2`$, this yields the displayed upper bound
$`2K_0p_D\phi(0)\rho t^2`$. The factor two and the Gaussian integration
constant are consistent.

For the lower bound on distance, the modified cell has the pattern
one, zero, one on three successive normal intervals of length $`t`$.
Every convex comparison cell intersects that line in an interval and
must disagree on length at least $`t`$. This applies separately to every
line, even if the comparison simplex rotates into unused coordinates.
The Gaussian density lower bound and Fubini therefore give the stated
positive multiple of $`t`$, uniformly over all comparison simplexes.

Consequently no smaller power than two can replace the squared distance
with a positive fixed coefficient, even at one fixed allowed correlation.
For a fixed sufficiently thin strip, the lower theorem and upper estimate
also show that the factor $`\rho`$ has the correct order as correlation
tends to zero. The constants need not be optimal for either conclusion.

## Scope

This is a deduction from the already reviewed low-correlation proof,
with two additional elementary estimates. The source audit's bounded
conclusion is unchanged; this review supplies no claim of global priority
or external acceptance. No numerical sampling or Lean work was used.
