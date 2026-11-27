# One four-valent vertex from a marked distance profile

Let a reduced metric tree have strictly positive edge lengths, no degree-two vertices, and defects $`w_v=\deg(v)-2`$. For a mark $`o`$ in the interior of an edge write $`h_v=d(o,v)`$. Use the two signed atomic measures

```math
U_o=\sum_v w_v\delta_{h_v},\qquad B=\sum_{\{u,v\}} w_uw_v\delta_{d(u,v)},
```

where the second sum is over distinct unordered endpoints. The mark has degree two on insertion and contributes zero. A trivalent tree means that each nonleaf vertex has degree three.

**Marked rigidity.** Suppose $`T`$ has exactly one vertex of degree four and all other nonleaf vertices have degree three. Its $`k`$ distances from the mark to the reduced vertices are linearly independent over the rationals. There is no marked trivalent tree $`R`$ with $`k+3`$ vertices having the same two measures. Both the lengths and the position of the competing mark are unrestricted.

**Unmarked consequence.** Fix any such reduced topology $`T`$ with at least sixteen leaves. Among the $`t^{k-1}`$ assignments of lengths in $`\{1,\ldots,t\}`$ to its labelled edges, all but $`O_T(t^{k-2})`$ yield ordinary subdivisions identified among all unweighted trees by the histogram of distances of unordered vertex pairs alone. The proof also eliminates any purported full-dimensional ambiguity admitting a freely variable pendant competitor edge, without the leaf bound. This is a partial result toward [Stanley’s tree conjecture](https://doi.org/10.1006/aima.1995.1020).

## Proof of marked rigidity

Root the trees at their marks. Write $`b`$ for the four-valent vertex and label the distinct target heights $`h_i`$ by their vertices. At each unit atom of $`U_o`$ select in $`R`$ one vertex of its indicated sign. At the atom of mass two select two positive vertices $`b_1,b_2`$. These $`k+1`$ selected vertices account exactly for $`U_o`$. The two remaining vertices must be a positive hub $`q`$ and a negative leaf $`l`$ of the same height $`t_0`$. This height may be one of the selected heights. In particular $`l`$ is never a descendant of $`q`$. Similarly $`b_1,b_2`$ lie in incomparable rooted subtrees.

For each target leaf $`i`$ take a separate basis vector $`e_i`$ in a rational vector space. Choose a rational-linear map on the span of the selected heights and $`t_0`$ sending every selected hub height to zero and each selected leaf height to its $`e_i`$. Independence provides such a map even if $`t_0`$ lies in the span. Write $`v`$ for the image of $`t_0`$ and $`Z=X^v`$ for the corresponding monomial. Multiply monomials by adding exponents. The subgroup spanned over the integers by the finitely many tags is torsion-free and finitely generated, so its rational group algebra is a Laurent polynomial domain. Every distance belongs to the domain of the linear map, since for a pair with lowest common ancestor $`c`$ its value is $`h_i+h_j-2h_c`$ with the mark at height zero.

Momentarily weight every pair by the monomial of its *sum* of heights. Its signed generating polynomial is half the difference between the square of the tagged profile and the diagonal sum $`\sum_i w_i^2 X^{2\mathrm{tag}(h_i)}`$. The actual distance monomial has the additional ancestor factor $`X^{-2\mathrm{tag}(h_c)}`$. All target ancestors have tag zero. In the competitor only the hub $`q`$ might have nonzero ancestor tag. Relative to the target, the competitor diagonal replaces $`4`$ by $`2+2Z^2`$. Thus equality of the two actual pair measures implies

```math
0=1-Z^2+(Z^{-2}-1)C,
```

where $`C`$ is the uncorrected sum for pairs whose lowest common ancestor is $`q`$. Let $`A_1,A_2`$ be the signed sums of endpoint monomials in its two child subtrees. Pairs across those subtrees or between $`q`$ and a descendant give

```math
C=A_1 A_2+Z(A_1+A_2).
```

If $`v\ne0`$, cancellation in the domain gives $`(A_1+Z)(A_2+Z)=0`$. All descendants of $`q`$ are selected. Each child sum is its number of positive hubs minus one distinct $`X^{e_i}`$ for each of its leaves. For one of these nonempty subtrees to have sum $`-Z`$, it must contain exactly one leaf, no hub, and $`v=e_{i_0}`$ for the label of that leaf.

The incomparable trivalent vertices $`b_1,b_2`$ have at least four distinct descendant leaves between them. Choose among them a selected leaf $`j\ne i_0`$, excluding the one unselected leaf. Consider the actual positive distance $`h_j-h_b`$, which has tag $`e_j`$. No competitor pair having lowest common ancestor $`q`$ can contribute: the endpoint tags would need to sum to $`e_j+2e_{i_0}`$, while each endpoint tag is either zero or a single basis vector. For other ancestors the two endpoints must be leaf $`j`$ and a selected hub of height $`h_a`$. If their ancestor is at $`h_c`$, equality with the chosen distance requires $`h_a-2h_c=-h_b`$. Rational independence forces $`h_a=h_c=h_b`$ and rules out ancestor height zero. Equality with the height of the endpoint hub makes that hub the ancestor itself, by positivity. On the path to $`j`$ exactly one such ancestor occurs. The coefficient in $`R`$ is therefore $`-1`$. In $`T`$ the same tag and independence argument gives either zero or $`-2`$, according as $`b`$ is absent from or present on that ancestral path in $`T`$. This contradiction eliminates $`v\ne0`$.

If $`v=0`$, all ancestors in both trees have tag zero. For distinct selected leaves $`i,j`$, the projected tag $`e_i+e_j`$ picks out only this pair on each side. The original measures agree on its whole inverse image, hence the actual labelled leaf distances agree for every such pair. Choose a target leaf in each of the four branches at $`b`$. For this quartet all three sums obtained by partitioning it into pairs coincide, since each uses all four paths to $`b`$. In any positive-length trivalent tree the reduced subtree on four distinct leaves has two branch vertices separated by a path of positive length. Two of the three sums exceed the third by twice that length. This contradiction proves marked rigidity.

## From the bare histogram to the mark

Use the [single-topology decision theorem](PATH-HISTOGRAM-DECISION.md) and its [full-dimensional matching construction](FIXED-EXCESS-REDUCTION.md). A failure of the asserted integer bound supplies a positive matching cell whose projection has full dimension. Choose in it independent real target edge lengths. The signed measure $`B`$ is obtainable from the unweighted histogram by the [signed second difference](PATH-DISTANCE-CERTIFICATE.md), and its actual positive-length real continuation agrees across this cell. All $`\binom{k}{2}`$ distinct target pair distances appear. Therefore the competitor has $`k'\ge k`$ reduced vertices. Both have the same $`M=\sum_v w_v^2=k+3`$, from $`2\sum_{u\lt v}w_uw_v=4-M`$. Since $`M-k'`$ is zero or at least three, either $`k'=k`$ and its defects have the same multiplicities, or $`k'=k+3`$ and it is trivalent. In the first case the generic [degree and path certificate](PATH-DISTANCE-CERTIFICATE.md) forces isometry. In the second case the competitor has one more leaf than the target by the degree sum.

As in the matching construction, the row space of equal-competitor-path conditions and target path-addition conditions has rank at most three. There is at least one nonzero equal-competitor-path row: the extra competitor pairs cannot all occupy distinct distances, since a singleton class has a nonzero weight. Choose a row basis beginning with that row. Its first member uses at most two paths, the other two at most three paths apiece. A simple path includes at most two pendant edges. At most sixteen pendant edges occur in the union. With at least seventeen competitor leaves some pendant edge can vary independently of all the other edges in the full matching nullspace.

By the [free-edge and deletion identities](FIXED-EXCESS-REDUCTION.md), the varying edge then equals a target pendant edge at a trivalent vertex, and deleting the two matched leaves gives equal $`B`$ and equal marked profiles at the suppressed attachment vertices. Both reduced orders decrease by two; the target still has one four-valent hub while its competitor is trivalent. The target marked heights after deletion are rationally independent. Indeed the positive lengths in the cut tree with the mark inserted are the old lengths with only the deleted pendant edge removed; these are independent. Rooting at the mark, each length is a child height minus its parent height, with root height zero. This triangular change of variables is invertible. The marked theorem now excludes the second case. The integer estimate follows by the rational-cone decision theorem.

This argument proves generic identifiability for the stated large one-four-valent topologies. The [companion collision argument](QUARTIC-DISTANCE-RIGIDITY.md) removes the leaf-count restriction. Higher excess and the unrestricted chromatic symmetric function conjecture remain open. The proof is written; it has no Lean formalization.
