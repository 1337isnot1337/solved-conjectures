# Why two natural positive constructions stall

These are barriers to particular constructions for Problem 9/C, not negative results for the problem.

## Unconstrained finite omission forcing becomes countably triangle colorable

Consider the poset of finite induced partial triple systems on $\omega_1$ omitting the four configurations, with no additional support restrictions. One can also impose the condition that any repeated pair must be the bottom pair of both triples. Add single isolated points freely, so the generic system is on all of $\omega_1$.

For every fixed infinite ground-model set $D\subseteq\omega_1$, the pair shadow in the generic extension is dominated by $D$: every vertex outside $D$ has a neighbor in $D$. To see this, start with any condition and put the chosen vertex $x$ into its support if necessary. Pick $d\in D$ outside the support and a new $z$ outside the support, then add the triple $xdz$. This uses only one existing point and creates none of the forbidden patterns. In particular neither a loose triangle nor a pattern containing a shared pair can be created by the new edge. The construction is dense for each $x$.

The neighborhood of any one vertex of the shadow is triangle-free, by the exact graph reformulation in [the companion note](SHADOW-AND-LIFT.md). Thus if $D$ is countably infinite, give each vertex outside $D$ the color of the first element of $D$ adjacent to it, and use separate colors on $D$ itself. This is a countable triangle-avoiding coloring of the generic shadow. In particular a finite-condition proof for the positive direction needs an actual restriction on prospective incidences, not just omission of the four finite patterns.

## Prefix-tree books cannot be made safe by simply thinning each book’s petals

Consider the $\Delta$-system form of [EGH Lemma 11.5](https://users.renyi.hu/~p_erdos/1975-24.pdf#page=54): vertices are $(s,u)$, where $s$ is a prefix of length below $\omega_1$ and $u$ is a file index. An edge has two base vertices in one prefix node and one apex vertex in a later node. For each fixed apex node $t$ and each earlier rank below its length there is at most one possible base pair, determined by the prefix $t$ itself.

Suppose petals have been thinned so that for each fixed base pair, no two of its petals lie together in any edge. This is necessary in this template for avoiding $\mathcal T_3$ and $\mathcal T_9$: an edge containing two petals either has its third vertex outside the base, giving $\mathcal T_9$, or has it in the base, giving $\mathcal T_3$. In any node $t$, the set $U_t$ of vertices used as apices is a countable union of such independent-in-the-shadow sets, because $t$ has only countably many preceding ranks and at most one possible base for each. Color $U_t$ properly in the horizontal shadow using countably many colors. Use the same palette at every node, and a new color for all vertices not in $U_t$ at their own node.

Every triple has an apex in the palette. If both its base vertices use the palette, their colors differ because they are adjacent in their common node’s horizontal shadow. If either does not, its color differs from the apex’s color. Thus this type of thinning destroys uncountable chromatic number, even though the unthinned prefix construction is expressly designed to have it.
