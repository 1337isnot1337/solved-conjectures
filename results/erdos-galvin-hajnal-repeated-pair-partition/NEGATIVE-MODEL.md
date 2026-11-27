# The simultaneous negative consistency construction

This construction gives the negative direction for [Problem 8/D](PROOF.md) and a negative consistency result for 8/C.

[Diagram 5 and Problems 8/C–8/D](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=49) give two finite triple systems. In clockwise vertex order $`A,B,C,D,E,F`$ starting at the top, the triples are
```math
\mathcal T_5=\{ABC,CDE,AEF,BDF\},
\qquad
\mathcal T_6=\{ABC,ABD,CDE,AEF\}.
```
For clarity, we use the intrinsic definition of the Pasch system: it is the four stars of $`K_4`$ as triples on the six graph edges. In particular, any two of its four triples meet in one point, the six pairwise intersections are distinct, and each triple consists of its intersections with the other three. All copies below are non-induced.

## Statement

There is a ccc forcing adding a triple system $`H`$ on $`\omega_1`$ without an uncountable independent set, omitting both $`\mathcal T_5`$ and $`\mathcal T_6`$. It also has the canonical property that if two triples meet in a pair, that pair is the set of two least vertices of each triple. Consequently each vertex has a matching as its lower link, and every $`n`$-vertex subgraph has at most $`\lfloor(n-1)^2/4\rfloor`$ triples. In particular neither positive arrow of Problems 8/C–8/D is provable in ZFC, assuming ZFC is consistent.

## Forcing and free amalgamation

A condition is a finite set of countable ordinals with a triple system on that set. Require the canonical property and omission of $`\mathcal T_5,\mathcal T_6`$. Order by induced extension. Any vertex may be added as an isolated vertex.

From an uncountable family, the $`\Delta`$-system lemma and thinning give a common root $`R`$, all petals above the root, and order-isomorphic conditions over $`R`$. For the assertion about the root, delete the at most countably many disjoint petals containing some ordinal at most $`\max R`$, when $`R`$ is nonempty. Let $`U`$ be the free union of any finite selection of the resulting conditions, adding no mixed-petal triples. A pair shared by triples from different petals consists of root vertices, below both third vertices, so the canonical property is preserved.

**The Pasch obstruction cannot occur in $`U`$.** A Pasch meeting more than one petal must use exactly two nonroot triples from each of two petals. In fact, a triple that is the only one in its petal must meet all other triples in distinct root points, making it a root triple instead. Thus each of the two participating petals has two triples, and there are no root triples in the Pasch. Each participating triple meets the two on the opposite side in two distinct root points. Its third vertex, at the intersection within its own side, is nonroot. The four intersections across sides are distinct, so four root points are paired in one matching at a petal vertex $`z`$ and in a different matching at a petal vertex $`z'`$.

Project the two conditions to either one by their root-fixing isomorphisms. If the petal vertices occupy distinct positions, the projection is injective on the six Pasch vertices, giving a forbidden copy within one condition. If they occupy the same position, the projected vertex has two different matchings on the same four root points in its lower link, contradicting the canonical property.

**The second obstruction cannot occur in $`U`$.** Suppose the four triples are $`ABC,ABD,CDE,AEF`$. Since $`AB`$ is repeated, $`A,B\lt C,D`$. The three triples $`ABC,ABD,CDE`$ all lie in one participating condition: if $`C`$ or $`D`$ is nonroot, the triple $`CDE`$ puts every nonroot among $`C,D,E`$ in its petal. If $`A`$ or $`B`$ is nonroot, then $`C,D`$ are also nonroot and $`ABC,ABD`$ put $`A,B`$ in that same petal. If $`C,D`$ are both in the root then so are $`A,B`$ and only $`E`$ can be nonroot. The assertion follows in either case.

