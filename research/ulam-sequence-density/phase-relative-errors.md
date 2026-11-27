# Relative error in the phase-truncated recurrence

Assume [Gibbs's approximate confinement](phase-gap-limits.md) at an
irrational frequency $\theta$. Write $`\phi(n)=n\theta\bmod1`$,
$`B=(1/3,2/3)`$, and let $O$ be the genuine Ulam terms outside $B$
in phase. Define the defect of an outlier $s$ by
$`d_s=\mathop{\mathrm{dist}}(\phi(s),\overline B)`$ and put
$`E(K)=\sup_{s\in O,\,s>K}d_s`$, with an empty supremum interpreted
as zero.

Use the [uniform angular estimate](phase-gap-limits.md) with constants
$C,b>0$ and $D\ge0$. Thus the number of selected terms through $N$
within distance $\eta$ of either endpoint is at most
$`C\eta^b A(N)+D`$. Assume the defects have finite $b$-moment over
the outliers,

```math
\sum_{s\in O}d_s^b<\infty .
```

Let $`r_K(n)`$ count genuine distinct-summand pairs for $n$ with
smaller summand at most $K$. Compare the indicator of $U$ with
the decision that accepts at a phase in $B$ if $`r_K(n)=1`$.
The comparison uses genuine predecessor membership at every step.
Write $`D_K(N)`$ for the number of disagreements through $N$.
Then

```math
\lim_{K\to\infty}\limsup_{N\to\infty}\frac{D_K(N)}{A(N)}=0.
```

## Counting the disagreements

For fixed $K$ we may charge the first $2K$ positions separately.
Disagreements outside $B$ are genuine outliers. By [relative rarity
of outliers](phase-gap-limits.md), their count through $N$ is
$`o(A(N))`$.

For an interior target, a disagreement requires a pair with both
summands above $K$. Two interior phases cannot sum to an interior
phase, so the pair has an outlier. If one summand is an outlier $s$
and the other has interior phase, the latter is within distance
$d_s$ of an endpoint. In fact a shift below $1/3$ can act only on
interior phases near $1/3$, and a shift above $2/3$ only on those
near $2/3$. Summing over such $s>K$ bounds the number of these
targets by

```math
C A(N)\sum_{s\in O,\,s>K}d_s^b+D|O\cap[1,N]|.
```

If both summands are outliers, the target is within $`2E(K)`$ of
an endpoint for all sufficiently large $K$. Genuine selected targets
in this case number at most $`C(2E(K))^b A(N)+D`$.

The remaining disagreements are omitted interior targets with one
short pair and with two outliers forming a long pair. The larger
summand of the short pair, if itself an outlier, accounts for at
most $`K|O\cap[1,N]|`$ such targets. Otherwise the smaller summand
of the short pair is an outlier $s\le K$. Fix a second cutoff $J$.
The smaller summands above $J$ contribute at most
$`C A(N)\sum_{s\in O,\,s>J}d_s^b+D|O\cap[1,N]|`$, by the same
interior-partner restriction as above.

For each remaining $s\le J$, the larger summand is within
$`2E(K)`$ of one of the two phases $`\beta-s\theta`$. Neither phase
can be an atom of a limiting phase distribution normalized by
selected terms. On the orbit of $\beta$, such an atom can only
occur at a nonnegative offset of the finite restart word rooted
at $\beta$, by the [atom classification](phase-gap-limits.md).
Irrationality makes the two endpoint orbits disjoint and makes a
negative offset different from every nonnegative one. Compactness
therefore bounds the relative mass of each shrinking neighborhood
by a quantity tending to zero as $K$ grows. There are finitely many
such neighborhoods for fixed $J$.

Take the upper limit in $N$, then let $K$ increase with $J$ fixed.
The only remaining upper bound is a constant times the tail of the
defect moment beyond $J$. Letting $J$ increase proves the result.
The estimate concerns individual predictions on genuine histories.
Transferring it to a trajectory that iterates the truncated rule
requires control of the effects of those disagreements.
