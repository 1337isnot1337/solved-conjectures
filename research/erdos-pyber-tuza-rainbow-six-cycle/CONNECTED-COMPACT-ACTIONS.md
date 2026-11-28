# Connected compact homogeneous colorings contain rainbow cycles

**Theorem.** Let $`m\ge3`$, and let $`G`$ be a connected compact metrizable group with normalized Haar measure. Let $`f_1,\ldots,f_m:G\to[0,1]`$ satisfy $`\sum_i f_i=1`$, inversion symmetry $`f_i(g^{-1})=f_i(g)`$, and $`\int f_i=1/m`$. The balanced color graphon $`W_i(x,y)=f_i(x^{-1}y)`$ has positive rainbow $`C_m`$ density. This applies also to colorings invariant under the transitive action of a connected compact group on a homogeneous space: pull the coloring back to the group from $`G/H`$.

The case $`m=6`$ excludes all connected compact-group homogeneous counterexample limits, including nonabelian groups and fractional colors. This is a structural subcase of Erdős #811, not a proof for arbitrary graphons or for arbitrary disconnected compact actions.

## Positive product support and Kemperman growth

For measurable $`A,B\subset G`$, write $`A\star B=\{g:(1_A*1_B)(g)>0\}`$. We use a standard passage from ordinary product sets to this positive support. Compact groups have a basis of conjugation-invariant symmetric identity neighborhoods: given an identity neighborhood, the compactness of the group and the continuity of conjugation give a smaller neighborhood all of whose conjugates lie in the original one; take the union of those conjugates and symmetrize.

For such shrinking neighborhoods $`V`$, the averages $`\mu(A\cap aV)/\mu(V)`$ converge in $`L^1(da)`$ to $`1_A(a)`$, by strong translation continuity in $`L^1`$; likewise for $`B`$. Choose a common subsequence along which both converge almost everywhere. Replace $`A,B`$ by full-measure subsets $`A',B'`$ of points where the corresponding limit is one. For any $`a\in A',b\in B'`$ there is one common $`V`$ for which both local densities exceed $`3/4`$. The sets of $`u\in V`$ with $`au\in A`$ and with $`u^{-1}b\in B`$ each have measure above $`3\mu(V)/4`$, because $`Vb=bV`$ and inversion preserves Haar measure. Their intersection is positive, hence $`ab\in A\star B`$. By inner regularity we can use full-measure sigma-compact subsets of $`A',B'`$, so their ordinary product is measurable and still lies in $`A\star B`$.

[Kemperman's product inequality](https://doi.org/10.4064/fm-56-1-51-68) now gives
```math
\mu(A\star B)\ge \min\{\mu(A)+\mu(B),1\}.
```
The same applies iteratively to positive convolution supports: convolution of nonnegative factors is positive exactly where convolution of the indicators of their positive sets is positive.

## The no-rainbow assumption makes every pair critical

Set $`S_i=\{f_i>0\}`$, so $`\mu(S_i)\ge1/m`$. Split any cyclic order of all $`m`$ colors into two nonempty ordered segments. Their convolution supports are disjoint after inversion of the second one, because the rainbow cycle density at that order is the convolution at the identity. These supports have respective measures at least the sums of constituent $`\mu(S_i)`$'s, capped at one, by the preceding growth bound. A support of measure one would meet the other positive-measure support. Thus the two caps do not apply and the sum of all $`\mu(S_i)`$ is at most one. This forces $`\mu(S_i)=1/m`$ and $`f_i=1_{S_i}`$ almost everywhere for each color. In particular the $`S_i`$'s partition $`G`$ and are symmetric under inversion up to null sets.

For any two different colors place them consecutively in the first segment, and all other colors in the second. Each lower bound must be tight, so $`\mu(S_i\star S_j)=2/m`$. The full-measure sigma-compact subsets $`S_i',S_j'`$ obtained above then have ordinary product measure exactly $`2/m`$. By the equality case of [Jing–Tran's inverse Kemperman theorem](https://arxiv.org/abs/2006.01824) (the compact-group statement and its inner-measure extension in Section 9), the two original sets, up to null sets, are inverse images of arcs of length $`1/m`$ under a common continuous surjection $`G\to\mathbb R/\mathbb Z`$.

Equivalently, one can use the compact-pair near-equality version of the same theorem on compact subsets of $`S_i',S_j'`$ tending to their full measures. The product measures are bounded above by $`2/m`$ and below by the sums of the approximating measures. This produces arc inverse images of lengths tending to $`1/m`$, approaching the original sets in symmetric difference. The uniqueness observation below forces the homomorphisms to stabilize up to sign, after which compactness of circle arc centers gives the same exact conclusion. This use of the near theorem only involves the regime where both set measures and the unused measure are bounded away from zero.

## The common circle quotient is unique

An arc inverse image of length $`t=1/m`$, with $`0<t<1`$, determines its circle homomorphism up to inversion. For a given surjection $`\phi:G\to\mathbb R/\mathbb Z`$, the Fourier coefficient of the indicator of $`\phi^{-1}(I)`$ along $`\exp(2\pi i\phi)`$ has magnitude $`\sin(\pi t)/\pi>0`$. A one-dimensional continuous character not factoring through $`\phi`$ has zero coefficient by integration over the kernel. The other nontrivial characters that factor through $`\phi`$ are integral powers of it, with coefficient magnitudes $`|\sin(k\pi t)|/(|k|\pi)`$. For $`|k|\ge2`$ these are strictly smaller: the ratio $`\sin(k\theta)/\sin\theta`$ is a sum of $`|k|`$ unit phases that are not all equal for $`\theta=\pi t`$. These coefficients tend to zero as $`|k|\to\infty`$, so there is a strict gap between the first pair of coefficients and all the other nonconstant ones. This also proves robustness of uniqueness for arc lengths close to $`t`$ and indicators close in $`L^1`$, since an $`L^1`$ error bounds the error of every coefficient uniformly.

Apply this to $`S_1`$ as shared between its critical pairs with each $`S_j`$. They all have the same circle quotient up to inversion, which can be absorbed by reflecting the arcs. But an inversion-invariant arc of length $`1/m<1/2`$ has midpoint either $`0`$ or $`1/2`$ on the circle. There are only two such arcs of that length, whereas $`m\ge3`$ of the arc inverse images must be disjoint and have positive mass. Contradiction.

The use of Kemperman's inequality and the inverse theorem is from the stated sources. The cycle-support reduction, alignment through a common color and the inversion-symmetry contradiction are the additions here. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
