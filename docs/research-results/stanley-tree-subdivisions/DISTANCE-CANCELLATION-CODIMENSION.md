# How many independent equalities can hide leaves from the distance histogram?

Let $`R`$ be a finite reduced tree with positive edge lengths and $`J\ge3`$ leaves. Its vertex defects are $`w_v=\deg(v)-2`$. Its signed measure of distances between distinct reduced vertices is
```math
B_R=\sum_{\{u,v\}}w_uw_v\delta_{d(u,v)} .
```
This measure is available from the [ordinary vertex-distance histogram of an integer subdivision](PATH-DISTANCE-CERTIFICATE.md) and from the [global two-point arclength law of a finite metric tree](METRIC-TREE-DISTRIBUTION.md). Write $`V^-(B_R)`$ for the total absolute weight of its negative atoms. Let $`d\ge0`$ be the number of reduced edges of $`R`$ minus the rational rank of their lengths.

**Theorem.** If $`J-2d\ge2`$, then
```math
V^-(B_R)\ \ge\ (J-2d)(J-2d-2).
```
For **any** other positive finite metric tree with $`m`$ leaves and the same global distance law, $`J-m\le2d`$. In particular if two such trees have leaf counts $`L_T,L_R`$ and respective edge nullities $`d_T,d_R`$, then
```math
-2d_T\le L_R-L_T\le2d_R .
```

A generic target is uniquely identified among all rivals with at most **two** independent rational relations among their reduced edge lengths. This uses the separate [marked reconstruction theorem](HEIGHT-RELATION-KERNEL.md) and the [one-extra-leaf theorem](ONE-EXTRA-LEAF.md).

For a fixed rival topology with $`e`$ edges and any integer $`c\ge1`$ with $`J-c\ge2`$, the positive real length vectors satisfying
```math
V^-(B_R)\le(J-c)(J-c-2)
```
lie in a finite union of rational linear subspaces of codimension at least $`\lceil c/2\rceil`$. Among subdivisions with each edge length in $`\{1,\ldots,t\}`$, there are therefore $`O_R(t^{e-\lceil c/2\rceil})`$ such vectors. In particular the same estimate bounds how often a subdivision of this topology can have the same histogram as any tree with at least $`c`$ fewer leaves. Both trees may have repeated pair distances.

## Leaf labels in the cancellation equations

Root $`R`$ at any hub. Give each nonroot vertex its own formal height coordinate, keeping distinct vertices separate even if they have equal actual heights. The root has coordinate zero. Rooted heights and edge lengths are related by an invertible integral triangular change of coordinates. The space of rational relations among the actual heights therefore has dimension $`d`$.

At each positive real distance, expand the integer weights of its pairs into signed units. Pair as many negative and positive units as possible at that distance. The remaining negative weight across all distances is $`V^-(B_R)`$. For each cancellation write the equality between its two formal path expressions, using the sum of endpoint heights minus twice the height of their lowest common ancestor. Set all hub coordinates to zero in each such difference row. The resulting relations on the leaf labels are of just two forms,
```math
y_i=0,\qquad y_i=y_j+y_k\quad (i,j,k\text{ distinct}).
```
The negative path has one leaf and one hub. A positive hub pair gives a zero relation for its paired leaf, while a positive leaf pair has two distinct leaves. When the negative leaf belongs to that pair, the other leaf receives a zero relation. Leaves are never lowest common ancestors of two distinct vertices. These are projections of the original formal difference rows, rather than identities that the actual leaf heights must satisfy after removing the hubs. Their rank $`t_0`$ is at most the rank of the original rows and hence at most $`d`$.

