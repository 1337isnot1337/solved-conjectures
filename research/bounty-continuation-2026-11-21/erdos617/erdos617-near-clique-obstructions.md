# Erdős 617: near-clique coverage and its unresolved overlap problem

21 November 2026. This records additional necessary conditions after the combined reduction to disjoint full cliques. It is not a solution or a novelty claim.

## Setting

Fix `r>=6`. Let `H` be the connected edge-critical sparse color graph obtained in the companion investigation. Its order is `N=r^2+1`, independence number is `r`, and edge count is at most `B=rN/2`. All its full cliques of order `r` are pairwise disjoint. Write their number as `q`, their union as `U`, and `R=V(H)\U`. The final extremal replacement section explicitly changes the optimization class and treats that as a separate one-color reduction.

The reduction uses the localized independence inequality of Abiad–Kumar–Pragada, https://borowiecki.dev/pdf/2609.00210:

```math
\alpha(H)\ge\sum_v\frac{2}{d(v)+c(v)+1},
```

where `c(v)` is the largest clique order at `v`. The same theorem gives the following exact defect bounds.

## Almost every residue vertex belongs to an `(r-1)`-clique

Cauchy's inequality gives

```math
2e(H)+\sum_v c(v)+N\ge\frac{2N^2}{r}.
```

Since `2e(H)<=rN`,

```math
\sum_v c(v)\ge (r-1)N+\frac{2N}{r}.
```

Every vertex of `U` has `c(v)=r`, and every vertex of `R` has `c(v)<=r-1`. Consequently

```math
\sum_{v\in R}(r-1-c(v))
\le(q-2)r-\frac2r.
\tag{1}
```

In particular, at most `(q-2)r-1` residue vertices fail to lie in a clique of order `r-1`.

This is a coverage statement. It does not say that the covering cliques are disjoint, are components, or can be selected into a prescribed packing.

## A simultaneous degree-variation bound

Put `z_v=d(v)+c(v)+1` and `D=sum_(v in R)(r-1-c(v))`. The exact identity

```math
\frac{2}{z_v}
=\frac1r-\frac{z_v-2r}{2r^2}
 +\frac{(z_v-2r)^2}{2r^2z_v}
```

and the independence inequality imply

```math
\sum_v\frac{(z_v-2r)^2}{z_v}+D
\le(q-2)r.
\tag{2}
```

Indeed, the sum of `z_v-2r` is

```math
2e(H)-rN+qr-D\le qr-D,
```

whereas summing the displayed identity shows that this sum minus the nonnegative quadratic sum must be at least `2r`.

The bound is exact as an inequality, without a statistical assumption or a numerical experiment.

## The possible large overlaps of maximal near-cliques

Call a clique of order `r-1` a near-clique only when it is not contained in a full `K_r`. Every `(r-1)`-clique containing a residue vertex has this property.

Let distinct near-cliques `C,D` have intersection of order `k`, and put `a=r-1-k`. Their whole union has order `m=r-1+a<2r`. Its missing edges are confined to the two private parts, so their number is at most `a^2`.

For `a>=2`, the hereditary palette bound requires at least

```math
(r-1)T_r(m)=(r-1)(a-1)
```

missing edges. But for `2<=a<=r-3`, the convex quadratic

```math
a^2-(r-1)(a-1)
```

has value `5-r<0` at both endpoints and hence is negative throughout. Those values of `a` are impossible. Thus the stronger exact restriction is

```math
k\in\{0,1,r-2\}.
\tag{3}
```

This whole-union argument replaces the weaker overlap restriction obtained by looking only at `(r+1)`-subsets.

When `k=r-2`, the union is exactly `K_r` with one edge missing. Adding that edge would make a full clique containing `C`, contrary to its defining restriction. Every vertex outside this union has at most two neighbors in it, since adding such a vertex to the `r`-set and applying the same palette cap gives that bound.

For `r>=6`, a near-clique cannot have two distinct partners with intersection order `r-2`. To see this, let `C` have such partners `D,E`. Their intersection has order at least `r-3>=3`, so (3) forces it to have order `r-2` as well. Three distinct `(r-1)`-sets pairwise meeting in `r-2` vertices either share a common `(r-2)`-set or lie in a common `r`-set. In the first case their clique edges cover an `(r+1)`-set with at most three missing edges, violating the required `r-1>=5`. In the second case their clique edges form `K_r`, contradicting maximality of the near-cliques.

