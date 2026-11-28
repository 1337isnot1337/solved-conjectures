# A prescribed longest cycle can be far from any mate

A long cycle with many chords is not by itself a certificate for [Erdős #585](https://www.erdosproblems.com/585). A second cycle on the same vertices would need the chords to contain a Hamilton cycle. The obstruction below persists even when the chord graph is regular and maximally edge-connected.

## Theorem

Fix integers $`d\ge6`$ and $`g\ge4`$. There is a constant $`c=c(d,g)>0`$ and an infinite family of simple balanced bipartite graphs $`G`$ of girth at least $`g`$, each with a specified Hamilton cycle $`C`$, such that:

- The graph $`H=G-E(C)`$ is $`d`$-regular and $`d`$-edge-connected. In particular there are exactly $`dn/2`$ chords of $`C`$ in $`G`$, where $`n=|V(G)|`$.
- Every Hamilton cycle $`D`$ in $`G`$ shares at least $`cn`$ edges with $`C`$.
- If a Hamilton cycle $`C'`$ drops fewer than $`cn`$ edges of $`C`$, then $`C'`$ has no edge-disjoint Hamilton mate in $`G`$.

Indeed, every Hamilton cycle uses one of the retained edges of $`C`$, which all belong to $`C'`$. The full graph $`G`$ has edge connectivity $`d+2`$: every nontrivial cut receives at least $`d`$ edges of $`H`$ and at least two of $`C`$.

## A skeleton with many disjoint obstructions

Take a fixed non-Hamiltonian, cyclically five-edge-connected, simple cubic bipartite graph $`K`$ from [Brinkmann, Goedgebeur, and McKay](https://arxiv.org/abs/2101.00943). In particular it is 3-edge-connected. Fix a vertex $`v`$ on its right shore. The three neighbors of $`v`$ are on the left shore. There is no spanning path of $`K-v`$ with endpoints two distinct neighbors of $`v`$: adding back $`v`$ would close it to a Hamilton cycle of $`K`$.

For an integer $`M\ge2`$, take the cubic prism over a cycle of length $`2M`$. It is bipartite and 3-edge-connected. To see the connectivity, a cut that splits both layers has at least four cycle edges. A cut splitting just one layer has at least two cycle edges and one rung. A cut that separates whole layers has $`2M`$ rungs.

Replace each left vertex of the prism by a copy of $`K-v`$. Match its old three edges to the three distinct neighboring vertices of $`v`$ in this copy. Let $`P`$ be the resulting simple cubic bipartite skeleton. There are $`2M`$ disjoint gadgets, each with its three connectors all at left vertices. The right vertices of the prism remain singletons. Thus $`|V(P)|=2M|V(K)|`$.

The skeleton is 3-edge-connected. If a gadget is split by a cut and $`s`$ of its ports lie on one side, placing $`v`$ first on one side and then the other gives two cuts of $`K`$. The gadget has at least $`\max(s,3-s)`$ internal crossing edges. Two split gadgets contribute at least four. With one split gadget, round it to a side keeping the prism cut nontrivial. Its internal crossing edges pay for all new crossing connectors, whichever side is chosen. With no split gadget, the original prism cut already has size at least three.

## Weight the skeleton and raise its girth

Factor $`P`$ into three perfect matchings. Write $`d=3a+b`$ with $`0\le b\le2`$. Replace each edge by $`a`$ parallel copies and add one more copy along the first $`b`$ matchings. The resulting multigraph $`P_d`$ is $`d`$-regular and $`d`$-edge-connected. Every cut of size at least four in $`P`$ has weight at least $`4a\ge d`$ since $`d\ge6`$. A cut of size three in a cubic bipartite graph is shore-unbalanced. The difference of its two directed crossing counts is three times its shore-size difference, and their sum is three. Therefore the three edges cross in the same bipartition direction. Each perfect matching then crosses exactly once, so the weighted cut has size $`d`$.

Fix a simple bipartite $`d`$-regular, $`d`$-edge-connected graph $`J`$ of girth at least $`g`$. The [finite Cayley construction](CUBE-COVER-OBSTRUCTION.md) supplies this for any $`d,g`$. Inflate every left vertex of $`P_d`$ to a copy of $`J-w`$, where $`w`$ lies on its right shore. Its $`d`$ left neighbors become the ports. Attach distinct incident edge copies at distinct ports. Leave every right vertex of $`P_d`$ as a singleton. The [partial vertex substitution proof](NONSPANNING-NECESSITY.md#partial-vertex-substitution) gives a simple $`d`$-regular, $`d`$-edge-connected bipartite graph $`H`$ of girth at least $`g`$. Each partial module contributes exactly $`|V(J)|-1`$ vertices. Therefore
```math
n=M|V(K)|\,|V(J)|.
```
Call the vertices descended from one entire $`K-v`$ gadget its footprint. The $`2M`$ footprints are still pairwise disjoint.

We can require the Hamilton cycle to use no edge joining different footprints. Choose $`J`$ large enough as a function of $`d,g`$, for example by first constructing it with a higher girth threshold. There are $`2M`$ right prism singletons outside all footprints. In each footprint add an alternating spanning path with both endpoints on the left. This is possible in the complete bipartite graph because its shore imbalance is one; these added edges may initially be parallel to edges of $`H`$. Place one outside singleton between each consecutive pair of footprints in the cyclic order. Join the path endpoints through these singletons. This adds a spanning bipartite cycle.

Now apply the [Hamilton-preserving girth switch](HAMILTON-MODULES.md) only to edges of the added cycle. Every short cycle has such an edge. It is either internal to a footprint or attaches a footprint to an outside singleton. Choose the second switch edge internal to that footprint and opposite in traversal direction. There are enough choices: the alternating path inside the footprint has arbitrarily many edges in each direction, and two radius-$`g`$ balls in degree $`d+2`$ exclude only a bounded number of candidates. A switch at two internal edges just reverses a subpath within that footprint. A switch at one external edge moves its attachment to another left vertex of the same footprint. It does not change the cyclic footprint order. The usual lexicographic descent yields a simple union of girth at least $`g`$ while preserving $`H`$ and the prescribed footprint order of $`C`$.

## Every spanning cycle must touch every footprint with a cycle edge

Let $`D`$ be a Hamilton cycle of $`G`$. Suppose some footprint is untouched by $`E(C)\cap E(D)`$: all edges of $`D`$ incident with its vertices belong to $`H`$.

In that footprint there is one more inflated left module than there are right singletons. Each inflated module has one more left vertex than right vertex. Hence the footprint has left-minus-right imbalance one. All its external edges in $`H`$ leave from left ports. Subtracting the two degree sums of $`D`$ within the footprint shows that precisely two $`D`$ edges cross its boundary.

Each inflated module must contribute at least two crossing edges of $`D`$, since the cycle spans the graph. If the footprint contains $`p`$ right singletons, its $`p+1`$ modules account for at most $`2p+2`$ module crossings. The $`p`$ right singletons each contribute two, and the only other crossings are the two edges leaving the footprint. Consequently each module is crossed exactly twice. The segment of $`D`$ inside the footprint is one spanning path of the footprint. It visits each module in one segment. Contract these segments and forget edge multiplicity. This gives a spanning path in the original $`K-v`$ with endpoints two distinct permitted neighbors of $`v`$. They are distinct because the path visits all the other vertices and each module is visited only once. This contradicts the choice of $`K`$.

Thus every footprint meets an edge of $`E(C)\cap E(D)`$. No edge of the specified cycle meets two footprints, so at least $`2M`$ such edges are needed. This proves the theorem with $`c=2/(|V(K)|\,|V(J)|)`$.

## Above the conjectured density, with a proper-support witness

Take even $`d\to\infty`$ and $`g=\max(4,\lfloor\sqrt d\rfloor)`$. In this case the [Hamilton-decomposable module lemma](HAMILTON-MODULES.md) permits a module $`J`$ of any sufficiently large even order. Choose its order of size $`O((d+2)^{g+1})`$, above the explicit distance-switch threshold used for the footprint. Take $`M=d`$, so $`\log\log n=O(\log d)`$ and $`d/\log\log n\to\infty`$. The girth and the number of compulsory overlaps both tend to infinity.

For even $`d\ge10`$, a seed edge with multiplicity at least four can be assigned to the four distinct ports of two Hamilton factors of $`J`$. As in [the nonspanning example](NONSPANNING-NECESSITY.md#the-obstruction-can-coexist-with-a-proper-support-witness), those two paths close through their common right singleton. They give a genuine pair on the module plus singleton. Adding the specified Hamilton cycle preserves this witness. Hence failure of the prescribed spanning approaches can occur in the very same example as a successful nonspanning witness.

## Scope and literature

The construction rules out replacing the common-support task by finding a longest cycle and retaining nearly all its edges. The obstruction is not low chord count, poor edge connectivity, or fixed girth. It does not exclude other spanning pairs or pairs on proper support.

The classical many-chords question asks for a cycle with at least as many chords as vertices. See [Draganić, Methuku, Munhá Correia, and Sudakov](https://doi.org/10.1002/rsa.21207) and [Draganić and Girão](https://arxiv.org/abs/2601.08769) for successive results. That question does not require those chords to contain a cycle through every vertex. The [published upper bound for #585](https://doi.org/10.1016/j.aim.2025.110228) still uses a polylogarithmic average-degree threshold. No improvement to the general extremal order follows from this example.
