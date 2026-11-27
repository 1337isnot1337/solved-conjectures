# A generic tree subdivision has no rival with one extra leaf

Let $`T`$ be any fixed nontrivial finite tree without vertices of degree two. Give its $`k-1`$ labelled edges positive integer lengths and subdivide them into unit edges. The ordinary distance histogram counts all unordered pairs of distinct vertices of the subdivision by their distance. Among trees with at most one more leaf than $`T`$, this histogram determines the subdivision up to isomorphism for all length choices outside a finite union of proper rational hyperplanes. In particular at most $`O_T(t^{k-2})`$ choices in the box $`\{1,\ldots,t\}^{k-1}`$ are exceptional. The lengths and the topology of a competing tree are arbitrary. The same generic comparison holds for the global arclength distance law of finite metric trees. [Integer and real comparison](PATH-HISTOGRAM-DECISION.md) · [Arclength identity](METRIC-TREE-DISTRIBUTION.md)

This answers the uniform finite decision problem for the first positive leaf allowance. Degrees on both sides are unrestricted. The case of two or more extra leaves in general and Stanley's conjecture for all trees remain open. [Bounded-surplus decision theorem](LEAF-SURPLUS-KERNEL.md) · [Stanley research issue](https://github.com/1337isnot1337/solved-conjectures/issues/315)

## Equations using the signs of endpoint weights

Use the signed path measure of the reduced tree. A vertex has weight $`w=\deg(v)-2`$. A path between reduced vertices contributes the product of their weights at its length. Negative paths have one leaf and one hub. Positive paths join two leaves or two hubs. For rationally independent target lengths all target distances are distinct. The [minimum-leaf theorem](ROBUST-HUB-DISTANCES.md) already identifies the target against rivals with as few or fewer leaves. The [rational-cell reduction](PATH-HISTOGRAM-DECISION.md) shows that to handle one more leaf it suffices to rule out a full-dimensional matching cell. Choose a generic real target in such a cell. The pruned single-edge and trivalent targets, and the case of just one hub of defect at least two, are already covered by the [previous theorems](LEAF-SURPLUS-KERNEL.md).

Write $`J`$ for the rival's leaf count, $`L=J-1`$ for the target's. Use subscripts $`R,T`$ for rival and target. Write $`H`$ for the number of hubs, $`E=\sum_{\mathrm{hubs}}(w-1)`$ and $`K=\sum_{\mathrm{hubs}}\binom{w}{2}`$. The degree sum and squared-defect budget give

```math
H_R=J-2-E_R,\qquad H_T=L-2-E_T,\qquad
K_T-K_R=1,\qquad \delta=1+H_R-H_T=2+E_T-E_R>0 .
```

Here $`\delta`$ is the difference in reduced vertex counts. The amount of positive weight canceled against negative weight at all rival distances together is $`\Omega=J(J-2)-L(L-2)=2J-3`$. These identities and the tail inequalities below are proved in the [surplus theorem](LEAF-SURPLUS-KERNEL.md).

Choose a rival representative for every target distance with the same sign as the target coefficient. Such a term exists in each class of the signed sum. Impose all equalities between rival path lengths belonging to the same actual distance class. For target additivity it suffices to impose selected collinear triple equations using **at least one leaf and at least one hub**. For leaf-to-hub paths telescope from the leaf, one hub–hub edge at a time. Split a leaf-to-leaf path at its first hub. For a non-edge hub-to-hub path choose a leaf in a branch beyond the first hub, so the path in question is the difference of its two leaf-to-hub paths. This recovers every representative as a sum of the target edge coordinates. Each of these equations has two negative representatives and one positive. Each negative path uses one rival pendant coordinate, each positive path uses at most two. Thus every row of this system meets at most four pendant coordinates. The same bound applies to any same-class path equality.

Let $`V`$ be the common nullspace in rival coordinates. Its projection to the target using edge representatives has rank $`k-1`$ as it contains the given full-dimensional comparison. The row rank is at most $`\delta`$. Throughout $`V`$ the signed sums agree, by the representative equations and the preserved sums in every distance class. If a pendant coordinate occurs in no basis row it varies freely. The [arbitrary-parent pruning and marked single-extra-leaf exclusion](LEAF-SURPLUS-KERNEL.md) rules this out in any such comparison. It applies here because its only nullspace requirements are free variation, equality of signed sums throughout the nullspace and positive edge lengths at the generic point.

Let $`A`$ be the span of rival differences between negative paths of equal length. Let $`\pi`$ retain only pendant coordinates, $`r=\dim(A\cap\ker\pi)`$ and $`s=\dim\pi(A)`$. Begin a basis with $`r`$ pendant-free rows, then $`s`$ original negative differences with independent projections. Each of these projections is a leaf-coordinate difference. Next take a positive-to-negative equality, which exists because $`\Omega>0`$. Its pendant-coordinate sum is $`1`$ or $`-1`$ and hence it is independent of all earlier rows. It uses at most three pendant coordinates. Complete the basis with original rows. Since every pendant is constrained, we obtain