Thus the relation “shares `r-2` vertices” pairs up near-cliques, rather than producing longer chains.

## Exact blocks and their intersections

Group each such pair into its induced `K_r` minus one edge. Leave each unpaired near-clique as a `K_(r-1)` block. Include the full `K_r` cliques as additional blocks.

Distinct blocks intersect in at most one vertex. An adjacent pair of shared vertices would lie in a constituent near-clique on both sides; (3) would then place those near-cliques in the same paired block. A full clique cannot share two vertices with a near-clique, by its external-neighbor restriction.

The only remaining possible two-vertex intersection would consist of the two nonadjacent tips of two `K_r`-minus-an-edge blocks. Their union has `2r-2` vertices and at most `(r-2)^2+1` missing edges. The hereditary palette bound instead requires `(r-1)(r-2)` missing edges. The difference is `3-r<0`, excluding this case as well.

Two related exact counts may be useful:

- For disjoint near-cliques of order `r-1`, there are at most `r-1` edges between them.
- For near-cliques meeting in one vertex, there is at most one edge between their private parts.

Both follow by subtracting the required missing-edge count on their whole union from the number of possible cross pairs. These are total edge bounds; they do not assert that the cross edges form a matching.

## Total overlap excess is small

For a vertex `v`, let `k_v` be the number of these blocks containing it. If `k_v>=2`, the blocks' other vertices are pairwise disjoint, and each block supplies at least `r-2` neighbors. Thus

```math
d(v)\ge k_v(r-2),\qquad c(v)\ge r-1.
```

Writing `u=k_v-1>=1`, this gives

```math
d(v)+c(v)+1-2r\ge u(r-4).
```

The function `x^2/(2r+x)` increases for nonnegative `x`, and

```math
\frac{u^2(r-4)^2}{2r+u(r-4)}
\ge u\frac{(r-4)^2}{3r-4}.
```

Consequently, (2) bounds the total overlap excess, including overlaps with full cliques:

```math
I:=\sum_v\mathop{\mathrm{max}}(k_v-1,0)
\le\frac{r(3r-4)}{(r-4)^2}(q-2).
\tag{4}
```

For `r>=10`, the coefficient is at most eight, so `I<=8(q-2)`.

Remove every vertex belonging to more than one block. The surviving blocks are pairwise disjoint. The total number of removed block incidences is at most `2I`, because `k_v<=2(k_v-1)` for `k_v>=2`. Thus this operation removes at most `16(q-2)` incidences from the blocks when `r>=10`; the loss is a total bound, not a bound to be multiplied by the number of blocks.

The individual cost calculations in the question are included in (4): a residue vertex shared by two distinct near-cliques with intersection one has `d>=2r-4`, `c=r-1`, and cost at least `(r-4)^2/(3r-4)`; a full-clique vertex also in a near-clique has `d>=2r-3`, `c=r`, and the larger cost `(r-2)^2/(3r-2)`.

## A concrete criticality reduction for paired blocks

The following argument uses the connected edge-critical setting and the previously proved attachment partition `R=A union Z`: each `A` vertex has one neighbor in each of the `q>=3` full cliques, while each `Z` vertex has none. Write `s=r-q`. Every independent `(s+1)`-set in `R` lies in `A`, and every `A` vertex belongs to such a set.

First, a general criticality lemma is useful. Let `C` be any proper clique of a connected edge-critical graph of independence number `r`. Then `alpha(H-C)=r`: if it were at most `r-1`, deleting a cross edge leaving `C` could not increase independence, since `C` would remain complete. Such a cross edge exists by connectedness.

Suppose `v in C` has exactly one neighbor `w` outside `C`. Every independent `r`-set outside `C` must contain `w`, or else `v` would extend it. If another vertex `u in C` is adjacent to `w`, it has no other neighbor outside `C`. Indeed, an essential edge `ux`, with `x outside C` and `x!=w`, would have an independent `(r+1)`-certificate containing `u,x`. Its other `r` vertices lie outside `C` and therefore include `w`, contradicting the still-present edge `uw`.

Thus all vertices of `C` adjacent to `w` have the same closed neighborhood `C union {w}`. They are true twins.

