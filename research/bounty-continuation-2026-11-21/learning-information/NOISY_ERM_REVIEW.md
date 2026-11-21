# Independent review: noisy-label threshold ERM information obstruction

Reviewed 21 November 2026. Source:
[noisy-threshold-erm-information-obstruction.md](noisy-threshold-erm-information-obstruction.md).

**Verdict:** the lower bound is valid for the stated earliest-minimum
learner, fixed $`0<p<1/2`$, and the single iid distribution with independent
uniform features and fair labels. This refutes the candidate's constant
original-CMI bound. It does not refute the existence statement in the
threshold bounty, and no priority claim is certified by this review.

## Reference law and information inequality

The reference law preserves the actual $`(W,T)`$ marginal and replaces
the selector by independent uniform bits. Its relative entropy from the
actual joint law is exactly $`I(W;S\mid T)`$, since the actual selector
is uniform conditional on $`T`$. Conditional on $`(W,T)`$, the score is
a sum of independent signed differences $`D_i`$. The inequalities
$`\cosh u\le e^{u^2/2}`$ and $`\sum_iD_i^2\le2V`$ give the stated
exponential-moment bound. Applying the relative-entropy variational
inequality to $`\alpha F-\alpha^2V`$, then optimizing a deterministic
scalar $`\alpha`$, gives $`(\mathbb EF)^2/(4\mathbb EV)`$.
All terms are bounded at each fixed $`n`$; the possible value
$`W=\infty`$ is correctly assigned zero weight.

## Earliest-minimum conditioning and mean height

After feature sorting, the perturbed labels are independent fair signs
and independent of the feature order statistics. Conditioning on those
signs makes each original sign have mean $`(1-2p)B_i`$. The ghost
observations remain independent of the learner and have mean-zero labels.

For $`J=j`$, the past condition is that every earlier partial sum is
strictly above $`S_j`$. It depends only on the first $`j`$ increments.
The future condition is that the next $`n-j`$ partial sums relative to
$`S_j`$ stay nonnegative. It depends only on the later increments.
The two conditions are independent, so the asserted future meander law
is exact, including possible later returns to the minimum.

The stopped walk at its first hit of $`-1`$, plus one, has expectation
one at a bounded stopping time. This yields the exact conditional mean
$`Q_r^{-1}-1`$. The central-binomial bound and
$`\sqrt{r+1}-1\ge\sqrt r/2`$ for $`r\ge2`$ check. Survival to a
later time reweights the time-$`r`$ height by a nondecreasing function,
so the covariance argument raises, rather than lowers, the mean.

## Spacings and geometric blocks

The relevant spacing is beta with parameters $`r-1,n+2-r`$, including
after conditioning on $`J`$. Its mean and reciprocal mean give the two
stated weight bounds. The lower bound uses
$`(r-1)/(n+1)+1/n\le r/n`$; the upper bound is needed only for
$`r\ge3`$, where the reciprocal mean is finite.

Summation by parts has the stated signs. The disjoint ranges
$`[R,4R)`$, with $`R=4,4^2,\ldots`$, each contribute at least
$`\sqrt n/6`$. Every omitted term has nonnegative expectation.
Reversal and negation send the earliest minimum to
$`n-J_{\mathrm{last}}`$. The two half-interval events have equal
probability and cover every path, giving probability at least one half
without an asymptotic arcsine formula. The floor and ceiling in $`K_n`$
therefore have the required directions.

## Quadratic penalty and constants

Conditional on $`J=j<n`$, the boundary weight squared is $`n`$.
When $`m=n-j\ge2`$, the remaining feature integral and the beta law of
$`W`$ give $`\mathbb E(1-W)^{-1}=n/(m-1)`$. The case $`m=1`$
is treated separately, avoiding the divergent reciprocal moment. Each
ghost contributes at most $`\log(n+1)`$. Hence
$`\mathbb EV\le n[1+2\log(n+1)]`$.

Combining this with $`\mathbb EF\ge(1-2p)\sqrt n K_n/12`$ reproduces
the denominator $`576`$ exactly. Since $`p`$ is fixed below one half
and $`K_n`$ grows as $`\log_4n`$, the resulting bound is
$`\Omega_p(\log n)`$.

No correction was required. The proof does not address other tie rules,
randomized near-minimum bands, or arbitrary learners. No numerical test
was used in this review.
