# A positive gap for pinned distances with arbitrary collinearities

**Theorem.** There are absolute constants $`c>0`$ and $`n_0`$ such that, for every planar $`n`$-point set $`P`$ with $`n\ge n_0`$ and no four cocircular points, the sum of its pinned positive-distance counts exceeds $`(1/3+c)n^2`$. In particular some pin determines more than $`(1/3+c)n`$ distinct positive distances. This is the arbitrary-collinearity relaxation proposed after display (4) on p. 168 of Erdős's 1987 paper. [Primary source](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Catalogue question](https://www.erdosproblems.com/654) · [Issue 922](https://github.com/1337isnot1337/solved-conjectures/issues/922).

The conclusion answers the one-third question and its stronger averaged version. Erdős also asked about a weaker geometric hypothesis which bounds just the circles centered at a site. The reflected-pair argument below uses the four-point prohibition for circles with arbitrary centers. The near-one bound has a separate counterexample. This proof does not give numerical constants.

Codex developed this argument in the WadeDavis research session, building on the project’s earlier counting and reflection results.

Suppose the theorem fails. The trivial lower bound is $`n(n-1)/3`$, so there is a sequence tending to infinity in size with sum $`(1/3+o(1))n^2`$. Write $`A_j`$ for the number of pin–radius classes of size $`j`$, for $`1\le j\le3`$. If $`D`$ is the sum of the pinned counts, $`3D-n(n-1)=2A_1+A_2=o(n^2)`$. Thus all but $`o(n^2)`$ ordered pin–site pairs belong to classes of size three. Call such pairs good. A uniform ordered good quadruple $`(X,Y_1,Y_2,Y_3)`$ lists a pin and all three bases on one circle, in random order. Each pin–base law differs from the product of the uniform site laws by $`o(1)`$ in total variation, and the bases are exchangeable. A prescribed base pair whose perpendicular bisector contains at most $`K`$ pins has at most $`K`$ completions for fixed base positions. Its restricted law is bounded by $`O(K)`$ times the independent site-pair law.

We use two earlier incidence results, with proofs reproduced in the appendices. First, the maximum number $`s_n`$ of collinear sites is $`o(n)`$ on such a sequence (Appendix A). Second, suppose source and target sites are each distributed in assigned sets on distinct lines within each family. If both line counts tend to infinity, their sizes lie between $`T`$ and $`CT`$ with $`T\to\infty`$ and fixed $`C`$, and no orientation contains a positive proportion of the source lines, then a vanishing fraction of all source–target site pairs admit a distinct reflected partner on the same assigned target line. A reflected partner of $`y`$ at a pin $`x`$ is a site $`z\ne y`$ at the same distance from $`x`$. The two line families may overlap (Appendix B).

## A local bound for three bases

For arbitrary subsets of $`p`$ pins and $`s`$ bases of $`P`$, write $`T(p,s)`$ for the number of centered triangles with pin in the first set and **all three** bases in the second. Uniformly in these subsets,

```math
T(p,s)\ll p^{2/3}s^{4/3}+s^2+n^{17/9}.
```

If two distinct endpoint pairs reflect across the same line, the pairs are disjoint and all endpoints are collinear. In coordinates with vertical reflecting line the pairs are $`(\pm u,a)`$ and $`(\pm v,b)`$. If $`a\ne b`$, the equation $`u^2+(a-h)^2=v^2+(b-h)^2`$ has a solution, giving four cocircular points. Call the line joining an endpoint pair its carrier.

Take all carriers containing between $`t`$ and $`2t`$ base sites, with dyadic $`t\ge2`$ and half-open bands. The rich-line bound of Szemerédi and Trotter gives $`O(s^2/t^3+s/t)`$ carriers and hence total multiplicity $`W=O(s^2/t+st)`$ of their unordered pairs. Give each perpendicular bisector weight equal to the number of these pairs it reflects. By the collinearity observation all these pairs for any one bisector are on the same carrier, are disjoint, and thus have total weight at most $`t`$. Group axes dyadically by weight $`d`$, with at most $`W/d`$ in such a group. Apply the point–line incidence theorem with the $`p`$ pins and multiply by $`2d`$. The mixed and pin terms are geometric sums and the line-count terms are bounded by twice the actual weight sum. The result is
```math
O(p^{2/3}W^{2/3}t^{1/3}+pt+W)
=O(p^{2/3}s^{4/3}t^{-1/3}+p^{2/3}s^{2/3}t+pt+s^2/t+st).
```