Choose a basis of these projected rows from the rows themselves. The system has a simultaneous zero-one solution with at least $`J-2t_0`$ ones. To prove this, form the bipartite incidence graph of the basis rows and their supported labels. In a connected component with $`b\ge1`$ rows and $`n`$ labels there are at most $`3b`$ incidences and at least $`b+n-1`$, so $`n\le2b+1`$. For $`n\le2b`$ use the zero solution on that component. At equality, all rows have three distinct labels and the incidence graph is a tree. Choose any one label and set it to one. Proceed through its incident rows away from that label. When a single label value in a ternary equation is prescribed, the other two can always be chosen to solve it in zeros and ones. For example a right-hand one forces the left-hand one and a zero on the other summand. A tree supplies no conflicting prior assignments. This gives at least one selected label in that component. Set every label absent from all basis rows to one. At most $`2t_0`$ labels were given zero, and every original projected row is satisfied by linearity.

Let $`h`$ be the number of selected leaves. Their total original negative weight is exactly $`h(J-2)`$, since the sum of all positive hub defects is $`J-2`$. Each canceled negative unit at a selected leaf consumes a positive leaf–leaf unit with exactly one selected leaf, since the two projected path sums agree at the chosen zero-one solution. There are only $`h(J-h)`$ such positive units, as every leaf pair has unit weight. The uncanceled negative weight is at least $`h(h-2)`$. When $`J-2t_0\ge2`$ this proves the asserted lower bound even with $`t_0`$ in place of $`d`$.

Any target on $`m`$ leaves has $`V^-\le m(m-2)`$, since even before cancellation its negative units have total weight $`m(m-2)`$. The function $`a(a-2)`$ increases on $`a\ge2`$, giving $`m\ge J-2t_0`$; this is automatic if the right side is below two. If $`t_0=1`$, choose a solution of its single basis row with at most one zero (in a ternary row set its left label and one right label to one). This sharpens the conclusion to $`J-m\le1`$ when $`d\le1`$. A generic target is the unique representative at its [minimum leaf count](ROBUST-HUB-DISTANCES.md), and the one-extra-leaf theorem excludes the only possible larger count. A path target has squared-defect moment two and its length fixes the path, so that case is included.

## Counting the exceptional edge vectors

With the topology fixed there are finitely many possible choices of the cancellations of pairs and their signed units. For a particular choice, the length vectors obey all of the corresponding linear pair-distance equations in the original edge coordinates. Their row rank is at least $`t_0`$ by the integral change of basis and projection above. The conclusion $`V^-\le(J-c)(J-c-2)`$ forces $`t_0\ge\lceil c/2\rceil`$. This remains true if $`J-2t_0<2`$, since $`J-c\ge2`$. For any rational subspace of codimension at least this large, choose pivot columns: the other coordinates have at most $`t^{e-\lceil c/2\rceil}`$ integer choices in the box, and each choice specifies at most one value for the pivot coordinates. Taking the finite union gives the bound.

## A finite unmarked decision and uniqueness at small nullity

Fix an integer $`D\ge1`$. Across all finite tree topologies, existence of an independently weighted target and a nonisometric rival with the same two-point arclength law and rival edge nullity at most $`D`$ can be decided by testing rivals with at most $`4D`$ leaves, and targets with fewer leaves. Only the unmarked distance law is supplied. In particular the outcome is uniqueness at $`D=1,2`$ for every target order.

