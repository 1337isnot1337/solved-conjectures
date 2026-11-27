# A finite marked-tree reduction controlled by the rational relations among the heights

Consider finite reduced metric trees with positive edge lengths, marked at a hub or at an interior point of an edge. Keep an interior mark as a bivalent vertex. Write $`w_v=\deg(v)-2`$, $`h_v=d(o,v)`$ and
```math
U=\sum_v w_v\delta_{h_v},\qquad
B=\sum_{\{u,v\}}w_uw_v\delta_{d(u,v)}.
```
The data are the signed marked profile and the global signed pair measure. The target has rationally independent nonzero vertex heights. Repeated heights in the rival, vertices of arbitrary degree and rival lengths outside the rational span of the target are allowed. This is a marked inverse problem within the [tree-subdivision campaign](https://github.com/1337isnot1337/solved-conjectures/issues/315).

Let $`m`$ and $`m+c`$ be the target and rival leaf counts, and assume $`c>0`$. Let $`s`$ be the number of distinct positive rival heights absent from the target. Let $`r`$ be their rational rank modulo the span of the target heights. The nullity of the complete set of distinct positive heights is $`\delta=s-r`$. Indeed every true nonzero vertex height has nonzero weight in $`U`$ and so occurs also in the rival. The sum of the true heights' rank and $`r`$ is the rank of the union. At every rival-only height at least one rival leaf cancels positive hub weight. Reserving one rival leaf for each target leaf shows $`s\le c`$.

**Theorem.** Put $`q=5\delta-s=4s-5r`$. Every such comparison with equal $`U,B`$ has at least $`m-q`$ target leaves that occur at singleton heights in the rival and have the same entire signed profile in both trees. It supplies a marked comparison of the same positive surplus on at most $`q`$ target leaves. In particular
```math
q\ge4,\qquad c\le\binom{q-2}{2}.
```
For any prescribed upper bound $`D`$ on the total height nullity, existence of any positive-surplus marked comparison with independent target heights is decidable over all finite topologies and **all** surpluses by testing at most $`4D`$ target leaves and $`\binom{4D-2}{2}`$ extra rival leaves (there are no instances for $`D=0`$). This specializes the [surplus-wise reduction](LINEAR-LEAF-SURPLUS.md), which uses a fixed leaf surplus. No uniform outcome of these tests or resolution of Stanley's conjecture follows here.

## Paths as linear expressions in actual height labels

Give each distinct nonzero real height in the union its formal coordinate vector $`e_h`$ and put $`e_0=0`$. For an unordered pair of distinct reduced vertices set
```math
v(x,y)=e_{h_x}+e_{h_y}-2e_{h_{x\wedge y}},
```
where the meet is the common ancestor furthest from the mark. The map sending $`e_h`$ to its actual real height sends this vector to the actual path length. Take all differences of two such vectors, across or within the trees, whenever they give the same actual distance. Their span is contained in the kernel of the height map and has dimension at most $`\delta`$. For every actual distance the sum of relative signed units is zero, taking the rival weights positively and subtracting the target weights. This includes a distance whose signed contributions all cancel in a single tree.

Call a height special if it is rival-only or is a true leaf height with more than one rival representative. Every special height $`h`$ occurs with a nonzero coefficient in a realized difference row with at most five coordinate labels. To see this, set its formal coordinate to one and all others to zero. A pair has resulting value two exactly when both endpoints have actual height $`h`$. Two distinct vertices at one positive height are incomparable, giving an ancestor of strictly lower height. For the rival class the sum of weights of those pairs is
```math
\frac12\left(\left(\sum_{x:h_x=h}w_x\right)^2-\sum_{x:h_x=h}w_x^2\right).
```
At a rival-only height its first term vanishes. At a repeated true leaf height its first squared sum equals one, while the second exceeds one since the weights are nonzero integers. Thus the sum is strictly negative, and the target has no pair of value two. At some actual distance a pair with value two must therefore occur alongside a pair with a different value in its zero-total class. The first pair has vector $`2e_h-2e_a`$. Subtracting the second pair vector has support at most five and nonzero coefficient at $`h`$.

Select one such row for each special height, then take a basis of these rows from the rows themselves, of size $`p\le\delta`$. Their combined coordinate supports contain every special height. Since all $`s`$ rival-only labels occur there, these supports contain at most $`5p-s`$ true leaf labels. Outside the supports each true leaf occurs as a single rival leaf, by the profile at its height. It can never be a lowest common ancestor in either tree. Extend the basis with further realized difference rows to a basis of all those rows. Each added row can introduce at most four previously uncovered true leaf labels, from its four endpoints. Hence the combined supports of the basis meet at most
```math
5p-s+4(\delta-p)\le5\delta-s=q
```
true leaf labels. Every actual equal-length comparison has zero coordinate at every leaf outside these supports. That coordinate in a realized pair vector is one precisely when the pair is incident to the corresponding singleton leaf. Restricting the actual measure $`B`$ to such distances gives exactly the contribution from pairs incident to this leaf on both sides. Negate it and adjoin the leaf's atom $`-\delta_0`$ to recover the full signed leaf profile. This argument also handles fully canceled real distances.

## Deletion and the choice of the smaller mark

Take a leaf $`j`$ with a recovered profile and write $`p`$ for its unique nearest other reduced vertex, its parent. The positive pendant length $`a`$ and positive parent defect $`w_p`$ are read from the first positive-distance atom, so agree on the two sides. Define
```math
H=\sum_{y\ne j}w_y\delta_{d(p,y)},\qquad
N=\sum_{\{x,y\}:x,y\ne j}w_xw_y\delta_{d(x,y)} .
```
The leaf profile is $`-\delta_0+\tau_a H`$ and the old pair measure is $`N-\tau_aH`$, where $`\tau_a`$ translates by $`a`$. Thus $`H,N`$ agree. Upon deleting the pendant, the parent defect drops by one, and the new pair measure is $`N-H+w_p\delta_0`$. Suppress any bivalent unmarked parent. All uses of this operation have a target with at least four leaves, by the square moment below.

If the mark lies outside the open pendant, retain it. This case is determined by $`h_j\ge a`$, including a mark at the parent. The new profile is $`U+\delta_{h_j}-\delta_{h_p}`$, with $`h_p=h_j-a`$. The union of surviving distinct positive heights is a subset of its old value, so the nullity does not increase. Both removed vertices, when removed, had true heights. Every rival-only height survives, so $`s`$ does not decrease. The surviving target heights remain independent.

If the mark lies strictly inside the pendant, then $`h_j<a`$ on both sides. Delete the entire pendant and place the new mark at $`p`$, retaining a bivalent parent as the mark. Its new profile is $`H-\delta_0`$. All surviving vertices were on the parent side of the old mark, with the sole exception of the removed leaf. Writing $`h_p=a-h_j`$, the new height of each surviving vertex other than $`p`$ is $`h_y-h_p>0`$. Every rival-only height therefore persists, shifted by the same $`-h_p`$, and cannot collide with a shifted true height. For distinct surviving height labels the formal vectors $`e_{h_y}-e_{h_p}`$ are linearly independent in the old free coordinate space. Restricting the old height map to their span cannot increase kernel dimension. For the true labels this same calculation and the old independence give independence after translation.

In both cases the leaf surplus is preserved and $`5\delta-s`$ cannot increase. Whenever the current target has more leaves than this bound, there is a leaf to remove. In the smaller tree the common mass of $`B`$ still determines $`M=\sum_vw_v^2=4-2B(\mathbb R)`$. For a tree on $`L`$ leaves write $`K=\sum_{w_v>0}\binom{w_v}{2}`$. The sum of its positive defects is $`L-2`$, and thus $`M=2L-2+2K`$. In particular $`c=K_T-K_R\le K_T\le\binom{L-2}{2}`$. A positive-surplus target must have at least four leaves. The descent terminates at a comparison with at most the original $`q`$ leaves, proving both bounds. If all rival heights are true or the additional heights are independent modulo the true span, positive surplus is impossible.

## Finite tests at bounded nullity

For fixed $`D\ge1`$, $`q=4\delta-r\le4D`$. The preceding bounds leave finitely many reduced topologies, mark placements at a hub or inside an edge, leaf counts and surpluses. For each candidate use the [rational cell test](PATH-HISTOGRAM-DECISION.md) on the finite joint list of positive lengths, pair distances and vertex heights. Enumerate equality and strict-order patterns of heights and distances, require positive lengths, check the signed sums at every height and distance, and check the root atom. Each feasible pattern is relatively open in its rational linear solution space. In that space compute the rational rank of the target height forms and of one representative of each distinct positive union height. The former must equal the number of target heights. The latter must be at least the number of distinct union heights minus $`D`$. These conditions are necessary and sufficient: choose any point in the nonempty relative open cell outside the countably many rational hyperplanes on which a nonidentically-zero rational combination of the restricted height forms vanishes. Both ranks are then attained simultaneously. Choosing a representative under the finite tree automorphism group is optional for this existence test. The claim is decidability, without a complexity estimate or evaluation of any large instance.
