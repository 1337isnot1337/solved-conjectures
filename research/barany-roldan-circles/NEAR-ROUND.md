# Circular intersections of a nearly round convex boundary

**Partial result.** Let $`K`$ be a planar convex body and suppose $`rB\subseteq K\subseteq RB`$ after a translation, where $`B`$ is the unit disk, and $`k=r/R>1/\sqrt2`$. There is $`p\in\partial K`$ such that every circle centered at $`p`$ meets $`\partial K`$ in at most
```math
 1+\left\lfloor\frac{3}{2k^2-1}\right\rfloor
 \tag{1}
```
points. In particular the bound is $`4`$ if $`k>\sqrt{7/8}`$. The value $`4`$ is sharp in this class, even when $`k`$ is arbitrarily close to $`1`$.

This concerns the continuous circle-intersection problem of [Bárány and Roldán-Pensado, *A Question from a Famous Paper of Erdős*, printed p. 254](https://www.renyi.hu/~barany/cikkek/134.pdf#page=2) ([DOI](https://doi.org/10.1007/s00454-013-9507-z)). They show the old universal bound $`2`$ is false, establish a body-dependent finite bound, and ask whether there is a universal finite bound, possibly $`6`$. Their §2 uses the endpoint map for boundary normals and a coarea formula. The addition here is a global transversality bound under the concentric sandwich and its quantitative sharp-four consequence; it does not establish any uniform bound for all $`K`$. This is distinct from the discrete pinned-distance assertion of Erdős #982.

## 1. Every opposite normal endpoint is transverse

A pair $`(q,u)`$ consists of $`q\in\partial K`$ and an outward unit support normal $`u`$ at $`q`$. Write
```math
 q=b+(q\cdot u)u,\qquad b\perp u,\qquad h=|b|.
```
Since $`q\cdot u\ge r`$ and $`|q|\le R`$, we have $`h\le\sqrt{R^2-r^2}<r`$. Thus the line $`b+\mathbb Ru`$ passes through the interior of $`rB`$. It meets $`\partial K`$ in exactly two points: $`q`$ at the positive end and an opposite point $`p=b-\tau u`$, $`\tau>0`$.

For any outward unit support normal $`v`$ at $`p`$, we have $`p\cdot v\ge r`$. Put $`\rho=|p|`$. The directions $`p/\rho`$ and $`-u`$ form angle $`\arcsin(h/\rho)`$; the directions $`v`$ and $`p/\rho`$ form angle at most $`\arccos(r/\rho)`$. As $`h<r`$, the sum of these two bounds is nondecreasing on $`\rho\in[r,R]`$. On $`\rho>r`$ its derivative is
```math
 -\frac{h}{\rho\sqrt{\rho^2-h^2}}
 +\frac{r}{\rho\sqrt{\rho^2-r^2}}\ge0,
```
and it is continuous at $`r`$. Hence the angle from $`v`$ to $`-u`$ is at most
```math
 \arcsin(h/R)+\arccos(r/R)\le 2\arccos k<\pi/2.
```
In particular every such pair of support normals satisfies
```math
 u\cdot v\le -g,\qquad g=2k^2-1>0.
 \tag{2}
```

## 2. Total variation of the endpoint map

Parametrize $`\partial(K+B)`$ once positively by arclength $`s`$, with $`x(s)=q(s)+u(s)`$. The Euclidean nearest-point projection gives $`q(s)\in\partial K`$ and $`u(s)=x(s)-q(s)`$, a unit outward support normal there. Conversely, every normal pair occurs exactly once in this parametrization, with the usual identification of the initial and final parameter: the inequalities $`u\cdot(y-q)\le0`$ for $`y\in K`$ imply
```math
 |q+u-y|^2=1+|q-y|^2-2u\cdot(y-q)\ge1,
```
with equality only for $`y=q`$. Both $`q(s)`$ and $`u(s)`$ are Lipschitz, by nonexpansiveness of convex nearest-point projection.

Let $`p(s)`$ be the opposite endpoint from §1 and write $`p=q-\ell u`$ with $`\ell>0`$. The map $`p(s)`$ is locally Lipschitz, as follows directly from (2). For two close parameters abbreviate $`d=p'-p=a u+b_0 Ju`$, where $`J`$ is a rotation through $`\pi/2`$ and the primes in this sentence mean values at the second parameter. Take support normals $`v,v'`$ at $`p,p'`$; then $`d\cdot v\le0`$ and $`d\cdot v'\ge0`$. If $`|u-u'|<g/2`$, (2) gives $`u\cdot v\le-g`$ and $`u\cdot v'\le-g/2`$. Using the second support inequality for $`a\ge0`$ and the first for $`a\le0`$ yields $`|a|\le2|b_0|/g`$. Moreover
```math
 |b_0|\le |q'-q|+2R|u'-u|
```
by taking the $`Ju`$ component of the endpoint identity. This gives local Lipschitz regularity uniformly along the parameter circle. In particular $`\ell=(q-p)\cdot u`$ is also Lipschitz.

Use dots now for arclength derivatives. At every differentiability point, $`\dot p\cdot v=0`$ for each support normal $`v`$ at $`p`$, since $`p(s+h)`$ lies in the fixed supporting half-plane for both signs of $`h`$. Consequently $`|\dot p\cdot Ju|=|\dot p|\,|v\cdot u|`$ and (2) gives
```math
 g|\dot p|\le|\dot q|+\ell|\dot u|.
 \tag{3}
```
The first term integrates to the perimeter $`L_K`$. To justify this without smoothness, $`q(s)`$ maps onto $`\partial K`$ and has multiplicity one except at points with a nontrivial normal cone. Such corners are countable, since their open normal direction intervals are disjoint. The one-dimensional area formula for the Lipschitz map $`q`$ therefore gives $`\int|\dot q|=L_K`$.

The angle of $`u(s)`$, the continuous outward normal of $`K+B`$, is monotone with total increase $`2\pi`$. This is the ordinary turning-angle property of a convex $`C^1`$ boundary; uniqueness of the outer normal on the parallel curve follows from its unique nearest point on $`K`$. The length $`\ell`$ of a normal chord is at most the width $`w_K(u)`$ of $`K`$ in its direction, since $`(q-p)\cdot u=\ell`$. Therefore
```math
 \int \ell|\dot u|\,ds
 \le \int_0^{2\pi} w_K(u_\theta)\,d\theta
 = 2L_K.
```
The last equality is Cauchy's perimeter formula: the total variation of projection onto $`u_\theta`$ in one circuit of a convex curve is twice its width, and integrating the absolute projected unit tangent across all directions gives $`4`$ per unit of arclength. Combining this with (3) shows $`\int|\dot p|\le3L_K/g`$.

By the area formula for $`p(s)`$, the integral over $`\partial K`$ of the number $`M(p)`$ of normal pairs with opposite endpoint $`p`$ is at most $`3L_K/g`$. Hence some $`p`$ has $`M(p)\le\lfloor 3/g\rfloor`$. There are no additional normals through this $`p`$ with a different source point: all normal lines cross the interior ball, so their only two boundary points are the source and the opposite endpoint.

## 3. From normals to circular intersections

Following the argument in Bárány and Roldán-Pensado §2, order any finite collection of distinct points of $`\partial K`$ at the same positive distance from this $`p`$, starting at $`p`$ in boundary order. If there are $`m`$ such points, each of the $`m-1`$ open arcs between consecutive ones contains a point $`q`$ at which the distance from $`p`$ has a local extremum, or a point of a constant-distance arc. At a point with a unique tangent, this forces the line $`pq`$ to be normal. At a corner, a local maximum forces $`q-p`$ to have nonpositive scalar product with both inward tangent rays, and hence to be an outward support normal up to scaling. A local minimum would force both scalar products nonnegative, which contradicts that $`p-q`$ lies in the cone generated by those rays. A constant-distance arc has a noncorner point. Thus the arcs supply $`m-1`$ distinct normal pairs. Since $`M(p)`$ is finite, this excludes infinitely many intersections as well, and proves (1).

## 4. Sharpness in the near-round class

Bárány and Roldán-Pensado already note that odd regular polygons give at least four intersections from every boundary point. For direct verification, consider a regular odd $`m`$-gon inscribed in the unit circle, with $`m\ge5`$ and $`\delta=\pi/m`$. A point on a side with outward normal $`u_0`$ can be written $`p=(\cos\delta)u_0+\tau Ju_0`$, $`|\tau|\le\sin\delta`$. The two side normals beside the opposite vertex have bearings $`\pi\pm\delta`$ relative to $`u_0`$. Choosing the sign that cancels the sign of $`\tau`$ gives, for one of those sides with normal $`v`$,
```math
 |p\cdot Jv|=\cos\delta\,(\sin\delta-|\tau|)<\sin\delta.
```
Thus $`p`$'s perpendicular foot lies strictly inside that side, since its half-length is $`\sin\delta`$ and its midpoint is on the $`v`$-axis. Take a circle radius strictly between the distance to this foot and the smaller distance to the side's endpoints. It intersects the side twice. Each of the two remaining arcs from the endpoints to $`p`$ supplies another intersection by continuity, for at least four in total. The concentric sandwich has $`k=\cos(\pi/m)\to1`$. For all sufficiently large odd $`m`$ our upper bound $`4`$ applies, so it is attained arbitrarily near the disk.

Focused title, exact-statement, near-circle and citation searches found the original endpoint/coarea method and its sharpness examples but did not locate the quantitative upper bound in (1). No guarantee of priority or claim about arbitrary convex bodies is made.
