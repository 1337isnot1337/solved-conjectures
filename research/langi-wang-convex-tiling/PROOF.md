# Lángi–Wang's convex tiling question

We answer all parts of Lángi and Wang's Question 5.1 (Question 5.6 in arXiv v4): the lower circular average number of sides is at most six, the upper circular average can be infinite, and there are infinitely many tiles with at most six sides. As a corollary, the minimax isoperimetric question in Croft–Falconer–Guy C15, formulated as Steinhaus's conjecture by Lángi and Wang, holds for all convex tilings. This does not settle the general nonconvex C15 formulation.

## Setting and statement

Let \(\mathcal T\) tile \(\mathbb R^2\) by compact convex tiles with nonempty, pairwise disjoint interiors. Write \(\operatorname{ir}(C)\), \(\operatorname{cr}(C)\), and \(v(C)\) for the inradius, circumradius, and number of geometric sides of tile \(C\). Suppose there are constants \(\lambda,\mu>0\) with
\[
\operatorname{ir}(C)\ge\lambda,\qquad \operatorname{cr}(C)\le\mu\operatorname{ir}(C)
\quad(C\in\mathcal T).
\]
The tiles need not have a common upper bound on their sizes. Let \(B_R\) be the closed disk of radius \(R\) about the origin, \(S_R=\{C\in\mathcal T:C\subseteq B_R\}\), and, when \(S_R\ne\varnothing\), let \(v_R=\sum_{C\in S_R}v(C)/|S_R|\).

**Theorem.** Under these assumptions \(\liminf_{R\to\infty}v_R\le6\). In particular, there are infinitely many tiles with at most six sides. There is a tiling under the same assumptions, even with \(\lambda=1\) and \(\mu=20\), for which \(\limsup_{R\to\infty}v_R=+\infty\).

## Lower circular average

Put \(D(C)=\operatorname{diam}(C)\). Since \(\operatorname{cr}(C)\ge D(C)/2\), every tile contains a disk of radius at least \(D(C)/(2\mu)\).

First, the tiling is locally finite. For a tile \(C\) meeting \(B_R\), choose \(x\in C\cap B_R\) and apply to \(C\) the homothety about \(x\) of ratio \(\lambda/\operatorname{ir}(C)\le1\). The image is contained in \(C\) by convexity, has diameter at most \(2\mu\lambda\), and contains a disk of radius \(\lambda\). All such disks lie inside \(B_{R+2\mu\lambda}\) and have disjoint interiors, proving that only finitely many tiles meet \(B_R\). In particular, each tile is a polygon: each boundary point belongs to another tile (approach it from outside and use local finiteness), and the intersections with those finitely many other tiles are points or line segments because the tiles are convex with disjoint interiors.

Use the contact graph in which two tiles are adjacent if their intersection contains a nondegenerate segment. This is a simple planar graph: choose one contact point on each segment, away from all other contacts and tile vertices, and join it to an interior point of each incident tile. The segments inside a tile from its interior point to distinct boundary points intersect only at the interior point, by convexity. The choice of contact points is possible because a segment in the relative interior of a side has on each side at most one tile occupying an open strip locally around an interior point of the common contact; equivalently, any third tile can meet the contact segment only at a tile vertex or an endpoint, of which there are finitely many locally. Every side of a tile has at least one segment-contact neighbor, and one neighbor cannot account for two different sides (their shared convex intersection would then contain noncollinear segments). Thus a tile's graph degree is at least \(v(C)\).

For a finite vertex set \(S\) and its outside neighbor set \(\partial S\), the planar edge bound \(e(J)\le3|V(J)|\) gives
\[
\sum_{C\in S} v(C)
\le \sum_{C\in S}\deg(C)
=e(S)+e(S\cup\partial S)-e(\partial S)
\le 6|S|+3|\partial S|.
\tag{1}
\]
Here \(e(X)\) means the number of edges in the induced subgraph on \(X\).

We find radii where \(|\partial S_R|/|S_R|\) tends to zero. Put \(N(R)=|S_R|\). By disjointness of the inballs of radius \(\lambda\), \(N(R)\le (R/\lambda)^2\). Also \(N(R)\to\infty\), since the total collection is infinite and every finite set of tiles fits in some disk. There are arbitrarily large \(R\) with
\[
N(3R)\le10N(R).
\tag{2}
\]
Otherwise the sequence \(N(3^j)\) would eventually grow by a factor greater than \(10\) at each step, contradicting its upper bound \(\lambda^{-2}9^j\).

For any \(R>0\), write \(\mathcal A_R\) for the finite set of tiles meeting the closed band \(R\le\|x\|\le2R\), and let \(w(C)=\min(1,D(C)/R)\) for \(C\in\mathcal A_R\). For each such tile choose \(x\) in its intersection with the band and contract the tile about \(x\) by \(\eta=\min(1,R/D(C))\). Its image lies in \(C\cap B_{3R}\) and contains a disk of radius at least \(\eta D(C)/(2\mu)=Rw(C)/(2\mu)\). The disks have disjoint interiors. Therefore
\[
\sum_{C\in\mathcal A_R} w(C)^2\le36\mu^2.
\tag{3}
\]
Tiles in the band of diameter at most \(R\) are wholly inside \(B_{3R}\); those with diameter greater than \(R\) have \(w=1\). Thus
\[
|\mathcal A_R|\le N(3R)+36\mu^2.
\tag{4}
\]

