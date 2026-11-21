# Independent review of the Erdős 517 logarithmic-derivative attempt

21 November 2026. Reviewed source:
[logarithmic-derivative obligation](logarithmic-derivative-obligation.md),
SHA-256 `d49769b51fbf88acddbc4d998e075b3ca86d0026ace97c74dd5c62fa69db7707`.
This review checks the mathematical deductions independently of the
author. The full conjecture remains unresolved.

## The finite-pole equivalence

Multiplying the local power series for $`zF'/F`$ by the series for $`F`$
gives exactly the recurrence in the note. For a prescribed finite zero
divisor, the polynomial factor contributes the negative power sum with
the displayed sign. The remaining coefficients are those of $`zg'`$
for an entire logarithm $`g`$, and therefore have root limsup zero.

Conversely, root limsup zero makes the proposed series for $`g`$ entire.
The two normalized functions have equal logarithmic derivatives near
zero and agree at zero, hence coincide locally and then globally. This
proves both directions with the specified multiplicities. The empty
divisor and an initial power of $`z`$ are handled correctly.

The quantified obligation is therefore exact. Its finite pole data must
be independent of the coefficient index. The equivalence itself does
not establish that sparse support excludes those data.

## The fixed-node block estimate

For a fixed nonempty finite power sum, the vector of any consecutive
block of length $`d`$ is the fixed Vandermonde matrix multiplied by
$`(u_j\lambda_j^N)_j`$. Invertibility gives the stated lower bound in
the maximum norm. If $`\limsup |e_n|^{1/n}=0`$, choose a positive number
strictly smaller than $`\rho`$ to bound $`|e_n|^{1/n}`$ eventually.
Its maximum on each fixed-length block is then $`o(\rho^N)`$.
This proves the perturbed block assertion without a uniform-in-nodes
estimate. It says nothing about the empty-pole case.

## The explicit product

I checked the all-index calculations for

```math
m_0=1,\qquad m_j=(j+1)2^j-1\quad(j\ge1),\qquad
F(z)=\prod_{j\ge0}\left(1+(z/(j+1))^{m_j}\right).
```

On every compact disk, the late product perturbations are bounded by
the summable sequence $`2^{-m_j}`$. The product is entire and equals
one at zero. The exact summation formula for $`\sum_{j\le J}m_j`$
gives strict superincreasing exponents, so all finite subset sums are
distinct. Positive coefficients prevent cancellation. Each coefficient
stabilizes after finitely many factors, which proves the asserted exact
Taylor support.

There are at most $`2^{J+1}`$ support elements below the next exponent,
and $`m_J\asymp J2^J`$. The support has density zero. Conversely the
block with largest selected index $`J`$ contains $`2^J`$ positive
integers, each at most $`J2^{J+1}`$. These disjoint blocks force a
divergent reciprocal sum. Both statements apply to the actual support.

Taking $`J=\lfloor R/2\rfloor-1`$ in the positive real product gives
$`\log M(R,F)\ge m_J\log2`$ for every sufficiently large $`R`$.
The resulting quotient $`\log\log M(R,F)/\log R`$ tends to infinity.
Thus the example genuinely has infinite lower order, and does not
return to the already known finite-order regime.

Logarithmic differentiation is valid locally on $`|z|<1`$. Each
coefficient has only finitely many contributing factors. Every
$`m_j`$ is odd, so all contributions to a given coefficient have the
same sign. The first factor supplies a unit contribution at every
positive index. The displayed formula for $`b_n`$ and
$`|b_n|\ge1`$ follow.

For the finite product through index $`J`$, the first remaining factor
has its simple zeros on the circle of radius $`J+2`$. Other remaining
factors have zeros on strictly larger circles. Thus the remaining
logarithmic derivative has actual poles at that first circle and has
exact Taylor radius $`J+2`$, despite all its coefficients below
$`m_{J+1}`$ vanishing. This verifies the warning about exchanging the
finite-set and all-index quantifiers.

## Outcome

The finite-pole criterion, fixed-node estimate and product construction
pass review. The product has infinitely many zeros on distinct circles;
it does not refute Erdős 517. It refutes the proposed transfer from gaps
in the original Taylor series to gaps in its logarithmic derivative,
and demonstrates why growing finite approximations do not settle the
fixed-pole question.

No missing universal estimate is supplied. This is a stopped research
route and adds zero completed problems. No Lean verification or
external acceptance is asserted.
