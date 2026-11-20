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
at most $3\lfloor L\rfloor$ boundary vertices. Atoms on a
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
The aligned triangular lattice gives the equality case
at side $k$ by deleting one site.

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
