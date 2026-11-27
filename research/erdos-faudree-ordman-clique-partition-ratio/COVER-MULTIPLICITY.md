# A universal cover-multiplicity bound

For every graph sequence with edge clique cover number at most a fixed q,
the normalized clique partition number has upper limit at most
$`\tfrac14(1-1/q)`$. In particular, a cover by thirteen cliques cannot
beat the known 1/56 examples when thirteen is the minimum cover
number. This reduces the list of possible nontrivial extremal
cover numbers from 1–13 to 1–12 without any enumeration.

## Positive edge scores

Fix proportions x and a feasible dual Y for the unbounded profile
problem in [REDUCTION.md](REDUCTION.md). A pure one-type profile
of arbitrarily large size forces its diagonal dual coefficient
to be nonpositive. Fill absent off-diagonal entries with zero.
Define

```math
P=\sum_{i\lt j}\max(y_{ij},0)x_ix_j,qquad
N=\sum_{i\lt j}\max(-y_{ij},0)x_ix_j
     +\sum_i(-y_{ii})x_i^2/2.
```

The objective is P minus N. We first have $`P\le1/4`$, independent
of q. For the fixed positive edge matrix, maximize P over the
proportion simplex, taking a maximizer whose support has minimum
size. If two positive-mass types have edge score zero in the
positive edge matrix, keeping their sum fixed makes the objective
affine in their individual masses. Moving to an endpoint then
preserves maximality and shrinks the support. Thus all distinct
types in that support have positive original scores and are
mutually adjacent. Taking one vertex of each type gives an allowed
clique profile, so the sum of their scores is at most one. For
any two distinct types their product of proportions is at most
one quarter. Summing proves the asserted bound, including the
trivial single-type case. This is the minimum-support argument
from Motzkin–Straus with a profile score bound on its final clique.

## Paying for positives within the covering cliques

For each of the q covering indices, let S be the set of types
containing that index. Write $`P_S,N_S`$ for the same weighted
sums restricted to S, without renormalizing the proportions.
Then $`P_S\le N_S`$. Indeed, take a sequence of integral profiles
supported on S with occupancy vector, divided by its scale,
tending to the unnormalized vector of proportions restricted
to S. The profile score is at most one. Dividing by the scale
squared and taking the limit gives $`P_S-N_S\le0`$.

Every positive edge score occurs in at least one S. Every
negative off-diagonal score and every diagonal penalty occurs
in at most q of them. Hence

```math
P\le\sum_S P_S\le\sum_S N_S\le qN.
```

Combining the two inequalities bounds every dual objective by
$`P-N\le(1-1/q)P\le(1-1/q)/4`$. For clarity, unbounded duality can
be justified by taking optimal duals for increasingly large
finite profile cutoffs, restricting to positive types. The
off-diagonal and diagonal coefficients are at most one, and
the objective is nonnegative; since every row has strictly
positive capacity, these facts give a uniform lower bound
on each coefficient. A convergent subsequence is feasible
for all profiles and attains the limit of the finite optima.
The profile-to-integral rounding then gives the claimed upper
limit for graphs.

At q = 13 the normalized ratio is at most 3/169, strictly
less than 1/56 since 3 times 56 is 168. Larger cover numbers
were already covered by Erdős–Goodman–Pósa. This does not
give the sharp value of the full ratio problem.