Let \(b(t)\) count tiles that meet the circle of radius \(t\). A single tile can contribute to \(b(t)\) over a set of \(t\)'s of length at most \(D(C)\), because the radius function is \(1\)-Lipschitz and its range over the tile has diameter at most \(D(C)\). Thus by Cauchy–Schwarz, (3) and (4),
\[
\frac1R\int_R^{2R} b(t)\,dt
\le\sum_{C\in\mathcal A_R}w(C)
\le6\mu\sqrt{N(3R)+36\mu^2}.
\tag{5}
\]
For \(R\) satisfying (2), choose \(t\in[R,2R]\) with \(b(t)\le6\mu\sqrt{10N(R)+36\mu^2}\). An outside neighbor of \(S_t\) has a point in \(B_t\) from the contact and a point outside \(B_t\) by its exclusion from \(S_t\). Convexity shows that it meets the circle of radius \(t\), so \(|\partial S_t|\le b(t)\). As \(N(t)\ge N(R)\to\infty\), along these radii
\[
\frac{|\partial S_t|}{N(t)}\le
\frac{6\mu\sqrt{10N(R)+36\mu^2}}{N(R)}\longrightarrow0.
\]
Inequality (1) proves the lower average bound. Since all tiles have at least three sides, the same sequence of radii has at least \(1/4-o(1)\) of its contained tiles with at most six sides: if their fraction is \(p\) then \(v_t\ge 3p+7(1-p)\). This proves the existence assertion in stronger form.

## Infinite upper circular average

We construct nested finite tilings of squares. Start with the single square \([-1,1]^2\). Assume that an entire square \(Q=[-s,s]^2\) has been tiled in earlier stages, with \(M\) tiles. Choose \(n=4\cdot2^j\) with \(j\ge1\), and a radius \(R\ge\max(8s,n)\). Write \(P_n(R)\) for the regular \(n\)-gon on the circle of radius \(R\) with a vertex at angle \(\pi/4\) and the remaining vertices equally spaced.

Fill \(P_n(R)\setminus Q\) with four convex tiles, one for each side of \(Q\). The upper tile is
\[
P_n(R)\cap\{(x,y):y\ge |x|,\ y\ge s\},
\]
and the other three are its rotations by multiples of \(\pi/2\). These four closed tiles and \(Q\) partition \(P_n(R)\) up to shared boundaries: outside \(Q\), choose a coordinate of largest absolute value and its sign. Each new tile contains a radius-\(R/8\) disk, e.g. centered at \((0,R/2)\) for the upper tile. That disk lies inside the wedge, above \(y=s\), and inside the inscribed circle of \(P_n(R)\), whose radius is at least \(R/\sqrt2\). The circumradius of each tile is at most \(R\), so the aspect ratio is at most \(8\).

Each wedge ray through a diagonal of \(Q\) passes through a vertex of \(P_n(R)\). Each of the four tiles has the \(n/4\) geometric sides of \(P_n(R)\) along its outer arc. These edges are fully retained beyond the square side: for any point on that outer arc one has \(y\ge R/2>s\) in the upper wedge, since its norm is at least \(R/\sqrt2\) and \(y\ge\|(x,y)\|/\sqrt2\); the other wedges follow by rotation. These are true sides, not subdivisions into collinear pieces.

We next tile from \(P_n(R)\) to a larger square without introducing a tile wholly contained in \(B_R\). The following coarsening step takes a regular \(m\)-gon of circumradius \(r\), where \(m\ge8\), to a concentric \((m/2)\)-gon. Retain every other vertex ray, including the one at angle \(\pi/4\). Put
\[
\Delta=2\pi/m\le\pi/4,\qquad r'=r(1+2\Delta).
\]
Use those retained rays for the outer vertices at radius \(r'\). The outer inradius is \(r'\cos\Delta\), which is at least \(r+r\Delta\): indeed \(\cos\Delta\ge7/10\) and \(1-\cos\Delta\le\Delta^2/2< (2/5)\Delta\).

Divide the annulus between the two polygons into the \(m\) sectors bounded by pairs of consecutive *old* vertex rays. In one sector, the inner polygon boundary is a single old chord, and the outer boundary is either half of one new chord or the other half, since each new chord spans two consecutive old sectors. The corresponding tile is the intersection of the sector with the exterior closed half-plane of the old chord (away from the origin) and the interior closed half-plane of the new chord (towards the origin). This is a compact convex quadrilateral; these tiles fill the closed annulus with disjoint interiors.

