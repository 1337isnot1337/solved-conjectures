# Exact simplex certificates for cover-type templates

For any fixed number of covering cliques the asymptotic
profile programme in [REDUCTION.md](REDUCTION.md) has a
quadratic right-hand side in the type proportions. This
gives an exact outer certificate for an entire region of
proportions, not a sampling test.

Take a simplex in the proportion space with vertices
$`v_0,\ldots,v_t`$. If $`x=\sum_i\lambda_i v_i`$, with coefficients nonnegative
and summing to one, expand the capacity vector as

```math
e(x)=\sum_{i,j}\lambda_i\lambda_j E(v_i,v_j).
```

For distinct types a and b sharing a cover index,
the a,b coordinate of E(u,v) is
$`(u_a v_b+v_a u_b)/2`$. The a,a coordinate is
$`u_a v_a/2`$. These are all nonnegative. The stated
expansion follows by expanding each product of two
coordinate sums.

For every pair of simplex vertices, including equal
ones, produce a feasible fractional partition of that
mixed capacity vector with cost at most T. The
coefficients in the expansion are nonnegative and sum
to one, so their convex combination is an exact
partition of e(x) with cost at most T. In particular
the same bound holds on the whole simplex. Bisection
adds the midpoint of an edge and partitions the
simplex into two simplices; there are no uncovered
faces.

## Rational soundness of the verifier

[bernstein_exact.py](bernstein_exact.py) builds the
finite profile matrix from the cover-type intersections.
It includes zero-cost pure edge mass on every diagonal,
justified by the arbitrarily large same-type profiles in
[CLIQUE-STARS.md](CLIQUE-STARS.md). Every paid column is
an allowed clique occupancy on two or more types.

A floating-point LP proposes nonnegative profile uses.
The script rounds these down to rational weights with
a fixed denominator, computes their loads with Python
integers, and scales them down by the minimum capacity
ratio if necessary. It checks that every residual edge
capacity is nonnegative. It then charges one per unit
of off-diagonal residual, using edge columns, and zero
on diagonal residual, using the pure columns. Only
when this resulting exact rational cost is at most T
can the proposal certify part of the simplex. The
solver's reported optimum is never itself used to
certify an inequality. A solver error can cause more
splits or failure, but cannot cause an incorrect
accepted inequality.

The verifier starts with the full simplex. If a check
does not pass, it splits a longest edge, using exact
rational midpoints and squared distances. It accepts
only once no subregions remain. This framework can
also be used for a positive-gap bounded subregion in
larger intersection templates.