Apply this to a paired block `B=K_r-ab`, whose two nonadjacent tips are `a,b` and whose core `T=B\{a,b}` has order `r-2`. If one core vertex has no neighbor outside `B`, take `C=B\{b}` and `w=b` in the lemma. Every core vertex then has closed neighborhood exactly `B`. Conversely, if one core vertex has an exterior neighbor, every core vertex does. Consequently there is an exact dichotomy:

- **Passive core:** all `r-2` core vertices are true twins of degree `r-1`, with no neighbors outside `B`.
- **Active core:** all `r-2` core vertices have degree at least `r`.

The passive case imposes more structure. No passive core vertex belongs to a full `K_r`: it has exactly `r-1` neighbors, and those neighbors are not a clique because `a,b` are nonadjacent. Any full-clique vertex inside `B` would therefore have to be one of its two tips. A core vertex would consequently have at most two neighbors in `U`. The attachment dichotomy and `q>=3` force it into `Z`. It has no `U` neighbors at all, so the entire block lies in `R`.

Let `S` be an independent `(s+1)`-set in `R`. It cannot contain a core vertex, since it contains only `A` vertices. If it contains neither tip, adding a core vertex gives an independent set containing `Z` of size at least `s+1`, impossible. If it contains exactly one tip, replace that tip by a core vertex for the same contradiction. Therefore every such `S` contains both `a,b`.

Also `alpha(H[R\B])<=s-1`: a larger independent set could be extended by a core vertex to a forbidden `(s+1)`-set containing `Z`. As `alpha(B)=2`, this proves

```math
\alpha(H[R])=s+1.
```

Both tips belong to `A`. Every `A` vertex occurs in an independent `(s+1)`-set of `R`, and all those sets contain both tips. Hence neither tip has any neighbor in `A`; they are isolated vertices of `H[A]`.

This is an exact restriction on the residue: a passive paired block forces the residue independence number to be precisely its boundary value, and its two tips occur in every maximum residue independent set. It does not rule out the block.

The two tips also have disjoint exterior neighborhoods. An exterior neighbor of either tip in `R` belongs to `Z`, since the tips have no neighbors in `A`. Suppose `ax` is such an edge. Its essential-edge certificate must meet every full clique: otherwise deleting `a` from the certificate leaves an independent `r`-set containing `x in Z` and disjoint from an omitted full clique, which cannot be perfectly matched to that clique. Thus the residue part of the certificate has exactly `s+1` vertices. It must contain `b`; otherwise replace `a` there by a core vertex to obtain an independent `(s+1)`-set containing `Z`. Therefore `x` is nonadjacent to `b`. For exterior vertices in `U`, the two tips have distinct neighbors in each full clique, since every independent `(s+1)`-set containing both has distinct attachments. This proves the claimed disjointness everywhere outside `B`.

An additional observation supplied by the independent reviewer organizes multiple passive blocks. Make a graph whose vertices are their tips and whose edges are the paired blocks. This graph is a forest. A cycle of length `ell` would allow its `ell` mandatory tips in a maximum residue independent set to be replaced by one core vertex from each of its `ell` blocks. Those core vertices are pairwise nonadjacent and avoid all retained vertices, so the replacement preserves the independent-set size while introducing vertices of `Z`, impossible. If there are `p` passive blocks and `h` distinct tips, then `h<=s+1` and their contribution to overlap excess is `2p-h`. Hence

```math
p\le\frac{s+1+I}{2}.
```

There is a concrete reason not to assert that criticality alone eliminates passive cores. Replacing one vertex of the five-cycle by a clique of order `r-2` gives a connected alpha-critical graph containing such a block with a passive core. Criticality is preserved by replacing a vertex of an alpha-critical graph by true twins: original-edge certificates lift using one clone, and a clone-pair edge has a certificate obtained by replacing that vertex in a maximum independent set by two clones. This small graph has order `r+2` and independence number two, so it is not a graph meeting the target's order and independence constraints. It is an obstruction to the proposed local elimination argument.

## A separate extremal replacement removes passive blocks

There is a stronger operation if the objective is an impossibility proof using only the single-color necessary conditions. Let `F_r` be the finite class of graphs on `r^2+1` vertices with independence number at most `r` and all hereditary palette caps

```math
e(H[S])\le P_r(|S|),\qquad
P_r(k)=\binom k2-(r-1)T_r(k).
```

