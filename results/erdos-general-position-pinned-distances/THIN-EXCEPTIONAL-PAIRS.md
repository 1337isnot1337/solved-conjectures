# A residual-weight criterion under a global quadratic trapezoid bound

**Reviewed written partial theorem.** Let $`P`$ be a planar set of $`n`$ sites with at most three sites on each positive-radius site-centered circle. Write $`Q(P)`$ for the number of noncollinear isosceles trapezoids including rectangles and squares, in the convention of the [published sparse-trapezoid theorem](SPARSE-TRAPEZOIDS.md). Fix $`C,H<\infty`$ and $`\eta>0`$.

For each subset $`S`$ of $`s`$ sites, group its unordered pairs by their perpendicular bisector $`L`$ and choose a carrier of maximal pair multiplicity among the lines on which those reflected pairs lie. Ties may be broken separately for each $`S`$. Let $`E`$ be a set of exceptional unordered pairs of the ambient set. Let $`v_L(S)`$ count pairs of $`S`$ lying off the chosen carrier of $`L`$ and outside $`E`$. Suppose

```math
 Q(P)\le Cn^2,\qquad
 \sum_L v_L(S)^{3/2}\bigl(1+\log(1+v_L(S))\bigr)^{1/2+\eta}\le Hs^2
 \quad\text{for every }S\subseteq P.
```

There are $`c,\delta>0`$ and $`n_0`$, depending only on the three fixed constants, such that $`|E|\le\delta n^2`$ and $`n\ge n_0`$ imply that the mean number of distinct positive distances exceeds $`(1/3+c)n`$. The power condition $`\sum v_L^{3/2+\eta}\le Hs^2`$ also suffices. The full local question and the arbitrary-global-$`C`$ implication remain open. This criterion reduces how much of the inherited transverse pair count is required; it still requires a bound on the indicated subsets.

## Incidences of sparse pair families

Suppose by contradiction that there are locally capped sets tending to the mean one-third barrier with $`|E|=o(n^2)`$. This is the negation of the uniform existence of $`c,\delta,n_0`$. The established mixed-line estimate gives maximal collinearity $`M=o(n)`$ on this sequence. Fix $`U,S\subseteq P`$, write $`p=|U|`$, $`s=|S|`$, and let $`t_L`$ be the full number of unchosen pairs before removing $`E`$. The transverse-pair argument gives $`\sum_L t_L^2\le6Q(S)\le6Cn^2`$. If $`r_L=|U\cap L|`$, rich-line counting gives $`\sum_{r_L>K}r_L^2\ll p^2/K+pM`$ for $`K\ge2`$. These two estimates are uniform in $`U,S`$. [Proofs and source](SPARSE-TRAPEZOIDS.md)

Consider any selection of unchosen pairs, allowed to depend on $`U,S`$, whose size is at most $`b_n=o(n^2)`$ uniformly. Its actual pin–pair incidences at axes with $`r_L\le K`$ number at most $`K b_n`$. The rest number at most $`O_C(n(p/\sqrt K+\sqrt{pM}))`$ by Cauchy–Schwarz with the full $`t_L`$. Thus its incidence contribution is $`o(n^2)`$ uniformly: fix $`K`$, take the limit superior divided by $`n^2`$, then let $`K`$ tend to infinity. An unchosen pair and pin together complete at most one full size-three radius class.

This applies first to pairs in $`E`$. It also applies to all unchosen pairs on axes with $`t_L>\sqrt n`$, since their total number is at most $`\sum t_L^2/\sqrt n=O_C(n^{3/2})`$. Retain the regular unchosen weights on the other axes, so that they are at most $`\sqrt n`$. The discarded bound applies only off the chosen carrier; the carrier's own pairs are retained in the single-carrier proof.

## The remaining weights

Write $`N_j`$ for the number of retained axes with weight in $`[2^j,2^{j+1})`$, $`j\ge0`$. The point–line incidence bound gives

```math
 \sum_L r_L v_L\ll p^{2/3}\sum_j2^j N_j^{2/3}
       +p\sum_{j:\,N_j>0}2^j+\sum_j2^jN_j .
```

Here $`v_L`$ denotes the retained weight. The second term is $`O(p\sqrt n)`$ and the third is $`O(s^2)`$ since every pair has a unique bisector. Set $`a_j=2^{3j/2}N_j`$ and $`w_j=(1+j)^{1/2+\eta}`$. The hypothesis gives $`\sum_j a_j w_j\ll_\eta Hs^2`$. Hölder's inequality yields

```math
 \sum_j2^jN_j^{2/3}=\sum_j a_j^{2/3}
 \le\left(\sum_j a_j w_j\right)^{2/3}
       \left(\sum_{j\ge0}w_j^{-2}\right)^{1/3}
 \ll_{H,\eta}s^{4/3}.
```

Combining this with the ordinary chosen-carrier estimate from the [sparse-trapezoid proof](SPARSE-TRAPEZOIDS.md) gives the required uniform local count for the number $`T(U,S)`$ of full triangles with pin in $`U`$ and three bases in $`S`$:

```math
 T(U,S)\ll_{C,H,\eta} p^{2/3}s^{4/3}+s^2+o(n^2).
```

On a fixed positive-mass node of the scale tree the ambient cardinality is a fixed positive fraction of $`n`$ in the limit. The global trapezoid bound and sparse exceptional-pair estimate therefore persist with node-dependent constants. The hereditary regular-weight hypothesis transfers unchanged, choosing carriers from the subset itself. For farthest sampling take the size limit first for each fixed finite sample size. For tightness the coefficient of the two main powers in this local count depends only on $`H,\eta`$ and the absolute chosen-carrier estimate, and hence is uniform in all descendant nodes; only the vanishing error depends on the node's global quadratic constant. This permits the same fixed choice of the disk mass cutoff at all depths. For the separate marked-carrier argument at any fixed node, choose carriers for the entire node. Its global quadratic bound and the rich-axis estimate control unchosen sides of large pin richness; bounded pin richness gives domination by the independent base-pair law. All remaining marked, source–target, and orientation steps use one carrier per axis exactly as in the [published proof](SPARSE-TRAPEZOIDS.md). This proves the criterion.

