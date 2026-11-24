# Radó’s covering problem for cubes

Tracking issue: [#341](https://github.com/1337isnot1337/solved-conjectures/issues/341).

**Proposed full resolution of the all-higher-dimensions strict-inequality question.** For every integer d≥3, the covering constant F(Q^d) for homothetic copies of an axis-aligned d-dimensional cube is strictly less than 2^(−d). This answers the question explicitly posed in Dall’Ara and Dumitrescu, [*Rado’s covering problem for cubes and balls: a survey*, arXiv v3 (17 November 2026), §7.2(6)](https://arxiv.org/abs/2604.17509v3). It does not determine the exact covering constant. Ajtai disproved the original conjecture in dimension two in 1973 and anticipated the higher-dimensional conclusion; the new argument here is an explicit lift of his construction.

## Definition and planar input

For a finite nonempty family of closed axis-parallel cubes C in R^d, let U(C) be the volume of their union, and I(C) the maximum union volume of any pairwise disjoint subfamily. Then F(Q^d) is the infimum of I(C)/U(C), taken over all such families with positive union volume. Here “disjoint” means no common point at all, including along boundaries. Section 5 below addresses a convention that permits boundary contact.

We use the following **planar almost-counterexample of Ajtai**, as reproduced and proved in the proof of Theorem 5.1 and Figure 5 of the [2026 survey](https://arxiv.org/pdf/2604.17509v3). There is a finite family A of axis-parallel closed squares of side lengths 1 and 2 inside a rectangle [0,W]×[0,h]. Write U>0 for its union area and A₀ for the squares meeting the rectangle’s bottom boundary y=0. There is a δ>0 such that:

- Every disjoint subfamily of A has area at most U/4.
- Every disjoint subfamily of A avoiding A₀ has area at most U/4−δ.

The second assertion is the survey’s strict inequality (2), with a positive gap since A is finite. Its proof partitions the union into 19 fictitious squares of side 2, bounds the permitted coverage of each by one unit of area, and shows that without bottom squares one of the 19 is uncovered. The two-size hypothesis concerns the almost-counterexample itself, not the finished planar counterexample. In particular the large squares in the Bereg–Dumitrescu–Jiang refinement are of side 10, not size 1 or 2; its large squares are not used as input here.

For a check independent of the diagram argument, the lower-left corners and side lengths of the 52 squares in Figure 5 are specified by the following table (all coordinates integral):

| Side | Bottom y | Left x |
| --- | --- | --- |
| 1 | 0 | 0 through 13 |
| 1 | 1 and 2 | 0, 3, 4, 9, 10, 13 |
| 1 | 3 | 0, 1, 2, 11, 12, 13 |
| 1 | 4 | 2, 11 |
| 1 | 5 | 2 through 11 |
| 2 | 1 | 1, 5, 7, 11 |
| 2 | 3 | 3, 5, 7, 9 |

Their interiors tile 76 unit cells, bounding rectangle 14×6. The [standard-library verification script](verify-planar-gadget.py) computes the exact maximum areas of 19 and 18, with and without the bottom squares, by the elementary independent-set recursion on integral rectangles. The script is an optional check of the published planar input, not a computational assumption in the higher-dimensional argument. One can take W=14, h=6, U=76 and δ=1.

## 1. Set up the lifted cube family

Fix d≥3 and k=d−2. Choose an even positive integer L≥max(W,2) with L²>δ. In the first two coordinate dimensions, let Q₁,…,Q₄ be the four closed squares of side L partitioning [−L,L]² along the coordinate axes. They all contain the origin.

For each Qᵢ, place an isometric copy Aᵢ of A outside Qᵢ, with the gadget’s bottom edge on the outside horizontal side y=+L or y=−L of Qᵢ. More explicitly, if Qᵢ has x-interval [a,a+L] and y-side of sign σ∈{−1,+1}, apply (u,v)↦(a+u,σ(L+v)) to A. The four gadget bounding rectangles have disjoint interiors, and their interiors are outside [−L,L]². Each bottom square of Aᵢ meets Qᵢ. No claim is needed about its intersections with the other squares.

Let H be a positive integer multiple of 2L. For each planar square S of side s used above (s is 1, 2 or L), include in the d-dimensional family all closed cubes

    S × [j₁s,(j₁+1)s] × … × [jₖs,(jₖ+1)s],

for 0≤j₁,…,jₖ<H/s, integers. The extra coordinate domain is thus [0,H]^k, fully covered over each S. The union volume of the family is exactly

    V_union = 4(L²+U) H^k,

because the four planar squares of side L and the four auxiliary regions overlap only in sets of area zero.

## 2. Count selected big cubes

Fix any disjoint subfamily, and let m be its number of big cubes, those with side L. Their extra-coordinate boxes are pairwise disjoint as closed sets, since the projections of any two big cubes on the planar coordinates both contain the origin.

Group the side-L cells into blocks of two consecutive cells in each extra dimension. Each such group contains 2^k cells, which share their common central point. Across the four planar choices this gives at most one selected big cube per block, hence

    m ≤ (H/(2L))^k.

The volume of the selected big cubes is m L^(k+2).

## 3. Count selected small cubes by an atomic fiber measure

On [0,H], put mass 2 at every even integer. The total mass is H+2. Use the product of this measure in the k extra coordinates. A side-1 cell has mass 2: its integer endpoints consist of one odd and one even integer. A side-2 cell has mass 4: its two even endpoints each have weight 2 and its midpoint is odd. Thus the extra box of every small cube with base S of side s carries mass (2s)^k.

For each extra point t in the support of this measure, take the planar squares obtained by intersecting at t all selected small cubes whose extra boxes contain t. This is a disjoint subfamily in the plane: two planar squares meeting at x would give two selected cubes meeting at (x,t). Duplicate planar projections cannot occur for the same reason. Its area is at most U, since each of the four copies Aᵢ contributes at most U/4.

If t is in the extra box of a selected big cube with planar base Qᵢ, then no planar bottom square of Aᵢ can appear in that same fiber: that small cube would meet the selected big cube at (x,t) for some x∈S∩Qᵢ. In this case the area bound improves to U−δ. The extra boxes of selected big cubes are disjoint and each has mass (L+2)^k, because L and its grid-indexed endpoints are even.

Let V_small be the total selected small-cube volume. Summing the planar fiber areas against the measure counts each selected cube of side s with weight s²(2s)^k=2^k s^d. Therefore

    2^k V_small ≤ U(H+2)^k − δ m(L+2)^k.

## 4. Final bound and existence of a finite witness

The preceding two estimates give

    V_sel ≤ 2^(−k) U(H+2)^k + m[L^(k+2)−δ((L+2)/2)^k].

The coefficient of m is positive, since L≥2 implies (L+2)/2≤L and L²>δ. Insert m≤(H/(2L))^k and divide by V_union:

    V_sel/V_union ≤
      [2^(−k)L² + 2^(−k) U(1+2/H)^k
       − δ 2^(−2k)(1+2/L)^k] / [4(L²+U)].

Let H tend to infinity through integer multiples of 2L, holding L fixed. This gives the quantitative bound

    F(Q^d) ≤ 2^(−d) − [δ/(4(L²+U))] · [(1+2/L)/4]^(d−2).

The subtracted term is positive for every d≥3. Moreover a finite witness is obtained whenever

    U[(1+2/H)^k−1] < δ 2^(−k)(1+2/L)^k.

For example, take H a multiple of 2L satisfying H≥2k and H>4k U 2^k/[δ(1+2/L)^k]; the elementary inequalities (1+2/H)^k≤exp(2k/H) and exp(x)−1≤2x for x∈[0,1] give the required strict inequality. All families in the argument are finite at each H.

In particular take L=14. The explicit bound becomes

    F(Q^d) ≤ 2^(−d) − (1/1088)(2/7)^(d−2).

For an all-d receipt using integers only, set k=d−2 and H=28·ceil((304k(7/4)^k + 1)/28); the above sufficient conditions hold. In the first unresolved dimension d=3, the exact inequality already holds with H=280, giving a family with independent-volume ratio at most 1/8−1/76160.

## 5. Boundary conventions

The cited survey works with compact cubes and disjoint subfamilies, as above. If one instead allows contacts between selected cubes on their boundaries, the same constant bound transfers. For each fixed finite family, expand every cube by a factor 1+ε about its own center. Whenever two original closed cubes intersect, any point of intersection is then interior to both expanded cubes. Thus an interior-disjoint subfamily of expanded cubes corresponds to a disjoint subfamily of original cubes. Its volume is at most (1+ε)^d times the original maximum independent volume, and the expanded union is at least as large as the original union. Taking ε↓0 transfers the bound, and a strict finite witness survives small enough positive ε.

## Historical and scope notes

- T. Radó’s original planar statement was generalized to F(Q^d)=2^(−d) by A. S. Sokolin, as recorded in the 2026 survey, §4. Ajtai's primary 1973 article is *The solution of a problem of T. Radó*, Bull. Acad. Polon. Sci. 21, 61–63. The construction in this note uses his almost-counterexample, not a new planar packing.
- [Bereg, Dumitrescu and Jiang, *On covering problems of Rado*, Algorithmica 57 (2010), 538–561](https://doi.org/10.1007/s00453-009-9298-z), [author PDF, end of §6](https://adriandumitrescu.org/rado.pdf), quote Ajtai’s assertion that his two-dimensional result implies the higher-dimensional disproof and say that detailed arguments and upper bounds remain to be derived.
- The latest dated literature we located again lists the strict inequality for all d≥3 explicitly as an open question. The proof here does not assert priority over unpublished or unindexed work and should be independently checked. It does not improve the known two-dimensional bound or determine F(Q^d) exactly.
