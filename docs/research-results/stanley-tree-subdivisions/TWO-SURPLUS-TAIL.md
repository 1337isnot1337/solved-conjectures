# Unmarked reconstruction against two extra leaves for large trees

Every fixed reduced tree with **at least 28 leaves** is generically determined by the ordinary histogram of distances in its integral subdivisions among all competing trees with at most two extra leaves. There are no degree restrictions on either tree. Equivalently for a target on $`k`$ reduced vertices, all but $`O_T(t^{k-2})`$ of its $`t^{k-1}`$ labelled edge-length choices in $`1,\ldots,t`$ have this property. The corresponding generic positive metric tree is determined in this comparison by its global arclength distance law. Both statements use the [rational matching-cell criterion](PATH-HISTOGRAM-DECISION.md) and the [metric-tree distance identity](METRIC-TREE-DISTRIBUTION.md).

The [marked theorem](MARKED-TWO-SURPLUS.md) is an all-orders written result. An unmarked competitor with two extra leaves and any freely variable pendant would yield a forbidden marked pair there. We first show without computation that a remaining unmarked comparison has at most 275 **rival** leaves, and then justify the finite degree-and-rank calculation reducing this maximum to 29. It is a necessary-condition screen. The small profiles it retains are not metric counterexamples. The unmarked two-extra-leaf problem below 28 **target** leaves and the unrestricted Stanley conjecture remain open in general.

## Bounding the remaining comparison

Rivals with fewer or equally many leaves are disposed of by the [minimum-leaf theorem](ROBUST-HUB-DISTANCES.md), and those with a single extra leaf by the [unmarked one-extra-leaf theorem](ONE-EXTRA-LEAF.md). Suppose a failure with exactly two extra leaves gives a full-dimensional matching cell. Inside the cell, choose rationally independent target edge lengths. Write $`J`$ for the rival's leaf count, $`J-2`$ for the target's, and $`H_X`$ for the number of hubs of tree $`X`$. Put
```math
E_X=\sum_h(w_h-1),\qquad K_X=\sum_h\binom{w_h}{2},\qquad
\delta=k_R-k_T=4+E_T-E_R.
```
The degree identity gives $`K_T=K_R+2`$, $`H_R=J-2-E_R`$ and $`H_T=J-4-E_T`$. The total canceled negative weight is $`\Omega=4J-8`$. The [truncated variation bounds](LEAF-SURPLUS-KERNEL.md) also give, for every integer $`j\ge1`$,
```math
J S_R(j)\le(J-2)S_T(j)+4J-8,\qquad
S_X(j)=\sum_h (w_h-j)_+ .
```

The following row bounds from the [unmarked matching argument](ONE-EXTRA-LEAF.md) work with any positive surplus. Let $`A`$ be the span of differences of rival negative paths at coincident distances and $`\pi`$ the pendant-coordinate projection. Write $`r=\dim(A\cap\ker\pi)`$ and $`s=\dim\pi(A)`$. A basis of the matching row space can start with $`r`$ pendant-free rows and $`s`$ original negative differences, which use at most two pendant coordinates each. A positive-to-negative equality supplies another independent row using at most three; the remaining rows use at most four each. The last bound uses sign-compatible representatives in target additive relations with a leaf and a hub. Since the rank is at most $`\delta`$ and no pendant may vary freely, we have
```math
r\le H_R-1,\quad r+s\le\delta-1,\qquad
J\le2s+4(\delta-r-s)-1 .
```
The negative paths at any fixed leaf have at least $`H_R-r`$ distinct lengths, and different components of the pendant equalities supply disjoint such sets. The $`s`$ independent projected differences give $`J-s`$ components. At most $`(J-2)H_T`$ of their lengths are target negative atoms, and each other length costs a cancellation unit. Hence
```math
(J-s)(H_R-r)\le(J-2)H_T+4J-8 .
```

