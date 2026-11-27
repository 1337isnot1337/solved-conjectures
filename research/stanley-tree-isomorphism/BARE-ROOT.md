# Recovering a rooted core from two layers of an ordinary tree invariant

Let the core of a finite unmarked tree be its induced tree of nonleaf vertices. Give each core vertex weight one plus its number of leaf neighbors. A vertex of weight one will be called bare. The weights specify how to recover the original tree from its weighted core.

**Theorem.** Suppose exactly one core vertex is bare, and some integer $`d\ge3`$ divides every other core weight. The ordinary chromatic symmetric function distinguishes the tree from every finite tree. There is no restriction on diameter, branching or repetitions among the positive multiples of $`d`$. In particular the bare vertex can occur away from the center.

The leading partition in the star basis determines the multiset of core weights. Thus any rival with the same chromatic symmetric function has the same weight data. One can take their common divisor for $`d`$. Write $`s`$ for the number of core vertices, $`n`$ for the order of the tree and $`L=n-s`$ for its number of original leaves. The ordinary chromatic symmetric function determines the signless forest polynomial $`U`$ counting all choices of retained tree edges by their partition of component orders: the signs in the power-sum expansion depend only on the length of that partition. [Gonzalez, Orellana and Tomba, leading star partition](https://www.mat.univie.ac.at/~slc/wpapers/FPSAC2025/78.pdf) · [Stanley, power-sum expansion](https://doi.org/10.1006/aima.1995.1020)

## The two layers

Root the core at its bare vertex. For each subset of retained core edges record the mass of the root component and the multiset of masses of all other components. Here mass means the sum of the original core weights. We reconstruct the multiplicity of every such rooted record.

1. **No singleton.** A forest counted by $`U`$ with no component of order one retains every original pendant edge. Conversely a core forest produces such a forest precisely when the bare root is joined to another core vertex. Among the parts of its partition $`\lambda`$, the unique part congruent to one modulo $`d`$ marks the root component. All other parts are divisible by $`d`$. Thus the coefficient $`N_\lambda`$ gives the complete record for every nonisolated root.

2. **Exactly one singleton.** Either the root was isolated and every original pendant edge was retained, or one pendant edge was cut in a forest from step 1. In the second case restoring that edge recovers the predecessor uniquely. No other core vertex can become isolated after just one pendant cut, because its weight is at least three. For a fixed predecessor partition $`\lambda`$ there are exactly $`L N_\lambda`$ ways to cut one pendant edge.

3. **Cuts outside the root component.** For each distinct nonroot part $`k`$ in $`\lambda`$, lower one occurrence of $`k`$ to $`k-1`$ and adjoin a singleton. The ordinary coefficient of this partition counts exactly the pendant cuts in components of mass $`k`$ of all predecessors with partition $`\lambda`$. After removing the singleton, the residues $`1`$ and $`-1`$ occur once each and are distinct modulo $`d`$. The first marks the root and the second marks the part to increment to recover the predecessor. Equal copies of $`k`$ are already counted by this coefficient; use each distinct $`k`$ once. Subtract the sum of these coefficients from $`L N_\lambda`$. The remainder counts cuts inside the root component of these predecessors.

4. **Isolated root.** Consider a one-singleton partition whose other parts are all divisible by $`d`$. Begin with its coefficient in $`U`$. For every predecessor from step 1 which gives this partition on lowering its root mass by one and adding the singleton, subtract the root-cut count from step 3. The remainder counts exactly the rooted records whose root mass is one and whose other masses are the given parts. This recovers the entire rooted forest polynomial.

For example, take a path core of weights $`(3,1,6)`$. With every core edge cut the omitted rooted record has mass one at the root and other masses three and six. The ordinary partitions $`(1,3,6)`$ also arise from lowering the root mass in $`(4,6)`$ or $`(3,7)`$. These supply respectively two and five pendant cuts. Subtracting them from the ordinary coefficient eight gives exactly one isolated-root record.

## Reconstruction from the rooted records

For completeness, encode the recovered root mass as an exponent of $`x`$ and give each other component of mass $`j`$ a variable $`y_j`$. Call this polynomial $`R_K`$. Let $`U_A`$ denote its unrooted weighted analogue on a branch $`A`$, obtained by sending each root factor $`x^j`$ in $`R_A`$ linearly to $`y_j`$. At a root of weight $`w`$, its incident branches give
```math
R_K=x^w\prod_A(R_A+U_A).
```
The minimum exponent of $`x`$ is $`w`$. Each branch factor contains its variable $`y_{W(A)}`$ exactly once with coefficient one, where $`W(A)`$ is the total branch mass. That term comes from retaining every edge in the unrooted branch. All other occurrences of component variables have smaller index. The factor is therefore irreducible, being monic linear in this variable. Unique factorization recovers all factors, with their repetitions and with the coefficient of that largest-index variable fixing each scalar. Taking the positive powers of $`x`$ in a factor gives the rooted polynomial of its branch. Recursion recovers the rooted weighted core, and reattaching the specified leaves recovers the original tree. This is the positive-weight version of the established rooted-polynomial reconstruction argument. [Aliste-Prieto, de Mier and Zamora, Theorem 12](https://doi.org/10.1016/j.disc.2020.112255)

This is a written partial result toward Stanley's general tree-isomorphism question. The new step is recovering the rooted invariant, including all isolated-root records, from the two ordinary unmarked cut layers. The full conjecture and reconstruction for arbitrary nonproper trees of diameter six remain open. [Independent review and checks](BARE-ROOT-REVIEW.md) · [Research issue](https://github.com/1337isnot1337/solved-conjectures/issues/315)
