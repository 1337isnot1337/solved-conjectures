# A normalized tripod countermodel for the enlarged scalar system

Status: a proved scalar countermodel. It assigns distances and charges
to subset units. It is not a tensor spectral point, and it gives no
lower bound above two for the matrix multiplication exponent.

The construction preserves a triangle of perimeter $`9/4`$ while
satisfying normalized full-unit charges, localized copositivity,
intersecting submodularity of unit charges, coherent retraction-law
extension, the full crossing inequality, the midpoint curvature
inequality, and all weighted hypergraph terminal-mincut inequalities.
Consequently these scalar requirements together do not imply a
perimeter bound of two.

## The metric and its charges

Let $`T`$ be a tripod with center $`O`$ and three closed arms of length
$`R=3/8`$, equipped with its geodesic metric $`d`$. Let $`A,B,C`$ be its
three endpoints. A labeled configuration is any finite collection of
points of $`T`$; distinct labels may occupy the same point.

For a nonempty finite set of labels $`H`$, put

```math
g(H)=2\max_{\mu\in\mathcal P(H)}
\sum_{x,y\in H}\mu(x)\mu(y)d(x,y),\qquad g(\varnothing)=0.
```

The maximum exists on a finite probability simplex. Duplicated
positions can be identified without changing the charge. A singleton
has charge zero, and a pair has charge equal to its distance.

### Closed form

For $`a,b,c\ge 0`$, define

```math
G(a,b,c)=a+b+c-\lambda(a,b,c),\qquad
\lambda(a,b,c)=\frac{abc}{ab+ac+bc}.
```

Set $`\lambda=0`$ when the denominator vanishes. Equivalently, when all
three coordinates are positive, $`\lambda=(1/a+1/b+1/c)^{-1}`$; when
any coordinate is zero, $`\lambda=0`$.

If the convex hull of $`H`$ in the tree contains $`O`$, let $`a,b,c`$ be
the largest radii of its points on each arm, using zero for an empty
arm. Then

```math
g(H)=G(a,b,c).                                      \tag{1}
```

If the convex hull does not contain $`O`$, all points are on one open
arm. If their least and greatest radii are $`\alpha,\beta`$, then

```math
g(H)=\beta-\alpha.                                 \tag{2}
```

Here is a proof. Distance to a fixed point is convex along any tree
geodesic. A point inside the hull can therefore be replaced by a
random choice of two hull endpoints on a path containing it without
decreasing any of its interactions with the remaining measure.
The interaction of the replaced mass with itself increases from zero
to a nonnegative number. Repeating this moves an energy-maximizing
measure to the extreme endpoints of the hull. For an interval the
two endpoint masses are optimally one half each, giving (2) and the
two-arm case of (1).

For three positive arm lengths $`s_1=a,s_2=b,s_3=c`$, the endpoint
distances are $`s_i+s_j`$. Twice the distance energy is

```math
4\sum_{i=1}^3s_i\mu_i(1-\mu_i).
```

This is a strictly concave quadratic on the probability simplex.
Its maximizing masses are

```math
\mu_i=\frac{1-\lambda/s_i}{2},\qquad
\lambda=\left(\sum_{i=1}^3\frac1{s_i}\right)^{-1}.
```

They are positive and sum to one. Substitution gives
$`s_1+s_2+s_3-\lambda`$, proving (1). Zero coordinates follow from the
interval calculation or continuity.

### Normalization and the original triangle

Charges are monotone under inclusion by extending probability
measures by zero. Formula (1) gives

```math
d(A,B)=d(B,C)=d(C,A)=\frac34,
\qquad
g(ABC)=3R-\frac R3=1.
```

Every finite set of points of $`T`$ has charge at most $`G(R,R,R)=1`$,
as follows by first adjoining $`O`$ and then using the monotonicity
of $`G`$ proved below. Therefore
every ambient label set containing $`A,B,C`$ has full-unit charge
exactly one, even after arbitrarily many auxiliary points are added.
The original perimeter is $`9/4`$.

The flattening tests also remain valid. In the degenerate tripod
consisting of a unit interval, put two original labels at one endpoint
and the third at the other. Its distances are $`(1,1,0)`$ up to
permutation, its full charge is one, and its perimeter is two.
The formulas and arguments below allow zero arm lengths and give
the same scalar properties for this configuration.

