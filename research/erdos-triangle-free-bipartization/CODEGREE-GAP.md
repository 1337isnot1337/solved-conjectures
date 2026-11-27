# A finite graphon quotient from a codegree gap

Let W be a zero-one saturated triangle-free graphon, and write K(x,y)=∫W(x,z)W(y,z)dz. Saturation here means W=1[K=0] almost everywhere. Assume the positive values of K are bounded away from zero by ε>0 almost everywhere. Then W is a blow-up of a finite triangle-free graph with at most

    (1+4/ε^(3/2))^ceil(16/ε³)

classes. This is a direct graphon analogue of the finite minimum-common-degree blow-up theorem of Liu, Shangguan, Skokan and Xu (as cited in [this source](https://arxiv.org/abs/2408.05547)). The bound is of the same exponential order in ε⁻³ log(1/ε); the novelty asserted here is the direct graphon reduction for this campaign, not a new finite theorem.

## Separation of the distinct rows

Fix a full-measure set of x such that the saturation and gap hypotheses hold almost everywhere in y. If W(x,·) and W(x',·) differ as L¹ functions, their disagreement has positive measure, and on that disagreement |K(x,y)−K(x',y)|≥ε. On the other hand

    |K(x,y)−K(x',y)| ≤ ||W(x,·)−W(x',·)||₁

for almost every y, since 0≤W≤1. Hence the row disagreement has measure at least ε. It follows that distinct rows give

    ||K(x,·)−K(x',·)||₂ ≥ ε^(3/2).

The K rows are the images under the compact self-adjoint Hilbert–Schmidt operator T_W of the W rows, whose L² norms are at most one. This already gives finiteness by compactness. Quantitatively, keep only operator eigenvalues of absolute value greater than ε^(3/2)/4. There are at most 16/ε³ of them, since the sum of squared eigenvalues is ||W||₂²≤1. Each truncated K row approximates its full row within ε^(3/2)/4 in L². The truncated rows lie in a unit Euclidean ball and are separated by at least ε^(3/2)/2. Comparing volumes of disjoint balls of radius ε^(3/2)/4 with the ball of radius 1+ε^(3/2)/4 gives the displayed bound.

For each observed row take its measurable equality class. The row map is measurable as a map into the separable space L²; equality classes of the finitely many rows are measurable. Merge null classes away. Symmetry makes W constant almost everywhere on each product of two positive-mass classes: a kernel both constant in its first coordinate and constant in its second must be constant on the product. On the diagonal class products that constant is zero, since a one-valued positive-mass square would create triangles. This is precisely a finite weighted graph quotient, and that graph has no triangle.

The open condition is obtaining such an ε for a global maximizing counterexample (or ruling out the case where positive codegrees approach zero). [Saturation](SATURATION.md) guarantees positive common mass at nonedges, not a uniform gap. Thus the finite quotient reduction does not yet close [Erdős #23](https://www.erdosproblems.com/23).

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
