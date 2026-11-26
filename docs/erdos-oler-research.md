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
$(x_0,y_0)$ and ends at $(x_1,y_1)$, with minimum height $`y_*`$,
its total variation in height is $`y_0+y_1-2y_*`$. Its length
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

**Proposition.** The Erdős–Oler lower bound holds, for every
$k$, for centers lying in a translate of any lattice whose minimum
nonzero vector length is at least one. The lattice orientation and
shape are arbitrary. Equality is attained in the class of such
packings by the aligned triangular lattice.

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
the covolume is at least $`\sqrt3\,|u|^2/2`$.

Consequently, by the directional bound,

```math
 |S|\le \frac{2\mathop{\mathrm{area}}(H)}{\sqrt3}
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

The [boundary-face analysis](erdos-oler-boundary-faces.md) shows that a counterexample can be assumed to occupy all three corners. Its exterior Delaunay faces lead to individual boundary edges, and the total normalised area of the deficient faces is less than $1+\sqrt3$. The possibility of several very thin deficient faces remains.

## Local rigidity after deleting any site

Let $V_k$ be the aligned triangular lattice patch of side $k$,
and remove any one site $o$. The packing $`V_k\setminus\{o\}`$
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

## A separation radius independent of the side length

The local rigidity radius can be chosen uniformly in $k$.
There is an absolute $c>0$ such that a packing in the same
triangle matched to a single-deletion triangular arrangement
with maximum displacement less than $c$ must coincide with
that arrangement. The proof combines the contact stress with
a discrete strain inequality.

### Extending through the deleted site

Use the standard small equilateral faces of side one in
the full lattice patch. For a vector-valued displacement $u$
write $E_{\rm str}(u)$ for the sum of the squares of its
projected contact differences $\tau_{vw}$ and of all its
normal projections on active walls. In this definition use
only the surviving sites and their contacts.

We first extend $u$ to the missing site so the same strain
energy on the full patch is at most $C E_{\rm str}(u)$ with
an absolute $C$. It suffices to take $k\ge6$, since the explicit
displacement bound above treats smaller $k$.
In integer barycentric coordinates, write the deleted site
as $(a_1,a_2,a_3)$ with $a_1+a_2+a_3=k$. Choose integers
$\min(a_j,2)\le b_j\le a_j$ with $b_1+b_2+b_3=6$.
This is possible since the sum of the lower bounds is at
most six and the sum of the upper bounds is $k$.
The sites with coordinates at least $a_j-b_j$ in each
position form an aligned triangle of side six. The hole
has local coordinates $(b_1,b_2,b_3)$. The small triangle
contains every contact incident to the hole in the full
triangle. Each local side for which the corresponding
$b_j\le1$ is a wall of the full triangle, since in that
case $b_j=a_j$.

On the small patch, use the energy of the surviving
contacts and the normals on those physical walls. Consider
its kernel. Zero projected difference on each edge of a
unit triangle makes the displacement on it infinitesimally
rigid. A common edge forces the same rigid motion on two
neighboring triangles. This follows because an infinitesimal
rigid motion in the plane is a translation plus a scalar
multiple of rotation by a right angle, and two point values
determine it.

If at most one local coordinate is at most one, the union
of the removed unit triangles meets at most one side.
The other unit triangles are connected by common edges
and contain every surviving vertex. For the connectivity,
the removed triangles form the hexagon of unit neighbors
of the hole, clipped by the containing triangle in the
boundary case. Its complement has connected interior
when it meets at most one outer side. Each surviving
interior vertex belongs to six original unit triangles,
and each noncorner boundary vertex belongs to three.
At most two incident triangles can be removed at any
one surviving vertex. No corner is a neighbor of the hole
in this case. Thus the kernel displacement is one rigid
motion on the patch, and its value at the hole gives zero
projected difference on the restored contacts. If the hole
is on a physical wall, this rigid motion already has zero
normal projection at two surviving sites on that wall,
so it also has zero normal projection at the hole.

The cases with two local coordinates at most one are,
up to permuting the coordinates, $(0,0,6)$, $(0,1,5)$ and
$(1,1,4)$. For $(0,0,6)$ the deleted site is the corner.
The remaining unit triangles form the truncated triangular
patch and are connected by edges. The two physical walls
through the corner constrain the resulting rigid motion
to zero.

For $(0,1,5)$ let $O$ be the nearby corner and let $e_1,e_2$
be the two unit directions along its sides, with the hole
at $O+e_2$. The corner is the only surviving site in no
remaining unit triangle. The bulk triangles form a connected
patch meeting both physical walls in runs of at least two
sites. These wall projections force its rigid motion to
vanish. The corner has two wall projections and is fixed.
For $(1,1,4)$ the hole is at $O+e_1+e_2$. The closed hexagon
of removed triangles meets the two sides of $O$ between
distances one and two on each side. It leaves the separate
unit triangle with vertices $O,O+e_1,O+e_2$ and the connected
bulk patch. Each component has contacts with both physical
walls on intervals, giving zero motion on each. In these
three cases the zero extension at the hole works for the
kernel.

There are finitely many choices of the hole in the side-six
patch. In each pattern choose a linear extension at the hole
that agrees with the indicated one on the kernel of the
local strain energy. For example, extend its orthogonal
projection to that kernel and set the complementary part to
zero at the hole. The resulting projected differences on
the new contacts and wall projections at the hole form a
linear map vanishing on the kernel. Its squared norm is
therefore at most a constant times the local strain energy
by equivalence of norms on the finite-dimensional quotient.
Taking the maximum constant gives the claimed extension
estimate uniformly.

### From strain to full displacement differences

Interpolate the extended displacements affinely on each
small equilateral face, obtaining a continuous function
$U$ on the triangle $T_k$. Korn's inequality on the unit
triangle, followed by dilation, gives

```math
 \int_{T_k}|\nabla U|^2
  \ll \int_{T_k}|\mathop{\mathrm{sym}}\nabla U|^2
     + k^{-1}\int_{\partial T_k}|U\cdot n|^2 .