On the partial-unit symbols, define the numerical values

```math
\mathcal V(U_H(r))=r^{g(H)}.
```

Every ambient configuration $V$ containing $A,B,C$ therefore satisfies
$\mathcal V(U_V(r))=r$ for every positive integer $r$. This assignment
is stated only on unit symbols; its extension to the tensor semiring
is not asserted.

The proofs below also allow unequal or zero arm lengths. In the
degenerate interval of length one, put one old party at one endpoint
and the other two at the other endpoint. The full charge is one and
the three distances are $(1,1,0)$ up to permutation. Thus the same
scalar constraints retain the required flattening examples.

## Intersecting submodularity

For all finite label sets $`S,T`$ with nonempty intersection,

```math
g(S)+g(T)\ge g(S\cup T)+g(S\cap T).                 \tag{3}
```

First observe that, for positive $`s_1,s_2,s_3`$,

```math
\frac{\partial G}{\partial s_i}
=1-\frac{\lambda^2}{s_i^2}\in[0,1],\qquad
\frac{\partial^2G}{\partial s_i\partial s_j}
=-\frac{2\lambda^3}{s_i^2s_j^2}\le0\quad(i\ne j).
```

Thus $`G`$ is monotone, is one-Lipschitz in each coordinate, and has
decreasing differences between different coordinates. In particular
it is submodular on the coordinate lattice:

```math
G(s)+G(t)\ge G(s\vee t)+G(s\wedge t).              \tag{4}
```

To prove the last assertion, increase the coordinates where $`s_i>t_i`$
from $`s\wedge t`$ to $`s`$. Compare the same increases from $`t`$ to
$`s\vee t`$. Their derivative integrals are no larger on the second
path, because its other coordinates are larger and all mixed
derivatives are nonpositive. This gives (4). These properties extend
to zero coordinates by adding the same positive number to all
coordinates and passing to the limit; $`\lambda`$ is continuous there.

Call a set centered when its tree convex hull contains $`O`$. This
includes sets containing $`O`$ and sets meeting at least two open arms.

If both $`S,T`$ are centered, let $`s,t`$ be their maximum-radius
vectors. Their union has vector $`s\vee t`$. The intersection, whether
centered or confined to one arm, has charge at most
$`G(s\wedge t)`$: adjoin $`O`$ and enlarge each radius to the indicated
coordinate. Equation (4) proves (3).

Suppose $`S`$ is not centered and has radius range $`[\alpha,\beta]`$ on
one open arm, while $`T`$ is centered. Let $`t`$ be the largest radius
of a point of $`T`$ on that arm. Nonempty intersection implies
$`t\ge \alpha`$. Coordinate Lipschitzness gives

```math
g(S\cup T)-g(T)\le(\beta-t)_+.
```

The intersection lies on the same arm, with radius range contained
in $`[\alpha,\min(\beta,t)]`$, so

```math
g(S\cap T)\le\min(\beta,t)-\alpha.
```

Adding these inequalities gives (3), because the two right sides
sum to $`\beta-\alpha=g(S)`$.

Finally, if neither set is centered, nonempty intersection forces
both onto the same open arm. The sum of their two interval ranges
equals the range of their union plus the length of the intersection
of their hull intervals. The charge of their actual intersection
is at most that latter length. This proves (3) in the remaining case.

## Coherent extension for any fixed joint retraction law

We give an explicit barycenter map. For a finitely supported
probability measure $`\mu`$ on $`T`$, let

```math
m_i=\mathbb E_\mu[r(Y)\mathbf1_{\{Y\text{ on arm }i\}}],
\qquad M=m_1+m_2+m_3.
```

The center contributes radius zero. Define $`b(\mu)`$ to lie at radius
$`(2m_i-M)_+`$ on the unique arm on which this expression is positive,
or at $`O`$ if none is positive. At most one is positive. Its radius
is at most $`m_i\le R`$, so it lies in the tripod.

This is also the unique minimizer of mean squared distance. At radius
$`x`$ on arm $`i`$, the mean squared distance is

```math
\mathbb E_\mu[r(Y)^2]+x^2+2x(M-2m_i),
```

