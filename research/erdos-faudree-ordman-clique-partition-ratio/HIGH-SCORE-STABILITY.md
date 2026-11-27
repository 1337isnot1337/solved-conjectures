# High-score stability for cover templates

The cover-multiplicity bound leaves twelve as the largest possible
cover number for a strict improvement on 1/56. At that number,
a maximizing counterexample can be assumed to use only membership
sets of sizes two through nine. In fact, every active type is
nonadjacent to more than 0.15 of the total type mass. The argument
also gives high-score stability without assuming a number of
covering cliques.

Use the unbounded dual Y, positive and negative scores P and N,
and proportions x from [COVER-MULTIPLICITY.md](COVER-MULTIPLICITY.md).
Let f=P-N. We choose x to maximize this particular dual quadratic
on the simplex and discard types of zero mass; then each active
row of Y has scalar product 2f with x. All diagonal entries are
nonpositive, absent entries are zero, and every entry is at most
one.

## A capped score inequality

Write $`p_{ij}=\max(0,y_{ij})`$ for distinct types and zero on
the diagonal. Then

```math
\sum_{i\lt j}\min(2p_{ij},1)x_ix_j\le\frac14.
```

For the capped matrix, the minimum-support argument used for P
again reduces an optimizer to a positive clique of types. The
sum of original scores on its edges is at most one by the
all-distinct profile constraint. In particular the sum of
capped scores on that clique is at most two, with each score
between zero and one. This is the convex hull of vectors that
equal one on at most two edges and zero elsewhere: in an extremal
vector, two fractional coordinates can trade mass, and one
fractional coordinate can move to an endpoint because the
total cap is integral. Any graph with at most two edges is
bipartite, and its weighted edge mass is at most one quarter.
Averaging over these vectors proves the assertion.

Let H consist of edges with $`p_{ij}>1/2`$. It is triangle-free,
since all three vertices of a triangle in H give a valid profile
with score greater than one. Let M be its unweighted edge mass in
the proportions x, E its weighted deficit from score one, and L
the total positive score mass outside H. Then with
$`\epsilon=1/4-P`$,

```math
M+2L\le1/4,\qquad P=M-E+L,\qquad
L+E\le\epsilon,\qquad M\ge 2P-1/4+2E.
```

In this sense the positive weights are quantitatively near zero
or one if their total is near one quarter.

## A nonneighbor bound for every active type

Let d be the largest weighted H-degree and let $`\beta_v`$ be
the mass of types not adjacent to v in the original template,
not in H. Then

```math
d\le \frac12+\sqrt{\frac14-M},\qquad
2M-E\le d(1-2f+\beta_v).
```

For the first bound, take A to be the H-neighborhood of a
maximum weighted degree vertex, of mass d. It is independent
in H. The sum of weighted H-degrees over the complementary
mass is at most $`d(1-d)`$ and counts each edge at least once.
Thus $`M\le d(1-d)`$.

For the second bound, put $`a_i=y_{vi}`$. On an edge ij of H
whose endpoints are both adjacent to v in the original
template, the three-vertex profile says
$`a_i+a_j\le1-p_{ij}`$. If v is one of the endpoints, use
the repeated-type profile, which gives the same inequality.
If exactly one endpoint is not adjacent to v then that endpoint
has a-coefficient zero and the other is at most one. If both are
nonneighbors the inequality holds without a correction. The
weighted mass of all edges incident to a nonneighbor is at most
$`d\beta_v`$. Writing $`d_i`$ for the weighted degree in H, this gives

```math
\sum_i x_i d_i a_i\le E+d\beta_v.
```

On the other hand, $`a_i\le1`$, $`d_i\le d`$ and
$`\sum_i x_i a_i=2f`$. Subtracting the nonnegative degree deficits
from $`d\sum_i x_i a_i`$ gives the lower bound
$`2fd-(d-2M)`$ on the same weighted sum.

## At partition cost at least three fourteenths no type is simplicial