Sum through $`S=n^{5/9}`$, truncating the last band. The result is $`O(p^{2/3}s^{4/3}+s^2+n^{17/9})`$. Each pin–pair incidence extends to at most one triangle, by the circle cap of three. There are $`h=O(s^2/S^3+s/S)=O(n^{4/9})`$ larger carriers. A triangle with two sides on larger carriers must have a vertex at one of $`O(h^2)`$ intersections. Each vertex belongs to at most $`n`$ centered triangles, one for each pin. This costs $`O(n^{17/9})`$ and proves the bound. [Incidence theorem, Solymosi–Tóth, Theorem 6](https://doi.org/10.1007/s00454-001-0009-z).

## Farthest-site sampling forces many convex-hull vertices

Let $`h_m`$ be the number of convex-hull vertices of $`m`$ independent sites, sampled with replacement. We show that for every sufficiently large fixed $`m`$, $`\liminf_{n\to\infty}\mathbb E h_m/m`$ is bounded below by one absolute positive constant. In this section let the full sample size be $`2m`$. It consists of distinct sites with no three collinear with probability $`1-o_n(1)`$, since a line determined by two distinct sites contains at most $`s_n=o(n)`$. Such samples will be called regular. No four can be cocircular.

Enclose all the sites in the interior of a fixed rectangle for this $`n`$. For a regular sample, construct its farthest-site Voronoi subdivision inside that rectangle. Each cell is the intersection of the rectangle with the half-planes on which its owner is at least as far as each competitor, hence is convex. An owner of a cell with interior is an extreme sample site, by strict convexity of squared distance. The full-plane subdivision has $`O(h_{2m})`$ edges and vertices: the cells are full-dimensional for extreme sites, every pair of convex cells shares at most one edge, and their adjacency graph is planar and simple. Equivalently this is the projection of the upper faces of the paraboloid lift. Clipping to the rectangle adds at most a constant times the number of existing edges and cells. Choose its frame directions, positions and the direction of the vertical subdivision generically for the finite ambient set, so no unintended aligned vertices, parallel vertical edges or corner incidences occur, including for its subsamples. Intrinsic Voronoi ties at ambient sites are allowed.

Vertically subdivide each convex cell into trapezoids, with triangles at degenerate ends, through the vertices of that cell. This gives $`O(h_{2m})`$ pieces, counted with their owner. Use their closures to assign boundary pins arbitrarily among incident pieces. For each piece $`\Delta`$ with owner $`u`$, let $`B_\Delta`$ consist of ambient sites $`z`$ which strictly beat $`u`$ at some point of the interior of $`\Delta`$. Write $`b_\Delta=|B_\Delta|/n`$. Strictly beating the owner at any boundary pin also implies beating it at interior points by continuity. All sample sites avoid $`B_\Delta`$.

Each piece persists unchanged upon deleting any sample sites except a set of at most seven defining sites. Retain the owner, the competitor supporting each non-frame top or bottom edge, and the competitors supporting the two incident edges of each cell vertex generating a vertical wall, allowing repetitions and frame edges. At every interior abscissa between the walls the retained inequalities bound the old vertical fibre on both ends, so it cannot enlarge. The generating vertices at the walls stay extreme intersections of retained nonparallel boundaries, and the old feasible portions remain. Hence the vertical decomposition between those walls persists with no inserted wall. This argument also covers a vertex or boundary edge coming from the rectangle.

Use the first $`m`$ sites as a random half sample $`R`$. Given the full set of sample labels, their split is uniform by exchangeability. For sufficiently large $`m`$, the chance that all defining sites of a specified regular full-sample piece survive is at least an absolute constant $`c_0>0`$. Conversely a surviving piece of $`R`$ that occurs in the full sample must have been missed by all the additional $`m`$ independent draws from $`B_\Delta`$. Define the family of pieces to be empty for an irregular sample. A regular full sample has regular half samples. For $`k=2,4`$ these observations give

```math
\mathbb E\sum_{\Delta\text{ full}}b_\Delta^k
\le c_0^{-1}\mathbb E\sum_{\Delta\text{ in }R} b_\Delta^k(1-b_\Delta)^m
\ll m^{-k}\mathbb E h_m.
```

For a fixed regular full sample let $`a_\Delta`$ be the fraction of pins assigned to its piece. If a good pin–base pair has radius larger than the pin's farthest sampled radius, all three bases are in $`B_\Delta`$. The local bound and Hölder's inequality bound the fraction of all such ordered pairs by
```math
O\left(\sum_\Delta a_\Delta^{2/3}b_\Delta^{4/3}
 +\sum_\Delta b_\Delta^2+m n^{-1/9}\right)
\ll\left(\sum_\Delta b_\Delta^4\right)^{1/3}
 +\sum_\Delta b_\Delta^2+O(m n^{-1/9}).
```
The factor of three for the possible first base is absorbed in the constant. For any fixed pin, among $`2m+1`$ independent sites each has chance $`1/(2m+1)`$ to be uniquely farthest up to $`o_n(1)`$ for fixed $`m`$. The chance of any equal radii is $`O(m^2/n)`$ since each radius has multiplicity at most three. Excluding bad initial pin–base pairs and irregular samples costs $`o_n(1)`$. Consequently, taking expectations and using concavity of the cube root,
```math
\frac1{2m+1}-o_n(1)
\ll m^{-4/3}(\mathbb E h_m)^{1/3}+m^{-2}\mathbb E h_m+O(m n^{-1/9}).
```
Taking $`n\to\infty`$ first proves the hull assertion.

## Rescaling at atoms

Fix $`b<1`$ sufficiently close to one, with the choice uniform over all near-extremal sequences. Normalize a smallest disk containing at least $`bn`$ sites to the unit disk by translation and positive dilation. In the one-point compactification pass to a subsequential limit with escaped mass $`e\le1-b`$. Use precisely $`\lceil bn\rceil`$ pins in that disk. A good pin–base pair whose base is outside the disk of radius $`R+2`$ has all three bases outside radius $`R`$. The local triangle count, first as $`n\to\infty`$ along a subsequence and then $`R\to\infty`$ through continuity radii for both disks, yields
```math
be\le C(b^{2/3}e^{4/3}+e^2)
```
with an absolute constant (including the three base positions). For $`b`$ sufficiently close to one this is impossible for $`0<e\le1-b`$. Thus the limiting measure is a probability on the plane. Its atoms have masses at most $`b`$, since every disk of radius less than one held less than fraction $`b`$, and open disks satisfy the lower Portmanteau bound.

At a node made of subsets $`Q_n`$ of positive limiting relative size, assume all but a vanishing fraction of internal pin–base pairs have all three sites on their circle inside $`Q_n`$. The root has this property. Normalize the node as above with its own size in place of $`n`$; its internal sets satisfy the same hypotheses, so let $`\lambda_Q`$ be the resulting tight probability limit. For each atom $`z`$ select a child consisting of the points of $`Q_n`$ in a disk $`B(z,r_n)`$ in parent coordinates. Choose $`r_n\downarrow0`$ slowly enough that the masses of both $`B(z,r_n)`$ and $`B(z,3r_n)`$ tend to the atom mass. This is possible along common continuity radii for the two disks. With countably many atoms use a growing finite prefix with disjoint child disks and a diagonal choice. Given an internal good pair in the child, all its parent mates are in the larger disk. Each mate has marginal within $`o(1)`$ of the uniform parent sites; the annulus has $`o(1)`$ parent mass. As the child has positive relative mass, it inherits the internal-pair property. In particular, conditioning a uniform parent quadruple on its pin and first base lying in a fixed child agrees up to $`o(1)`$ in total variation with that child's uniform internal quadruple law.

Construct and extract the tree on nested subsequences. There are countably many nodes, which can be processed with ancestors before children, then a diagonal subsequence taken far enough along each of the finitely many earlier choices to preserve all convergences. Record for each site its node indicators and its planar coordinate in each node it visits, using a separate dummy value elsewhere. The node coordinates can be compactified with one point at infinity; tightness ensures zero conditional mass there. Take a joint limit in the countable product for a site, for independent samples, and for uniform internal quadruples at every fixed node. Write $`\mu`$ for the limiting site law on these paths. Conditional on membership in $`Q`$, the site coordinate has distribution $`\lambda_Q`$. At a fixed atom the corresponding child is visited almost surely: membership forces that coordinate, and both mass limits equal its atomic mass. The countable union over atoms gives termination at the remaining coordinates. The one-site internal law is precisely the path law conditional on membership, and all internal quadruple marginals are this law by near-uniformity. Pin and base are asymptotically independent even with the additional site attributes in this encoding.

Two independent paths separate at distinct coordinates of a finite visited node almost surely. They cannot coincide at a terminal nonatomic coordinate. Conditional on a common node, the probability of proceeding into a common child is at most $`b`$, since each of its relative child masses is at most $`b`$. For a separating pair the difference direction at that node is the limit of its finite Euclidean directions, because the normalizations use only positive dilations and translations. This can be formalized by recording directions in a compact circle for independent pairs and taking a joint subsequence: the direction of a nonzero coordinate difference is continuous. The countable union of the separation events covers almost all independent pairs.

## A chain of positive mass

Partition oriented directions into eight congruent sectors of aperture $`\pi/4`$. Choose the rotation so no boundary is charged by the direction of an independent limiting pair, and no boundary equals a finite pair direction in the sequence. Only countably many rotations are excluded. In the boundary of a finite convex hull, the edges belonging to one sector form a consecutive chain in cyclic order. All differences within that chain lie in the sector or its negative, since the sector is a convex cone. The sum of the largest such chain sizes over the eight sectors is at least the number of hull vertices. By the hull bound, for one fixed sector and arbitrarily large $`m`$, the expected largest chain in an independent limiting sample of $`m`$ sites has size $`\Omega(m)`$. For fixed sample size comparability passes to the limit because every pair separates and avoids the sector boundaries. The sector and the positive constant can be chosen along a common unbounded sequence of sample sizes.

Write this sector as the intersection of two oriented half-planes through zero. Adjoin to each site the two empirical coordinate ranks of the defining linear forms, divided by $`n`$. The finite ranks have no ties in each order. Their limiting marginals $`U,V`$ are uniform on $`[0,1]`$. For independent paths the order in each limiting rank agrees almost surely with the sign of the corresponding linear form on the pair direction. The signs are almost surely determined by the paths. In particular $`U,V`$ are measurable functions of the path up to null sets. Indeed, if $`U'`$ is the rank of an independent copy, then conditional on the first augmented path the chance that $`U'<U`$ equals $`U`$. The order comparison is already a function of the two unaugmented paths, so integrating the second path yields a function of the first path alone. The same holds for $`V`$.

Comparability in these ranks is coordinatewise ordering. In an infinite independent rank sample the expected largest-chain fraction has positive limsup. Since the fractions are bounded, reverse Fatou gives a realization with positive limsup and almost-sure weak empirical convergence to the rank law $`\rho`$. On a subsequence, the empirical submeasures of maximal chains normalized by the whole sample size have a nonzero limit $`\sigma\le\rho`$. The coordinatewise comparability relation is closed, so all pairs of points in the support of $`\sigma`$ are comparable, by weak convergence of its product measures. The inverse image $`S`$ of this support in path space has positive mass. Almost every independent pair from $`S`$ has difference direction in the closed double sector.

## Terminal paths and infinite paths

The marked-carrier argument below, in Appendix C, gives the following two conclusions for any near-extremal sequence, in particular for any internal node.

1. No vague site limit under translations and dilations assigns positive nonatomic mass to a graph of Lipschitz constant strictly less than one in orthonormal coordinates.
2. There cannot be a sequence of site attributes consisting of two ranks in $`[0,1]`$ with atomless limiting one-rank marginals, realizing exact coordinatewise comparability in a fixed double sector on the finite sets, whose limiting rank pairs have probability greater than $`1-10^{-4}`$ of belonging to one closed coordinatewise chain.

To verify the second implication from the carrier argument, all four limiting rank pairs of a uniform good quadruple lie in the closed chain with probability at least $`1-4\cdot10^{-4}`$. If no two labels tie in either rank, the strict coordinate orders of every limiting pair agree with those of the approximating finite ranks. All six finite pairs would then be comparable. This is impossible for four distinct sites comprising a pin and three equidistant bases, because a set with differences in such a double sector lies on a graph of Lipschitz constant $`\tan(\pi/8)<1`$. Formally, each quadruple with all limiting comparisons strict belongs to an open rank neighborhood with the same six comparisons; the joint limit assigns zero mass to the union of such forbidden neighborhoods. The independent pin–base laws and atomless individual rank marginals exclude pin–base ties. For each bounded bisector richness $`K`$, the restricted two-base law is dominated by $`O(K)`$ times the independent product on the finite rank pairs, hence has zero limiting tie mass in either coordinate. Therefore some coincident-rank side on the chain event has escaping bisector richness. Appendix C's small-carrier and orientation estimates put both its endpoints on a single retained large carrier except for arbitrarily small error. At least two of three labels are matched with probability $`>0.99`$. The last part of Appendix C then contradicts this with weight identically one, $`Z=1`$ and exact weight symmetry. This establishes conclusion 2 without requiring ranks to be computed inside the node.

If a positive part of $`S`$ terminates at nonatomic coordinates in some node, its coordinate distribution there is a nonzero nonatomic measure dominated up to a constant by $`\lambda_Q`$. Differences of distinct independent coordinates from this restriction lie in the closed double sector, by separation at that node. Closedness extends this to its support. Projection on the sector axis is injective on that support and the transverse coordinate has Lipschitz bound $`\tan(\pi/8)<1`$. Extend the graph to the whole axis, for instance by the usual one-dimensional Lipschitz extension. Removing the countably many atoms of $`\lambda_Q`$ leaves positive mass on the graph. This contradicts conclusion 1.

Thus almost all of $`S`$ follows infinite atom paths. Consider the increasing filtrations that remember the node reached by a surviving path at each depth and record the terminal coordinate on an already stopped path. Together they generate all coordinates: on an infinite path the coordinate in a node is the atom of the chosen child. The martingale convergence theorem for the indicator of $`S`$ gives a surviving node $`Q`$ of positive mass with $`\mu(S\mid Q)>1-10^{-4}`$. The internal site's limiting global ranks have the conditional distribution of the root ranks given membership in $`Q`$. Each is atomless, since this conditional law is dominated by the uniform marginal divided by $`\mu(Q)>0`$. The ranks still give the exact finite double-sector order at every node. Conclusion 2 gives the final contradiction. Therefore the posited near-extremal sequence does not exist, which supplies the absolute constants in the theorem.

## Appendix A. Collinear sites

Fix a line $`L`$ and $`n`$ sites. Write $`I_L`$ for the number of ordered triples with pin and first base on $`L`$, second base off $`L`$, and equal pin–base distances. Here is the uniform power saving used in the proof.

### The rational functions

Make $`L`$ the horizontal axis and let $`A`$ denote the coordinates of the points on it. For $`z=(u,v)`$ off the axis, put $`h=v^2>0`$. The equation for $`x,y\in A`$ becomes

```math
x=f_{u,h}(y),\qquad f_{u,h}(t)=\frac{t+u}2-\frac{h}{2(t-u)}.
```

There is no solution with $`y=u`$. The functions are determined by their finite pole and its residue. Every distinct function is produced by at most two points of $`P`$, interchanged by reflection across $`L`$. Let $`F`$ be the family of distinct functions. For $`y\in A`$ put $`s_y=\#\{f\in F:f(y)\in A\}`$, omitting poles. Then $`I_L\le2\sum_y s_y`$.

For an ordered pair of distinct functions $`f,g`$, take the complex projective closure $`\Gamma_{f,g}`$ of the rational curve parametrized by $`(f(t),g(t))`$. It is irreducible and has degree at most three. Multiplying by the two linear denominators exhibits a homogeneous parametrization of degree at most three after homogenizing and canceling common factors. Equivalently a generic line meets the parametrization at at most three values of $`t`$.

### Distinctness of the curves

Write $`f=f_{u,h}`$ and $`g=f_{v,j}`$. The parameter is a rational function of the two coordinates $`X=f(t)`$ and $`Y=g(t)`$, since

```math
2(X-Y)t=2uX-2vY+v^2+j-u^2-h.
```

Here $`X-Y`$ is not identically zero. Thus both the displayed parametrization and the parametrization from any other pair giving the same curve have rational inverses on dense subsets. The parameter change is a fractional linear function, since the degrees of nonconstant rational functions multiply under composition.

As $`t\to\infty`$, both $`f(t)`$ and $`g(t)`$ have a pole and $`g(t)/f(t)\to1`$. No other parameter value has this property. For different finite poles, only one coordinate diverges at either one. For a common finite pole, the limiting ratio is $`j/h\ne1`$. The change of parameter for two equal curves must therefore fix infinity. It has the form $`at+b`$. Comparison of leading coefficients in $`f(t)=t/2+O(1)`$ gives $`a=1`$. If $`f_{u',h'}(t)=f_{u,h}(t+b)`$, comparison of finite poles gives $`u'=u-b`$, while the constant terms at infinity give $`u'=u+b`$. Hence $`b=0`$. Both functions in the ordered pair are recovered. The curves of distinct ordered pairs are distinct.

### The incidence bound

Two of these irreducible curves have at most nine points in common by Bézout's theorem. Ten distinct points consequently belong to at most one of the curves. On the real line, split each parametrization at its at most two finite poles into at most three simple arcs. The first coordinate is strictly increasing on each interval. Different arcs from the same curve have only a bounded number of intersections, since distinct preimages must have $`f(t)=g(t)`$ by the rational inverse above, and this equation has bounded degree. Ten points lie on at most three arcs. The [Pach–Sharir point–curve incidence theorem](https://www.cambridge.org/core/journals/combinatorics-probability-and-computing/article/abs/on-the-number-of-incidences-between-points-and-curves/D82C6E430EE5402A3FE18C724A0C14B1) therefore applies with ten degrees of freedom and an absolute multiplicity bound.

The set of points is $`A^2`$ and there are $`O(n^2)`$ arcs. Each arc takes each coordinate pair at most once. The total number of incidences bounds $`\sum_y s_y(s_y-1)`$ and is at most

```math
O\!\left((n^2)^{10/19}(n^2)^{18/19}+n^2\right)=O(n^{3-1/19}).
```

Also $`\sum_y s_y\le n^2`$. Cauchy–Schwarz gives $`(\sum_y s_y)^2\le n\sum_y s_y^2=O(n^{4-1/19})`$, which proves the stated estimate.

### Application to pinned distances

Suppose that $`P`$ has no four cocircular points and write $`m=\#(P\cap L)`$. If an ordered pair of distinct points $`x,y\in P\cap L`$ belongs to a multiplicity-three pin-radius class at $`x`$, at least one of its other members is off $`L`$, since a positive-radius circle meets a line in at most two points. Thus the number of ordered incidences in single or double classes, counted over all pins, is at least $`m(m-1)-O(n^{2-1/38})`$. In the notation of the proof’s opening count, this yields

```math
3D-n(n-1)=2A_1+A_2\ge\tfrac12(A_1+2A_2)
\ge\tfrac12\bigl(m(m-1)-O(n^{2-1/38})\bigr).
```

In particular, if $`D\le(1/3+o(1))n^2`$, the maximum number of collinear points is $`o(n)`$. A line containing $`\alpha n`$ points for fixed positive $`\alpha`$ gives an asymptotic gain of $`\alpha^2/6`$ in $`D/n^2`$. 

## Appendix B. Reflected partners on two line families

In this appendix the source and target sets are denoted by $`A_i\subset M_i`$ and $`B_j\subset N_j`$, on $`p`$ and $`q`$ distinct lines respectively. Their sizes are between $`t`$ and $`Kt`$, where $`K`$ is fixed, $`p,q,t\to\infty`$ and at most $`o(p)`$ sources have any one orientation. We prove the claimed $`o(pqt^2)`$ bound on ordered source–target site pairs with a reflected partner in the target set.

### Popular midpoints

Use a scalar coordinate along each target line and write $`\pi_j(x)`$ for the orthogonal projection in that coordinate. We use the same notation $`B_j`$ for the scalar set of its sites. For a fixed $`x`$, the possible $`z`$ for $`y`$ is uniquely specified by $`y+z=2\pi_j(x)`$. For any fixed orientation among the target lines, at most one of those lines can supply a distinct reflected pair for $`x`$. Otherwise four endpoints are reflected across the same perpendicular through $`x`$ on two distinct parallel lines and are concyclic by the reflection argument in the local triangle bound. In particular, tuples with $`M_i\perp N_j`$ contribute only $`O(pt^2)`$. For all the other line pairs $`\pi_j`$ is an injective affine map on $`M_i`$.

Suppose along a subsequence there are at least $`\eta pqt^2`$ tuples for a fixed $`\eta>0`$. Choose a fixed sufficiently small $`\delta>0`$ depending on $`\eta,K`$. For each target let $`S_j`$ consist of the scalar midpoints at which there are at least $`\delta t`$ ordered representations by two distinct points of $`B_j`$. Then $`|S_j|\le K^2t/\delta`$. The pin–target incidences not hitting $`S_j`$ contribute at most $`K\delta pqt^2`$ tuples. By averaging, for positive constants $`\alpha,\beta`$ there are at least $`\alpha pq`$ nonperpendicular pairs $`(i,j)`$ for which $`|\pi_j(A_i)\cap S_j|\ge\beta t`$.

### Extracting source sets of small doubling

If $`R\subset A_i`$ and $`U=\pi_j(R)\cap S_j`$ has size at least $`\beta t/2`$ for a nonperpendicular target, then $`U`$ contains a subset of size at least $`ct`$ whose sumset has size at most $`Ct`$. The constants are uniform in the choices of line and subset. Indeed, at least $`(\beta\delta/2)t^2`$ pairs $`(u,b)\in U\times B_j`$ satisfy $`2u-b\in B_j`$. By Cauchy–Schwarz, the additive energy between $`2U`$ and $`-B_j`$ is at least a constant times $`t^3`$. This energy counts pairs of representations of the same sum. Its square is at most $`E(U)E(B_j)`$ by Cauchy–Schwarz on difference multiplicities. Since $`E(B_j)\le |B_j|^3`$, the one-set energy $`E(U)`$ is also at least a constant times $`t^3`$. The Balog–Szemerédi–Gowers theorem gives the asserted subset. In its small-difference-set formulation, the usual inequality $`|V+V|\le |V-V|^3/|V|^2`$ gives the same conclusion. [Balog–Szemerédi–Gowers theorem](https://arxiv.org/abs/2308.10245)

For each $`i`$, start with $`R=A_i`$. Whenever some nonperpendicular target has $`|\pi_j(R)\cap S_j|\ge\beta t/2`$, remove the preimage of such a small-doubling subset. Each preimage has the same sumset cardinality in scalar coordinates on $`M_i`$, since the change of coordinates is invertible affine. There are at most $`K/c`$ removals. For each originally counted good pair, the removed pieces between them hit at least $`\beta t/2`$ popular coordinates. One can therefore choose a single removed piece $`A_i'`$ for each participating source line so that at least $`\gamma pq`$ pairs still have $`|\pi_j(A_i')\cap S_j|\ge\gamma t`$ for a positive uniform $`\gamma`$. For instance, choosing a removed piece uniformly gives this lower bound in expectation after decreasing $`\gamma`$. An unused source line contributes zero.

### Projections onto common coordinates

Write $`X_{ij}=\pi_j(A_i')\cap S_j`$ on the retained nonperpendicular pairs and use the empty set otherwise. For each $`j`$, Cauchy–Schwarz gives

```math
\sum_{i,k}|X_{ij}\cap X_{kj}|
\ge\frac{(\sum_i|X_{ij}|)^2}{|S_j|}
```

when $`S_j`$ is nonempty. Summing and applying Cauchy–Schwarz over $`j`$ gives a lower bound of order $`p^2qt`$ since $`\sum_{i,j}|X_{ij}|\ge\gamma^2pqt`$ and $`\sum_j|S_j|=O(qt)`$. Pairs of equal or parallel source lines contribute $`o(p^2qt)`$ by the orientation hypothesis and the bound $`|X_{ij}|\le Kt`$. Consequently two nonparallel sources $`M_i,M_k`$ have intersections $`|X_{ij}\cap X_{kj}|\ge\gamma' t`$ for at least $`\gamma' q`$ targets, for some fixed $`\gamma'>0`$.

For each orientation, the sets of $`x\in A_i'`$ whose projection lies in $`S_j`$ for targets $`N_j`$ of that orientation are pairwise disjoint by the reflected-pair observation above. Hence at most $`K/\gamma'`$ of these targets have any one orientation. The number of distinct orientations among them tends to infinity.

### Rich rays in a Cartesian product

Measure the scalar coordinates on $`M_i,M_k`$ from their common point and let $`a_i,a_k`$ be unit vectors along them. Write $`U_i,U_k`$ for the coordinates of $`A_i',A_k'`$. For a unit direction $`d_j`$ of a retained target, two source sites with coordinates $`s,u`$ have the same projection if and only if

```math
s(a_i\cdot d_j)=u(a_k\cdot d_j).
```

Both dot products are nonzero. The two source directions are independent, so different target orientations yield different ratios $`(a_i\cdot d_j)/(a_k\cdot d_j)`$. The Cartesian product $`U_i\times U_k`$ thus has a line through the origin in each of a growing number of distinct directions, each containing at least $`\gamma' t`$ points.

Choose one populated ray on each line, discarding the origin. On at least one quadrant, arbitrarily many of the selected rays then have at least $`\gamma't/3`$ points each. Order them by angle. The sums of one point on each of two neighboring rays lie strictly between the rays, and every such sum has a unique decomposition on that pair of rays. Different consecutive pairs use disjoint open sectors. All sums belong to $`(U_i+U_i)\times(U_k+U_k)`$, a set of at most $`C^2t^2`$ points. This permits only a bounded number of the selected rays and gives a contradiction. This is the adjacent-ray argument of [Solymosi](https://arxiv.org/abs/0806.1040).

## Appendix C. The marked-carrier obstruction

### A weight symmetric in the three base labels

Choose a uniform ordered multiplicity-three circle $`(X,Y_1,Y_2,Y_3)`$, with pin $`X`$. The three bases are exchangeable. Every pin–base law has total variation distance $`o(1)`$ from two independent uniform sites, since all but $`o(n^2)`$ pin–base pairs belong to a triple. The law of a specified base pair restricted to a side whose bisector contains at most $`K`$ pins is bounded by $`O(K)`$ times the independent-pair law, by counting its possible pins.

Pass to weak limits in the one-point compactification, preserving the normalized finite coordinates used in the statement. If the pin and any base are finite in the limit, the common radius bounds both other bases. Suppose the graph carries positive nonatomic mass, and let $`H`$ be a compact subset of positive mass on that graph containing no atom of $`\mu`$. At almost every $`a\in H`$ the relative mass of $`H`$ in balls around $`a`$ tends to one. We may also take $`a`$ with arbitrarily small record radii $`R`$ satisfying

```math
\mu(B(a,s))\le (s/R)^3\mu(B(a,R))\qquad(s\ge R),
```

where these balls are closed. Indeed $`\limsup_{s\downarrow0}\mu(B(a,s))/s^3=\infty`$ almost everywhere. The exceptional set is null by covering its bounded portions with $`O(s^{-2})`$ squares, after restricting to uniform constants and a uniform starting radius. The closed-ball mass ratio is upper semicontinuous away from zero and tends to zero at infinity. Taking maxima over successively longer intervals bounded away from zero gives record radii tending to zero.

Fix $`\tau=1/100`$ and a continuous function $`\psi:[0,\infty)\to[0,1]`$ equal to one on $`[0,1/2]`$ and zero on $`[1,\infty)`$. Weight each quadruple by

```math
w(x,y)=e^{-\lVert x-a\rVert/R}
\psi\!\left(\frac{\lVert x-y\rVert}{\tau R}\right).
```

This has the same value for each base of a given circle. It extends continuously by zero if either argument escapes to infinity. For all finite $`x,y`$, one has $`w(x,y)\le e^\tau w(y,x)`$. Write $`Z=\iint w(x,y)\,d\mu(x)d\mu(y)`$. Cover $`B(a,R)`$ by $`O(\tau^{-2})`$ pieces of diameter at most $`\tau R/2`$. Cauchy–Schwarz applied to the masses of a partition subordinate to this cover gives $`Z\gg\tau^2\mu(B(a,R))^2>0`$. At fixed $`R`$, the finite weighted normalizing masses tend to $`Z`$.

For every $`\varepsilon>0`$ a sufficiently small record radius gives weighted probability at least $`1-\varepsilon`$ that the **four limiting coordinates** all lie in $`H`$. In fact, the weighted mass from pins at distance greater than $`MR`$ from $`a`$ is bounded by

```math
\mu(B(a,R))^2\sum_{j\ge\lfloor M\rfloor}e^{-j}(j+2)^6
```

for $`M\ge2`$, using the record bound and the independent pin–base law on annuli of width $`R`$. For the other pins, all bases with positive weight lie in $`B(a,(M+1)R)`$. Apply the independent pin–base law with each of the three base labels. The contribution to any coordinate lying outside $`H`$ is at most a constant times

```math
\mu(B(a,(M+1)R))\,\mu(B(a,(M+1)R)\setminus H).
```

At fixed $`M`$ this is $`o(\mu(B(a,R))^2)`$ by density and the record bound. First choose $`M`$, then $`R`$. Such weighting avoids a boundary error when swapping a pin and base and preserves exchangeability among all base labels.

If all four points lie on $`H`$, at least two of the three base labels have coincident coordinates. A circle about a graph point meets a graph of slope bound strictly less than one at most once on either side of its pin. This follows by subtracting squared distances at two ordered abscissae on either side and using the Lipschitz bound. The assertion also holds at zero radius.

### Carriers of coincident labels

Write $`s_n`$ for the maximum collinearity. Appendix A gives $`s_n=o(n)`$ on the putative near-extremal sequence. Fix an arbitrarily small error $`\delta>0`$, measured as a fraction of all finite quadruples. There is $`c>0`$ such that, outside this error in the limiting law, every side with coincident endpoints in $`H`$ has both endpoints exclusively on its own carrier containing at least $`c n^{2/3}`$ sites. Here and below a statement combining finite attributes and limiting coordinates means that the attributes are recorded as discrete flags before taking a further joint subsequence.

To see this, a side of bisector richness at most fixed $`K`$ has limiting law dominated by $`O(K)\mu\otimes\mu`$ on finite coordinate pairs, so it cannot coincide in $`H`$. For axes richer than $`K`$, and carriers smaller than $`c n^{2/3}`$, the small- and intermediate-carrier bounds give at most

```math
O\big(n^2(B/K^2+B^{-1/3}+c)+nB\big)
```

pin–pair incidences. For carriers with fewer than $`B`$ sites, each axis represents at most $`B`$ pairs. The sum of site incidences on all $`K`$-rich axes is $`O(n^2/K^2+n)`$: the rich-line bound gives $`L=O(n^2/K^3+n/K)`$ such axes, and the point–line bound for these axes is $`O(n^{2/3}L^{2/3}+n+L)`$. Split at $`K=\sqrt n`$ to obtain the stated estimate. For intermediate carriers, sum the dyadic estimate in the local triangle bound with $`s=p=n`$ from $`B`$ to $`cn^{2/3}`$. This contributes $`O(n^2(B^{-1/3}+c))`$. First choose $`B`$ large, then $`K`$ large, then $`c`$ small. Each incidence accounts for at most one centered triangle. There are $`O_c(n^{1/3})`$ carriers of size at least $`c n^{2/3}`$, and the sites common to two carriers number $`O_c(n^{2/3})`$. Their total probability as any quadruple label is $`o(1)`$.

On each such large carrier assign its sites that do not lie on another large carrier. Distinct assigned sets are disjoint. Remove every orientation whose assigned sets have total size more than $`\epsilon_n n`$, where $`\epsilon_n=\sqrt{s_n/n}\to0`$. There are at most $`1/\epsilon_n`$ removed orientations. At any fixed pin, at most one carrier of a given orientation can contain a reflected pair about that pin. Otherwise two distinct parallel carriers would supply four sites reflected across the same perpendicular through the pin, forcing a circle through the four. Each such carrier supplies at most $`s_n`$ ordered pairs. Thus the total removed pin–pair incidence count is $`O(ns_n/\epsilon_n)=o(n^2)`$.

Let $`J`$ be the union of the assigned sets on the retained large carriers. Call a base label matched if it is an endpoint of a side **with both endpoints in the same retained assigned set**. Matching is a finite property, symmetric in the three labels. By the foregoing estimates, under the weighted law at least two labels are matched with probability at least $`1-\eta`$, for any prescribed small $`\eta>0`$ and all sufficiently large indices of the subsequence. Indeed first choose the spatial localization with error much less than $`\eta`$, then the unweighted carrier error $`\delta`$ much less than $`\eta Z`$. On the limiting event of four graph coordinates some side has coincident endpoints, and the three possible sides cost at most the sum of their errors. Since matching flags are finite and the three labels are exchangeable, this conclusion transfers back to the finite weighted probability.

### Comparing the sizes of the source and target carriers

Write $`p=\Pr_w(X\in J)`$ for the normalized finite weighted law. Up to $`o(1)`$ every pin–base event can be computed by weighting the independent site law, since $`Z>0`$ is fixed. The weight comparison under a swap and the matched-label probability give

```math
p\ge e^{-\tau}\Pr_w(Y_1\in J)-o(1)
\ge e^{-\tau}\tfrac23(1-\eta)-o(1).
```

Moreover, even after requiring $`X\in J`$, exchangeability gives $`\Pr_w(X\in J,\ Y_1\text{ matched})\ge\tfrac23(p-\eta)`$. On this event let $`s`$ be the size of the pin's assigned set and $`t`$ the size of the matched label's assigned set. For any $`A>1`$, swapping independent pin and site gives

```math
\Pr_w(X,Y_1\in J,\ t>As)
\le\frac{e^\tau}{1+e^\tau}\Pr_w(X,Y_1\in J)+o(1)
\le\frac{e^\tau}{1+e^\tau}p+o(1).
```

Indeed the reversed event is disjoint, and its weighted independent-pair mass is at least $`e^{-\tau}`$ times that of the displayed event. With $`\eta=1/100`$ these inequalities leave a fixed positive weighted probability for $`X\in J`$, $`Y_1`$ matched and $`t\le As`$. The bound is uniform in $`A>1`$.

The regime $`s>At`$ contributes $`O(n^2/A+ns_n)`$ unweighted incidences over all source and target sets. For nonperpendicular source and target lines, a target pair's midpoint is the projection of at most one pin on the source line, so each source–target choice contributes at most $`t^2\le st/A`$. The sets on each side are disjoint and their sizes sum to at most $`n`$. For perpendicular source and target lines, each pin has a prescribed target orientation and at most one active target of that orientation, giving the $`ns_n`$ term. Choose a fixed $`A`$ large enough in terms of $`Z`$. Since weights are at most one, a positive fraction of all $`n^2`$ ordered pin–base pairs must then be matched from one retained carrier to another of comparable size $`A^{-1}s\le t\le As`$.

Group retained carriers by dyadic assigned-set sizes. Let $`a_j`$ denote the fraction of all sites in group $`j`$. Comparable source and target groups differ by at most a fixed $`d=d(A)`$. For any $`u>0`$ the products $`a_i a_j`$ of neighboring groups with either group mass below $`u`$ sum to at most $`2(2d+1)u`$. The mass of ordered pin–base pairs in those groups is bounded by that sum. Choose $`u`$ sufficiently small. At most $`1/u`$ remaining groups have positive mass above the cutoff. Some pair of comparable groups must therefore account for $`\Omega(n^2)`$ reflected partners. The pair of group indices may vary with $`n`$.

Let $`T`$ be the lower endpoint of the smaller chosen size band. Each source and target set then has between $`T`$ and $`C_A T`$ sites. Here $`T\to\infty`$, since each retained carrier initially had at least $`c n^{2/3}`$ sites and lost at most $`O_c(n^{1/3})`$ intersections. The number of sources and targets tends to infinity since each group has positive mass and $`s_n=o(n)`$. There are $`\Theta(n/T)`$ source lines, and at most $`\epsilon_n n/T=o(n/T)`$ sources in one orientation. Appendix B applies and bounds the count by $`o(n^2)`$. This is the required contradiction.

