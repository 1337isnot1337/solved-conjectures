# Dense orthogonal products satisfy the linear diameter bound

**Theorem.** Fix $`0<\rho\le1`$ and $`R\ge0`$. Let $`X,Y`$ be arbitrary finite subsets of the real line, with no assumptions on their spacings. Suppose $`E\subset X\times Y`$ occupies at least a $`\rho`$ fraction of the product, and replace each occupied point $`e`$ by a distinct planar point $`P_e`$ with $`|P_e-e|\le R`$. If the resulting point set is distance-separated in the sense of [Erdős Problem 100](README.md), its diameter is $`\gg_{\rho,R}|E|`$ when $`|E|\ge2`$. The two coordinate axes may lie in any orthonormal frame.

This is separate from [the dense lattice theorem](DENSE-LATTICES.md): the one-dimensional coordinate sets here can be highly nonuniform or have no common lattice at all. The density is among pairs of coordinates, not among points of a containing rectangle in a lattice.

## Reduce to a dense regular pair

First treat $`R\le1/100`$. View $`E`$ as a bipartite graph. We need the following elementary density-increment form of the regular-pair lemma.

Fix $`\eta=\min(\rho/20,1/100)`$. Starting at density at least $`\rho`$, we can restrict each side to a fraction bounded below in terms of $`\rho`$ so that the pair is $`\eta`$-regular and its density is still at least $`\rho`$. Indeed, if a pair of density $`d`$ is not regular, find a rectangle whose sides are each at least an $`\eta`$ fraction and whose density differs from $`d`$ by more than $`\eta`$. If its density is greater, keep it. If its density is smaller, partition the current rectangle into the four cells determined by its sides. The negative weighted deviation of the witnessing cell is at least $`\eta^3`$ in magnitude, so total positive weighted deviation is at least $`\eta^3`$. The cells of relative weight less than $`\eta^3/16`$ can contribute at most $`\eta^3/4`$. Some cell of weight at least $`\eta^3/16`$ consequently has density at least $`d+\eta^3/2`$. Each side of this cell retains at least an $`\eta^3/16`$ fraction. Iterate: density at most one gives a bound in terms of $`\eta`$ on the number of steps. The terminal pair is regular, meaning that subsets of each side of relative size at least $`\eta`$ have induced density within $`\eta`$ of the pair density.

Write $`M,N`$ for the sizes of the two reduced sides. They are fixed fractions of the original sizes. If either $`M`$ or $`N`$ is bounded by a constant depending on $`\rho`$, then an original side is bounded in terms of $`\rho`$. All occupied labels lie on boundedly many horizontal or vertical lines. On each such line their spacings are at least $`1-2R`$, since the actual points have minimum spacing one. It follows directly that $`|E|=O_\rho(D+1)`$, where $`D`$ is the diameter of the actual point set. We can thus assume $`M,N`$ exceed all the fixed thresholds below.

For each reduced coordinate set, call its lowest and highest $`\lceil M/10\rceil`$ or $`\lceil N/10\rceil`$ positions its two fringes. Define $`a`$ as the gap between the largest left-fringe $`X`$ coordinate and the smallest right-fringe $`X`$ coordinate. Define $`b`$ analogously for $`Y`$. They are both positive; the middle coordinates are contained in intervals of lengths $`a,b`$, respectively. Both are at most $`D+2R`$: there are actual occupied label points in the extremes of each reduced side after deleting any initially isolated coordinates on the original sides. Equivalently, even if a reduced coordinate is now isolated, it was occupied in the original graph, which is all that this bound requires. We may delete any originally isolated coordinates before starting, increasing density.

## Obtain two rectangles at complementary scales

All but at most $`2\eta M`$ members of the reduced $`X`$ have at least $`(\rho-\eta)`$ times the size of each $`Y`$ fringe as neighbors there. Regularity proves this separately for each fringe: an exceptional set of more than $`\eta M`$ would make an irregular pair with that fringe. At least $`M/2`$ middle positions of $`X`$ meet both bounds.

Choose a sufficiently large integer $`s`$ depending only on $`\rho`$, for example $`s=\lceil16/\rho^2\rceil`$. Divide the middle interval of length $`a`$ into $`\lfloor M/(4s)\rfloor`$ bins of width at most $`8sa/M`$. Some bin contains at least $`s`$ of the typical middle positions $`x`$. Each of those $`x`$'s is adjacent to both coordinates of at least $`(\rho-\eta)^2`$ times the total number of ordered pairs $`(y_-,y_+)`$ across the two $`Y`$ fringes. Since $`s(\rho-\eta)^2>1`$, two distinct $`x`$'s in the bin share the same pair $`(y_-,y_+)`$. Their four cells are occupied. We have found a rectangle of horizontal width $`u\le 8sa/M`$ and vertical height $`v\ge b`$. Interchanging $`X,Y`$ gives another rectangle of horizontal width at least $`a`$ and vertical height at most $`8sb/N`$.

Consider the first rectangle and compare the top pair with the bottom pair. The four cross lengths of the labels are $`v,v,\sqrt{v^2+u^2},\sqrt{v^2+u^2}`$. If $`\sqrt{v^2+u^2}-v<1-4R`$, the four actual cross lengths occupy an interval of length less than one, so they are equal. This would make the two lines through the pairs one another's perpendicular bisectors, forcing their midpoints to coincide. But $`v\ge1-2R`$, by the minimum spacing for the actual points on a vertical side of the rectangle, and perturbing moves each of the two midpoints by at most $`R`$. They cannot coincide. Consequently
```math
u^2\ge 2(1-4R)v\ge b.
```
The analogous conclusion for the second rectangle says its vertical height has square at least $`a`$. The two upper bounds for the small sides now give
```math
M\le 8s\,a/\sqrt b,\qquad N\le 8s\,b/\sqrt a,\qquad
MN\le64s^2\sqrt{ab}\le64s^2(D+2R).
```
This bounds the product of the original side sizes, and hence $`|E|`$, by $`O_\rho(D+1)`$. Because $`D\ge1`$ for at least two actual points, it proves the theorem in the small-perturbation case.

For any fixed $`R`$, partition the displacement vectors in the radius-$`R`$ disk into boundedly many sets of diameter at most $`1/100`$. Keep the most frequently occupied displacement cell, retaining a positive fraction of the original product density, then translate all its actual points by the negative of one displacement in that cell. The small-perturbation argument applies. If the retained set has fewer than two points, the original size was bounded by the number of displacement cells, in which case its minimum spacing proves the desired estimate.

## Limits

The result requires high occupancy relative to the product of the numbers of coordinate levels, not just containment in some orthogonal product. A general finite planar set need not have this structure in any frame. A bounded novelty search for the exact dense Cartesian-product result included the old Brass and Baron strip work, lattice examples and distance separation with Cartesian products; no source for this exact statement was found. No claim is made that the unrestricted problem has been solved.
