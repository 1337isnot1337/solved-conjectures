# Repairing shortest-cycle labels at higher odd girth

This is an all-order partial result for [Erdős’s odd-girth deletion conjecture](https://www.erdosproblems.com/23). Let an odd $`g\ge7`$ be the length of a shortest odd cycle $`R=(r_0,\ldots,r_{g-1})`$ in a finite graph. Vertices carry nonnegative masses with edge costs the endpoint products. Write $`D,O_1,O_0`$ for vertices with two, one, or zero neighbors on $`R`$, and let $`H=G[D\cup O_1]`$. Denote the mass of $`O_1`$ by $`u`$. Indices of root labels are cyclic.

There is a map $`H\to V(C_g)`$ fixing the labels of the roots such that all edges map to consecutive labels except edges of total weight at most
```math
r\le \frac{u^2}{(g-5)(g-3)}.
```
Every exceptional edge maps to labels separated by an odd arc of length three, not to an arbitrary pair. Its cost can therefore be charged only three times in the $`g`$ canonical cycle cuts. If $`R`$ dominates all vertices, this proves
```math
\beta(G)\le \frac{e_w(G)}{g}+\frac{2u^2}{g(g-5)(g-3)}.
```
In particular it certifies the sharp normalized bound for such graphs of total mass one whenever $`e_w(G)\le 1/g-2u^2/[(g-5)(g-3)]`$. No general minimum-degree assumption is used. It does not close the whole dominating-cycle class or the unrestricted conjecture.

## Local labels and exact obstruction

An odd closed walk of length below $`g`$ is impossible. Any two distinct neighbors of a vertex on $`R`$ must have cyclic separation two, since their odd arc must have length at least $`g-2`$. There cannot be three such neighbors for $`g\ge7`$. A vertex in $`D_i`$ sees $`r_{i-1},r_{i+1}`$ and is assigned label $`i`$. Edges between two $`D`$ classes are necessarily consecutive. One way to verify the latter assertion is to consider the root-to-root walk of length three through such an edge: its ends cannot be joined by an even root arc of length at most $`g-5`$. Equal labels and distance two share a root. For short index gap $`h\ge3`$, use the inward root neighbors to get a forbidden even arc $`h-2`$ if $`h`$ is even, or the outward neighbors on the other arc to get $`g-h-2`$ if $`h`$ is odd.

A vertex $`x\in O_1`$ with unique root neighbor $`r_j`$ must have label $`j+\epsilon_x`$, where $`\epsilon_x\in\{-1,+1\}`$. Its only possible neighbors in $`D`$ have labels $`j,j-2,j+2`$: both roots of any adjacent $`D`$-vertex must be at odd root-arc distance one or three from $`j`$, again by the length-three walk test. An attachment to $`D_{j+2}`$ forces $`\epsilon_x=+1`$, and one to $`D_{j-2}`$ forces $`\epsilon_x=-1`$.

For an edge in $`O_1`$, orient its root labels $`j\to j+d`$, where $`d`$ is the odd arc length. The same test gives $`d=1`$ or $`3`$. For $`d=1`$ the homomorphism condition is $`\epsilon_x\ge\epsilon_y`$. For $`d=3`$ it forces $`+1`$ at the tail and $`-1`$ at the head. Thus all forcing rules, whether from $`D`$ or from a length-three label edge, give a two-edge walk from the forced vertex to $`r_{j+3}`$ (for sign $`+`$) or $`r_{j-3}`$ (for sign $`-`$). A vertex cannot be forced both ways, as the two walks joined through the root arc of length $`g-6`$ would give an odd closed walk of length $`g-2`$.

A homomorphism on $`H`$ exists if and only if no directed path of length-one label edges leads from a forced minus to a forced plus. Necessity is the monotone inequality on each step; for sufficiency make the whole reachable set minus and the rest plus. Any homomorphism can be rotated and reflected to fix the roots, since a homomorphism from $`C_g`$ to itself is a rotation or reflection: its $`g`$ steps are all $`+1`$ or all $`-1`$ in order to close an odd walk of this length. Thus the obstruction also characterizes the existence of an unrooted homomorphism on $`H`$.

Moreover every conflict path has length at least $`g-5`$. If it had length $`l\le g-6`$, attach the two forcing walks at its ends. Their root labels run from $`j-3`$ to $`j+l+3`$. Closing by the complementary root arc of length $`g-l-6`$, allowing length zero when the roots coincide, gives an odd closed walk of length $`g-2`$, a contradiction.

## Weighted layer repair

Give each $`O_1`$ vertex its directed distance from the forced-minus set via length-one label edges. For any $`0\le t\le g-6`$, mark distance at most $`t`$ minus, and the rest plus. No forced-plus vertex is incorrectly marked. All unary constraints remain satisfied; the only violations go from layer $`t`$ to layer $`t+1`$. Their cost is at most $`s_t s_{t+1}`$, where $`s_i`$ is the mass of that layer.

On a path of $`2b+1`$ layers of total mass at most $`u`$, the minimum adjacent product is at most $`u^2/[4b(b+1)]`$. Indeed, put a probability distribution on path edges with uniform marginals in the even and odd positions: for odd vertex $`2j-1`$, $`1\le j\le b`$, put weights $`(b+1-j)/(b(b+1))`$ and $`j/(b(b+1))`$ on its left and right edges. A weighted geometric mean bounds the minimum product by the product of the two parity-class geometric means. AM–GM bounds that product by $`u^2/[4b(b+1)]`$. Apply this with $`2b=g-5`$ to get the repair bound.

The only bad label pairs above have displacement three: on a violated oriented length-one edge the choices are $`-1,+1`$. In each of the $`g`$ cuts of $`C_g`$ missing exactly one edge, pull back the signs. A good edge is missed once and a bad edge three times, so the average missed cost on $`H`$ is $`(e_w(H)+2r)/g`$. This does not require actually paying full deletion cost for the entire repair set.

For the full graph, each $`O_0`$ vertex may independently choose its cheaper side relative to all of $`H`$ in each cut. Averaging the minimum over the $`g`$ cuts is concave in its $`g`$ attachment masses, so cyclic averaging of those masses bounds the loss by $`(g-1)/(2g)`$ of its total attachment mass. Charging edges within $`O_0`$ in full gives the further estimate
```math
\beta(G)\le
\frac{e_w(H)+2r}{g}+\frac{g-1}{2g}e_w(H,O_0)+e_w(O_0).
```

The shortest-cycle profile method is related to [Messuti–Schacht](https://arxiv.org/abs/1602.03904) and [Lu–Wang](https://arxiv.org/abs/2607.04323), which use stronger degree hypotheses to give cycle or Möbius-ladder homomorphisms. The new entries here are the weighted implication-path repair and the three-cut charge. This complements the [pentagon-rooted inequality](ROOTED-PENTAGON-RATIO.md); the $`g\ge7`$ requirement is essential to the displayed conflict-walk argument.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
