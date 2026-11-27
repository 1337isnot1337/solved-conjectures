# The clique-partition ratio on all clique-stars

A clique-star is the join of one nonempty center clique with
a disjoint union of nonempty peripheral cliques, whose sizes
may differ. The edge clique cover number is the number of
peripheral cliques. The [four-periphery construction](REDUCTION.md)
has limiting normalized ratio $`1/56`$. In fact $`1/56`$ is the
sharp asymptotic upper bound for the **entire clique-star class**,
not just the balanced construction. What is still open is
whether a non-clique-star intersection template can beat it.

The proof uses a small finite rational certificate to handle
arbitrary peripheral proportions simultaneously. The certificate
does not enumerate any finite graphs. Its only computations
enumerate three- and two-dimensional polyhedra and check
768 inequalities with exact rational arithmetic.

## The arm polyhedron

By the profile program from [REDUCTION.md](REDUCTION.md), it suffices
to bound the limiting fractional cost with allowable clique sizes
at most twelve, except also allowing unlimited same-type cliques of
zero normalized cost. Formally, add a zero-cost pure column at each
type, occupying only that type's edge coordinate. This gives an
upper bound on the unrestricted asymptotic partition cost: replace
any such pure column by same-type profiles of order $`L'`$,
with added cost at most $`1/[2\binom{L'}2]`$, use the rounding
theorem for the resulting finite profile programs, and let
$`L'\to\infty`$. In the dual this extra column imposes
a nonpositive coefficient on each internal edge coordinate.

Write the internal coefficient at the center as $`-h`$ and
at peripheral part $`i`$ as $`-d_i`$. All $`h,d_i`$ are nonnegative.
Let $`p_i`$ be the reward for a crossing of the center and that
peripheral part. It can be chosen nonnegative: replacing a negative
$`p_i`$ by zero remains feasible since both internal coefficients
are nonpositive and there are no other crossings in that profile.
A clique meets at most one peripheral part. Thus the constraints
for each arm are exactly

```math
h,d_i,p_i\ge0,\qquad
a b\,p_i-\binom a2 h-\binom b2 d_i\le 1
\quad(a,b\ge1,\ a+b\le12).
```

Here $`a,b`$ are integers in the occupancy inequalities.
For $`q`$ arms all the polytopes share the same $`h`$.
At a vertex of the resulting $`(2q+1)`$-dimensional polyhedron,
either $`h=0`$ or some arm contributes three independent tight
rows in its variables $`(h,d_i,p_i)`$. Otherwise, the tight rows
in each arm have rank at most two, and without $`h=0`$ at
most $`2q`$ independent tight rows are present in total.
Accordingly, the possible $`h`$ values occur among vertices
of the single-arm polyhedron; zero also occurs there.
That polyhedron is three-dimensional and pointed.
For fixed $`h`$, the slices in the two remaining parameters
are likewise pointed. The single-edge constraint has $`p_i\le1`$;
all recession rays increase only penalties, never rewards, so
a maximum dual objective for any particular proportions can
be attained at a vertex. No boundedness of the penalty variables
is assumed.

## A certificate for every distribution of mass

Write $`x`$ for the fraction of vertices in the center and
$`b_i`$ for the fractions in the peripheries. If $`x=0`$ the
zero-cost pure profiles already suffice. Otherwise set
$`r_i=b_i/x`$, so $`x=(1+\sum_i r_i)^{-1}`$. The dual objective
divided by $`x^2`$ is

```math
\sum_i(p_i r_i-d_i r_i^2/2)-h/2.
```

To show the objective is at most $`T=q/56`$, we want to
subtract $`T(1+\sum_i r_i)^2`$ and get a nonpositive value.
For a nonnegative rational $`\lambda`$, completing a square
gives the upper bound

```math
\frac{\lambda^2}{4T}-\lambda-\frac h2
       +\sum_i\bigl((p_i-\lambda)r_i-d_i r_i^2/2\bigr).
```

It suffices to find $`\lambda`$ and $`B\ge0`$ with the first
three terms equal to $`-qB`$, such that

```math
\bigl(\max(0,p_i-\lambda)\bigr)^2\le2d_iB
```

at every vertex of the arm slice for the given $`h`$.
For $`d_i>0`$, the inequality bounds the maximum over $`r_i\ge0`$
of the corresponding quadratic by $`B`$. For $`d_i=0`$ it
ensures $`p_i\le\lambda`$ and the same conclusion. It extends
from vertices to the whole slice: for every fixed $`r_i`$
the expression to be bounded is linear in the arm parameters,
and on a recession ray it does not increase.

For $`q=2,\ldots,13`$, [verify_star.py](verify_star.py) enumerates
all possible center values by nonsingular triples of tight rows
and every arm vertex by tight pairs. At each center value it
checks at most three explicit rational choices of $`\lambda`$
as listed in the code. The checks cover all 64 center values
and all 798 arm vertices across the corresponding slices.
For $`q\ge14`$, the general Erdős–Goodman–Pósa bound
$`\mathop{\mathrm{cp}}(G)\le n^2/4`$ gives the desired ratio
directly, and $`q=1`$ is one clique.

Thus the entire clique-star family, with no restriction on
peripheral sizes, has maximum limiting ratio $`1/56`$.
The global problem on arbitrary intersection templates can
only exceed this ratio through another template structure.

## Sharp limits with two and three peripheries

The same certificate strengthens the two-periphery bound to
normalized ratio 1/88. In the certificate take T = 1/44 and try
2/25 or 1/10 for the square-completion parameter. Every graph with
edge clique cover number two is two cliques with a possibly
empty intersection, together with isolated vertices. The
intersection is the center, so the asymptotic normalized ratio
for these graphs is at most $1/88$. This sharpens the separate
two-cover estimate in Proposition 1 of the [original paper](https://www.renyi.hu/~p_erdos/1988-04.pdf#page=7).

For equality in the limit, take a center of size 5t and two
peripheries of size 3t each. Use the dual center penalty 1/2,
periphery penalties 2/3, and crossing rewards 1/2. For any
profile meeting center and periphery with occupancies a and b,
respectively, twelve times its signed weight is

```math
-3(a-b)(a-b-1)+b(7-b)\le 12.
```

The first term is nonpositive for integer a and b, and the
second is at most 12. Summing over any integral partition
gives the following lower bound, which matches the upper
bound after normalization:

```math
\mathop{\mathrm{cp}}(G)\ge (11t^2+13t)/4.
```

For three peripheries the sharp clique-star ratio is 1/63.
Take T = 1/21 and try 1/6, 1/5, and 2/9 for the square-completion
parameter. A matching example has a center of size 9t and
three peripheries of size 4t each. The dual center penalty is
2/3, peripheral penalties are 1, and crossing rewards are 2/3.
Six times a profile's signed weight is

```math
-2(a-b)(a-b-1)+b(5-b)\le 6.
```

Summing this certificate gives a partition lower bound of
21t² + 9t; the ratio tends to 1/63. Unlike
the two-cover case, the three-periphery result does not treat
every graph of cover number three.
