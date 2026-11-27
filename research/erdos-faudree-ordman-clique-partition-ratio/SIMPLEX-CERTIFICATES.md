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

## A stronger matrix certificate

A region can pass even when a few mixed coefficients exceed T.
Use a rigorously verified upper cost $`U_{ij}`$ for every coefficient.
The convex-combination argument gives cost at most
$`\lambda^TU\lambda`$ throughout the simplex. Define a symmetric
matrix H with diagonal $`H_{ii}=T-U_{ii}`$ and, for $`i\ne j`$,
$`H_{ij}=\min(0,T-U_{ij})`$. Its quadratic form on nonnegative
vectors is at most that of $`T\mathbf1\mathbf1^T-U`$.
Thus H positive semidefinite suffices for the desired bound.
The implementation [bernstein_psd.py](bernstein_psd.py)
checks this with exact rational elimination on a symmetric
matrix. A negative pivot fails; a zero pivot is accepted only
when its remaining row vanishes. Nonnegative diagonal dominance
gives a quicker sufficient check when it applies.

For three covering cliques, simultaneously permute the cover labels
so their singleton masses satisfy $`x_1\le x_2\le x_3`$. After
ordering, that sector is itself a simplex: replace the first two
singleton unit vectors by $`(e_1+e_2+e_3)/3`$ and $`(e_2+e_3)/2`$,
retaining the third unit vector and the unit vectors of all other
types. This follows by writing the nonnegative-coordinate differences
$`x_1`$, $`x_2-x_1`$, and $`x_3-x_2`$ on those three rays. The objective
is invariant under these simultaneous permutations.

## Verified three-cover bound

With profiles of at most five vertices, the strengthened certificate
establishes cost at most 3/56 for **every** point of the full seven-type
three-cover template. Hence a graph family whose minimum edge clique
cover number is three has ratio at most 1/56. This does not require
that its type adjacency graph be triangle-free. The best known
three-cover lower bound remains 1/63 in the ratio, so the present
certificate does not determine the sharp constant within the
three-cover class.

Run the following command with NumPy and SciPy installed:

```sh
python3 bernstein_psd.py --q 3 --L 5 --target 3/56
```

The verified run processed 96,634 bisections and certified 96,635
leaves, with maximum depth 22 and 48,857 distinct pair capacities
evaluated. All accepted coefficient costs and matrix checks used
rational arithmetic.

A stricter run with `--target 53/1000` also passed. It processed
104,900 bisections and 104,901 leaves, reaching depth 23 with
52,528 distinct coefficient capacities. Thus the ratio for
cover number three is at most 53/3000, strictly less than 1/56.
