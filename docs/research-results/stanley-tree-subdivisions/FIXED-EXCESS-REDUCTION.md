# Finite reduction at fixed degree excess for ordinary path histograms

For a nontrivial reduced tree $`T`$, write $`k`$ for its number of vertices and $`w_v=\deg(v)-2`$ for its signed defects. Put $`M=\sum_v w_v^2`$ and $`\Delta=M-k`$. Thus $`\Delta`$ is the sum of $`w_v^2-1`$ over the hubs. Here **generically identifiable** means that all but $`O_T(t^{k-2})`$ of the labelled edge assignments in $`\{1,\ldots,t\}^{k-1}`$ give unweighted subdivisions determined among all trees by their ordinary unordered distance histogram.

**Reduction.** For any prescribed positive excess $`\Delta`$, it is decidable whether **every** reduced tree of that excess is generically identifiable. If the answer is negative, there is a witnessing reduced target and a fixed competing topology, each with at most $`12\Delta-2`$ vertices. It therefore suffices to run the [single-topology decision test](PATH-HISTOGRAM-DECISION.md) on finitely many cores, even though this excess allows arbitrarily many trivalent hubs. For excess zero the previous [trivalent theorem](PATH-DISTANCE-CERTIFICATE.md) already gives an affirmative answer. The reduction does not give an affirmative answer for every positive excess.

## A full-dimensional family of matches

Suppose a reduced target $`T`$ has a positive-density family of ambiguous subdivisions. By the single-topology test, some competitor $`R`$ has a nonisomorphic matching cell whose projection onto the target variables has full dimension $`k-1`$. Choose a point in its relative interior whose **real** target lengths are linearly independent over the rationals. Such points exist outside the countable union of proper rational hyperplanes. Integer densities enter through the separate rational-cone argument; no independence over the rationals is asserted for integers. The target reduced pair distances are then distinct, with nonzero endpoint products. A competitor with $`k'`$ reduced vertices has $`k'\ge k`$ by the number of visible pairs. Equality of the distance data gives the same $`M`$, so $`\delta=k'-k`$ lies between zero and $`\Delta`$ and the competitor has excess $`\Delta-\delta`$.

For each nonempty target path $`ij`$, choose a competitor path $`P_{ij}`$ matching its length in the cell. Use its incidence vector as a linear form in the competitor edge coordinates $`x`$. Each target edge length is now a particular $`P_{ij}(x)`$. Impose the following equations in the competitor variables.

1. Impose all equalities between competitor path forms in the same actual distance class.
2. For each nonsingleton target path $`ij`$, choose one interior vertex $`z`$ and impose $`P_{ij}=P_{iz}+P_{zj}`$.

The second conditions ensure inductively that the representatives have exactly the required lengths in the tree with those target edge values. Each first row uses differences of at most two paths. Each second row uses at most three paths. Let $`V`$ be their common nullspace. It contains the projection of the original matching cell onto competitor variables. The map from $`V`$ to target variables by the chosen edge representatives has rank $`k-1`$, so the rows have rank at most $`(k'-1)-(k-1)=\delta`$.

For any $`x\in V`$, including outside the initial ordering cell, the signed exponential sums for the two trees coincide:
```math
\mathcal B_T(s)=\sum_{u\lt v}w_u w_v\exp(s d(u,v))=\mathcal B_R(s).
```
Indeed, sum first over the original competitor path classes. Each invisible class has net weight zero and its path forms remain equal. In each visible class the common representative is the corresponding target path length and the signed weights sum to its target coefficient. Coincidences between previously different classes merely add equal terms on both sides. At our chosen point every edge on both trees is positive.

## Finding a freely variable pendant edge

Choose a basis from the displayed rows. Each of its at most $`\delta`$ members involves at most three simple paths and therefore meets at most six pendant edges of the competitor. Any pendant edge $`e`$ outside their union can vary freely with all other competitor lengths fixed. At most $`4(\Delta-\delta)/3`$ competitor leaves have a neighbor of degree greater than three, since a hub of defect $`w\ge2`$ is incident with at most $`w+2\le4(w^2-1)/3`$ leaves. Consequently if $`R`$ has more than
```math
6\delta+4(\Delta-\delta)/3\ \le\ 6\Delta
```
leaves, there is a freely variable pendant edge at a trivalent hub. Positive excess of the target rules out the single-edge competitor.

Every target edge length has slope zero or one under this variation, being the length of a fixed competitor path. Their slopes sum to one. Indeed the first derivative of $`\mathcal B_T(s)`$ at $`s=0`$ equals the total edge length, as the sum of defects on either side of any single edge is $`-1`$. Thus exactly one target edge $`f`$ varies, with length $`x_e+C`$. Here $`C\ge0`$ is the sum of the other lengths on its representative path. If $`C>0`$, putting $`x_e=0`$ leaves every target edge positive, but the two endpoints of $`e`$ are the unique competitor pair of zero distance and have nonzero product. Equality of the signed sums prohibits this, by linear independence of exponentials of distinct real distances. Hence $`C=0`$, the representative is $`e`$ itself, and the same zero-distance comparison gives equal endpoint products for $`e`$ and $`f`$. This product is $`-1`$, so $`f`$ is also pendant at a trivalent hub.