A nonisometric rival of an independent target has surplus $`c=J-m\ge2`$, by the [minimum-leaf theorem](ROBUST-HUB-DISTANCES.md) and the [one-extra-leaf exclusion](ONE-EXTRA-LEAF.md). Use the [sign-preserving matching equations](ONE-EXTRA-LEAF.md#equations-using-the-signs-of-endpoint-weights) on the rival edge coordinates. Their construction applies to every surplus. Group rival paths by their actual distances and impose all within-class equalities. Select a representative of the correct sign for each target distance and use its representative for each target edge coordinate. For a target leaf–hub path, telescope its length from the leaf along the hub–hub edges. Split a leaf–leaf path at its first hub. For a non-edge hub–hub path use a leaf in a branch beyond an endpoint to express its length as a difference of two leaf–hub paths. Each telescoping equation therefore uses two negative representatives and one positive representative. It meets at most four rival pendants, as does a within-class equality. The signed pair measures agree on the common nullspace under the linear map from rival to target coordinates: the equations retain the total signed weights and the formal additions of all target paths. The actual independent target point is in their image. All rows annihilate the actual rival edge vector, so their rank is at most $`d`$.

If $`J\gt4d`$, select a basis from these rows. Some rival pendant lies outside their supports and can be varied on that full nullspace with all other rival lengths fixed. The [common-pendant argument](FIXED-EXCESS-REDUCTION.md) and its [arbitrary-parent version](LEAF-SURPLUS-KERNEL.md#cutting-at-a-matched-parent-of-arbitrary-degree) then remove matching pendants and mark their corresponding parents. The smaller trees have equal marked and pair profiles, the same surplus $`c`$, and independent nonzero target heights. Keep the rival parent at the mark even if it becomes bivalent. The remaining rival segments are a subset of the original edges, so their rational nullity $`d'\le d`$.

Write $`s,r,\delta`$ for the [marked height parameters](HEIGHT-RELATION-KERNEL.md). The number of nonroot rival vertices is the number of marked segments, whose free coordinates are related to the list of vertex heights by an invertible triangular change of variables. If $`b`$ is the excess of the number of nonroot rival vertices over the number of distinct positive rival heights, then
```math
d'=\delta+b,\qquad b\ge c\ge s\ge\delta .
```
Indeed reserve one rival leaf at each true leaf height and one rival hub at each true positive hub height. At each rival-only height reserve a hub, which exists since the defect sum there is zero. These reservations use one representative per positive height and exactly the target number of leaves, so all $`c`$ additional leaves are among the $`b`$ unreserved vertices. Every rival-only height uses an extra leaf, and $`\delta=s-r`$. At a bivalent mark the single point at zero is excluded from both counts.

Descend by the marked height theorem to a comparison with at most $`4\delta-r\le4\delta`$ target leaves and the same surplus $`c`$. Its number of rival leaves is at most $`4\delta+c\le4d'`$. Every surviving ordinary rival edge is a sum of a disjoint set of original edge lengths: deletion discards the pendant and suppression of a bivalent vertex adds its two incident segments. Retaining a bivalent mark preserves the two segments, and forgetting the final mark makes at most one further such sum. The map from the new free edge basis to these disjoint sums is injective, so the final rival edge nullity is still at most $`D`$. The final target lengths are independent by the same argument from its independent marked heights. Thus either the original rival already has at most $`4D`$ leaves or a smaller example does.

At $`d=2`$, a positive surplus $`c\ge2`$ requires $`t_0\ge2`$ by the sharper one-row Boolean argument. Two cancellation equations with independent pendant projections are independent among the full rival matching equations and therefore span them. Each uses at most three rival pendants. The square-defect identity $`c\le\binom{m-2}{2}`$ from the marked-height proof holds equally for the unmarked pair law, and implies $`m\ge5`$, hence $`J\ge7`$. A pendant outside these two supports therefore exists even at these orders. Its deletion gives the above marked comparison with $`d'\le2`$. But $`d'\ge c+\delta`$ forces $`\delta=0`$, whereas the marked theorem requires $`4\delta-r\ge4`$. This excludes the rival. The cases $`d\le1`$ were settled above. More generally any marked positive-surplus pair with independent target heights must have marked rival segment nullity at least five. Indeed the [marked one- and two-surplus exclusions](MARKED-TWO-SURPLUS.md) give $`c\ge3`$. If $`\delta\le1`$, the marked reduction gives at most four target leaves, forcing $`c\le1`$ by the square-defect identity. Thus $`d'\ge c+\delta\ge5`$.

For the finite test use the [rational pair-distance matching cells](PATH-HISTOGRAM-DECISION.md) for the indicated finitely many topologies. Require a full-rank target projection in the linear span of a feasible relatively open cell and rational rank at least the number of rival edges minus $`D`$ for the restricted rival edge-coordinate forms. The target and rival ranks can be attained simultaneously outside countably many proper rational hyperplanes, as in the marked decision. A uniform affirmative outcome for all nullities, and Stanley's full chromatic symmetric function question, remain open.