whose minimizing radius is exactly the one just stated.

For every coupling of measures $`\mu,\nu`$, this barycenter satisfies

```math
d(b(\mu),b(\nu))\le\mathbb E[d(Y,Z)].              \tag{5}
```

Define $`f_i`$ to be positive radius on arm $`i`$ and negative radius
on the other arms, with $`f_i(O)=0`$. Each $`f_i`$ is one-Lipschitz and
$`f_i+f_j\le 0`$ for different arms. Also $`\mathbb E_\mu f_i=2m_i-M`$.
If the two barycenters lie on the same arm, or one is the center,
their distance is bounded by

```math
|(\mathbb E_\mu f_i)_+-(\mathbb E_\nu f_i)_+|
\le|\mathbb E_\mu f_i-\mathbb E_\nu f_i|
\le\mathbb E[d(Y,Z)].
```

If they lie on different arms $`i,j`$ with positive radii $`a,b`$, then
$`\mathbb E_\mu f_i=a`$ and $`\mathbb E_\nu f_i\le -b`$. Hence

```math
a+b\le\mathbb E_\mu f_i-\mathbb E_\nu f_i
\le\mathbb E[d(Y,Z)].
```

This proves (5), including all center cases.

Now let $`V`$ be an old finite label set and let $`V'`$ be an enlarged
set. Fix one probability law on maps $`\pi:V'\to V`$ that fix the old
labels. Keep all old positions and place each new label $`v`$ at the
barycenter of the law of the old point $`\pi(v)`$. A point mass has
its original point as barycenter, so all old positions are preserved.
Using the same random map on any pair gives, simultaneously,

```math
d(v,w)\le\mathbb E[d(\pi(v),\pi(w))].
```

For a probability vector $`\alpha`$ on any subset $`P`$ of $`V'`$, multiply
these inequalities by $`2 \alpha_v \alpha_w`$ and sum. For each map
realization, the right side is the distance energy of the pushforward
probability vector on $`\pi(P)`$, bounded by $`g(\pi(P))`$. Maximizing on
the left yields, for every subset at once,

```math
g(P)\le\mathbb E[g(\pi(P))].                       \tag{6}
```

For the empty subset the same inequality is the equality zero.

The placements depend only on the fixed joint law, not on $`P`$.
The construction can be repeated from any enlarged finite set.
This is the quantifier “for each joint law, there exists an extension”.
It is not one extension satisfying differently optimized laws
simultaneously. Nor is associativity of barycenters asserted.
For example, the barycenter of equal masses at $`B,C`$ is $`O`$, and
the barycenter of equal masses at $`A,O`$ is halfway along the $`A`$
arm; the barycenter of masses $`1/2,1/4,1/4`$ at $`A,B,C`$ is $`O`$.

## Crossing and midpoint curvature

