# Erdős’s separated-distance diameter conjecture

[Erdős Problem 100](https://www.erdosproblems.com/100) asks whether the diameter of every \(n\)-point planar set is \(\Omega(n)\) if all positive distances are at least one and any two distinct distances differ by at least one. The stronger original conjecture is the eventual sharp bound \(n-1\). This note gives a growing-width partial result, not a proof of the unrestricted conjecture.

## A uniform strip theorem

**Theorem.** Let \(A\) have the stated distance separation. If it is contained in a rectangle of horizontal length \(L\) and vertical width \(w\), then
\[
|A|\le L+160(1+w^2).
\]
In particular \(D\ge n-O(1+w^2)\), where \(D\) is the Euclidean diameter and \(w\) can be the minimum width over all enclosing strips. This gives the linear diameter bound throughout \(w=O(\sqrt D)\), and \(D\ge(1-o(1))n\) when \(w=o(\sqrt n)\).

Write \(W=1+w^2\), and divide the plane into vertical half-open bins of width \(1/4\). Let \(k\) be the maximum bin occupancy. In any one bin, two points have horizontal gap at most \(1/4\), so their vertical gap is greater than \(1/2\) by the minimum distance one. Thus \(k\le1+2w\le3W\).

The main estimate is the following. If \(p,q\) lie in the rectangle and \(z\) is horizontally outside their interval at horizontal distance at least \(u>0\) from each, then
\[
\bigl||z-p|-|z-q|\bigr|
\le |p_x-q_x|+\frac{w|p_y-q_y|}{u}.
\tag{1}
\]
Subtract the squared distances and divide by \(|z-p|+|z-q|\). The horizontal numerator is \(|p_x-q_x|(|z_x-p_x|+|z_x-q_x|)\) and the vertical numerator is at most \(2w|p_y-q_y|\). This proves (1).

**Case \(k\ge3\).** Choose a bin with \(k\) points. Among its points sorted by vertical coordinate there is a consecutive triple whose vertical span is at most \(2w/(k-2)\le 6w/k\): each adjacent gap contributes at most twice to the sum of all consecutive triple spans. The slightly sharper bound \(4w/k\) holds for \(k\ge4\); for \(k=3\) the span is at most \(w\), also at most \(4w/k\). Consequently any \(z\in A\) lying at horizontal distance at least \(16W/k\) from the bin has the same distance to all three points. Indeed (1) bounds the differences by at most \(1/4+w(4w/k)/(16W/k)\le1/2\). Distance separation forces equality.

Three noncollinear points admit only one common equidistant point in the plane. Three distinct collinear points admit none. Hence all but at most one point of \(A\) have horizontal coordinate in an interval of length \(1/4+32W/k\) centered at that bin. This interval meets at most \(3+128W/k\) bins. Therefore
\[
|A|\le1+3k+128W\le138W.
\]

**Case \(k\le2\).** Take a leftmost point \(z\). Discard temporarily all points with \(x-z_x<8W\), of which there are at most \(68W\), since the occupied part meets at most \(32W+2\) bins. For each remaining point with radius \(r=|x-z|\), where \(x\) denotes the point itself, its horizontal displacement \(v=x_x-z_x\) satisfies
\[
0\le r-v=\frac{(x_y-z_y)^2}{r+v}\le\frac{w^2}{16W}\le\frac1{16}.
\]
Thus every occupied radius lies in \([1,L+1/16]\), and its fiber meets at most two bins and contains at most four points.

Suppose two radii \(r,s\) each have at least two points, with \(|r-s|>8W+1\). Choose distinct \(p,q\) from one fiber and \(a,b\) from the other. Within either pair the horizontal gap is at most \(1/16\). All cross pairs have horizontal gap greater than \(8W\). Applying (1) in both directions shows that the four cross distances agree, because every pair of comparisons within a row or column has difference at most \(1/16+w^2/(8W)<1\). But then the line through \(p,q\) is the perpendicular bisector of \(a,b\), and the line through \(a,b\) is the perpendicular bisector of \(p,q\). Both midpoints belong to both lines, so must coincide. This contradicts the disjoint horizontal intervals occupied by the two pairs.

The repeated radii therefore lie in an interval of length at most \(8W+1\). Since there is unit separation between distinct radii, at most \(8W+2\le10W\) radii repeat. Each contributes at most three extra points beyond its first point. There are at most \(L+2\) occupied radii in total. Adding the discarded points bounds \(|A|\) by \(L+2+30W+68W\le L+160W\).

To make the theorem applicable within a larger point set, simply restrict to any desired rectangle: the separation hypothesis is hereditary. In particular, any fixed number of independently oriented strips of widths \(O(\sqrt D)\) containing \(A\) also implies the linear bound. Conversely, every fixed positive-fraction piece of a putative \(D=o(n)\) counterexample has width \(\Omega(\sqrt n)\).

## Provenance and remaining question

- The original stronger conjecture appears in [Erdős’s chapter on geometry](https://assets.cambridge.org/97805216/07667/excerpt/9780521607667_excerpt.pdf) and [Brass–Moser–Pach, §5.10, Conjecture 3](https://doi.org/10.1007/0-387-23815-8). The numbered question asks for only a positive linear constant.
- [Peter Brass, 1996](https://doi.org/10.1016/0012-365X(95)00208-E) gives an asymptotic result for a parallel half-strip, as stated in the published abstract. This note uses an explicit dependence on the width and so allows width growing with \(n\). We do not claim priority for the fixed-strip case. The publisher abstract does not specify the quantitative dependence in the earlier proof; access to the full text remains a priority-check step.
- [Guth–Katz](https://arxiv.org/abs/1011.4105) and distance separation give the unconditional lower bound \(\Omega(n/\log n)\). The [separate recent high-dimensional paper](https://arxiv.org/abs/2604.15305) assumes that all unordered edges have distinct lengths and treats a quadratic-diameter statement; it does not answer this problem.
- A follow-on target is to replace a thin strip by a more general condition forced by the separation itself. In the proof above the key rigidity is that two far-apart duplicate radial fibers would create four identical cross distances. The unrestricted geometry, particularly point sets with many directions of spread, is not yet covered.

Coordination: [issue #885](https://github.com/1337isnot1337/solved-conjectures/issues/885).
