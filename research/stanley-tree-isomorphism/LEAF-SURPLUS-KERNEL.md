# Finite comparison at bounded maximum degree and excess number of leaves

Work with nontrivial finite reduced trees and strictly positive edge lengths. The generic conclusion excludes a finite union of rational hyperplanes in the target length coordinates; for a fixed target on $`k`$ reduced vertices, it excludes at most $`O_T(t^{k-2})`$ labelled integer subdivisions with edge lengths from $`1,\ldots,t`$. The input is the ordinary histogram of distances between all pairs of vertices of an unweighted subdivision, equivalently for generic real lengths the global arclength distance law.

**Finite reduction.** For every fixed maximum allowed hub defect $`D\ge2`$ and every fixed maximum surplus $`C\ge1`$, it is decidable whether *all* fixed reduced topologies of maximum defect at most $`D`$ are generically identified among all competitors having at most $`C`$ more leaves. No bound is assumed on the number of high-degree vertices, their total degree excess, or the number of leaves. If this assertion fails, it already fails with a competitor having at most $`6F(D,C)`$ leaves, where

```math
F(D,c)=3c+(D-2)(2c-1)+c(2c-1).
```

For a fixed target of maximum defect $`D`$ with $`L`$ leaves, every full-dimensional competitor with a single extra leaf satisfies $`L+1\le6(D+2)`$. There is also an unconditional side-information result across all sizes and degrees: **every topology with only one hub of degree at least four is generically identified among all competitors with at most one extra leaf.** If that hub has defect $`N`$, every genuine full-dimensional competitor has at least $`\lceil(N+8)/11\rceil`$ extra leaves. The one-quartic theorem already excludes all competitors for $`N=2`$. The subsequent rank-three argument excludes exactly two extra leaves for $`N\ge6`$ as well.

## The entire truncated negative variation

Use the [signed endpoint measure and minimum-leaf principle](ROBUST-HUB-DISTANCES.md). In a full-dimensional nonisomorphic matching cell choose positive rationally independent target edge lengths. Its target pair distances are distinct. Write $`R`$ for the competitor, $`c=L_R-L_T\ge1`$, $`L=L_T`$, and $`\delta=k_R-k_T\ge1`$. For a tree $`X`$ define

```math
S_X(j)=\sum_{v\text{ a hub}}(w_v-j)_+,\qquad j=1,2,\ldots,\qquad w_v=\deg(v)-2.
```

Negative paths join a leaf to a hub. Before cancellation their weights in the competitor include $`L+c`$ copies of the defect of each rival hub. Grouping negative paths at equal distances cannot decrease their total weight above threshold $`j`$, because the positive part after subtracting $`j`$ is superadditive on nonnegative inputs. Canceling a unit of positive against negative weight reduces the pooled truncated weight by at most one. The total amount of negative weight canceled is fixed by the observed negative variation:

```math
\Omega=(L+c)(L+c-2)-L(L-2)=c(2L+c-2).
```

In the target the observed sum of truncated negative coefficients is $`L S_T(j)`$. We obtain

```math
(L+c)S_R(j)\le L S_T(j)+\Omega,\qquad S_R(j)-S_T(j)\le2c-1,
```

using integrality and $`\Omega/(L+c)=2c-c(c+2)/(L+c)\lt2c`$. In particular the rival maximum hub defect is at most $`D+2c-1`$. Set $`E_X=S_X(1)`$ and $`K_X=\sum_{j\ge1}S_X(j)=\sum_v\binom{w_v}{2}`$, summed over hubs. The square-defect budget and degree sum give $`K_T-K_R=c`$ and $`\delta=2c+E_T-E_R`$. Consequently

```math
E_T-E_R=c+\sum_{j\ge2}(S_R(j)-S_T(j)).
```

For $`2\le j\lt D`$ use the preceding upper bound. The excess weights $`b_v=(w_v-D)_+`$ have sum at most $`2c-1`$. Hence the sum of $`S_R(j)`$ over $`j\ge D`$ is at most $`\binom{2c}{2}`$, by $`\sum_v\binom{b_v+1}{2}\le\binom{1+\sum_v b_v}{2}`$. This proves $`\delta\le F(D,c)`$, irrespective of the size of the high-degree part of the tree.

## Cutting at a matched parent of arbitrary degree

The [full matching nullspace](FIXED-EXCESS-REDUCTION.md) has at most $`\delta`$ independent rows, each involving at most six pendant coordinates. If $`L_R>6\delta`$, some rival pendant edge varies with all other rival coordinates fixed. The [zero-length comparison](FIXED-EXCESS-REDUCTION.md) shows that its path representative is a common, equal target edge with the same endpoint-defect product. A negative product forces a pendant edge on each side. The two parent hubs therefore have the same positive defect $`w`$.

Write $`z`$ for either parent, $`a`$ for the removed leaf, $`E`$ for its length, $`N(s)`$ for the old signed-pair exponential omitting the leaf, and $`H(s)=\sum_{v\ne a}w_v e^{s d(z,v)}`$. The old sum is $`N(s)-e^{sE}H(s)`$. Variation of the common pendant length gives equal $`N,H`$ on both sides. After removal the new pair sum is $`N-H+w`$ and the signed profile about $`z`$ is $`H-1`$. When $`w=1`$ suppress the bivalent vertex and keep its location as an interior mark. For $`w\ge2`$ retain the parent as a positive-defect marked vertex. The target reduced edge lengths are rationally independent after deletion; if suppression joins two edges their sum replaces them. For the marked comparison the nonzero target heights are independent: the cut tree with its marked parent retained still has exactly the surviving original edges, and parent–child differences recover them.

