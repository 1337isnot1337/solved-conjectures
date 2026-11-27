# The six-point criterion at higher regular hosts

Cinna Davis proved the density criterion, common-extension argument and asymptotic dichotomy at the first uncountable cardinal. The following transfer, identified in the independent review by Wade Davis, applies the same constructions at higher cardinals. The uniform estimates reach the specific higher parameter mentioned by Erdős, Galvin and Hajnal. The consistency of the positive rainbow assumption at that parameter remains undetermined here.

Fix a regular uncountable cardinal $`\theta`$. A witness is a triple system on $`\theta`$ with no independent subset of cardinality $`\theta`$. Let $`e_H(n)`$ be the maximum number of triples on an $`n`$-point subset. Write $`R_2(\theta)`$ for the statement that each coloring of the unordered pairs from $`\theta`$, using each color at most twice, has a rainbow subset of cardinality $`\theta`$. Put $`q(n)=\lfloor(n-1)^2/4\rfloor`$ for positive integers $`n`$.

## Six vertices characterize simultaneous attainment

In ZFC the following three conditions are equivalent.

1. $`R_2(\theta)`$ fails.
2. Some witness satisfies $`e_H(n)\le q(n)`$ for every positive integer $`n`$.
3. Some witness satisfies $`e_H(6)\le6`$.

For the first implication take a bad coloring. Each pair determines the finite union of the endpoints of all pairs of its own color. For the third-to-first implication start instead with a witness as in (3). For distinct $`a,b,f`$, fewer than $`\theta`$ vertices $`z`$ can extend both $`ab`$ and $`af`$ to triples. Otherwise a triple in their common extension set gives seven distinct triples on six points. Associate to each three-element set the union of these three small sets, allowing each choice of distinguished vertex $`a`$.

In either application we have a fixed finite-arity map returning subsets of cardinality less than $`\theta`$. There is a closed unbounded set of ordinals below $`\theta`$ closed under its values on tuples from that ordinal. Indeed, starting beyond a given ordinal, apply the map to all eligible tuples below the current bound, take a strictly larger bound, and repeat countably many times. Regularity keeps each step and the countable supremum below $`\theta`$. The limit is closed under the map. Increasing limits below $`\theta`$ of such closed ordinals remain closed. Take one vertex in each successive interval of a continuous cofinal chain of closed ordinals. This set $`S`$ has size $`\theta`$.

In the first application every pair-color collision on $`S`$ shares its maximum by closure at the left endpoint of the later maximum's block. Join $`x<y<z`$ in a triple exactly when $`xz`$ and $`yz`$ have equal colors. An independent subset is rainbow. Each lower link is a matching, so there are at most $`\sum_{j<n}\lfloor j/2\rfloor=q(n)`$ triples on $`n`$ vertices. Transporting the order on $`S`$ to $`\theta`$ gives (2), which implies (3). In the third-to-first application the lower link of each $`z\in S`$ is a matching by the same closure property for common extensions. Assign a fresh repeated color to the two apex pairs of each triple, then distinct singleton colors to all remaining pairs. No rainbow subset of size $`\theta`$ exists, proving (1).

## Density under the positive relation

Suppose $`R_2(\theta)`$ holds and $`H`$ is a witness. For each finite $`k\ge1`$, in every subset of size $`\theta`$ there are $`a,b_1,\ldots,b_k`$ having $`\theta`$ distinct common extensions $`z`$ with all $`ab_i z`$ present. Otherwise close a chain as above under the fewer-than-$`\theta`$ common extensions of each tuple. On its one-point-per-block set every lower link has maximum degree at most $`k-1`$. For $`k=1`$ the set is independent. For $`k\ge2`$ a greedy edge coloring of each lower link, in any well-order, uses at most $`2k-3`$ colors since each edge meets at most $`2k-4`$ others. Each color class is a matching and provides one two-bounded pair coloring as before. Use $`R_2(\theta)`$ successively on the finitely many colorings, retaining size $`\theta`$ at each step. The final set is independent, a contradiction.

