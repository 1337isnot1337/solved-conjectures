# Rigid motions in small displacement bins

Let \(A\) be an \(n\)-point planar set with diameter \(D\), such that unequal positive interpoint distances differ by at least one. Put
\[
M_{\rm tr}=\max_{v\ne0}|\{x\in A:x+v\in A\}|,\qquad
M_{\rm cir}=\max_{\text{circle }\Gamma}|A\cap\Gamma|.
\]
**Theorem.** If the minimum point separation is at least one, then
\[
n(n-1)\le (6D+2)^2\max\{2M_{\rm tr},M_{\rm cir}\}.
\]
Consequently bounded translate multiplicity and bounded circle occupancy imply a linear diameter, without any lattice or convex-position hypothesis. In particular this applies if there are no four distinct concyclic points and no nondegenerate parallelograms, with no collinear triple. (Bounded point-on-a-line occupancy can replace the last assumption.) More generally, any hypothetical sequence with \(D=o(n)\) has a positive fraction of all its ordered edges in large single-motion classes as described below. This is a partial result toward [Erdős #100](README.md).

If there are two distinct points \(p,q\) at distance below one, every third point is equidistant from them by the reverse triangle inequality and separation of unequal lengths. Thus all the other points lie on their common perpendicular bisector. Distances from one extreme of that line set to the remaining points are distinct, giving \(D\ge n-4\). So the minimum-separation assumption may be imposed when analyzing a sublinear-diameter sequence.

## Local rigidity

Partition displacement space into half-open squares of side \(1/3\). A bin defines a family of ordered edges \(x\mapsto y\) whose displacement vectors \(y-x\) lie in that bin. No source or target can repeat within a bin, except in an identical edge: otherwise the two endpoints on the other side would be closer than one. For two different matches from a bin,
\[
\bigl||x-x'|-|y-y'|\bigr|
 \le |(y-x)-(y'-x')|
 \le \sqrt2/3<1.
\]
The two distances are positive and therefore equal. Thus the whole bin is the restriction of a single Euclidean isometry. For example, one can choose a base matched point, use equality of pairwise distances to obtain equal Gram matrices of the displacement-to-base vectors, and extend the resulting orthogonal map between their linear spans to the full plane. Also all edges of the bin have the same length \(r\), since the lengths of their displacement vectors differ by less than one.

- If the isometry is a translation, the bin has at most \(M_{\rm tr}\) edges.
- If it is a nontrivial rotation, \(x\mapsto y\) of displacement length \(r\) has its source and target on the same circle about the rotation center. The bin has at most \(M_{\rm cir}\) edges.
- If it reverses orientation, the displacement vectors of the motion lie in an affine line (the linear part is a reflection and the displacement map has rank one). On the circle of radius \(r\) that line has at most two points. Partition its edges by the exact displacement; these are at most two translation classes, each of size at most \(M_{\rm tr}\). This includes glide reflections.

The displacement vectors lie in \([-D,D]^2\), which meets at most \((6D+2)^2\) bins. Counting ordered edges proves the theorem. For the no-parallelogram example, three noncollinear sources with the same nonzero displacement cannot exist: any pair of their sources not on a line parallel to the displacement gives a nondegenerate parallelogram with their images. If all sources lie on a parallel line, the no-three-collinear assumption limits their number to two. The circle bound is three. The convex-position case without these assumptions is already a consequence of [Altman's distinct-distance theorem](https://erdosproblems.ai/wiki/problems/distance_problems/E0093), and is not claimed here.

## Many large motion classes, not just one

Split each orientation-reversing bin into its at most two exact-displacement classes, leaving rotations and translations unsplit. There are still at most \(2(6D+2)^2\) classes. By throwing away all classes of size less than \(n(n-1)/(4(6D+2)^2)\), at most half the ordered pairs are lost. Thus at least half the pairs belong to translation classes of that order of multiplicity or to nontrivial rotation classes of that order of size.

For a nontrivial rotation through angle \(\theta\), take \(0<|\theta|\le\pi\) and let the radius be \(R=r/(2|\sin(\theta/2)|)\). The bin's displacement directions lie in an arc of angular length \(O(1/r)\), since their chordal diameter is at most \(\sqrt2/3\) and \(r\ge1\). The source points lie in an arc of the same angular length on the radius-\(R\) circle, because \(x\mapsto y-x\) is a fixed rotation-and-dilation on vectors measured from its center. Their distance separation of at least one makes their number \(O(1+R/r)=O(1+1/|\sin(\theta/2)|)\). Thus for a sublinear-diameter sequence, the large rotation classes have rotation angles tending to zero. This gives an explicit near-translation structural obstruction for at least half the ordered edges. It does not yet show the motions have a common center or direction.

One can sharpen the angle condition using two point anchors. If \(p,q\) are at distance \(s\), then for any given positive radius \(r\) from \(p\) there are at most \(\lfloor 2s\rfloor+1\) possible radii from \(q\) for the same point: they lie in the interval \([r-s,r+s]\) and are separated by at least one. Each consistent pair of positive radii determines at most two points. Since \(p\) has at most \(D+1\) positive radii,
\[
n-2\le 2(D+1)(\lfloor2s\rfloor+1).
\]
In particular the minimum point separation \(s\) in any sequence with \(D=o(n)\) is \(\Omega(n/(D+1))\). Using \(s\) instead of one in the rotation-arc count gives a bound \(O(1+R/(rs))\) on the class size. On the retained rotation classes, where the size is \(\Omega(n^2/(D+1)^2)\), this implies
\[
|\theta|=O\!\left(((D+1)/n)^3\right).
\]
Thus the large rotations are even closer to translations after accounting for the growth of the minimum point spacing. The two-anchor observation alone does not force a linear diameter.

The [Guth–Katz method](https://arxiv.org/abs/1011.4105) uses motions to encode equal distances and gives the general \(n/\log n\) lower bound for the diameter. The local conclusion here instead uses separation to make all small-displacement comparisons exact and enforce a single motion on every bin. Searches in the [#100 sources and status](https://erdosproblems.ai/problems/100), [Brass's half-strip work](https://doi.org/10.1016/0012-365X(95)00208-E), and related distance and rigid-motion work found no earlier statement of this displacement-bin obstruction. Coordination: [#885](https://github.com/1337isnot1337/solved-conjectures/issues/885).