The pruned comparison is nonisomorphic. For interior marks the [published mark-recovery argument](FIXED-EXCESS-REDUCTION.md) applies even when the merged edge is pendant. For vertex marks, the target's distinct path lengths distinguish any two reduced vertices by their incident distance sets if there are at least three vertices: two such sets intersect only at their mutual distance. All incident weights are nonzero. Thus equality of the signed marked profiles forces a pruned isometry to match the parent vertices also, and adding back the common pendant would give the excluded isometry. An edge alone has interchangeable endpoints. Genericity of pruned target lengths and the rational-cell criterion put the pruned match in a full-dimensional ambiguous family. Removing the leaf lowers the square-defect budget of each tree by $`2w`$, since the deleted leaf contributes one and the common parent defect changes from $`w`$ to $`w-1`$. The leaf difference $`c`$ and the vertex difference $`\delta`$ are unchanged, and the maximum target defect does not increase.

The [marked single-extra-leaf exclusion](ROBUST-HUB-DISTANCES.md) also holds at a shared positive-defect root. It uses independence of the nonzero target heights, and the mark's own defect agrees by construction. The root is the only vertex at zero on both sides, so it is unsplit. It has tag zero, cancels from the diagonal difference, and cannot be the split hub. Everywhere else in that argument the root may act as the zero-tag ancestor; its own possible contribution as a zero-tag endpoint at the distinguishing distance would require $`2h_u=h_b`$ for a positive target hub height $`h_b`$ and a selected ancestor height $`h_u`$, impossible by independence. Therefore for $`c=1`$ the initial free-pendant comparison already gives a contradiction. Since $`F(D,1)=D+2`$, this gives the stated threshold.

For arbitrary $`c\le C`$ repeat the pruning whenever the rival leaf count exceeds $`6F(D,C)`$. Eventual termination yields a target and a nonisomorphic full-dimensional rival with at most that many rival leaves. The number of reduced vertices of a tree with $`b`$ leaves is at most $`2b-2`$. Enumerate all bounded targets and rivals meeting the degree and leaf-gap restrictions and apply the existing [rational matching-cell decision](PATH-HISTOGRAM-DECISION.md) to each pair. Conversely every enumerated failure belongs to the original family. This proves the uniform decision theorem.

## One high-degree hub of arbitrary degree

Let the sole high-degree hub of $`T`$ have defect $`N\ge2`$, all other hubs being trivalent. Since $`K_R=\binom{N}{2}-c`$, every rival hub has defect less than $`N`$. For $`1\le j\le N-1`$ put $`d_j=N-j-S_R(j)`$. This sequence is concave, since $`S_R`$ is convex in the threshold. Its last entry is one, and its sum is $`c`$. For $`N\ge3`$ its sum is at least that of the chord between the endpoints. It follows that

```math
\delta=2c+d_1\le2c-1+\left\lfloor\frac{2c}{N-1}\right\rfloor.
```

If $`N>11c-8`$ then $`2c\lt N-1`$, so $`\delta\le2c-1`$. At every stage $`L_R=L_T+c\ge N+2+c>6\delta`$. A matched free pendant must have a trivalent target parent, since no rival hub has defect $`N`$. Removing it preserves the unique hub of defect $`N`$ and reduces each leaf count by exactly one, giving another full-dimensional comparison. This is impossible by descent, since each tree with a hub of defect $`N`$ has at least $`N+2`$ leaves. Thus any such rival has $`N\le11c-8`$.

For $`c=1`$ and $`N\ge3`$, the concavity bound instead gives $`\delta\le2`$. At each of the $`L`$ distinct target leaf-to-high-hub distances with weight $`-N`$, one needs two different rival negative paths, since each individual rival defect is less than $`N`$. Differences of such pairs include two independent matching rows. If all proposed differences were proportional with nonzero pendant restriction, they would use the same pair of leaves at all $`L`$ distances. Either one of them has at most $`L_R-2=L-1`$ distances to rival hubs. If all pendant restrictions vanish, the common support shows that all compare a leaf's distances to the same two hubs. The two outward branches at each hub exclude at least four distinct leaves, leaving fewer than $`L`$ options. Both alternatives contradict the count. Some negative weight cancels, giving a third path-equality row between a positive and a negative path. It has pendant-coordinate sum one when oriented suitably, whereas each negative-difference row has sum zero. This contradicts the rank bound. The [one-quartic theorem](QUARTIC-DISTANCE-RIGIDITY.md) covers $`N=2`$.

For $`c=2`$ and $`N\ge6`$ one has $`\delta\le3`$. The same two independent negative-difference rows exist: the positive $`K_R\! =\!\binom N2-2`$ ensures that the number of rival hubs, $`L_R-2-E_R`$, is less than $`L`$; the outward-branch count again leaves fewer than $`L`$ leaves. With a single mixed row these form a basis. As in the [one-quartic quotient proof](QUARTIC-DISTANCE-RIGIDITY.md), identify up to two pairs of leaves to kill the differences. Every mixed row has the same quotient vector. If this is not a single group vector, no positive hub–hub path can cancel; each canceled positive path must be a leaf pair in the same two groups. There are at most four such leaf pairs, each of unit weight, whereas the total canceled negative weight is $`4L`$. Therefore it is a group vector. All constrained pendant coordinates lie in at most five leaves, namely the nontrivial groups and the one named group. The other pendants vary freely. Since $`L_R\ge N+4>5`$ at every stage, repeated common trivalent-pendant deletion while preserving $`N,c`$ gives the same contradiction.

[Source scope and independent review](LEAF-SURPLUS-REVIEW.md) · [Finite checks](verify_leaf_surplus.py)