Set $`a=\delta-r-2`$. The degree-and-rank inequality in the [degree-uniform reduction](LEAF-SURPLUS-KERNEL.md) gives $`a E_R\le4J-8`$ whenever $`a\ge0`$. The row-support bound gives $`a\ge(J-7)/4`$. For $`J\le23`$ one has $`E_R\le J-3\le20`$. For $`J\ge24`$ the inequalities imply
```math
E_R\le16+\frac{80}{J-7}\lt21.
```
Convexity yields $`K_R\le\binom{E_R+1}{2}\le210`$. Thus $`K_T\le212`$, and the largest target hub defect $`D`$ is at most 21. The previously proved bound $`\delta\le F(D,2)=3D+6`$ now gives $`\delta\le69`$ and $`J\le4\delta-1\le275`$. The finite search does not assume any upper bound on the original target or rival topology.

## If only one further row remains

When $`\delta-r-s=1`$, every terminal comparison satisfies the stronger bound $`J\le2s+1`$. Quotient the rival pendant coordinates by the $`s`$ negative differences. Each is a difference of leaf-coordinate vectors, so the surviving group coordinates are independent, one per connected component. If the groups have sizes $`n_g`$, the sum of $`n_g-1`$ is $`s`$. Beyond the negative differences there is exactly one independent mixed row. Orient each mixed equality so the sum of its projected coefficients is one. Every such equality has the same quotient because its scalar is fixed by this sum.

If the common quotient is a unit group vector, every leaf lies in a non-singleton group or in that one named group: a singleton group with zero coefficient occurs in no row of the selected basis. Non-singleton groups cover at most $`2s`$ leaves and the named group adds at most one. Otherwise the common quotient has form $`e_A+e_B-e_C`$ with $`C`$ different from $`A,B`$, permitting $`A=B`$. No positive hub pair can then cancel, since that kind of mixed equality projects to a unit. Every canceling positive term must be an unordered leaf pair from groups $`A,B`$.

All unnamed groups are non-singleton. For the $`b`$ distinct named groups the same accounting gives
```math
J\le 2s+2b-\sum_{g\ {\rm named}} n_g .
```
If $`J\ge2s+2`$ and $`A\ne B`$, we get $`n_A+n_B\le3`$, since $`b=3`$ and $`n_C\ge1`$. At most two unit leaf-pair terms can cancel. If $`A=B`$, then $`b=2`$ gives $`n_A=n_C=1`$ and there is no such leaf pair. Both alternatives contradict $`\Omega=4J-8\gt2`$. This proves the strengthened one-row bound.

## Finite degree-and-rank calculation

The [exact Python verifier](verify_two_surplus_tail.py) enumerates descending positive excesses $`w_h-1`$ above trivalence. The remaining trivalent hubs are determined by the leaf count. Rival excess sums are at most 20. Each target list has exactly $`K_R+2`$ triangular cost and no part above 20. A list with excess sum $`E`$ and $`b`$ entries needs total positive hub weight at least $`E+b`$; this checks that the list fits the specified number of leaves. For $`E_R\gt16`$ the inequality $`(J-7)E_R\le16J-32`$ also gives the enumerated upper bound $`J\le(7E_R-32)/(E_R-16)`$ (orders below seven already obey it).

At each degree pair the verifier imposes the truncated variations, every available pair $`(r,s)`$ in the preceding bounds, and the extra condition when $`\delta-r-s=1`$. It includes all degree patterns, without omitting high-hub cases covered separately. The calculation finds no feasible records with $`30\le J\le275`$. At $`J=29`$ exactly four degree profiles pass these necessary tests. Three have rival excess list $`(6)`$ and one has $`(5)`$. In all four, $`(r,s)=(0,11)`$. This boundary does not assert existence of competing tree metrics.

A target with at least 28 leaves would have $`J\ge30`$ and hence cannot have a two-extra-leaf rival. This concludes the stated result. The marked theorem and the analytic upper bound on rival order are written proofs. The final 28-leaf threshold also uses the finite integer profile certificate. There is no Lean formalization of these claims.
