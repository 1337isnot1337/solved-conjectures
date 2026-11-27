# A finite, exact reduction for the clique-partition ratio

The [first note](REDUCTION.md) used clique profiles of size at most
$`L`$ to define a finite-program bound $`B_L`$. Its rational values
converge to the sharp answer $`R`$. In fact **the sequence stabilizes**:

```math
R=B_{25600}.
```

The rational maximization in that equality is finite and has
no approximation parameter. Its explicit value is still unevaluated.
The proof uses two observations at a global maximum: every active
diagonal of a dual optimizer is uniformly negative, and an
occupancy profile beyond the cutoff can then be rounded down
in such a way that any violation would already appear below it.

## Negative diagonals at a maximum

Set $`k=12800`$, $`L=2k`$ and $`\delta=1/1600`$.
Choose a maximizer of $`B_L`$, with cover parameter $`q\le13`$,
proportions $`x`$, and dual coefficients $`y`$ at those proportions.
These maximizers exist: a finite dual optimum can be taken among
finitely many vertices, so the value is a maximum of finitely
many continuous quadratic functions on the simplex.
Let $`S`$ be the set of positive proportions. Put $`y_{ij}=0`$ on
nonedge categories. For the fixed optimal dual, write

```math
f(x)=\frac12\sum_{i,j}y_{ij}x_i x_j=F_{q,L}(x)=q B_L.
```

At its maximizing $`x`$, the same fixed quadratic is maximal on
the simplex because its value at any other point is bounded
above by $`F_{q,L}`$ there. Its partial derivatives are thus equal
on $`S`$; their weighted sum is $`2f(x)`$. In particular, for all
$`i\in S`$,

```math
\sum_j y_{ij}x_j=2f(x)\ge\frac1{28},
```

using the explicit one-fifty-sixth lower bound of the first note
and $`q\ge1`$.

Suppose $`y_{ii}\ge-\delta`$ for some $`i\in S`$. For any
different adjacent type $`j`$, the allowed profile with 56
vertices of type $`i`$ and one of type $`j`$ gives

```math
56y_{ij}+\binom{56}{2}y_{ii}\le1,
\qquad
y_{ij}\le\frac1{56}+\frac{55}{3200}<\frac1{28}.
```

For a nonadjacent type $`j`$ the entry is zero, and the one-type
profile of size 57 also gives $`y_{ii}\le1/\binom{57}{2}<1/28`$.
Every contribution to the weighted row average is thus strictly
below $`1/28`$, a contradiction. All active diagonals satisfy
$`y_{ii}<-\delta`$.

## Round down a larger occupancy

Restrict to active types. There are at most $`d=2^{13}-1<k`$ of
them. Let $`u`$ be an arbitrary occupancy vector of size
$`m>2k`$, supported on a clique of active types. Let $`\theta=k/m`$,
and independently round each $`\theta u_i`$ to its floor or ceiling,
with mean $`\theta u_i`$. Write $`V_i`$ for the rounded integer and
$`\sigma_i^2`$ for its variance. Then $`\sigma_i^2\le1/4`$, and
$`\sigma_i^2\le\theta(1-\theta)u_i`$: floor–ceiling rounding is the
minimum-variance integer-valued law with the prescribed mean,
and the binomial law with parameters $`u_i,\theta`$ has that mean.
For completeness, if $`a`$ is the floor of the prescribed mean,
the inequality $`(Z-a)(Z-a-1)\ge0`$ for integer $`Z`$ shows that
mass on $`a,a+1`$ minimizes the second moment.

The rounded vector has size at most $`k+d\le L`$ and is still
supported on the same clique. It therefore satisfies the
truncated dual constraints, including the trivial sizes zero
and one, which have no edges. On off-diagonal edge counts,
independence gives the factor $`\theta^2`$. On each diagonal,
the exact difference is

```math
\theta^2\binom{u_i}{2}-\mathbb E\binom{V_i}{2}
=\frac12\bigl(\theta(1-\theta)u_i-\sigma_i^2\bigr)\ge0.
```

By the uniform negative diagonal bound, combine these equations
to get

```math
1\ge\mathbb E[y\cdot a(V)] \ge \theta^2 y\cdot a(u) +\frac{\delta}{2}\left(\theta(1-\theta)m-\sum_i\sigma_i^2\right) > \theta^2 y\cdot a(u)+\frac{\delta k}{8} = \theta^2 y\cdot a(u)+1.
```

The strict inequality uses $`\theta<1/2`$ and $`d\le k`$.
So any profile larger than the cutoff has negative dual value,
and cannot violate the desired inequality. Extend this dual by
zero on every category involving inactive types. It is now valid on
all profiles, since it sees just the restriction of any profile to
active types.

## Recover the extremal coefficient

Apply the untruncated dual certificate to every actual clique
partition of blow-ups of the maximizing proportions. Its limiting
dual objective is still $`q B_L`$. The graphs have edge clique
cover number at most $`q`$, so the limiting maximal ratio is at
least $`B_L`$. The first note established the reverse bound
$`R\le B_L`$ for every $`L`$, which proves equality.

In particular, the sharp coefficient is **rational** and is
attained as a limit by a rational blow-up of a single intersection
template with at most 13 cover cliques. Rationality follows from
the primal/dual vertex and simplex-stationarity algorithm in the
first note: one can choose rational maximizing proportions and
the same argument makes its maximizing dual certificate valid
for every profile. This reduces the problem to exact arithmetic
with no reliance on a finite-order graph census, but does not
provide the simplified rational value.