Iterating inside the common extensions yields $`d`$ groups of $`k+1`$ vertices on which at least $`k(k+1)\binom{d}{2}`$ distinct triples occur. Each counted triple uses the center and one spoke of a group and one vertex from a later group. With $`k=\lfloor\sqrt n\rfloor`$ and $`d=\lfloor n/(k+1)\rfloor`$, padding to $`n`$ gives $`e_H(n)\ge n^2/2-O(n^{3/2})`$ with an absolute constant, uniformly in $`H`$ and $`\theta`$. At $`k=2`$ two common extensions give a four-cycle in the link at $`a`$, containing a three-edge path. At $`\theta=\omega_1`$ this gives the uncountable-independent-set direction of Problem 8/E in this model. Its separate countable-colorability theorem uses a countable rainbow partition.

## The pointwise limit at successors of regular cardinals

Let $`\kappa`$ be infinite regular, $`\theta=\kappa^+`$, and $`h(n)=\min_H e_H(n)`$ over witnesses. Then ZFC determines the limit by the rainbow relation at this same host:

```math
\lim_{n\to\infty}\frac{h(n)}{n^2}=
\begin{cases}
1/4,&\neg R_2(\theta),\\
1/2,&R_2(\theta).
\end{cases}
```

In the first case the simultaneous upper bound and Corollary 3.6 of Erdős–Galvin–Hajnal give $`h(n)=q(n)`$ pointwise. For a common upper bound in the second case, take a coloring $`c:[\theta]^2\to\kappa`$ attaining every color on each subset of size $`\theta`$. This is the square-bracket theorem for successors of infinite regular cardinals, coarsened to $`\kappa`$ colors. [Rinot–Todorčević, *Rectangular square-bracket operation for successor of regular cardinals*, p. 119 and Theorem 2.6](https://www.impan.pl/shop/publication/transaction/download/product/89041) · [Rinot–Zhang, Definition 2.1 and Facts 2.2–2.3](https://www.assafrinot.com/files/paper44.pdf#page=4) · [Todorčević's original paper](https://doi.org/10.1007/BF02392561)

For every $`\beta<\theta`$ choose a bijection $`u_\beta:D_\beta\to\beta`$ from a subset of $`\kappa`$. Declare $`\gamma<\alpha<\beta`$ a triple when $`c(\alpha,\beta)\in D_\beta`$ and $`u_\beta(c(\alpha,\beta))=\gamma`$. Each top pair accounts for at most one triple, and the least vertex of a chosen finite set cannot belong to a top pair. Thus $`e_H(n)\le\binom{n-1}{2}`$. For any $`\theta`$-sized $`A`$ choose $`\gamma\in A`$. Among later $`\beta\in A`$ there are $`\theta`$ with the same index $`i=u_\beta^{-1}(\gamma)`$, since there are only $`\kappa`$ possible indices. Two of these later vertices give a pair colored $`i`$, making a triple with $`\gamma`$. The resulting system is a witness. The lower and upper estimates now squeeze the pointwise limit.

In the original source $`\kappa=\aleph_2`$ means host $`\theta=\aleph_3`$. At this host the six-point criterion identifies exactly which rainbow relation would prevent sharp density, and the theorem gives both conditional limits. The relative-consistency result for the two different limits established at $`\omega_1`$ applies to that host alone. In particular, a rainbow theorem furnishing an $`\omega_1`$-sized subset of $`\omega_2`$, or a negative result restricted to closed rainbow subsets, does not select either alternative at $`\aleph_3`$. [Original Theorem 10.5 and remark](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=44) · [Abraham–Cummings–Smyth, introduction, item 4(a)](https://www.math.cmu.edu/users/jcumming/papers/polyx_revised_dec2006.pdf#page=3) · [Garti–Zhang, Lemmas 1.2–1.3 and Corollary 2.6](https://arxiv.org/pdf/2007.05935)
