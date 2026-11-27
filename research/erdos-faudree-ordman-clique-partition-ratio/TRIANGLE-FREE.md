# The ratio for clique blow-ups of triangle-free graphs

The sharp limiting Erdős–Faudree–Ordman ratio for **all clique
blow-ups of triangle-free graphs** is 1/56. A clique blow-up of
a simple graph H replaces each vertex by a clique and each
edge by all edges between the corresponding cliques.

The existing clique-star construction attains this ratio.
There is also a different extremal pattern: a four-cycle of
cliques of sizes 4t, 3t, 4t, 3t. This pattern has no universal
vertex and is not a clique-star. The upper bound below handles
every triangle-free quotient; it leaves open quotients with a
triangle.

## Profile constraints and a spectral bound

Every clique meets at most two types. The edge clique cover
number is the number q of edges of H after deleting isolated
types, plus one for each isolated type of size at least two.
Isolated types can be partitioned by one clique each and do not
affect the limiting upper bound. The normalized count for a
disconnected quotient follows by summing the bounds on its
components: if component j has proportion x_j of the vertices
and q_j quotient edges, its contribution is at most
q_j x_j²/56, and their sum is at most q/56. Thus it suffices
to consider connected H.

Use the profile LP and its integral transfer from
[REDUCTION.md](REDUCTION.md). As in [CLIQUE-STARS.md](CLIQUE-STARS.md),
allow pure-type edge mass at zero limiting cost; it can be
replaced with arbitrarily large same-type profiles. A dual
solution now has a nonnegative diagonal penalty h_i at each
type and a reward p_ij between adjacent types. We may take
p_ij nonnegative because each mixed profile uses a single
crossing category and all its other weights are nonpositive.
In particular p_ij is at most one. For every mixed pair its
small-profile constraints include

```math
h_i,h_j,p_{ij}\ge0,
\qquad
abp_{ij}-\binom a2 h_i-\binom b2 h_j\le1
\quad (a,b\ge1,\ a+b\le L).
```

In this three-dimensional polyhedron two useful inequalities
hold. They use L = 5 and L = 6, respectively:

```math
p_{ij}\le a_0+b_0\sqrt{h_i h_j},
\qquad
(a_0,b_0^2)\in\{(1/4,9/32),(1/5,49/150)\}.
```

[verify_triangle_free.py](verify_triangle_free.py) enumerates
the 11 and 20 respective vertices by exact arithmetic and
checks the squared inequalities at each. The geometric mean
is concave on the nonnegative quadrant, so the inequalities
extend to the convex hull. On a recession ray both penalties
are nondecreasing and the reward cannot vary, by
$`0\le p_{ij}\le1`$; this proves the bound over the whole polyhedron.

Let x be the vector of vertex proportions and write

```math
W=\sum_{ij\in E(H)}p_{ij}x_ix_j,\qquad
N=\frac12\sum_i h_i x_i^2,\qquad f=W-N.
```

Weighted Mantel in its elementary simplex form gives
$`\sum_{ij\in E(H)}x_ix_j\le1/4`$. Indeed, at a maximizing weighting
with support minimal, nonadjacent types cannot both have mass:
concentrating their combined mass on one of them does not
decrease the objective, which depends affinely on the split.
The remaining support is a clique of size at most two.
The same argument with weights proportional to the squares of
a nonnegative vector z, followed by Cauchy–Schwarz, gives

```math
\sum_{ij\in E(H)} z_i z_j
\le \sqrt q
\left(\sum_{ij\in E(H)}z_i^2z_j^2\right)^{1/2}
\le \frac{\sqrt q}{2}\sum_i z_i^2.
```

Let M be any bound such that the final inequality with M in
place of the square root of q holds for every nonnegative z.
One may therefore use either the square root of q or the
adjacency spectral radius of H. Apply the inequality to
$`z_i=\sqrt{h_i}x_i`$ and combine it with the pair constraints:

```math
f\le \min\{1/4-N,\ a_0/4+(b_0 M-1)N\}.
```

For a target T between a_0/4 and 1/4, this yields f at most T
whenever $`b_0M\le(1-a_0)/(1-4T)`$. Indeed N at least
1/4−T uses the first term. Below that threshold, the second
term lies below T by checking both endpoints.

## Quotient reduction and the exceptional square

* If q is at least 14, the ordinary Erdős–Goodman–Pósa
  bound suffices. For q from 6 to 13, take a_0 = 1/4,
  b_0² = 9/32, and M² = q. The needed inequality is
  $`q(14-q)^2\le392`$. Its left side decreases
  for q between 6 and 14 and is 384 at q = 6.
* For a bipartite H with q edges that is not complete
  bipartite after removing isolates, take M to be its
  adjacency spectral radius. The bipartite adjacency
  block is a zero-one matrix of rank at least two. It has a
  nonzero two-by-two minor. The sum of squares of these
  minors is the second elementary symmetric polynomial of
  its squared singular values, by Cauchy–Binet. Those squared
  singular values sum to q, so $`M^4\le q^2-2`$.
* For q = 5 nonstars, this gives M² at most the square root
  of 23 if bipartite, or M = 2 for the only nonbipartite
  possibility, a five-cycle. Either suffices with a_0 = 1/4
  since $`M^2\le\sqrt{23}<392/81`$.
* For q = 4 there is no odd cycle. The non-complete-bipartite
  case uses M² at most the square root of 14, which is less than
  96/25, the required bound for a_0 = 1/5 and b_0² = 49/150.
* For q = 3, the second pair inequality alone gives f at most
  1/20, since b_0² q is less than one. Two or fewer edges give
  a clique-star or disjoint cliques. All stars, including the
  complete-bipartite quotients with one side a singleton, were
  handled in [CLIQUE-STARS.md](CLIQUE-STARS.md).

The only quotient left is the four-cycle. Its dual has eight
coordinates, four penalties and four rewards. Use all profiles
with a+b at most five. The resulting pointed polyhedron has
1,855 vertices and four nonincreasing recession rays. At each
vertex, maximize the quadratic f on the simplex: enumerate the
nonempty supporting faces and solve the stationarity equations
for each face. If a stationarity system is singular and has an
interior solution, the value is constant along a nonzero
stationary direction until the boundary, so a smaller support
already attains it. The exact rational verifier uses the GMP
version of [cddlib](https://github.com/cddlib/cddlib) for the vertex
enumeration and Python rational arithmetic for the stationary
systems. It gives exactly f = 1/14, hence the normalized ratio
at most 1/56 here as well.

For the lower bound on the four-cycle, give successive types
penalties 1, 2, 1, 2 and each crossing reward 1. Between
occupancies of a vertices of penalty-one type and b of
penalty-two type the signed inequality is

```math
ab-\binom a2-2\binom b2\le1.
```

It holds for every profile size, as in the clique-star lower
bound. Take successive part sizes 4t, 3t, 4t, 3t. Summing gives
at least 14t² + 10t cliques in every partition. There are four
cover cliques and 14t vertices, so the limit is 1/56.

All these statements are asymptotic in the class. Uniformity is
not an additional assumption: any quotient with at least 14
edges uses the general bound, and otherwise there are at most
26 nonisolated types and only finitely many nonisolated
quotients. The exact global ratio on general intersection
templates is not evaluated by this argument.
