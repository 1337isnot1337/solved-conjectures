# Dual geometry at an extremal intersection template

The exact finite reduction in [FINITE-CUTOFF.md](FINITE-CUTOFF.md)
shows that the sharp clique-partition ratio is rational. This note
gives more structure for the unresolved global upper certificate.
It does not assume that the four-leaf construction is extremal.

## A positive-semidefinite matrix from simplex stationarity

Choose a globally maximizing template, proportions and
untruncated dual as in the finite reduction. Restrict to
positive proportions, fill the missing edge entries of the
symmetric matrix $`Y`$ with zero, and put

```math
f=\tfrac12 x^TYx,qquad K=f\mathbf1\mathbf1^T-Y/2.
```

Because the same quadratic is globally maximal at $`x`$ on the
simplex, $`Yx=2f\mathbf1`$. In addition, the second derivative
is nonpositive in every tangent direction: if
$`\mathbf1^Th=0`$, then $`h^TYh\le0`$. Indeed small variations
$`x\pm\varepsilon h`$ remain in the positive face and the
linear term vanishes by stationarity.

It follows that $`K`$ is positive semidefinite and $`Kx=0`$.
To see this, for any vector $`z`$ let
$`h=z-(\mathbf1^Tz)x`$. The cross terms in $`z^TKz`$ vanish
because $`Kx=0`$, and $`h^TKh=-h^TYh/2\ge0`$.

Thus there are vectors $`v_i`$ in a real space of dimension at
most the number of active types minus one with the properties

```math
\sum_i x_i v_i=0,qquad \langle v_i,v_j\rangle=f-y_{ij}/2.
```

For example take vectors from a Gram factorization of $`K`$;
their weighted sum has squared norm $`x^TKx=0`$. In particular,
types which do not share a covering clique have inner product
exactly $`f`$. The negative diagonal bound in the finite
reduction gives $`\lVert v_i\rVert^2>f+1/3200`$ for every
active type.

## Clique profiles control the convex hull of each cover set

For each integral occupancy $`u`$ on mutually intersecting
types, let $`m=\sum_i u_i`$. The dual constraint is exactly

```math
f m(m-1) + \sum_i u_i\lVert v_i\rVert^2
       -\left\lVert\sum_i u_i v_i\right\rVert^2\le1.
```

This identity follows by expanding the squared norm and using
the diagonal edge count $`\binom{u_i}{2}`$ instead of
$`u_i^2/2`$. Approximating any proportions $`p`$ on a clique of
types by integral profiles of size tending to infinity and
dividing the inequality by $`m^2`$ yields

```math
\left\lVert \sum_i p_i v_i\right\rVert^2\ge f.
```

Thus any clique of types, in particular each of the original
cover sets, has convex hull disjoint from the open ball of
radius $`\sqrt f`$ around the origin, despite the full set of
type vectors having a positive barycentric representation of
the origin. If $`w`$ is the nearest point of one of those convex
hulls to the origin, every vector $`v`$ in that hull satisfies
$`\langle w,v\rangle\ge\lVert w\rVert^2\ge f`$: minimize
the squared norm along the segment from $`w`$ to $`v`$.

The missing part is a bound on $`f/q`$ from the arrangement of
these cover hulls together with the discrete profile inequalities.
The simpler distance conditions alone forget small-profile
constraints and are not offered as a sharp certificate.