If $`AEF`$ is not already in that condition, then $`A,E`$ are root points and $`F`$ is in another petal. Move $`F`$ to its corresponding position in the first condition, preserving the triple $`AEF`$. The moved point cannot equal $`B,C`$, or $`D`$: if it equals any one of them, the corresponding pair $`AB,AC`$, or $`AD`$ would occur in both $`AEF`$ and one of $`ABC,ABD`$, but it is not the bottom pair in $`AEF`$ (the moved point is above the root). It cannot equal a root point either. Therefore this transfer gives a copy in one condition, again impossible.

This proves the free-amalgamation assertion and the ccc.

## The generic system has no uncountable independent set

Suppose $`p`$ forces $`\dot X`$ to be uncountable. Choose distinct ordinals $`x_i`$ for $`i<\omega_1`$ and extensions $`p_i\le p`$ forcing $`x_i\in\dot X`$. Include the marked vertex $`x_i`$ in the support of $`p_i`$, adding it isolated if needed. Apply the same thinning, taking marks in petals (at most finitely many marks lie in the common root), and requiring the marks to have the same order position. Take three such conditions and their free union $`U`$. Add the mixed triple $`e`$ of the three marks. No pair of $`e`$ occurred earlier, so the canonical property still holds.

A Pasch containing $`e`$ would have one old triple in each of the three mark petals. Each old triple contains its mark and two root points, to meet the other two old triples in distinct points. Their three root pairs form a triangle on the three distinct pairwise intersection points. Projecting the three marks to their common role would put that triangle into one lower link, which is a matching. Impossible.

For $`\mathcal T_6`$, the new triple cannot be $`ABC`$ or $`ABD`$, since they share $`AB`$ and no old triple has a pair from $`e`$. If $`e=AEF`$, then $`ABC,ABD`$ are in the $`A`$ petal and $`CDE`$ is in the $`E`$ petal. This forces $`C,D`$ into the root, contradicting $`A\lt C,D`$. If $`e=CDE`$, then $`ABC,ABD`$ are in the $`C,D`$ petals, respectively, and therefore $`A,B`$ are in the root. Projecting either of these triples to the $`E`$ petal gives $`ABE`$ (the three marks have the same role). But its pair $`AE`$ also occurs in $`AEF`$, and $`AE`$ is not the bottom pair of $`ABE`$. Impossible.

Thus adding $`e`$ gives a condition extending the original $`p`$ and forcing a triple inside $`\dot X`$, as required. The forbidden patterns and the canonical property are preserved in the generic union because they are finite. For the density claim, on a finite set the $`j`$-th vertex (zero-based) is apex for at most $`\lfloor j/2\rfloor`$ triples, and the sum is $`\lfloor(n-1)^2/4\rfloor`$.

## Further properties

The forcing is Knaster: the same thinning yields pairwise compatibility within an uncountable subfamily of any uncountable family. It has size $`\aleph_1`$, so it preserves CH if the ground model satisfies CH. In that case the set of countable sequences of conditions has size $`\aleph_1`$, and every name for a real has a nice name coded by such a sequence of antichains, by the ccc. Thus the negative direction of each problem is consistent even with CH.

The construction can also give $`\omega_1`$ disjoint layers, each without an uncountable independent set. Label each triple by an ordinal in its finite support below the largest point of the triple, and require induced extensions to preserve labels. The same thinning now gives isomorphism preserving the finite label pattern by position; labels of triples contained in the root lie in the root. The amalgamation proof goes through. Before proving the density requirement for any fixed label $`\mu`$, add $`\mu`$ as a vertex to the starting condition and include it in the common root. At the last step assign $`\mu`$ to the new triple of marks, whose vertices are all above the root. Nothing about the obstruction analysis depends on the label.

## Scope

These are negative consistency results about the exact partition arrows and require no large-cardinal assumption. See [the accompanying proof](PROOF.md) for the positive model for 8/D. The reverse consistency direction for 8/C is not claimed.
