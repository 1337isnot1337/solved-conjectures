# The six-block prism model has only the parity obstruction

**Theorem.** In the six-block model of [PRISM-REDUCTION.md](PRISM-REDUCTION.md), zero rainbow six-cycle density forces an exact parity cut, with no monochromatic-rectangle assumption. Consequently in any balanced six-color zero-cycle graphon, if the rainbow-triangle link graph of some single hue is disconnected, there is a parity cut.

In the link graph of a color $`a`$, the other five colors are vertices and $`bc`$ is an edge when the rainbow triangle palette $`\{a,b,c\}`$ has positive density. The theorem thus strengthens the previous necessary condition that every color pair occur: in a nonparity obstruction every one of the six link graphs must be connected. It does not settle the unrestricted case.

## Rules in the prism model

Write $`t=1/6`$. The six equal blocks have internal color $`a`$. Cyclically consecutive blocks have colors $`b,c`$, and the other interblock pairs have the three other colors $`D=\{d,e,f\}`$. Each vertex has degree $`t`$ in each color. The graph of $`D`$-interfaces consists of the two triangles of even and odd cyclic indices, and the perfect matching of opposite blocks between these triangles. Work with indicators by [circle refinement](DETERMINISTIC.md); the blocks and all stated degrees lift unchanged, and parity descends.

Two distinct blocks $`X,X'`$ of the same cyclic parity have a common neighbor $`Z`$ in the $`b,c`$-cycle. A $`b,c`$-rainbow two-path through $`Z`$ between $`x\in X`$ and $`x'\in X'`$ has positive measure exactly when their $`b`$-rows on $`Z`$ differ in $`L^1`$, because all these edges are $`b`$ or $`c`$. A $`D`$-rainbow three-path between the same blocks, if one existed on positive measure, could close with the $`b,c`$-two-path and an $`a`$-edge **inside one of the two end blocks**.

More precisely, let $`R(x,x')`$ denote an arbitrary sum of specified $`D`$-rainbow three-path kernels from $`X`$ to $`X'`$ that has positive integral, and let $`B(x,x')`$ be the $`b,c`$-two-path kernel through $`Z`$. The $`a`$-edge in $`X`$ allows its two incident $`X`$ vertices to be chosen independently, since the entire block is color $`a`$. Zero cycle density therefore implies
```math
\int_{X'}\left(\int_X R(x,x')\,dx\right)
            \left(\int_X B(\widetilde x,x')\,d\widetilde x\right)\,dx'=0.
```
For a positive mass set of $`x'`$, the first factor is positive, so almost every $`x`$ in $`X`$ has its $`b`$-row on $`Z`$ equal to that of these $`x'`$. In particular all of $`X`$ has one row. Put the $`a`$-edge inside $`X'`$ instead and use the reversed paths. This proves all of $`X'`$ has one row too, the same row as in $`X`$. But then at almost every vertex of $`Z`$, the $`b`$-degree into $`X\cup X'`$ is zero or $`2t`$, not $`t`$. These are the only two $`b,c`$-neighbor blocks of $`Z`$, a contradiction. Hence **no $`D`$-rainbow three-path of positive density can connect distinct blocks of the same cyclic parity**.

## Matching rectangles are monochromatic, all in the same color

For each vertex $`y`$ let $`P(y)\subseteq D`$ be the set of hues of positive degree into its opposite matched prism block. For an edge $`yz`$ between different blocks of one of the two $`D`$-triangles, let its color be $`h`$. The path taking a matching edge to $`y`$, then $`yz`$, and then a matching edge from $`z`$, joins two distinct blocks in the other triangle. A choice of distinct colors from $`P(y)\setminus\{h\}`$ and $`P(z)\setminus\{h\}`$ would produce the forbidden $`D`$-rainbow three-path, with independent endpoint choices in the matching blocks.

Both remaining palettes are nonempty for almost every such edge. If $`P(y)=\{h\}`$, its unique color fills the whole matching block of measure $`t`$ and exhausts the $`h`$-degree at $`y`$, so $`yz`$ could not have that color; the argument for $`z`$ is identical. Two nonempty sets admit no distinct pair of choices only if they are the same singleton. Thus every such edge $`yz`$ requires $`P(y)\setminus\{h\}=P(z)\setminus\{h\}`$ to be one singleton.

In particular a vertex cannot have three matching colors on positive measure, since it has triangle edges and deleting any one hue from its matching palette would leave at least two. It cannot have exactly two matching colors on positive measure either: its missing third $`D`$-hue must have degree $`t`$ into the other two blocks of its triangle, and along an edge of that missing hue both matching colors survive. Consequently almost every matching palette is a singleton. Every such vertex sends all edges to its matched block in its singleton hue. Symmetry then makes each entire matching rectangle monochromatic.

If two matching rectangles used different hues $`u,v`$, an edge joining their endpoint blocks in one triangle would use neither $`u`$ nor $`v`$, since the matching hue is saturated at each of its endpoints. The resulting matching–triangle–matching path would be rainbow, already ruled out. Therefore all three matching rectangles use the same hue of $`D`$. Together with $`b,c`$ on the quotient $`C_6`$, that hue fills all edges between the even and odd unions. The other three hues fill their interiors. Both unions have measure $`3t`$, giving the parity cut.

For the link-graph consequence, a disconnected link on five vertices either has an isolated vertex or splits as a two-vertex part and a three-vertex part with no crossing edges. An isolated link vertex is precisely a globally missing color pair, settled by [MISSING-PAIR-PARITY.md](MISSING-PAIR-PARITY.md). In the other case, choosing the two-vertex part and the distinguished hue as a half-palette makes its distinguished hue isolated across the two sides of the color grouping. Apply [PRISM-REDUCTION.md](PRISM-REDUCTION.md); the only alternative to immediate parity is the six-block prism, now settled above. Coordination: [#870](https://github.com/1337isnot1337/solved-conjectures/issues/870).
