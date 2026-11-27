# Reflected partners on families of lines

Let $`P`$ be a planar point set with no four sites on a circle. Take distinct source lines $`M_1,\ldots,M_p`$ with sets $`A_i\subseteq P\cap M_i`$, and distinct target lines $`N_1,\ldots,N_q`$ with sets $`B_j\subseteq P\cap N_j`$. Both families may vary along a sequence. Assume $`p,q,t\to\infty`$, all the site sets have cardinality between $`t`$ and $`Kt`$ for fixed $`K`$, and at most $`o(p)`$ source lines have any one orientation. The two families may overlap. Count the tuples $`(i,j,x,y)`$ with $`x\in A_i`$, $`y\in B_j`$ and a distinct $`z\in B_j`$ satisfying $`|x-y|=|x-z|`$. Their number is $`o(pqt^2)`$.

This controls the case in [Erdős Problem 654](https://www.erdosproblems.com/654) where a pin belongs to one of many comparable source lines and a repeated pair lies on one of many comparable target lines. The estimates allow arbitrary different orientations, including orientations converging to a common direction. The general pin bound remains open. [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/922)

## Popular midpoints

Use a scalar coordinate along each target line and write $`\pi_j(x)`$ for the orthogonal projection in that coordinate. We use the same notation $`B_j`$ for the scalar set of its sites. For a fixed $`x`$, the possible $`z`$ for $`y`$ is uniquely specified by $`y+z=2\pi_j(x)`$. For any fixed orientation among the target lines, at most one of those lines can supply a distinct reflected pair for $`x`$. Otherwise four endpoints are reflected across the same perpendicular through $`x`$ on two distinct parallel lines and are concyclic by the [bisector lemma](BISECTORS.md). In particular, tuples with $`M_i\perp N_j`$ contribute only $`O(pt^2)`$. For all the other line pairs $`\pi_j`$ is an injective affine map on $`M_i`$.

Suppose along a subsequence there are at least $`\eta pqt^2`$ tuples for a fixed $`\eta>0`$. Choose a fixed sufficiently small $`\delta>0`$ depending on $`\eta,K`$. For each target let $`S_j`$ consist of the scalar midpoints at which there are at least $`\delta t`$ ordered representations by two distinct points of $`B_j`$. Then $`|S_j|\le K^2t/\delta`$. The pin–target incidences not hitting $`S_j`$ contribute at most $`K\delta pqt^2`$ tuples. By averaging, for positive constants $`\alpha,\beta`$ there are at least $`\alpha pq`$ nonperpendicular pairs $`(i,j)`$ for which $`|\pi_j(A_i)\cap S_j|\ge\beta t`$.

## Extracting source sets of small doubling

If $`R\subset A_i`$ and $`U=\pi_j(R)\cap S_j`$ has size at least $`\beta t/2`$ for a nonperpendicular target, then $`U`$ contains a subset of size at least $`ct`$ whose sumset has size at most $`Ct`$. The constants are uniform in the choices of line and subset. Indeed, at least $`(\beta\delta/2)t^2`$ pairs $`(u,b)\in U\times B_j`$ satisfy $`2u-b\in B_j`$. By Cauchy–Schwarz, the additive energy between $`2U`$ and $`-B_j`$ is at least a constant times $`t^3`$. This energy counts pairs of representations of the same sum. Its square is at most $`E(U)E(B_j)`$ by Cauchy–Schwarz on difference multiplicities. Since $`E(B_j)\le |B_j|^3`$, the one-set energy $`E(U)`$ is also at least a constant times $`t^3`$. The Balog–Szemerédi–Gowers theorem gives the asserted subset. In its small-difference-set formulation, the usual inequality $`|V+V|\le |V-V|^3/|V|^2`$ gives the same conclusion. [Balog–Szemerédi–Gowers theorem](https://arxiv.org/abs/2308.10245)

For each $`i`$, start with $`R=A_i`$. Whenever some nonperpendicular target has $`|\pi_j(R)\cap S_j|\ge\beta t/2`$, remove the preimage of such a small-doubling subset. Each preimage has the same sumset cardinality in scalar coordinates on $`M_i`$, since the change of coordinates is invertible affine. There are at most $`K/c`$ removals. For each originally counted good pair, the removed pieces between them hit at least $`\beta t/2`$ popular coordinates. One can therefore choose a single removed piece $`A_i'`$ for each participating source line so that at least $`\gamma pq`$ pairs still have $`|\pi_j(A_i')\cap S_j|\ge\gamma t`$ for a positive uniform $`\gamma`$. For instance, choosing a removed piece uniformly gives this lower bound in expectation after decreasing $`\gamma`$. An unused source line contributes zero.

## Projections onto common coordinates

Write $`X_{ij}=\pi_j(A_i')\cap S_j`$ on the retained nonperpendicular pairs and use the empty set otherwise. For each $`j`$, Cauchy–Schwarz gives

```math
\sum_{i,k}|X_{ij}\cap X_{kj}|
\ge\frac{(\sum_i|X_{ij}|)^2}{|S_j|}
```

when $`S_j`$ is nonempty. Summing and applying Cauchy–Schwarz over $`j`$ gives a lower bound of order $`p^2qt`$ since $`\sum_{i,j}|X_{ij}|\ge\gamma^2pqt`$ and $`\sum_j|S_j|=O(qt)`$. Pairs of equal or parallel source lines contribute $`o(p^2qt)`$ by the orientation hypothesis and the bound $`|X_{ij}|\le Kt`$. Consequently two nonparallel sources $`M_i,M_k`$ have intersections $`|X_{ij}\cap X_{kj}|\ge\gamma' t`$ for at least $`\gamma' q`$ targets, for some fixed $`\gamma'>0`$.

For each orientation, the sets of $`x\in A_i'`$ whose projection lies in $`S_j`$ for targets $`N_j`$ of that orientation are pairwise disjoint by the reflected-pair observation above. Hence at most $`K/\gamma'`$ of these targets have any one orientation. The number of distinct orientations among them tends to infinity.

## Rich rays in a Cartesian product

Measure the scalar coordinates on $`M_i,M_k`$ from their common point and let $`a_i,a_k`$ be unit vectors along them. Write $`U_i,U_k`$ for the coordinates of $`A_i',A_k'`$. For a unit direction $`d_j`$ of a retained target, two source sites with coordinates $`s,u`$ have the same projection if and only if

```math
s(a_i\cdot d_j)=u(a_k\cdot d_j).
```

Both dot products are nonzero. The two source directions are independent, so different target orientations yield different ratios $`(a_i\cdot d_j)/(a_k\cdot d_j)`$. The Cartesian product $`U_i\times U_k`$ thus has a line through the origin in each of a growing number of distinct directions, each containing at least $`\gamma' t`$ points.

Choose one populated ray on each line, discarding the origin. On at least one quadrant, arbitrarily many of the selected rays then have at least $`\gamma't/3`$ points each. Order them by angle. The sums of one point on each of two neighboring rays lie strictly between the rays, and every such sum has a unique decomposition on that pair of rays. Different consecutive pairs use disjoint open sectors. All sums belong to $`(U_i+U_i)\times(U_k+U_k)`$, a set of at most $`C^2t^2`$ points. This permits only a bounded number of the selected rays and gives a contradiction. This is the adjacent-ray argument of [Solymosi](https://arxiv.org/abs/0806.1040).
