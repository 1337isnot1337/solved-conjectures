# Deciding generic identifiability from unlabelled path lengths

Fix a finite reduced tree $`T`$ with $`d\ge1`$ edges and no vertex of degree two. Independently choose positive integer lengths for its labelled edges and subdivide. Call a length vector ambiguous if some nonisomorphic unweighted tree has the same histogram of all unordered vertex-pair distances. There is a finite algorithm, with $`T`$ as its only input, deciding which of the following two assertions holds.

1. The number of ambiguous vectors in the box $`\{1,\ldots,t\}^d`$ is $`O_T(t^{d-1})`$. All such vectors lie in a finite union of proper rational hyperplanes that the algorithm can supply.
2. At least $`c_Tt^d`$ vectors in the box are ambiguous for every sufficiently large $`t`$, for an effectively obtainable constant $`c_T>0`$. In this case the algorithm can give a fixed competing topology and $`d`$ integer pairs of metric assignments whose positive integer sums yield competing trees.

This criterion decides whether almost every subdivision of a **given** topology is identifiable from its ordinary distance histogram, with no degree data supplied to the observer and no topology promised for the competitor. Its uniform affirmative outcome for every topology is unresolved. The four-arm computation is a much smaller implementation of the exclusion test for one topology. [Four-arm test](FOUR-ARM-FLATS.md) · [Earlier degree-and-path certificate](PATH-DISTANCE-CERTIFICATE.md)

## Finite topology and sign choices

For a subdivision on $`n`$ vertices let $`p_j`$ count pairs at positive integer distance $`j`$. With $`w_v=\deg(v)-2`$ and $`M=\sum_v w_v^2`$, the histogram determines $`M=2p_2-2n+6`$ and $`n=p_1+1`$. Every competing reduced tree therefore has at most $`M`$ vertices, which is a number obtained directly from the fixed topology $`T`$. Enumerate one representative of every unlabelled reduced tree of that size or smaller. It suffices to test nontrivial trees because the target has an edge.

Gutman's identity identifies the signed measure on positive reduced pair distances with coefficients
```math
B_j=p_j-2p_{j+1}+p_{j+2}
=\sum_{\{u,v\}: d(u,v)=j}w_u w_v .
```
On integer subdivisions equality of these measures is equivalent to equality of the original histograms. Finite support gives the inversion $`p_i=\sum_{j\ge i}(j-i+1)B_j`$ at every positive $`i`$. Hence we can compare a finite list of path forms on the reduced trees without imposing an order bound on the subdivided trees. [Endpoint identity and original source](PATH-DISTANCE-CERTIFICATE.md)

Fix a competitor $`R`$ with $`d'`$ edges. In the joint variable $`(a,x)\in\mathbb R^{d+d'}`$ use one coordinate per edge of $`T`$ and one per edge of $`R`$. For each vertex pair of either tree form its path length, a linear form with coefficients 0 and 1, and attach its signed product of endpoint weights. Enumerate all weak orderings of this combined list. A weak ordering specifies equalities inside each tied class and strict inequalities between consecutive classes. Add strict positivity of every edge coordinate. The resulting cell is a relatively open convex rational cone or is empty. Its emptiness is decidable by rational linear inequalities: replace every strictly positive left-hand side by a lower bound of 1. Homogeneity permits simultaneous positive dilation of any strictly feasible point to satisfy all these finitely many bounds. A nonempty rational system so obtained admits a rational point.

Keep a cell only if in every tied class the sum of signed products from $`T`$ equals that from $`R`$, including zero classes. For each surviving cell the metric isomorphism test is constant. List all reduced graph isomorphisms from $`T`$ to $`R`$. For one such map to give identical subdivided trees, every edge length must equal that of its image. Each edge length occurs separately among the combined path forms. If any one map matches every edge within the cell's tied classes, discard the cell. In particular this tests **all** automorphisms when the two reduced topologies coincide. Suppression of bivalent vertices and their re-expansion make this equivalence exact. Keeping labelled coordinates on $`T`$ counts independent random assignments correctly; quotienting the assignments themselves would change their sampling weights.

Every integer ambiguity belongs to a retained cell by taking its actual topology and actual weak ordering. Conversely every integral point of a retained cell has identical histograms and nonisomorphic subdivided trees.

## Projection and integer counts

For a retained nonempty cell, let $`V`$ be the common nullspace of its equality rows, and let $`\pi(a,x)=a`$ project to target coordinates. The cell contains a relatively open neighborhood of each of its points in $`V`$, since its remaining inequalities are strict. Thus its linear span is all of $`V`$, and its image contains an open subset of $`\pi(V)`$ relative to that space. Rational row reduction computes $`\dim\pi(V)`$.

If this dimension is less than $`d`$, every target assignment from the cell lies in a proper rational hyperplane. By fixing the other $`d-1`$ coordinates and solving for a coordinate with nonzero coefficient, the hyperplane meets the integer box in at most $`t^{d-1}`$ points. When all retained cells pass this test, their finite union proves the first assertion.

Otherwise choose $`d`$ rational joint points in one retained cell whose target vectors are linearly independent. They exist by relative openness, surjectivity of $`\pi:V\to\mathbb R^d`$ and density of rational points in rational $`V`$. One can find them by rational enumeration and a rank test. Multiply **all** coordinates of these joint points by one common positive integer to make them integral; every equality, strict ordering and coordinate positivity survives. Call the resulting target vectors $`v_1,\ldots,v_d`$ and their matching competitor vectors $`u_1,\ldots,u_d`$. Every simultaneous positive integer combination of the pairs belongs to the same cell because its equalities and strict inequalities are homogeneous and linear.

Set $`K=\max_j\sum_{i=1}^d(v_i)_j`$. Taking coefficients independently from 1 to $`\lfloor t/K\rfloor`$ gives target coordinates between 1 and $`t`$. The target vectors obtained are distinct by linear independence, and the corresponding competitor lengths are positive integers. Thus there are at least $`\lfloor t/K\rfloor^d`$ ambiguous labelled targets. For $`t\ge2K`$ one may take $`c_T=(2K)^{-d}`$. There is no requirement that the competitor variables be uniquely determined by the target, and the construction supplies an integer competitor for each target it counts.

## Scope and cost

This is an effectiveness result. Its direct enumeration over all reduced competitors permitted by $`M`$ and all combined weak orderings can be very large. It supplies no feasible running-time guarantee for large cores. The [four-arm calculation](FOUR-ARM-FLATS.md) instead exploits the degree budget, a collision-rank bound and the signs of the observed coefficients. The [earlier bounded source review](PATH-DISTANCE-REVIEW.md) records results for supplied topologies, weighted path decks and inverse problems with stronger data. This deterministic criterion concerns generic identifiability on one input topology against all competitors. It is a research reduction with no separate independent review or Lean verification.