Here simplicial means that the closed neighborhood of the type is a
clique in the original template. Suppose such a neighborhood had
mass m. Since it is a clique, the dual objective restricted to it
is nonpositive. Every coefficient elsewhere is at most one, so
$`f\le (1-m^2)/2`$. The row equation also gives $`m\ge2f`$.
For $`f\ge3/14`$ these imply $`3/7\le m\le19/25`$.

Use a profile with one copy of our type and two independent
samples from its closed neighborhood, normalized to mass one.
All three actual vertices are distinct, even when some share a
type. The expected score on the two edges incident to the fixed
copy is $`4f/m`$. The remaining edge has expected score at least
$`-2N/m^2`$. Since the total is at most one, this gives
$`N\ge 2fm-m^2/2\ge 57/175-361/1250>1/28`$;
the quadratic $`3m/7-m^2/2`$ decreases throughout this interval.
But $`N=P-f\le1/28`$. In particular, singleton membership types
are impossible at this objective value.

## Consequences for twelve covering indices

Assume $`f\ge3/14`$. Initially $`N\ge P/12`$, so $`P\ge18/77`$,
$`M\ge 67/308+2E`$ and $`d\le15/22`$ by the preceding bounds.
It follows that every $`\beta_v\ge1/15`$. Since singleton
types are absent, no membership set of size eleven or twelve
can have a nonneighbor, so all sizes are now at most ten.

Every negative coefficient is therefore counted at most ten times
in the cover-multiplicity argument. This gives
$`P\ge5/21`$, $`\epsilon\le1/84`$, $`M\ge19/84+2E`$ and $`d\le2/3`$.
Consequently every $`\beta_v\ge3/28`$.

If a set of size ten were active, its only possible nonneighbor
would be the complementary set of size two, since singletons are
absent. Call that complementary type v. Its mass is at least
$`3/28`$. Partition its H-neighbors into two cliques of the original
template by assigning each to a shared cover index with v, using
either index if both are shared. For each resulting clique j,
let $`d_j`$ be its mass, $`e_j`$ its deficit in scores toward v,
and $`c_j=d_j-e_j`$ its score mass toward v. The one-fixed-copy,
two-independent-neighbor profile implies that the negative mass
inside j is at least
$`d_j c_j-d_j^2/2=(c_j^2-e_j^2)/2`$, also valid for an empty clique.
These cliques are vertex-disjoint, so their negative masses
do not overlap. Therefore

```math
N\ge(c_1+c_2)^2/4-(e_1+e_2)^2/2 .
```

Let l be the low positive score mass incident to v without the
factor $`x_v`$. The row equation gives $`c_1+c_2\ge 2f-l`$.
The global estimate $`L+E\le\epsilon`$ gives
$`l+e_1+e_2\le\epsilon/x_v\le (28/3)\epsilon`$.
Put $`t=(28/3)\epsilon\le1/9`$.
It follows that $`N\ge(3/7-l)^2/4-(t-l)^2/2`$ for $`0\le l\le t`$.
This is a concave quadratic in l, and its value at $`l=0`$
is at least its value at $`l=t`$, since $`t\le 1/9<2/7`$.
Hence $`N\ge(3/7-(28/3)\epsilon)^2/4`$.
This exceeds $`1/28-\epsilon`$ throughout
$`0\le\epsilon\le1/84`$: subtract that line, observe that the
difference is decreasing over the interval, and check that
at its right endpoint the difference is
$`(20/63)^2/4-1/42>0`$. This contradicts
$`N=P-f\le1/28-\epsilon`$. Thus size ten is impossible too.

Finally, negative multiplicities at most nine imply
$`P\ge27/112`$, so $`M\ge13/56+2E`$ and $`d\le9/14`$.
Inserting these values in the nonneighbor bound gives
$`\beta_v\ge19/126>0.15`$ for every type, as claimed.
These constraints are not by themselves a solution of the
remaining twelve-cover case.
