# Four-cover templates without singleton memberships

Among four labels, two membership sets of size at least two
are disjoint exactly when they are complementary pairs.
All size-three and size-four memberships are universal in
this induced template. Their classes merge into a single
universal clique. Consequently the full no-singleton
template reduces to seven types: three missing pairs among
six cliques, together with one universal clique. Two missing
pairs alone support the square example of ratio 1/56.

[bernstein_matching.py](bernstein_matching.py) tests the
entire seven-type simplex using the existing exact matrix
certificate. It also admits a new primal patch at a square
witness, where the upper bound has no gap and subdivision
alone is not useful. The following verifies the patch.

## Cost-free addition of outside types

Let A and B be any two of the missing pairs, so that their
four types form a square. Let t be the total outside mass
and let a and b be the unnormalized masses at the ends of
one of the four square edges. Every outside type is
adjacent to all four square vertices. Allocate each
square type's diagonal capacity evenly over its two
incident edges. On an edge use local capacities
$`C=a^2/4`$, $`D=b^2/4`$, $`P=ab`$ for its two diagonal shares
and crossing mass. Use the four canonically tight profiles
from [LOCAL-MAXIMA.md](LOCAL-MAXIMA.md) with weights

```math
z_{32}=2(1-t)^2/784,\quad z_{22}=D-z_{32},\quad
z_{21}=C-D-2z_{32},\quad z_{11}=P-2C-2D+2z_{32}.
```

They spend exactly the required capacities on the square.
Replace an amount $`r_{21}=(a-b)t/2`$ of the (2,1) profile,
and an amount $`r_{11}=(2b-a)t/2`$ of the (1,1) profile,
by the respective profiles with one outside vertex appended.
Distribute these replacement masses among outside types
proportionally to those types' masses (nothing to append
when t is zero). This adds no cliques to the count. It spends
$`2r_{21}+r_{11}=at/2`$ on crossing edges from the first
endpoint and $`r_{21}+r_{11}=bt/2`$ from the second endpoint,
exactly half the required totals at those endpoints because
they each participate in two square edges.

The patch applies provided $`0\le r_{21}\le z_{21}`$,
$`0\le r_{11}\le z_{11}`$ and $`z_{22}\ge0`$ on every edge.
The weight $`z_{32}`$ is automatically nonnegative.
The remaining outside edges cost at most $`t^2/2`$ if all are
taken individually. The square profiles are tight for the
canonical dual, so their number is at most $`(1-t)^2/14`$
by its square-face maximum. Thus the patch proves cost at
most 1/14 if $`t\le1/4`$, since

```math
(1-t)^2/14+t^2/2-1/14=t(4t-1)/7\le0.
```

The inequalities hold in a relative neighborhood of each
square witness: at the exact witness, all original profile
weights are positive, the ratios of the endpoint masses
lie strictly between one and two, and the required
replacement amounts vanish as t goes to zero.

## Exact verification on a simplex cell

All patch conditions other than $`t\le1/4`$ are homogeneous
quadratic inequalities in the type masses after writing
$`1-t`$ as the sum of the four square masses. For a cell of
the proportion simplex, the checker applies the symmetric
bilinear form of each inequality to every pair of its
vertices, including repetitions. If these coefficients
are nonnegative, the same holds on the entire cell since
each constraint expands with the nonnegative products of
the underlying barycentric coordinates. The linear mass
bound is checked at the vertices.

The three flips within the missing pairs are symmetries.
Requiring the first mass in each pair to be at least the
second restricts to one sector without loss. This sector
is itself a simplex: keep the first coordinate vector and
replace the second by the pair's midpoint, independently
for each pair. The checker starts from this exact sector.
The full check passed. The single-sector verifier split 43,555
times and certified all 43,556 leaves, including 229 primal
patches, at depth at most 43. The faster
[ordered-sector verifier](bernstein_matching_order.py)
simultaneously orders the first masses of the three pairs,
then triangulates that sector by its 15 compatible total
orders on the six coordinates. For each total order, the
simplex vertices are the normalized prefix sums of its
coordinate vectors and the universal type's unit vector.
This is the usual successive-difference expansion of an
ordered nonnegative vector. The second run split 5,710 times
and passed all 5,725 leaves, including 15 primal patches,
at depth at most 35. It checked 4,132 distinct pair capacities.

The sharp asymptotic ratio over four-cover representations
without singleton memberships is therefore 1/56. If such a
representation has fewer than four cliques in a minimum
cover, use the separate bounds at cover numbers one through
three. For the lower bound the square uses four covering
indices, each type belongs to two, and the square requires
all four covers. The general four-cover problem still allows
singleton memberships; this proof does not drop that case.

To reproduce the exact fast run:

```sh
python3 bernstein_matching_order.py --L 5 --limit 1000000
```