A balanced coloring would supply a member with at most `B` edges. One may therefore choose a graph of minimum edge count in this whole class; it is independence-critical and has at most `B` edges. This global optimization need not preserve realizability as a color class of an actual balanced coloring. Subsequent arguments for this optimized graph may use only the preserved necessary conditions.

No such global edge-minimizer contains a passive paired block `B=K_r-ab`.

To prove this, first observe that `alpha(H-B)=r-1`. A passive core vertex extends every independent set outside `B`, giving the upper bound. If the bound were at most `r-2`, every cross edge between `B` and the outside would be redundant, since deleting it leaves independence at most two in `B` and at most `r-2` outside. Such a cross edge must exist: the block itself is not independence-critical, since deleting an edge between two core vertices does not increase its independence number.

Both tips have a neighbor outside `B`. Otherwise a tip would have no neighbor outside its proper clique consisting of itself and the core, contradicting the proper-clique argument above. Thus at least two cross edges leave `B`.

Replace `B` by an isolated `K_r`: add the single missing edge `ab` and delete every cross edge between `B` and its outside. The resulting graph `H*` has

```math
\alpha(H^*)=1+\alpha(H-B)=r,
\qquad e(H^*)\lt e(H).
```

Every hereditary palette cap survives. If a vertex set does not contain both tips, no edge is added inside it. If it contains both tips and loses a cross edge, its induced edge count does not increase. In the remaining case it contains both tips but no cross edge to delete; its new induced graph is a disjoint clique of order `ell<=r` together with an unchanged induced graph on `k` outside vertices.

The required padding inequality is

```math
P_r(k+\ell)\ge P_r(k)+\binom\ell2
\qquad(0\le\ell\le r).
```

Write `k=tr+u`, with `0<=u<r`. The difference between the two sides is

```math
\ell t+\ell u-(r-1)\mathop{\mathrm{max}}(0,u+\ell-r).
```

It is nonnegative when `u+ell<=r`. Otherwise, putting `d=r-ell`, it equals `ell t+u+d(r-1-u)`, again nonnegative. This verifies every cap and contradicts the global minimality of `H`.

This replacement is stronger than the earlier local criticality argument, but its scope is different. It does not establish that the missing edge can be recolored into the chosen color while preserving the independence bounds of all the other colors. In particular it cannot be combined silently with the cross-color rook arguments.

There is a further componentwise consequence for this extremal class. In an active paired block, an essential edge from a core vertex to the exterior has a certificate containing exactly one block vertex. If the block lies in a component of independence number `a`, its exterior in that component therefore contains an independent `a`-set. Each of those vertices has at most two neighbors in the block. To prevent extending the independent set through the block, they must cover all `r` block vertices, so

```math
2a\ge r.
```

Since passive blocks have been excluded in the global minimum, every paired block in that minimum lies in a component of independence number at least `ceil(r/2)`. This does not exclude such a component.

The companion [extremal core normalization proof](erdos617-extremal-core-normalization.md) develops this separate optimization further. It reduces a global minimum to isolated `K_r` components and one noncomplete core, and proves that the core is both independence-critical and minimal for the induced-subgraph independence ratio. Its hypotheses and conclusions remain in the single-color necessary-graph class. The bound `q(q-1)<r` proved for a connected critical color graph cannot be transferred to this normalized, disconnected graph.

## What this does not prove

Deleting these overlap vertices separates the large near-clique pieces, but it does not control all edges between the pieces or between them and the uncovered residue. A single unpaired near-clique has a much weaker external-neighbor restriction than a full clique. The bound of two outside neighbors applies to the paired `K_r`-minus-an-edge block, not automatically to an unpaired `K_(r-1)` block. The resulting pieces therefore do not automatically have an independent transversal.

The uncovered residue can still have order proportional to `qr`. No argument here produces a sufficiently large compatible independent set in that residue. The existing growing local-independence range in https://erdosproblems.ai/wiki/research/erdos_617/independent/growing_local_independence_range does not cover all the parameters left by the new reductions. Treating the approximate covering as a clique factor would be a gap.

The active-core case and the edges from passive-block tips to `Z` remain uncontrolled. An independent set guaranteed elsewhere in the residue need not avoid these tip neighborhoods. The true-twin reduction cannot silently identify the tips or contract the block while retaining the original full-clique external-neighbor restrictions.
