# The parity cut forces rainbow six-cycles after a small pointwise perturbation

This is a partial result for the rainbow six-cycle clause of [Erdős #811](https://www.erdosproblems.com/811), not a solution for unrestricted balanced colorings. Unlike the [abelian result](README.md), it does not assume any transitivity or group structure. The unperturbed odd-crossing-palette obstruction at even order is the Brightwell–Trotter construction credited in [Erdős–Tuza (1993), §3.4](https://doi.org/10.1016/S0167-5060(08)70377-7). This note proves a stability statement for exact balance at odd order, rather than claiming the parity example as new.

**Theorem.** Let a six-edge-coloring of the complete graph on $6t+1$ vertices give every vertex exactly $t$ incident edges of each color, with $t\ge 2{,}000{,}000$. Partition the vertices into $X,Y$ and the colors into triples $A,B$. Call an edge misplaced if its color is in $A$ and it lies within a side, or if its color is in $B$ and it crosses. Suppose each vertex is incident to at most $D$ misplaced edges, where $(D+1)/t\le 10^{-6}$. Then every misplaced edge belongs to a rainbow six-cycle, and at least one such edge exists.

**Global form.** Under the same lower bound on $t$, if there exists such a partition with at most $5\cdot10^{-15}t^2$ misplaced edges *in total*, the coloring contains a rainbow six-cycle. This formulation permits an unrestricted number of misplaced edges at individual vertices before choosing the partition.

## A three-color walk identity

Write $P_i$ for a color-adjacency matrix divided by $t$, with the vertex set and admissible edges restricted to one of two kinds of blocks: the edges within a single part, colored with the three colors in $B$; or the edges between the two parts, colored with the three colors in $A$. In either block ignore the misplaced edges. Let $S=P_1+P_2+P_3$. Let $R$ be the sum of the six ordered products with three distinct factors. Expanding noncommutatively gives
```math
R=S^3-\sum_{i=1}^3(P_i^2S+P_i S P_i+S P_i^2)+2\sum_{i=1}^3P_i^3.
```
A triple of indices with exactly two equal is subtracted once, and an all-equal triple is subtracted three times and added back twice. In the exact uniform model with $S=3Q$ and $P_iQ=QP_i=Q^2$, where $Q$ is a normalized complete-block matrix, this reduces to $R=2\sum_iP_i^3$. This turns a rainbow path count into a monochromatic walk count.

## Robust form

For the pointwise theorem, all norm bounds below use the maximum absolute row sum. Both sides are nonempty, as each vertex has at least $3t-D$ correctly crossing edges. For a vertex in one part the total crossing degree differs from $3t$ by at most $D$: any discrepancy is the number of misplaced $B$ edges crossing minus the number of misplaced $A$ edges not crossing. Hence each part size lies in $[3t-D,3t+D]$.

Let $\eta=(D+1)/t$, and let $Q$ have entry $1/(3t)$ at every slot in the block, zero elsewhere, including the diagonal slots for a within-part block. The row norm of $Q$ is at most $2$, that of each $P_i$ at most $1$, and that of $S$ at most $3$. Since there are at most $D$ misplaced edges per row, and at most one absent loop in the within-part case, $`\|S-3Q\|\le\eta`$. Also
```math
\|P_iQ-Q^2\|,\ \|QP_i-Q^2\|\le 2\eta.
```
For the first bound, products have identical possible supports (the full within block, or the two same-side blocks in the bipartite case). Each supported entry of $P_iQ$ is $1/(3t)$ times a row degree divided by $t$, between $1-\eta$ and $1$. The corresponding entry of $Q^2$ is $1/(3t)$ times a part size divided by $3t$, within $\eta/3$ of one. The row contains at most $(3+\eta)t$ slots, so the row difference is at most $(4\eta/3)(1+\eta/3)\le2\eta$. The other bound follows by the same entrywise comparison using column degrees; the matrices are symmetric.

It follows by telescoping that $`\|S^3-27Q^3\|\le (9+18+36)\eta=63\eta`$. Each of $P_i^2Q,P_iQP_i,QP_i^2$ has distance at most $6\eta$ from $Q^3$ by the previous two product bounds and submultiplicativity. Replacing each appearance of $S$ in the nine mixed terms by $3Q$ incurs at most $\eta$ per term. Thus
```math
\left\|R-2\sum_iP_i^3\right\|\le 250\eta.
```

The same calculation applies after deleting $b$ vertices from the original blocks, if the surviving vertices originally had misplaced degree at most $D_0$ and the two original part sizes were within $D_0$ of $3t$. Use $\eta=(D_0+b+1)/t$: surviving sizes are within $D_0+b$ of $3t$, row and column color degrees are at least $t-D_0-b$, and at most $D_0+1$ uncolored slots remain per row of the restricted block. These are exactly the inequalities used above.

Let $U,V$ have sizes between $t/3$ and $t$; they lie in the one allowed part in the within-part case, and in opposite parts in the bipartite case. At least $(1-3\eta)|U||V|$ of their ordered pairs are correctly colored edges, since at most $\eta t$ slots per row are missing. One color occurs on at least $e=(1-3\eta)|U||V|/3$ of these pairs. Regard $U,V$ as disjoint labelled copies for counting even when they overlap. The number $W$ of monochromatic three-walks in that bipartite subgraph in the direction from $U$ to $V$ equals the sum of $d(u)d(v)$ over middle edges $uv$. Applying Hölder's inequality over those edges to the three factors $(d(u)d(v))^{1/3}$, $(1/d(u))^{1/3}$ and $(1/d(v))^{1/3}$ gives $W\ge e^3/(|U||V|)$. For $\eta\le10^{-6}$, this is at least $t^4/2500$, since $|U||V|\ge t^2/9$. The row-norm error costs at most $250\eta t^4$ walks after undoing the normalization. Therefore the number of rainbow three-walks between the two sets is at least $t^4/2048$.

Those walks have four listed vertices. If two of them coincide, or if any equals one of two prescribed vertices, fixing the equality leaves at most three free choices, each in a prescribed part of size at most $4t$. There are at most fourteen equalities to prohibit. Hence at most $960t^3$ walks are unusable for this reason. For $t\ge2{,}000{,}000$ this is strictly less than $t^4/2048$. There is a rainbow three-path, with endpoints in $U,V$, disjoint from the two prescribed vertices.

## Complete a misplaced edge

If the edge $xy$ has color in $A$ and lies within one side, choose the other two $A$ colors in either order. Let $U,V$ be the corresponding correctly crossing neighborhoods of $x,y$ in the opposite part. The three-path in the within-part block uses all three $B$ colors, and with the two chosen edges and $xy$ forms the cycle. If $xy$ has color in $B$ and crosses, use the neighborhoods of $x,y$ in their own parts in the other two $B$ colors, and the three-path in the cross block uses all three $A$ colors. The path avoids $x,y$ in either case. Finally, if there were no misplaced edges, the crossing degree condition would give $|X|=|Y|=3t$, contrary to order $6t+1$.

## From few total errors to few errors per vertex

Set $\delta=10^{-7}$ and assume at most $\delta^2t^2/2$ misplaced edges. Call a vertex bad if it has more than $D_0=\delta t$ misplaced edges incident to it. Double-counting these incidences gives $b\le\delta t$ bad vertices. Each side contains a good vertex. Otherwise the side without good vertices has at most $b$ vertices, while any good vertex in the other side has at least $3t-D_0$ crossing edges. The presence of good vertices in both sides gives the original size estimates from the pointwise proof. Restrict to the good vertices. The robust three-path lemma therefore applies with $\eta=(D_0+b+1)/t\le10^{-6}$.

Assume no rainbow six-cycle exists. For a bad vertex $z$, each color has at least $t-b$ good neighbors, so that color has at least $t/3$ good neighbors on one side. Suppose two colors $i,j$ from the same palette have opposite such majority sides. Or suppose all three colors of a palette have the same majority side, but some edge in color $i$ from $z$ to a good vertex $x$ goes to the other side; then choose any different color $j$ from the same palette. In either case there is a good neighbor $x$ in color $i$, opposite a set $V$ of at least $t/3$ good neighbors of $z$ in color $j$.

Let $k$ be the third color of their palette, and $U$ the correctly placed good color-$`k`$ neighborhood of $x$. It has size at least $t-D_0-b$. If $k\in A$, $U,V$ lie on the same side, and the within-part three-path lemma uses all three $B$ colors. If $k\in B$, $U,V$ lie on opposite sides, and the cross three-path lemma uses all three $A$ colors. Use the lemma with $x,z$ forbidden. The resulting three-path together with the edges in colors $i,j,k$ gives a six-cycle, a contradiction.

Hence for each bad vertex all its edges of palette $A$ to good vertices go to one side, and all its edges of palette $B$ to good vertices go to one side. These two sides are opposite: otherwise no color could join $z$ to a good vertex on the other side. Move each bad vertex, if necessary, to the side for which these two placements are correct. Every good–bad edge is correct in the new partition. Good vertices then have at most $D_0$ misplaced edges, and bad vertices at most $b$. The pointwise theorem applies, contradicting the assumption of no rainbow six-cycle.

## Consequence for cuts in every three-color union

A rainbow-free balanced coloring of sufficiently large order forces every three-color union $B$ to have edge expansion greater than $10^{-16}t$: for every nontrivial cut $X,Y$, its $B$ edges crossing the cut number more than $10^{-16}t\min(|X|,|Y|)$.

To see this, write $|X|=3t-d\le|Y|$ and let $e$ be the number of crossing edges in $B$. The internal $B$ degree bound gives $e\ge|X|(d+1)$. If $e\le a t|X|$, then $d+1\le at$ and $e\le3at^2$. The total of the two within-part edge capacities is $9t^2+d(d+1)$, and $B$ has exactly $9t^2+3t/2$ edges. The total misplaced count with $B$ designated as the within palette is therefore $2e+d(d+1)-3t/2\le(6a+a^2)t^2$. For $a=10^{-16}$ this is below the global stability threshold.

Check the [regression script](check_parity_cut.py) for the three-walk identity and planted defects; it does not assume that the exact asymptotic bounds are tight.

## The hypothesis is nonvacuous

For any even $t$, let $|X|=3t$ and $|Y|=3t+1$. Put all crossing edges except a matching saturating $X$ in the union palette $A$; add a perfect matching on the $3t$ matched vertices of $Y$ to $A$. Both $A$ and its complement $B$ are $3t$-regular with at most one misplaced edge at each vertex. Each union palette can be split into three spanning $t$-regular subgraphs. Indeed, any even-degree regular graph splits into 2-factors: orient Euler tours so in- and outdegrees agree, split the incidence into a regular bipartite graph of tails and heads, and repeatedly remove a perfect matching by Hall's theorem. Group the factors into three groups of $t/2$ factors each.

No result is claimed here when no suitable approximate parity cut exists. An important next step is whether a sequence of counterexamples must converge in edit distance to this structure, or whether a different type of obstruction exists.
