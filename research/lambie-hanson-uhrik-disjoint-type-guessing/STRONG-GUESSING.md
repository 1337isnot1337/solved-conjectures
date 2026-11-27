# Strong guessing on two stationary sets

Cinna Davis’s proof for two bounded interleaving parameters can be localized to any closed unbounded set of limit ordinals (a club). This gives the following strengthening in ZFC for the same ladder system. For every coloring $`f:\omega_1\to\omega`$ and every type sequence with uniformly bounded depth and lower reach, there are a color $`k`$, disjoint stationary sets $`A,B`$ of limit ordinals of color $`k`$, and fixed disjoint prefixes $`a,b`$ of length $`n_k`$ such that

```math
C_\alpha[n_k]=a\quad(\alpha\in A),\qquad
C_\beta[n_k]=b\quad(\beta\in B),\qquad
\mathop{\mathrm{type}}(a,b)\in\{t_k,\bar t_k\}.
```

In particular for stationarily many upper ordinals $`\beta`$, the same-color lower witnesses are unbounded in $`\beta`$. This gives strong guessing in the sense of Lambie-Hanson and Uhrik’s Definition 2.6, including when the widths are unbounded. [Original definitions and bounded-width theorem](https://arxiv.org/pdf/2312.01828#page=5) · [Two-parameter construction](PROOF.md)

## Localizing the finite-prefix construction

Fix the coloring and the type sequence. For any club $`E`$, repeat the positive proof with $`E`$ as a parameter in every elementary submodel. Choose the upper model ordinal $`\beta`$ with the prescribed finite prefix as before. In particular $`\beta\in E`$, since the model contains the unbounded set $`E`$ and $`E`$ is closed. Strengthen the relation used under the nested unbounded quantifiers by requiring the lower limit ordinal to belong to $`E`$. The upper ordinal still witnesses the initial relation, so replacing it, then the successive model ordinals, by unbounded quantifiers goes through with this extra condition. All recursive choices in the prescribed gaps preserve the strengthened relation. At the final step the lower ordinal lies in $`E`$ and below the first upper tail marker. When the depth is zero, choose the lower ordinal from $`E`$ below the first upper marker using the same unbounded assertion. Thus some ordinary guessing pair has both indices in $`E`$.

## From a club to two stationary fibers

For each limit ordinal $`\alpha`$, associate its data consisting of its color and the whole ladder prefix of length equal to the width for that color. There is a club on which every such datum has a stationary fiber. Indeed, if the set of indices with a nonstationary fiber were stationary, restrict first to a stationary subset on which the color is constant, using countable completeness of the nonstationary ideal. Its width is now a fixed finite integer. Each prefix coordinate is strictly below its index. Apply the pressing-down lemma successively to those finitely many coordinates. The resulting stationary subset would lie in one fiber previously assumed nonstationary, a contradiction.

Use the localization just proved with a club disjoint from the bad indices. The two witnesses have color $`k`$ and disjoint prefixes realizing the prescribed type up to exchange. Their fibers $`A,B`$ are stationary and disjoint. Every pair taken from opposite fibers has the same two prefixes. The accumulation points of $`A`$ form a club, so stationarily many $`\beta\in B`$ have unboundedly many witnesses from $`A\cap\beta`$. Conversely, if two such stationary fibers exist for a coloring, every club contains a guessing pair for that coloring: intersect both fibers with the club and choose the second ordinal above the first. This equivalence uses localization on every club.

## Why the localization matters

For the constant sequence of width-one types, there are ladder systems that guess ordinarily and fail strong guessing. For every $`0\lt\xi\lt\omega_1`$, let the first ladder point of $`\gamma_\xi=\omega^2\cdot\xi+\omega`$ be $`\omega^2\cdot\xi`$. Give every other nonzero limit ordinal first ladder point zero. Complete each ladder to an increasing cofinal sequence of order type $`\omega`$. For any countable coloring, uncountably many exceptional indices have the same color and distinct first points, so an ordinary guess occurs. Now color all exceptional indices one and all other indices zero. Two ordinary zero-colored indices have identical first points. For each exceptional index, all smaller exceptional indices are at most $`\omega^2\cdot\xi\lt\gamma_\xi`$. Its predecessors capable of guessing are bounded. This disproves the automatic upgrade for an arbitrary ordinary-guessing ladder system.

## Classification and scope

In the restricted proper forcing axiom model, and after any countable forcing over that model, the two bounds therefore characterize existence of both ordinary and strong guessing for a type sequence. The positive implication holds in ZFC by this proof. If either parameter is unbounded, the ordinary-guessing obstruction rules out even a single witness pair for a suitable coloring of each proposed ladder system. [Ground-model obstruction](PROOF.md) · [Preservation theorem](../../work/1061-lambie-hanson-uhrik-disjoint-type-guessing/COUNTABLE-FORCING.md)

This supplement gives unbounded predecessor indices as in Definition 2.6. The extra conclusion about the next ladder coordinate in the bounded-width Theorem 2.7 is a separate property. Question 6.2 about graphs after one Cohen real remains open.
