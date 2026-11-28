# Kneser–Poulsen conjecture

**Status.** Partial results for union volumes. The unrestricted conjecture remains open. [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/599)

## Exact target and sources

The original union assertion is that expanding every pairwise distance between finitely many labeled centers in Euclidean space weakly increases the volume of the union of congruent balls. The modern formulation allows different fixed positive radii. This note proves sufficient conditions for that union assertion and exhibits an obstruction to checking individual walls without conditions. [Poulsen, Problem 10](https://geodesic.mathdoc.fr/item/MS2_1954__2_165557/) · [Kneser](https://doi.org/10.1007/BF01900510) · [Bezdek and Connelly, Conjecture 1](https://arxiv.org/abs/math/0108098)

The bounded 2026-11-25 UTC screen used the union, weighted-ball and configuration-expansion formulations. It found the general planar theorem of Bezdek and Connelly, Gorbovickis’s theorem for small triple incidence, the 2026 uniform-contraction results and Aishwarya and Li’s version 2 recovering known cases by Gaussian convolution. None supplies an unrestricted proof. Cheng, Tan and Zheng also prove that a monotone motion can require twice the endpoint dimension. The repository branches, issue tracker and PRs yielded no matching research package. Priority for the results below is provisional. [Gorbovickis, Theorem 1.3](https://cdm.ucalgary.ca/article/download/62082/46716/177471) · [Uniform contractions, v2](https://arxiv.org/abs/2602.15352v2) · [Aishwarya and Li, v2](https://arxiv.org/abs/2609.07041v2) · [Cheng, Tan and Zheng](https://arxiv.org/abs/1107.0140)

## Sufficient conditions at individual walls

Let $`p=(p_1,\ldots,p_N)`$ and $`q=(q_1,\ldots,q_N)`$ be in $`\mathbb R^d`$, with all pairwise distances weakly larger at $`q`$. Fix positive radii $`r_i`$. Define the potentially relevant labels for a pair $`i,j`$ to be $`i,j`$ themselves and those indices $`a`$ for which the three closed balls of labels $`i,j,a`$ intersect at $`p`$. Let $`\rho_{ij}`$ be the affine dimension of the paired vectors $`(p_a,q_a)\in \mathbb R^{2d}`$ on this index set.

Use the lifted centers
```math
z_a(t)=\bigl(\sqrt{1-t}\,p_a,\sqrt t\,q_a\bigr).
```
When the distance on pair $`i,j`$ increases, its two centers are distinct at interior times. Let $`H_{ij}(t)`$ be their radical hyperplane, defined by equality of powers $`\Phi_i(x)=\Phi_j(x)`$, where $`\Phi_i(x)=|x-z_i(t)|^2-r_i^2`$. Let $`u_{ij}(t)`$ be the orthogonal projection of $`z_i(t)`$ onto this hyperplane.

**Theorem.** The union volume at $`q`$ is at least the union volume at $`p`$ if every increasing pair satisfies one of the following conditions.

1. $`\rho_{ij}\le d+2`$.
2. $`\rho_{ij}\le d+4`$ and, for every other potentially relevant label $`a`$ and every interior time $`t`$, $`\Phi_a(u_{ij}(t))\le\Phi_i(u_{ij}(t))`$.
3. At every interior time, $`\Phi_a(u_{ij}(t))=\Phi_i(u_{ij}(t))`$ for every other potentially relevant label.

Condition 1 permits arbitrarily many triple incidences, provided the paired affine span is small. Gorbovickis’s bound of $`d+1`$ other labels implies condition 1. The conditions impose no restriction on pairs whose distances stay constant.

For equal radii the power comparison in condition 2 reduces to
```math
|z_a-z_i|^2+|z_a-z_j|^2\le |z_i-z_j|^2.
```
This inequality holds for the full lifted path if it holds at the endpoints, since each squared distance is affine in $`t`$. For unequal radii, putting $`\lambda=(|z_i-z_j|^2+r_i^2-r_j^2)/(2|z_i-z_j|^2)`$ gives $`u_{ij}=(1-\lambda)z_i+\lambda z_j`$. At this point,
```math
\Phi_a-\Phi_i=(1-\lambda)|z_a-z_i|^2+\lambda|z_a-z_j|^2-\lambda|z_i-z_j|^2+r_i^2-r_a^2.
```
Multiplication by $`2|z_i-z_j|^2`$ makes the comparison a quadratic polynomial test on the parameter interval. The formula follows from the squared norm identity for an affine combination and remains valid when the foot lies beyond either center.

### Proof

If two centers coincide at $`p`$, retain only a largest-radius label at that point. This preserves the initial union and can only reduce the final union. The pair hypotheses are preserved for the remaining labels. We can therefore assume that the centers are distinct throughout the lifted path.

Work in ambient dimension $`D=d+2m`$, with $`m\ge 2`$ and $`D\ge 2d`$, padding the lift by zero coordinates. The distance formula for the lift is the Alexander construction expressed in orthogonal coordinates. Set $`r_i(s)^2=r_i^2+s`$ and interpret negative squared radius as an empty ball. Power differences and radical hyperplanes are independent of $`s`$. Denote the volume of the lifted union by $`U_D(t,s)`$. Let $`W_{ij}(t,s)`$ be the $`(D-1)`$-volume of the intersection of the radical hyperplane, the ball of label $`i`$ and all the halfspaces $`\Phi_i\le\Phi_a`$. At generic squared radii, Csikós’s formula integrated over the expansion gives
```math
U_D(1,s)-U_D(0,s)=\int_0^1\sum_{i\lt j} d'_{ij}(t)W_{ij}(t,s)\,dt .
```
All the coefficients are nonnegative and the constant-distance terms vanish. The distance derivatives are bounded up to the endpoints, since initially distinct centers have positive minimum pair distance. The wall volumes are uniformly bounded for bounded $`s`$ by the volume of a ball in a hyperplane. One can integrate first on compact interior time intervals, where the volume is locally Lipschitz under the smooth translations of the balls, and then use volume continuity at the endpoints. [Csikós’s volume derivative](https://doi.org/10.1007/PL00009395) · [Bezdek and Connelly, §5](https://arxiv.org/abs/math/0108098)

For clarity, handle coincident radical hyperplanes by perturbing the squared radii in a fixed generic direction and letting the positive perturbation tend to zero. The perturbation direction is independent of $`s`$. Three lifted centers are collinear at an interior time only if their paired vectors are collinear, in which case their affine ratio is time-independent. For a collinear triple the condition that its radical planes agree is affine in the squared radii and in the squared pair distances, hence affine in time. The generic perturbation direction avoids preserving a persistent equality. For sufficiently small positive perturbation, radical coincidences for a collinear triple occur at most at isolated times. Other triple ties have codimension at least two in the ambient space and do not affect the formula.

At any fixed interior time and pair, translate the perturbed radical hyperplane back to the unperturbed one. Its ball section and each nonconstant power inequality converge off sets of hyperplane measure zero. A power inequality constant on the hyperplane either stabilizes as true or stabilizes as false, by affine dependence on the perturbation. Its truth value is independent of $`s`$. Consequently the limiting perturbed wall volume is either the displayed unperturbed wall volume or zero, with that choice independent of $`s`$. Dominated convergence gives the integral formula at the original radii with each wall multiplied by a coefficient in $`\{0,1\}`$ depending on the pair and time alone. All subsequent difference arguments hold with these coefficients. This preserves the hypotheses even when an outward halfspace inequality is an equality at the foot.

For some $`\epsilon>0`$, every triple disjoint at the initial radii stays disjoint at $`p`$ under the common squared-radius shift $`s\le\epsilon`$. This follows by compactness for each absent triple and finiteness of the label set. Such a triple is also disjoint at every lifted time for these radii. Indeed, the map from the lifted centers back to $`p`$ is 1-Lipschitz and extends by Kirszbraun’s theorem. A point in a lifted triple intersection would map into an initial triple intersection. Embedding the initial centers in the lift does not create an intersection, by orthogonal projection. A label absent from the potentially relevant set cannot remove any point from the truncated radical hyperplane. A removed point lies in both pair balls and in the competing ball because its competing power is smaller than the common nonpositive pair power. Thus only the potentially relevant labels enter the wall volume. [Gorbovickis’s related triple argument, §§4–5](https://cdm.ucalgary.ca/article/download/62082/46716/177471)

Fix a time and pair. In the radical hyperplane the truncated wall is a polyhedron intersected with a ball centered at its foot $`u_{ij}`$. The squared radius in the hyperplane is $`s+\sigma`$, where $`\sigma=r_i^2-|z_i-u_{ij}|^2`$. The possible halfspace normals come from the projections of the center differences onto the radical hyperplane. If the local affine dimension is at most $`d+2j`$, the normals span at most $`d+2j-1`$ dimensions, since the pair direction already belongs to the center span and is orthogonal to the hyperplane. Take a subspace of dimension $`d+2j-1`$ containing those normals and denote the corresponding truncated volume by $`f(s)`$. The other directions are unrestricted except by the ball. For $`j\le m`$, integrating in them gives
```math
W_{ij}(t,s)=\pi^{m-j} I^{m-j} f(s),
\qquad (If)(s)=\int_{-\infty}^s f(v)\,dv .
```
One step integrates over two perpendicular coordinates in polar coordinates. Repeating yields the formula. All these wall volumes vanish for sufficiently negative squared radius.

In condition 1 take $`j=1`$. The set defining $`f(s)`$ grows with $`s`$, so $`f`$ is nondecreasing. In condition 2 take $`j=2`$. With the foot as origin, each retained halfspace can be written $`a\cdot x\ge b`$ with $`b\ge0`$. Along a ray the allowed nonnegative radii therefore form a ray starting at a threshold $`c\ge0`$, an empty set, or a set of zero radial volume. Polar integration in dimension $`n=d+3`$ gives the respective contributions proportional to
```math
\left((s+\sigma)_+^{n/2}-c^n\right)_+ .
```
Every such function is convex since $`n/2\ge1`$. Integrating over directions proves that $`f`$ is convex. In condition 3 the wall polyhedron in the full hyperplane is a cone with apex at the foot. Its wall volume is a nonnegative constant times $`(s+\sigma)_+^{(D-1)/2}`$, whose forward differences of order $`m`$ are nonnegative. Its weak derivative of order $`m`$ is nonnegative, since $`(D-1)/2\ge m-1/2`$, and integrating it over an $`m`$-fold product interval gives the forward difference.

For a step $`h>0`$, write $`\Delta_h f(s)=f(s+h)-f(s)`$. Each repeated primitive in the volume formula turns one forward difference into an integration over a step interval. In particular,
```math
\Delta_h^m I^{m-j} f(s)=
\int_{[0,h]^{m-j}} \Delta_h^j f(s+x_1+\cdots+x_{m-j})\,dx .
```
The right-hand side is nonnegative when $`s+mh\le\epsilon`$, using monotonicity for condition 1 and convexity for condition 2. The cone calculation covers condition 3. Thus all contributing walls have nonnegative differences of order $`m`$. Applying the same difference to the integrated Csikós formula gives a nonnegative forward difference of the lifted union change at $`s=0`$ for sufficiently small $`h`$.

At either endpoint all centers lie in a $`d`$-dimensional subspace. By the same two-coordinate integration, its lifted union volume is $`\pi^m I^m U_d(s)`$, where $`U_d(s)`$ is the union volume at that endpoint in dimension $`d`$. Its order-$`m`$ forward difference divided by $`h^m`$ tends to $`\pi^m U_d(0)`$ by volume continuity. Taking the limit in the lifted comparison proves the theorem.

## Connected configurations beyond the triple-count condition

Here is an arbitrary-cardinality class using condition 1. In dimension $`d\ge4`$, for each $`j=2,\ldots,d`$, place a cluster of radius-one balls at the initial centers $`10j e_1+\epsilon_\ell e_j`$ and the final centers $`20j e_1+(\epsilon_\ell+\epsilon_\ell^2)e_j`$, for distinct real $`\epsilon_\ell\in[0,1/4]`$. Include at least three labels in each cluster. Between consecutive clusters include a ball of radius $`9/2`$ with center on the $`e_1`$ axis at their midpoint at each endpoint.

Distances within each cluster increase since the scalar change is increasing with slope at least one. Between different clusters or between a bridge and a cluster, the first-coordinate separation doubles from at least five and the initial transverse squared distance is at most $`1/8`$. Bridge-to-bridge distances double. Thus the final configuration is an expansion. Initially, different clusters have disjoint balls and the bridge balls are mutually disjoint. A bridge meets the two adjacent clusters and no others. It follows that the potentially relevant labels for any initially overlapping pair fit in a single cluster plus its adjacent bridges. In the paired-vector space, all such points lie in an affine space spanned by the common $`e_1`$ direction with scaling two and the two endpoint coordinate directions for the cluster axis. So the local affine rank is at most three. A pair which starts disjoint has no other potentially relevant labels.

The connected initial union can have arbitrarily large triple incidence, since every ball of a single cluster contains $`10j e_1`$. The affine span of the whole paired configuration has dimension $`2d-1>d+2`$. Each cluster provides two independent directions because at least three points lie on the nonaffine quadratic graph, and the cluster bases give one further independent direction. Thus the local certificate applies even when the whole paired lift has dimension greater than the two-extra-dimension threshold.

## A negative wall term along a genuine expansion

The claim that each moving wall has nonnegative differences of the required order fails even for congruent balls and for the standard lift of a strict expansion. This construction concerns an individual term of Csikós’s formula. The sum of all terms is the quantity needed for the conjecture.

Choose any even endpoint dimension $`d=2m\ge4`$ and use lift dimension $`D=2d`$. Write $`n=D-1`$. In $`\mathbb R^D`$ take centers $`\pm a e_0`$ and $`\pm b e_j`$ for $`1\le j\le n`$, where $`b>2`$ and $`a^2=b^2-2b`$. The wall of the pair $`\pm a e_0`$ lies in $`x_0=0`$. For each $`j\ge1`$, comparison with $`\pm b e_j`$ imposes $`|x_j|\le(b^2-a^2)/(2b)=1`$. Thus the power wall is the cube $`[-1,1]^n`$ truncated at squared radius $`r^2-a^2+s`$ about its center.

Choose $`b`$ large enough and use common squared radius $`r^2=a^2-(m-2)n>0`$. At shifts $`s=0,n,\ldots,(m-2)n`$ the wall has zero volume. At shifts $`(m-1)n`$ and $`mn`$ the wall contains the entire cube. Consequently its order-$`m`$ forward difference with step $`n`$ is $`-(m-1)2^n<0`$. Negative terms also occur with arbitrarily small steps at some radius shifts. For an integer $`J`$, write the step-$`n`$ difference as a sum of shifted step-$`n/J`$ differences, and take its $`m`$-fold product. If all the smaller order-$`m`$ differences in that sum were nonnegative, the displayed large-step difference would be nonnegative.

This wall can occur at an interior time of a canonical lift. In each coordinate plane spanned by $`e_j,e_{j+d}`$ for $`0\le j<d`$, put the line through $`2e_j-e_{j+d}`$ in $`A`$ and the line through $`e_j+2e_{j+d}`$ in $`B`$. These give an orthogonal split into $`d`$-spaces. A difference of distinct centers has one or two nonzero components. If two components lie in the same coordinate plane, their absolute ratio lies strictly between $`1/2`$ and $`2`$, for $`b\ge3`$. If they lie in different planes, their projections in those planes are independent. Hence every difference has nonzero projections onto both spaces. For the fixed wall centers $`c_i`$ and a small $`T>0`$, set $`p_i=\mathop{\mathrm{proj}}_A(c_i)/\sqrt{1-T}`$ and $`q_i=\mathop{\mathrm{proj}}_B(c_i)/\sqrt T `$, identifying each subspace with $`\mathbb R^d`$. As $`T\to0`$, each squared final distance diverges and each squared initial distance stays bounded. For sufficiently small $`T`$, every distance strictly increases and the lifted centers at time $`T`$ are exactly $`c_i`$. In particular the cube wall has strictly positive pair speed.

A general proof through this lift must therefore control cancellation between wall terms, or establish other geometry of the motion. No inequality for a union or intersection is refuted by the wall example.

## Verification

The symbolic audit checks that the radius perturbation retains each original wall or discards it independently of the radius shift, that triple exclusions are preserved on the entire lifted path, and that the endpoint coarea and wall coarea use the same squared-radius parameter. The negative difference is for one wall with positive pair speed.

Run `python3 research/kneser-poulsen/verify.py` from the repository root. The exact checker covers the cluster construction, the radical-foot identity and the negative cube-wall differences. The conclusions in arbitrary dimension use the written argument. The partial results have no independent review or formal verification.