## Removing and recovering the leaf

On either tree write $`z`$ for that trivalent neighbor, $`\ell`$ for the leaf and $`E`$ for their common edge length. Define $`N(s)`$ by omitting all pairs containing $`\ell`$ from the old sum, with the old weights. Set
```math
H(s)=\sum_{v\ne\ell} w_v\exp(s d(z,v)).
```
The old sum is $`N(s)-\exp(sE)H(s)`$. Holding all other coordinates fixed and varying $`E`$ identifies $`N`$ and $`H`$ on both trees, first at every $`s\ne0`$ and then by continuity at zero. After deleting the leaf, $`w_z`$ decreases from one to zero. The new signed sum is $`N-H+1`$ and the signed distance profile at the marked point $`z`$ is $`H-1`$. Suppressing $`z`$ as a bivalent vertex preserves both quantities. Denote the new reduced tree by $`T_0`$ or $`R_0`$. On both sides the vertex count drops by two and $`M`$ drops by two, preserving both excesses.

We show that isometry of these reduced metric trees would recover the original marked point and hence the original trees. In $`T_0`$ let $`g=uv`$ be the merged edge of length $`L_g`$ and $`\alpha=d(u,z)`$. All the new edge lengths together with $`\alpha`$ and the deleted length $`E`$ are rationally independent: they are an invertible rational linear reparametrization of the original independent target lengths. The distances from $`z`$ to the reduced vertices are all distinct. On the same side of $`g`$ this follows from independence of the edge lengths and distinctness of the paths from the side's endpoint. Distances on opposite sides have coefficients $`+1`$ and $`-1`$ on $`\alpha`$. Each vertex supplies a nonzero signed atom, so equality of the signed marked profiles in isometric trees implies equality of the unlabelled distance sets even if the competing point was initially unpromised: there are exactly as many distinct atoms as reduced vertices.

Exactly one known reduced edge length is a sum of two marked-point distances to distinct vertices. On the same side their sum has a nonzero coefficient on $`\alpha`$. On opposite sides the sum is the genuine path length between those two vertices and equals an edge length only when that path consists of that one edge, by independence. The unique pair is therefore $`u,v`$ and the edge is $`g`$. Any competing marked point lies strictly inside an edge because it came from suppressing a trivalent hub after leaf removal. Its two endpoint distances sum to that edge length, so it lies on $`g`$ and is either at $`z`$ or at its reflection.

If the edge has a neighbor edge $`h`$ at $`u`$, the far endpoint of $`h`$ would have distance $`L_g-\alpha+L_h`$ from the reflected point. No target distance on the $`u`$-side has this coefficient on $`\alpha`$. A target vertex on the other side with this distance would require a path of length $`L_h`$ from $`v`$ lying on that side, impossible by independence since $`h`$ is on the $`u`$-side. The argument with the endpoints exchanged covers a neighbor only at $`v`$, including when $`g`$ is pendant. For a tree consisting of one edge the reflection is a genuine isometry. Thus a trimmed isometry always extends to a marked one and reattaching the common leaf gives an isometry before trimming.

## Descent and scope

It follows that the two pruned metric trees are genuinely nonisomorphic and have identical signed measures. The square-defect budget also follows directly for any real matching pair from twice the value of its signed sum at zero, which is four minus the sum of its squared defects. The pruned target lengths are rationally independent. They therefore lie in no proper rational hyperplane. The cell of this pruned matching must project with full target dimension, and the integer construction in the [decision proof](PATH-HISTOGRAM-DECISION.md) makes it a positive-density family of integer ambiguities. This step ensures that induction is about full-dimensional ambiguities even after a choice of real generic point.

Repeat as long as the competitor has more than $`6\Delta`$ leaves. Each step decreases its order by two and keeps the target excess unchanged. At termination a nontrivial reduced tree on $`b`$ leaves has at most $`2b-2`$ vertices, by the degree sum and the minimum hub degree of three. The resulting competitor has at most $`12\Delta-2`$ vertices, and the resulting target has no more than the competitor. Thus a failure at any size gives a bounded witness. Conversely any bounded failure is a failure for the entire class. The procedure can enumerate all bounded target topologies satisfying the prescribed excess and use the existing finite decision criterion on them. The positive-excess numerical thresholds need not be sharp.

This is a research reduction for reconstructing a tree from its distance histogram. It does not settle any positive-excess class by itself, and Stanley's unrestricted CSF problem remains open. It is not Lean formalized.

[Internal independent review](FIXED-EXCESS-REVIEW.md) · [Direct pruning and marked-point checks](verify_fixed_excess_pruning.py) · [Continuous metric-tree formulation](METRIC-TREE-DISTRIBUTION.md)
