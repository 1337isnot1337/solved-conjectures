# Erdős–Oler conjecture

Research log for [issue #62](https://github.com/1337isnot1337/solved-conjectures/issues/62).
Use the centers of disks of diameter one. A packing of
these disks in an equilateral triangle of side $L+\sqrt3$
is a set of centers at pairwise distance at least one
in the inward equilateral triangle of side $L$.

For an integer $k\ge1$ put $n_k=(k+1)(k+2)/2$.
The classical triangular arrangement packs $n_k$ centers
in side $k$. The conjecture says that side $k$ is still
required for $n_k-1$ centers.

## Literature

- [Oler (1961)](https://doi.org/10.4153/CMB-1961-018-7)
  proves optimality for the complete triangular numbers.
  [Folkman and Graham (1969)](https://doi.org/10.4153/CMB-1969-096-7)
  give a triangulation proof of Oler's Euclidean inequality.
- [Melissen (1993)](https://doi.org/10.2307/2324212)
  studies the exact small packings and the equality cases of
  the area-and-perimeter bound. [Payan (1997)](https://doi.org/10.1016/S0012-365X(96)00201-4)
  proves the 14-disk case and states that his argument can
  be extended to 20 disks. [Graham and Lubachevsky](https://arxiv.org/abs/math/0406252)
  report further packings and conjectures.
- The problem is listed in [Research Problems in Discrete Geometry](https://doi.org/10.1007/0-387-23815-8)
  and in the [Wikipedia article on equilateral-triangle packing](https://en.wikipedia.org/wiki/Circle_packing_in_an_equilateral_triangle).
- [Sahir's 2025 proof claim](https://www.academia.edu/129891186/A_Proof_of_the_Erdos_Oler_Conjecture)
  uses the planar hexagonal density to argue that a smaller
  triangle cannot contain $n_k-1$ disks. Even granting that
  density as an upper bound for the finite container, for
  disks of radius one it gives only $s^2\ge8(n_k-1)$ for the
  outer side $s$. The desired side satisfies
  $(2k+2\sqrt3)^2-8(n_k-1)=(8\sqrt3-12)k+12>0$.
  Thus the required finite lower bound does not follow.
  [A separate posted claim](https://www.researchgate.net/publication/387465203_Optimal_Circle_Packings_for_Triangular_Numbers_A_Detailed_Mathematical_Proof_For_Paul_Erdos_and_Norman_Oler_conjecture)
  assumes the necessary correspondence between numbers of
  disks touching the sides and triangular arrangements, without
  establishing it for an arbitrary packing. Neither argument
  establishes the unrestricted conjecture.

## A directional bound for the hull boundary

**Lemma.** In an equilateral triangle of side $L$, a convex
polygon with successive vertices at distance at least one has
at most $3\lfloor L\rfloor$ boundary vertices. Points on a
straight side of the polygon may be counted as successive
vertices.

Orient the polygon and the containing triangle counterclockwise.
Assign each directed edge of the polygon to the closest of the
three directed side directions of the triangle. Fix a half-open
convention at the ties. The assigned edges for any one side
are a single consecutive chain, because the edge directions
of a convex polygon are cyclically nondecreasing.

Rotate coordinates so the assigned side is the bottom side,
from $(0,0)$ to $(L,0)$. The edge directions of this chain
lie between $-60^\circ$ and $60^\circ$. In particular
$\Delta x>0$ and $|\Delta y|\le\sqrt3\Delta x$ for each
edge. Squaring the two sides gives

```math
 \sqrt{(\Delta x)^2+(\Delta y)^2}
    \le \Delta x+\frac{|\Delta y|}{\sqrt3}.
```

Along the chain the height first decreases and then increases,
since the directions are nondecreasing. If the chain starts at
$(x_0,y_0)$ and ends at $(x_1,y_1)$, with minimum height $y_*$,
its total variation in height is $y_0+y_1-2y_*$. Its length
is at most

```math
 x_1-x_0+\frac{y_0+y_1-2y_*}{\sqrt3}
 \le L-\frac{2y_*}{\sqrt3}\le L.
```

The middle inequality uses the two sloping sides of the
containing triangle at the endpoints. Thus there are at
most $\lfloor L\rfloor$ edges in the chain. The three
chains partition the boundary edges, proving the lemma.

## All lattice packings and a condition on unrestricted counterexamples

**Proposition.** The Erdős–Oler equality holds, for every
$k$, when the centers are required to be in a translate of
any lattice whose minimum nonzero vector length is at least one.
The lattice orientation and shape are arbitrary.

In fact, let $S$ be any noncollinear subset of such a lattice
in an equilateral triangle of side $L$, let $H$ be its convex
hull, and triangulate $H$ with vertex set $S$. If $b$ points
of $S$ are on the hull boundary, Euler's formula gives
$2|S|-b-2$ triangular faces. Each nondegenerate lattice
triangle has area at least half the lattice covolume,
which is at least $\sqrt3/2$. To see the latter bound,
take a shortest vector $u$ and extend it to a basis
$u,v$. The shortest vector is primitive in the lattice.
Reduce $v$ by multiples of $u$ so its projection onto
$u$ has magnitude at most $|u|/2$. Since $|v|\ge|u|\ge1$,
the covolume is at least $\sqrt3\,|u|^2/2$.

Consequently, by the directional bound,

```math
 |S|\le \frac{2\operatorname{area}(H)}{\sqrt3}
           +\frac b2+1
     \le \frac{L^2}{2}+\frac32\lfloor L\rfloor+1.
```

For $L\lt k$ the right side is strictly below $n_k-3/2$,
so the integer count is at most $n_k-2$. A collinear
packing has at most $\lfloor L\rfloor+1$ centers and
also meets the desired bound when $L\lt k$.
The aligned triangular lattice attains side $k$
after deleting one site.

The same proof applies to any packing with a triangulation
whose faces all have area at least $\sqrt3/4$. Conversely,
suppose an unrestricted counterexample $S$ has $n_k-1$
centers in a triangle of side $L\lt k$. It has at least
$k^2+1$ triangular faces in any triangulation, since
$b\le3k-3$. Its hull has area strictly less than
$k^2\sqrt3/4$. Therefore every triangulation has at least
two faces of area less than $\sqrt3/4$: a single deficient
face could contribute a deficit no greater than $\sqrt3/4$.

In a Delaunay triangulation, each of these faces has
circumradius greater than one. Indeed, if a triangle has
all sides at least one and circumradius at most one, each
angle is at least $30^\circ$ by the sine rule. Its largest
angle lies in $[60^\circ,120^\circ]$. The two sides incident
to this angle then give area at least $\sqrt3/4$.
Each of the deficient Delaunay faces also has circumcenter
outside the containing triangle. Otherwise the empty
circumdisk would allow adding that circumcenter to the
packing, contrary to Oler's bound for $n_k$ centers.

The remaining problem is to control these exterior
circumcenters and the total area deficit of their faces.

## Local rigidity after deleting any site

Let $V_k$ be the aligned triangular lattice patch of side $k$,
and remove any one site $o$. The packing $V_k\setminus\{o\}$
is infinitesimally rigid inside the fixed containing triangle.
In fact, if another packing in the same triangle can be put
in correspondence with these sites so that each displacement
has norm less than $1/(2000 k^2)$, all displacements are zero.
This concerns perturbations of a single-deletion configuration.
A global comparison with all possible packings is still needed.

### Balancing contact forces

Start with the full lattice patch. Give weight one to every
unit contact. At a site $v$ let the force be the sum of the
weighted unit vectors from $v$ to the sites that touch it.
The force is zero at interior sites. At a side site it is
$\sqrt3$ times the inward unit normal. At a corner it is
$\sqrt3$ times the sum of the two inward unit normals.

After deleting $o$, double the weight of each contact joining
consecutive surviving neighbors in the unit ring about $o$.
If a neighbor $o+e$ has its two adjacent ring neighbors
$o+e_-,o+e_+$, the added force there is
$e_-+e_+-2e=-e$. This replaces the original force of the
contact with $o$ exactly.

If $o$ is on a side or at a corner, the surviving part of the
ring is a path. At either endpoint $o+e$, the net change in
force after the deletion and doubling is the one adjacent
unit vector in the ring. Write that vector as
$e/2+(\sqrt3/2)n$, with $n$ the inward unit normal to the
wall along $e$. From $o+e$ follow that wall in direction $e$
to the next corner. Reduce the weights of all contacts along
this segment from one to one half. If the segment has positive
length, this removes the tangential component at its starting
point, leaves the net force unchanged at intervening points,
and adds $e/2$ to the force at its far corner. If the segment
has length zero, the force change $e/2+(\sqrt3/2)n$ is already
at that corner.

The two endpoints lead to different corners, so each remaining
corner receives at most one tangential adjustment. In terms of
the two inward unit normals at the far corner, adding $e/2$
reduces their coefficients by $1/(2\sqrt3)$ and $1/\sqrt3$,
in some order. Thus at every surviving boundary site the
modified force is still a positive sum of all its active
inward normals, with each coefficient at least $2/\sqrt3$.
Every contact weight is between one half and two.

### Infinitesimal motions

Give each surviving site $v$ a velocity $u_v$ that is feasible
to first order. An edge $vw$ requires
$(w-v)\cdot(u_w-u_v)\ge0$. At every active wall with inward
normal $n$, we require $n\cdot u_v\ge0$.
Sum the edge derivatives with the modified weights. By the
force balance, the sum is the negative of the sum of inward
wall derivatives with their positive coefficients.
Hence all edge derivatives and all wall derivatives vanish.

At a remaining corner both wall projections vanish, so the
velocity is zero. Each connected part of a side after one
deletion contains a remaining corner. Along that part, the
side's unit contacts carry the zero tangential projection
from the corner to every site, and the zero wall derivative
gives the other projection. All boundary velocities are zero.

At an interior site, two of the three lattice-direction rows
through the site avoid $o$. Indeed, express the sites by three
integer barycentric coordinates summing to $k$. A row in one
direction fixes one coordinate, and two distinct sites cannot
agree in two coordinates. The velocities along each intact
row have equal projections into its direction, by the contact
derivatives, and the endpoints are on the boundary. Thus the
two corresponding projections at the interior site are zero.
The directions are independent, so this velocity is zero as
well.

### A displacement bound

For an actual packing inside the same triangle, let
$\varepsilon=\max_v|u_v|$, now with $u_v$ the displacement
of the point matched to site $v$. Put
$\tau_{vw}=(w-v)\cdot(u_w-u_v)$ for each unit contact.
The condition on the new length gives $\tau_{vw}\ge-2\varepsilon^2$,
and all inward wall projections of displaced sites are
nonnegative. There are at most $9k^2$ contacts. The sum of the
negative parts of the weighted edge derivatives is at most
$36k^2\varepsilon^2$. The force identity bounds the sum of the
positive parts of the weighted derivatives and the total
weighted wall projection by this same quantity. In particular,

```math
 \sum_{vw}|\tau_{vw}|\le144 k^2\varepsilon^2,
 \qquad
 0\le n\cdot u_v\le36 k^2\varepsilon^2
       \quad\text{at each active wall}.
```

At a corner the two projections imply
$|u_v|\le144k^2\varepsilon^2$. Along every side component,
the first inequality bounds the variation of the tangential
projection from its remaining corner. Together with the wall
projection this gives $|u_v|\le324k^2\varepsilon^2$ at each
boundary site. At any interior site, the two intact rows give
two directional projections each at most
$468k^2\varepsilon^2$ in absolute value. For unit directions
meeting at $60^\circ$ or $120^\circ$, a vector's norm is
at most twice the sum of its two absolute projections.
Consequently $\varepsilon\le1872 k^2\varepsilon^2$.
If $\varepsilon\lt1/(2000k^2)$ then $\varepsilon=0$,
as asserted.