The full crossing requirement below is the scalar inequality of
Proposition B.3 in the pinned
[Anthropic paper](https://github.com/anthropics/formal-math/tree/11b6c7e3c927df2658f513b6b68ea7f8929c62c5/vp-vnp).
For four endpoints $`x,v,y,u`$ and nonnegative $`p,q`$, there are
nonnegative $`r,r'`$, independent of the hubs, such that

```math
r^2+(r')^2\le2(p^2+q^2)
```

and, for every choice of hubs $`o,o',w,w'`$, with
$`L=p d(x,v)+q d(y,u)`$,

```math
\begin{aligned}
L&\le p[d(x,o)+d(v,o')]+q[d(y,o)+d(u,o')]+r d(o,o'),
\\ L&\le p[d(x,w)+d(v,w')]+q[d(u,w)+d(y,w')]+r' d(w,w').
\end{aligned}                                                   \tag{7}
```

Every tree satisfies (7). Put

```math
a=d(x,v)+d(y,u),\quad
b=d(x,y)+d(v,u),\quad
c=d(x,u)+d(y,v).
```

The two largest of these three sums are equal in a tree. One can
see this in the subtree spanned by the four endpoints: pendant
segments contribute equally to all three sums, and any central
segment contributes twice to two sums and zero to the third.
In particular, $`a\le b`$ or $`a\le c`$.

For $`p\ge q`$ and $`a\le b`$, write

```math
L=(p-q)d(x,v)+qa
\le(p-q)d(x,v)+q d(x,y)+q d(v,u).
```

Route $`x`$ to $`v`$ through $`o,o'`$, $`x`$ to $`y`$ through $`o`$, and $`v`$
to $`u`$ through $`o'`$. The first bound in (7) follows with $`r=p-q`$.
Ordinary routing of the two original paths through $`w,w'`$ in
opposite orders gives the second bound with $`r'=p+q`$. If $`a\le c`$,
use the other endpoint pairing; the roles of these two hub
coefficients are exchanged. If $`q\ge p`$, use the same calculation
with residual path $`y`$ to $`u`$ of weight $`q-p`$. Thus the two
coefficients are $`|p-q|`$ and $`p+q`$, in one order, and their squared
sum is exactly $`2(p^2+q^2)`$.

The tripod also contains every geodesic midpoint and satisfies the
curvature inequality of the pinned paper's Theorem C.1:

```math
d(z,m)^2\le\tfrac12d(z,x)^2+\tfrac12d(z,v)^2
-\tfrac14d(x,v)^2.                                 \tag{8}
```

For a direct proof, let $`d(x,v)=2D`$ and let the projection of $`z`$
onto the path $`[x,v]`$ have signed coordinate $`t`$ from its midpoint
$`m`$, where $`|t|\le D`$. Put $`h=d(z,[x,v])`$. The three relevant
distances are $`h+|t|`$ and $`h+D+t,h+D-t`$. The right side of (8) is
$`h^2+2hD+t^2`$, at least $`(h+|t|)^2`$. The equal-weight barycenter
of two points is their geodesic midpoint, so these midpoints are
also supplied by the coherent extension rule above.

## Copositivity, tree bounds, and all hypergraph mincuts

Let $`D_H`$ be the distance matrix on a finite set $`H`$. The definition
of $`g(H)`$ immediately gives

```math
g(H)J-2D_H\quad\text{is copositive}.
```

Indeed, normalize any nonzero nonnegative test vector to a probability
vector and multiply the defining energy bound by the square of its
total mass.

If any finite tree with arbitrary auxiliary vertices joins $`H`$,
with its edges assigned the distances between their endpoint
positions, then $`g(H)`$ is at most the sum of those edge lengths.
For a probability vector on $`H`$, route two independent sampled
points along the tree. An edge separating mass $`t`$ from mass $`1-t`$
is used with probability $`2t(1-t)`$. Twice the expected path length
therefore gives coefficient $`4t(1-t)\le 1`$ on each edge. Maximize over
the probability vector.

More strongly, let a finite ambient configuration have nonnegative
weights $`w_H`$ on arbitrary hyperedges and let $`P`$ be any terminal
subset. Define $`\lambda_P`$ as the minimum total crossing-hyperedge
weight of a cut separating at least two terminals, and set
$`\lambda_P=0`$ if $`P`$ has at most one label. The companion
tree-terminal-mincut theorem gives

```math
\sum_H w_H g(H)\ge\lambda_P g(P).                  \tag{9}
```

It applies to every $`P`$ here, since every terminal metric is a subset
of the same tree. This is the theorem proved in the companion
[TREE_TERMINAL_MINCUT.md](TREE_TERMINAL_MINCUT.md): its proof uses an optimal terminal
probability vector, a cut measure of density $`4t(1-t)`$ along the
tree, and projection to each hyperedge hull to bound its integrated
cut charge by $`g(H)`$. Coincident labeled points are harmless; cuts
of the underlying tree pull back to labeled cuts, and only
positive-charge terminal sets need to be considered.

## Exact scope

The construction supplies one scalar model satisfying (1)--(9) and
preserving the normalized original perimeter $`9/4`$. In particular,
adding intersecting submodularity to the previous auxiliary-party
scalar constraints does not eliminate that perimeter. The square
counterexample to submodularity in the Euclidean energy model rules
out that particular model, while the tripod model survives.

No value has been assigned to a general tensor, and no monotonicity
under arbitrary tensor restrictions, product rule on arbitrary
tensors, or tensor direct-sum rule has been proved for this model.
It is therefore not a normalized spectral point. The remaining
matrix multiplication question requires an implication beyond the
scalar requirements listed here.
