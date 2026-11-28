# An ordinal link condition for the 9/B wedge core

Assume the countable rainbow partition principle for $`<\omega_1`$-type-bounded colourings of pairs, as in [Garti–Zhang, Theorem 2.3](https://arxiv.org/pdf/2007.05935#page=5). It holds under PFA and in a model of ZFC without large-cardinal assumptions. Here a normal pair colouring is type-bounded if the order types of all its colour classes below their common maximum have a single countable bound.

Let $`W`$ be the two-heavy-pair core of a $`T_1,T_9`$-free triple system on $`\omega_1`$. Use the [closure orientation](WEDGE-CORE-ORIENTATION.md) and its countable block tags to reduce to wedges whose last vertex is a leaf, in a well-order of type $`\omega_1`$ respecting the model blocks. For a fixed last leaf $`b`$, its lower link consists of disjoint stars: the centre $`x`$ of any such wedge is a $`G`$-neighbour of $`b`$, and the other leaf $`a`$ is not (since $`G`$ is triangle-free). Moreover $`a`$ cannot belong to two different stars: the two leaves $`a,b`$ have a unique common $`G`$-neighbour. Thus the star sets
```math
S_{x,b}=\{x\}\cup\{a\lt b:\{a,x,b\}\in W,\ x\text{ is its centre}\}
```
for nonempty lower-link stars are pairwise disjoint at a fixed $`b`$.

Suppose there is some countable ordinal $`\gamma`$ bounding the order types of all these stars in this order. Then $`W`$ is countably chromatic: assign the pairs $`\{\xi,b\}`$ for $`\xi\in S_{x,b}`$ one common colour for that star, use disjoint sets of colour labels across different $`b`$'s, and give all other pairs singleton labels. This is a normal $`<\omega_1`$-type-bounded colouring. The assumed rainbow partition properly colours the wedge core, because each wedge contains two pairs in its top-star colour class. If the star hypothesis holds separately in each of countably many block-tag classes, one may apply the argument on each, with a countable sum of palettes.

This uses a stronger rainbow principle than the finite-to-one one. It reduces the negative consistency approach to the still-open case of lower-link stars with no common countable order-type bound after these reductions. Countability of each individual star is automatic and does not give the uniform bound.