```

Here is the boundary step in this form of the inequality.
On the unit triangle, the usual Korn inequality modulo
infinitesimal rigid motions bounds $U-R$ in $H^1$ for an
appropriate rigid motion $R$. The trace estimate controls
the boundary normal projection of $U-R$. A rigid motion
with zero normal projection along the triangle boundary
must be zero, since it would be tangent along two
nonparallel line segments. Its norm is therefore controlled
by its normal trace by finite dimensionality. The factor
$k^{-1}$ comes from scaling boundary length. See
[Ayuso de Dios, Brezzi, Marini, Xu and Zikatanov, §2](https://mate.unipv.it/brezzi/papers/XXXXX.pdf)
for the normal-trace argument in Korn inequalities.

On each unit face the three directional projections along
its edges determine the symmetric part of the gradient.
Thus the integral of $|\mathop{\mathrm{sym}}\nabla U|^2$
is bounded by a constant times the sum of the squared
contact projections. The boundary integral is bounded
by the sum of the squared normal projections at the lattice
sites by linear interpolation. The integral of $|\nabla U|^2$
controls the sum of squares of the full vector differences
across the surviving contacts. By the extension estimate,

```math
 E:=\sum_{vw}|u_w-u_v|^2 \ll E_{\rm str}(u)
```

with a constant independent of $k$ and of the deleted site.

For an actual packing in the same triangle we have
$\tau_{vw}\ge-|u_w-u_v|^2/2$, and the wall projections are
nonnegative. The contact stress implies that the sum of
absolute contact projections and the sum of nonnegative
wall projections are both $O(E)$. If
$\varepsilon=\max_v|u_v|$, each projection has absolute
value at most $2\varepsilon$. Hence
$E_{\rm str}(u)\ll\varepsilon E$. The two inequalities
force $E=0$ when $\varepsilon$ is below an absolute
constant. Then all the contact and wall projections
vanish, and the earlier rigidity argument gives $u=0$.