Every such sector contains the entire radial strip of radii \(r\) through \(r+r\Delta\) within that sector. A disk of radius \(r\Delta/4\) centered on its bisector at radius \(r+r\Delta/2\) lies in the strip and in the sector. For the ray constraints, the center's distance to either side is at least \(r\sin(\Delta/2)\ge r\Delta/\pi>r\Delta/4\). For the diameter, radii in the quadrilateral lie between \(r\cos(\Delta/2)\) and \(r'\), and directions differ by at most \(\Delta\). The triangle inequality bounds the distance between any two of its points by
\[
r\big(2\Delta+1-\cos(\Delta/2)\big)+r'\Delta \le 5r\Delta.
\]
Indeed \(1-\cos(\Delta/2)\le\Delta^2/8\) and \(\Delta\le\pi/4\). Thus the circumradius-to-inradius ratio is at most \(20\). The initial value \(r\Delta=2\pi R/n\) is at least \(2\pi\), and it increases in later steps since the radius increases and \(\Delta\) doubles. All these tiles have inradius at least \(1\).

After finitely many coarsening steps \(m=4\) and the resulting polygon is an axis-aligned square. Its inradius is greater than \(R\). Each transition tile lies at least partly outside \(B_R\): in its sector it has points of radius greater than its inner circumradius \(r\), and \(r\ge R\). The next stage starts from the larger square. The square sizes increase without bound because \(R\ge8s\), so the stages eventually tile the entire plane.

At the intermediate test radius \(R\) of a stage, the tiles wholly contained in \(B_R\) are precisely the \(M\) old tiles and the four new convex tiles; no coarsening tile or future tile qualifies. Their total side count is at least \(n\). Choose the stages with \(n\ge j_0(M+4)\) for stage index \(j_0\to\infty\), which is possible by using sufficiently large powers of \(2\). The average at the test radius is then at least \(j_0\), so the upper circular average is infinite. All tiles satisfy the stated common inradius and aspect bounds.

## Convex minimax isoperimetric corollary

Let \(\mathcal T\) be any convex planar tiling with a common positive lower bound \(D_0\) on tile diameters. If \(\sup_C \operatorname{perim}(C)^2/|C|=+\infty\), it already exceeds the regular hexagonal value. Otherwise put \(J=\sup_C\operatorname{perim}(C)^2/|C|<\infty\).

For a tile of diameter \(D\), choose diameter endpoints \(p,q\), and let \(W\) be its projection width perpendicular to \(pq\). Its area \(A\le DW\) by enclosing in a rectangle of side lengths \(W\) and at most \(D\). Some point of the tile has distance at least \(W/2\) from the line \(pq\). The triangle it forms with \(p,q\) lies in the tile, has area at least \(DW/4\ge A/4\), and has perimeter at most \(3D\). Its inradius is at least \(A/(6D)\). The tile's perimeter is at least \(2D\), from the two boundary paths between \(p,q\); hence \(A\ge4D^2/J\). Consequently
\[
\operatorname{ir}(C)\ge\frac{2D}{3J}\ge\frac{2D_0}{3J},
\qquad
\frac{\operatorname{cr}(C)}{\operatorname{ir}(C)}\le\frac{3J}{2}.
\]
For the perimeter-length inequality one may first define length as the supremum over inscribed polygon lengths, so no local polygon assumption is needed in deriving these bounds. The tiling therefore falls under the theorem.

Some tile has at most six sides. By the polygonal isoperimetric inequality, an \(m\)-gon has ratio at least \(4m\tan(\pi/m)\), the ratio of the regular \(m\)-gon. This constant decreases with \(m\ge3\), so for \(m\le6\) it is at least \(8\sqrt3\). The regular hexagonal tiling attains \(8\sqrt3\), proving the exact minimax value in the convex class. Lángi–Wang's Theorem 5.2 (Theorem 5.3 in arXiv v4) also lets one transfer the lower-side-average bound to the lower-average isoperimetric comparison in their normed setting.

## References and scope

- Z. Lángi and S. Wang, [The Honeycomb Conjecture in Normed Planes and an Alpha-Convex Variant of a Theorem of Dowker](https://doi.org/10.1093/imrn/rnaf372), *IMRN* 2026(1), [arXiv:2406.10622v4](https://arxiv.org/pdf/2406.10622v4). Question 5.1 (Question 5.6 in arXiv v4) asks about the two circular averages and, failing both bounds, a tile with at most six sides. Their Example 5.1 (Example 5.7 in arXiv v4) addresses an upper average for **square** windows; the construction here is for disk windows and does not count collinear subdivisions as geometric sides. Their Theorem 5.1 (Theorem 5.2 in arXiv v4) answers the isoperimetric question for normal convex tilings, with a common upper bound on circumradii; the argument above uses no such upper bound.
- H. T. Croft, K. J. Falconer and R. K. Guy, [*Unsolved Problems in Geometry*](https://doi.org/10.1007/978-1-4612-0963-8) (Springer, 1991), Problem C15, p. 96. The congruent-unit-area Steinhaus formulation is covered by Hales's honeycomb theorem. The minimax formulation for varying tile sizes is the subsequent broader question in C15. Our corollary addresses only this broader formulation within the convex class.
- No external review or absolute priority is claimed.
