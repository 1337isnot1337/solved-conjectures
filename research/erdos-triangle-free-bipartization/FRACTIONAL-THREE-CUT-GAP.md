# A strict MaxCut gain for dense fractionally three-colorable graphs

This concerns a full-parameter structural route to [Erdős Problem 23](https://www.erdosproblems.com/23), not a resolution of the sharp bound.

For every p₀>0 there is η(p₀)>0 such that a triangle-free graphon of ordered edge density p≥p₀, admitting a fractional three-coloring, has

```math
 \beta\le (1/3-\eta(p_0))e,\qquad e=p/2,
```

where β is the minimum unordered monochromatic mass. This applies to finite graphs, arbitrary vertex product weights and all proper three-colorings. No explicit constant large enough to settle §23 in the middle band is provided.

By a fractional three-coloring of a graphon we mean a probability law on indicators of measurable independent sets, with each vertex covered with probability at least 1/3 almost everywhere. A finite fractional three-coloring gives one for its weighted step graphon.

## Equality is impossible

The cut separating a sampled independent set I from its complement crosses exactly its incident mass ∫_I d. Averaging gives at least p/3=2e/3. Suppose that is the maximum. Then equality holds almost surely for the sampled cuts, and the inclusion probability is exactly 1/3 on vertices of positive degree. For every such optimal cut, on almost every vertex x outside I the local margin

```math
 \Delta_I(x)=2d_I(x)-d(x)
```

is nonnegative. This is the single-vertex variation inequality for a measurable cut: if the margin were negative on positive mass, flipping a sufficiently small subset of that mass would improve the cut, since its internal edge term is only quadratic in its mass.

For almost every x, its mean d_I(x) is d(x)/3; moreover d_I(x)=0 whenever x lies in I, outside a joint null set. The probability of lying outside I is 2/3 for d(x)>0. Hence the nonnegative outside margin has expectation zero: whenever x is outside I its margin equals zero almost surely. Fubini makes this true for almost every outside vertex of almost every sampled cut.

Choose a sampled I with positive ∫_I d and with the zero-margin property. Choose a suitable root u∈I of positive degree and let J be its positive neighborhood. Up to null sets J is independent by triangle-freeness and is disjoint from I. Flip all of J to the I side. This does not change cost: every flipped vertex had zero margin and there are no edges inside J.

The new cut cannot be optimal. At u essentially all its neighbors lie in J, and the new local margin at any x∈I is d(x)−2d_J(x). Almost every row W(u,·) is in the essential support of the distribution of rows obtained by sampling u from I. Indeed L¹ is separable, so the exceptional union of open null balls can be taken countable. Choose u with this property as well. Since d(u)−2d_J(u)=−d(u)<0, the same inequality holds for a whole sufficiently small L¹ ball around its row. That ball contains a positive-measure subset of I. The single-vertex variation inequality is violated on that subset, contradicting maximality of the new cut. This proves β<e/3 whenever e>0.

## Why the dense gap is uniform

The class of graphons admitting a fractional three-coloring is closed in the cut metric. To see this, align a convergent sequence W_n→W in cut norm by measure-preserving representatives on a common space. View its independent-set laws as measures on the weakly compact metrizable box 0≤f≤1 in L², and take a subsequential weak limit law. For each nonnegative bounded test h, the expectation of ∫h f is at least ∫h/3 and the bound passes to the limit. Also ∫∫W f(x)f(y) is weakly continuous in f by compactness of the integral operator; the difference using W_n is bounded by the cut norm on indicator f. The limiting law therefore has zero expectation of this nonnegative quadratic, so it is supported on fractional f with W=0 almost everywhere on the square of their positive support. Replace each f by the indicator of that support. This preserves independence, increases coverage and is a Borel operation (approximate the positive-support indicator by bounded continuous pointwise functions). It supplies the desired fractional coloring of W.

The triangle-free, density-at-least-p₀ part of this class is therefore compact. The ratio β/e is cut-continuous when e is bounded below. Its maximum is attained and is strictly below 1/3 by the equality obstruction. The same compactness argument gives some ε(p₀)>0 such that sufficiently dense triangle-free graphs with fractional chromatic number at most 3+ε(p₀) still have deletion fraction strictly below 1/3: otherwise a convergent countersequence of their laws with coverage tending to 1/3 contradicts the theorem.

The ordinary independent-set averaging bound is classical. The point here is the zero-margin argument and the second flip of a neighborhood, not that the resulting compactness gap has the size required for the unrestricted Erdős conjecture. Compare the [fractional-coloring exclusion using the density tails](FRACTIONAL-COLOR-EXPANSION.md) and the [established graphon density tails](https://arxiv.org/abs/2103.14179).
