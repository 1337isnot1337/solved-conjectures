# Independent review of the susceptibility checkpoint

Date: 20 November 2026 (America/Chicago).

Reviewed file:
[Matching susceptibility and the Hwang padding limit](../inequalities/susceptibility_bridge.md).

The conditional curvature implication and the infinite-family failure of
the unrestricted-activity auxiliary bound are correct as written. This is
an internal mathematical review, not external confirmation or a priority
assessment. Neither statement resolves a numbered Minc problem.

## Conditional implication

Multiplying the proposed scalar identity by $`1+q`$ gives
$`-2t^2+4tq-2q^2=-2(q-t)^2`$. Adding the square of the first logarithmic
derivative therefore gives the stated lower bound for $`F_A''/F_A`$.
The bracket is strictly positive for $`m\ge2`$, $`q>0`$, $`t>0`$.
The direct order-one derivative is also correct. The argument does not
require differentiating an inequality for the matching mean.

## Uniform analytic estimate

The reciprocal transfer has simple eigenvalues $`4/9`$ and $`1/9`$ at
zero. On one fixed sufficiently small complex disc, both eigenvalues and
their spectral projectors are analytic and the projectors are bounded.
With $`a=4/9`$, the dominant eigenvalue satisfies
$`|\lambda_+(w)/a|\le1+C|w|`$, while the other satisfies
$`|\lambda_-(w)/a|\le1/2`$.

For $`|w|\le c/f`$, the dominant power is bounded by $`e^{Cc}`$,
and the other by $`2^{-f}`$. Thus $`a^{-f}M(w)^f`$ is bounded uniformly
in $`f`$. The displayed polynomial formula for $`Q_f`$ makes
$`a^{-3f}Q_f(w)`$ uniformly bounded on that same disc. Every point of
$`|w|\le c/(2f)`$ has a surrounding disc of radius $`c/(2f)`$ inside
the larger disc. Cauchy's estimate gives
$`|Q_f''(w)|\le C' f^2 a^{3f}`$, exactly as required.

The argument needs only sufficiently large $`f`$ when evaluated at
$`w_f=2^{-f}`$. This value eventually belongs to the smaller disc.
The constant and linear terms, together with the second-derivative
bound, give the two Taylor estimates in the proof. In particular the
denominator is asymptotic to $`16a^{3f}w_f`$ and is positive. The stated
mean and variance expansions follow, including
$`\mathop{\mathrm{Var}}L=O(f^2 2^{-f})`$.

Finally, $`n=6f+1`$ and $`\mathbb E L\to1`$ give
$`\mu(n-\mu)/(n+\mu)\to1/2`$. Its positive limit and the vanishing
variance establish strict failure for all sufficiently large $`f`$.

## Scope and input checks

The asymptotic review uses the exact transfer formula (3), the reciprocal
formula (4), and the stated constant and first derivative (5). Their
algebra is also covered by the author's exact checker, which compares
the transfer with independent rook enumeration for two matrices. No
second independent graph enumeration was needed for this review's
specific analytic issue.

The violating activities grow as $`2^f`$. The note correctly leaves the
bounded-activity inequality on $`0<z\le2`$ open and does not infer a
counterexample to Hwang or Lih--Wang from this auxiliary failure.