## Bounded transverse multiplicity outside sparse pairs

For an unordered pair $`e`$ let $`d_P(e)`$ count other pairs reflected in the same bisector but on a different carrier. If $`Q(P)\le Cn^2`$ and outside $`o(n^2)`$ exceptions $`d_P(e)\le B`$ for fixed $`B`$, the criterion applies. In any subset, an unchosen pair has at most half the axis's pairs on its own carrier. If that axis represents more than $`2B`$ pairs of the subset, every unchosen pair has $`d_P(e)>B`$. The regular unchosen weights are therefore at most $`2B`$ on each axis of every subset. Their sum is bounded by $`\binom{s}{2}`$, so the weighted condition holds with a constant depending on $`B,\eta`$ only. The same compactness argument converts the vanishing exceptional fraction to a sufficiently small fixed fraction depending on $`B,C`$.

## Why a positive-density hereditary extraction is impossible

Fix $`A>0`$. For each sufficiently large odd $`m`$ take $`k=\lfloor m/A\rfloor`$ regular $`m`$-gons in generic independent similarities, and let $`P`$ be the union of their vertices. Then $`n=km`$. We can ensure that no four sites from more than one polygon are concyclic, no three sites are collinear, and every equal-distance triple with a site pin is entirely within one polygon. For each forbidden coincidence its determinant or squared-distance polynomial in the finitely many translation and complex multiplication variables is not identically zero. In a four-point coincidence across polygons, a polygon contributing only one site allows that site to move freely; in the remaining two-plus-two case the two sites of one polygon may be placed at any ordered pair of distinct planar positions by a similarity. The same one-site freedom prevents a mixed collinearity or equal-distance triple. A finite union of proper zero loci has empty interior. Within a polygon the site-centered capacity is two. Each line therefore holds at most two sites, an arbitrary circle at most $`m=o(n)`$, and every pin sees precisely $`n-m+(m-1)/2`$ distinct positive distances.

With cyclic labels modulo $`m`$, points $`a,b`$ form a reflected pair on the axis determined by $`a+b`$ modulo $`m`$. Each of the $`m`$ axes has $`(m-1)/2`$ disjoint pairs on distinct carriers: a chord line meets the circle in only those two endpoints. Two different reflected pairings of a four-set would force its two pairs of opposite sides to be parallel, all four points making a rectangle. An odd regular polygon has no antipodal vertices and hence contains no rectangle. Thus one polygon contributes $`m\binom{(m-1)/2}{2}`$ trapezoids. There are no cross-polygon trapezoids and global $`Q(P)/n^2\to A/8`$. Every pair joining different polygons has $`d_P(e)=0`$. Marking the $`k\binom m2=O_A(n^{3/2})`$ intra-polygon pairs gives the claimed sparse exceptional family even at arbitrarily large fixed global quadratic coefficient.

Nevertheless, fix any positive density $`\rho`$. Every subset $`Y\subseteq P`$ with $`|Y|\ge\rho n`$ contains some polygon slice $`S`$ of size $`s\ge\rho m`$. Write $`u_i`$ for the number of pairs of $`S`$ reflected on polygon axis $`i`$. Since $`\sum u_i=\binom{s}{2}`$ and the carriers differ, Cauchy–Schwarz gives

```math
 Q(S)=\sum_i\binom{u_i}{2}\ge\tfrac12\left(\binom{s}{2}^2/m-\binom{s}{2}\right).
```

It follows that $`Q(S)/s^2\gg_\rho m`$ for large $`m`$. No positive-density thinning of these sets satisfies the earlier hereditary quadratic hypothesis with a uniform constant. The example demonstrates failure of that extraction procedure; its mean pinned count is asymptotic to $`n`$.

## Comparison and finite checks

The bounded prior search compared the two repository branches and issue #969 with the original site-centered question, the four-grid obstruction, the two-sided active-bisector criterion and the sparse-trapezoid theorem. The latter uses either a small global coefficient or a hereditary quadratic bound on all transverse pairings. The present hypothesis controls a lower moment after deleting sparse pairs, while retaining the global quadratic bound for discarding small incidence families. Lund, Sheffer and de Zeeuw count total bisector energy. Dumitrescu discusses weighted isosceles incidences and general-position distinct-distance questions. The weighted point–line calculation above uses the usual incidence theorem; the reduction to the localized one-third gap and the failure of positive-density extraction are the contributions of this supplement. The regular polygon is a classical example. The construction uses many independent polygons to compare the two hypotheses. [Original problem](https://users.renyi.hu/~p_erdos/1987-27.pdf#page=2) · [Lund–Sheffer–de Zeeuw](https://arxiv.org/abs/1411.6868) · [Dumitrescu](https://adriandumitrescu.org/distinct3.pdf) · [Published predecessor](https://github.com/1337isnot1337/solved-conjectures/pull/986)

The [exact polygon checker](check_sparse_pair_moments.py) compares the reflection-pair sum with testing the two pairs of opposite sides of each cyclically ordered quadruple. It verifies all 43,688 subsets of odd regular polygons with 3, 5, 7, 9, 11, 13 and 15 vertices, including the closed full-polygon count and the finite lower bound for each subset. Codex developed this argument in the WadeDavis research session. [Independent review](THIN-EXCEPTIONAL-PAIRS-REVIEW.md)
