# Stability of the two four-cover extremal templates

The clique-star and square constructions both give normalized
value 1/56. In the full simplex of all fifteen membership types
for four covering cliques, both of their weight vectors are
**strict local maxima** of the bounded-profile limit, allowing
all profiles of sizes two through five and zero-cost pure
diagonal mass. In particular, putting a sufficiently small
amount of mass on any combination of new membership types
cannot beat either construction. This does not rule out a
larger value elsewhere in the simplex.

Write $`f_Y(x)=x^T Yx/2`$ for the dual objective, with diagonal
coefficients equal to minus the penalties. Put absent
off-diagonal coefficients equal to zero. The dual feasible
set may be truncated to a bounded polytope without changing
the optimum for any proportions. Every coefficient is at
most one by its single-edge constraint. A coefficient below
minus the maximum number of edges of any paid profile can
be raised to that negative bound: in any paid profile that
uses such a raised coefficient, that term alone offsets
all the other terms of weight at most one. Pure diagonal
bounds are still respected. All capacities are nonnegative,
so this operation never decreases the objective.

## Active optimizers on the witness faces

On the four-leaf star use the singleton membership types
as leaves and the type consisting of all four indices as
center. Their masses are 1/7 on each leaf and 3/7 at
the center. The canonical dual has crossing reward one,
center penalty one and leaf penalties two. It is possible
to allocate every type's capacity using just the four
tight mixed profiles in each arm, in the following amounts:

| Occupancies on penalty-one and penalty-two types | 1,1 | 2,1 | 2,2 | 3,2 |
| --- | ---: | ---: | ---: | ---: |
| Four-leaf star, per arm, in units of 1/392 | 2 | 1 | 2 | 2 |
| Four-cycle, per edge, in units of 1/784 | 2 | 3 | 7 | 2 |

For the four-cycle, the cover indices are its four edges.
A type records its two incident indices. Use alternating
penalties one and two, with respective masses 2/7 and 3/14.
Each edge has crossing reward one. The table spends each
internal capacity evenly over the incident arms or edges;
substitution in the occupancy formulas checks every
capacity. In each case the total cost is 1/14.

All four listed profile amounts are positive. Thus every
optimal full-template dual at either witness must have
each listed profile tight, since none can contribute a
positive slack to a matching objective. The constraints
with occupancies (1,1), (2,1), (2,2) successively force the
crossing reward and both penalties to be exactly the
canonical ones. Hence the optimal face restriction is
unique, even if the unseen coordinates are not.

On the star face, with center mass X, the objective
restricted to this forced matrix is at most

```math
X(1-X)-X^2/2-(1-X)^2/4=1/14-(7/4)(X-3/7)^2,
```

with equality in the upper bound only for equal leaf
masses. On the square face, take X to be the total mass of
the two penalty-one types. The bound is

```math
X(1-X)-X^2/4-(1-X)^2/2=1/14-(7/4)(X-4/7)^2,
```

with equality in the upper bound only for equal weights
within each opposite pair. Thus the respective witness is
the unique maximizer of the forced quadratic on its face.

## New membership directions are strictly losing

Let z be a membership type outside the witness face.
Whenever it is adjacent to both types of an active edge,
write a and b for its dual coefficients toward the
penalty-one and penalty-two endpoints. Adding one z to
the tight profiles (1,1) and (2,1) gives, respectively,

```math
a+b\le0,\qquad 2a+b\le0.
```

The profiles remain cliques and use at most four vertices.

For the star, z is a subset of the four indices of size
two or three, so it meets that many leaves, and it meets
the center. If its coefficient a toward the center is
nonnegative, the sum of its coefficients against witness
masses is at most $`(3-2r)a/7`$ by the second inequality
on every incident arm. If a is negative, the analogous
bound from the first inequality is $`(3-r)a/7`$. Both
are nonpositive.

For the square, any unseen type with only one cover index
meets exactly the two endpoints of that edge. Its mass-
weighted sum against the witness is $`(4a+3b)/14`$, at most
zero: use the second inequality when a is nonnegative,
and the first otherwise. An unseen type with at least
two indices meets all four square vertices. Indeed the
two consecutive indices would already define a witness
type, while two opposite indices cover all four. Apply
the weighted bound on the two edges of a matching of
the square. Their total is again at most zero.

For either witness x and any active optimal full-template
dual Y, the derivative of $`f_Y(x)=x^T Yx/2`$ toward z is therefore
at most $`-2f_Y(x)=-1/7`$. This is uniform over all the
unseen coordinates. On the witness face the forced
quadratic has a strict unique maximum, as proved above.

Finally choose the finite vertex set of the bounded dual
polytope as possible optimizers. For each vertex attaining
1/14 at the witness, continuity preserves a strictly
negative derivative toward every unseen type near the
witness face point. More explicitly, write an enlarged
point as $`(1-t)u+tv`$, where u lies on the witness face near
x, v is supported on unseen types, and t is small. The
derivative at t = 0 is a convex combination of the
derivatives toward the individual unseen types, and the
quadratic remainder in t is bounded. For sufficiently
small t it cannot increase the objective. Other dual
vertices have a positive gap at the witness and cannot
close it in a sufficiently small neighborhood, since
there are only finitely many. This proves strict local
optimality for the whole profile bound and for the
unrestricted limiting partition objective as well.

## Explicit neighborhoods

In fact the result holds whenever the total unseen mass t is at
most 1/1000 and the normalized restriction u to the witness face
satisfies $`\lVert u-x\rVert_1\le 1/10000`$. In this paragraph x is the
witness, and write r for that distance. Fix a dual matrix Y with
entries in [-10,1] and let $`\Delta=1/14-f_Y(x)\ge 0`$.

At u, split the diagonal capacities as before into equal shares
over the active edges. On each edge let C, D, P be these two
diagonal shares and its crossing capacity. Keep the (3,2) profile
amount $`z_{32}`$ fixed at its witness value and set
$`z_{22}=D-z_{32}`$, $`z_{21}=C-D-2z_{32}`$ and
$`z_{11}=P-2C-2D+2z_{32}`$. These amounts use every capacity on
the edge exactly. Each of C, D and P changes by at most r, so
each amount changes by at most 5r. The smallest listed witness
amount is 1/392, so every amount at u is at least half its
witness value. The cost of this allocation equals the canonical
quadratic at u because every used profile is canonically tight.
Subtracting its slacks for Y therefore gives
$`f_Y(u)\le 1/14-\Delta/2`$.

For an unseen z, the two incident inequalities now have right
sides equal to the Y-slacks of (1,1) and (2,1). Each slack is
at most $`392\Delta`$, since its original amount was at least 1/392
and the sum of all original weighted slacks is exactly $`\Delta`$.
The sign arguments above consequently give $`x^TYz\le 392\Delta`$:
the combined coefficients of the contributing slacks are at most
the total witness mass, which is one. By convexity this holds for
each distribution v on unseen types, and the coefficient bound
gives $`u^TYv\le 392\Delta+10r`$. Also $`f_Y(v)\le 1/2`$.
Hence at $`w=(1-t)u+tv`$,

```math
f_Y(w)\le (1-t)^2(1/14-\Delta/2)
          +t(1-t)(392\Delta+10r)+t^2/2.
```

The coefficient of $`\Delta`$ is nonpositive since
$`392t\le(1-t)/2`$. If $`t>0`$, the remaining bound is strictly
smaller than 1/14: its difference divided by t is at most
$`-1/7+1/1000+(1/14+1/2)/1000<0`$.
For $`t=0`$, the face allocation bounds the objective by the
canonical quadratic, which is strictly smaller away from x.