```math
0\le r\le H_R-1,\quad 0\le s\le J-1,\quad r+s\lt\delta,\qquad
J\le 2s+4(\delta-r-s)-1 .
```

Negative-path ties group leaves into $`J-s`$ classes by pendant projection. A fixed leaf supplies at least $`H_R-r`$ distinct negative lengths because the raw path forms to the $`H_R`$ hubs are independent and each within-leaf tie is pendant-free. Different leaf groups have disjoint negative lengths. At most $`LH_T`$ lengths are target negative atoms and each other negative length costs at least one canceled unit. This gives $`(J-s)(H_R-r)\le LH_T+\Omega`$. The [degree-free reduction](LEAF-SURPLUS-KERNEL.md) proves these facts in detail.

## Exhaustive degree and rank screen

Here are explicit finite bounds for the [standard-library verifier](verify_one_extra_leaf.py). Set $`d=\delta-r`$ and $`a=d-1`$. Weakening $`J-s`$ to $`J-d`$ in the preceding product gives $`a(E_T+2-a)\le\Omega`$ by direct multiplication. Since $`a\le 1+E_T-E_R`$ and $`a\ge0`$, we have $`a(E_R+1)\le2J-3`$. The support bound gives $`a\ge(J-3)/4`$. At $`J\ge16`$ this implies

```math
E_R+1\le \frac{4(2J-3)}{J-3}=8+\frac{12}{J-3}<9 .
```

For $`J\le15`$, $`E_R=J-2-H_R\le12`$, so globally $`E_R\le12`$. Sum convexity gives $`K_R\le\binom{E_R+1}{2}`$. In the cases remaining to check $`E_R\ge1`$, since $`E_R=0`$ gives $`K_T=1`$ and a single high target hub. If $`m`$ is the maximum of $`w-1`$ on the target, then $`\binom{m+1}{2}\le K_R+1`$ implies $`m\le E_R`$. The previous degree-sensitive bound at one extra leaf is $`\delta\le (m+1)+2`$. Hence $`E_T\le E_R+m+1\le25`$ and $`J\le4\delta-1\le59`$.

The verifier enumerates the positive parts of $`w-1`$ with these excess bounds. At fixed leaf count the missing trivalent hubs are determined by the degree sum. It enforces the two degree identities, the support and negative-length constraints, and every truncated variation inequality
$`J\sum_R(w-j)_+\le L\sum_T(w-j)_++\Omega`$ for integer $`j\ge1`$. It excludes only cases already proved by the preceding theorems. It leaves six target leaves and two target hubs of defect two. The rival has seven leaves and hub defects $`2,1,1,1`$. Thus $`\delta=3`$ and $`\Omega=11`$. The only dimension pairs $`(r,s)`$ are $`(0,2)`$ and $`(1,0)`$. This exhaustive arithmetic step is computer-assisted. An independent implementation enumerating full hub-defect lists gave the same two cases. [Review and reproducibility](ONE-EXTRA-LEAF-REVIEW.md)

## Excluding the two possibilities

**Two projected ties.** The support budget is tight at seven. The two independent simple differences therefore involve disjoint pairs of leaves, and the mixed equality involves the other three distinct singleton leaves. Quotient the pendant coordinates by the span of those two differences. Orient every mixed equality so that its coordinate sum is one. For a positive leaf pair minus a negative leaf–hub term its projection is $`e_i+e_j-e_h`$. For a negative leaf–hub term minus a positive hub pair the projection is a single group vector. The basis has only one mixed direction left and the sum fixes its scalar, so every oriented mixed equality has the same image. The three singleton coordinates in the basis row are distinct. Thus no positive hub pair can cancel, and any canceled positive leaf pair must use the two specific singleton leaves with positive signs. This one pair has total weight one. It cannot supply eleven units.

**One internal tie.** Here $`s=0`$, so tied negative paths start at the same leaf. Each nonzero difference of two such paths is supported on the entire unique chain between the two endpoint hubs. Rank $`r=1`$ fixes that support and so fixes its pair of endpoints. At each endpoint at least two branches lead away from the chain. At least four distinct leaves in those branches cannot be equidistant from the two hubs. Among seven leaves at most three can supply tied distances, one per leaf for those fixed endpoints. The target has twelve distinct coefficients $`-2`$. At most seven of these lengths can use a rival path from its unique defect-two hub. Each of the remaining five lengths requires at least two negative unit terms, even in the presence of positive terms. At most three such ties exist, a contradiction.

Both cases are impossible. The rational matching-cell decision theorem now puts all exceptional integer assignments inside the claimed finite union of proper rational hyperplanes. This is a computer-assisted, internally reviewed proof. It has no Lean formalization. [Independent review](ONE-EXTRA-LEAF-REVIEW.md)
