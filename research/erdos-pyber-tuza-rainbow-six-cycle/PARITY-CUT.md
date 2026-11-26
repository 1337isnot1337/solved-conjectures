# The parity cut forces rainbow six-cycles after a small pointwise perturbation

This is a partial result for the rainbow six-cycle clause of [Erdős #811](https://www.erdosproblems.com/811), not a solution for unrestricted balanced colorings. Unlike the [abelian result](README.md), it does not assume any transitivity or group structure.

**Theorem.** Let a six-edge-coloring of the complete graph on $6t+1$ vertices give every vertex exactly $t$ incident edges of each color, with $t\ge 2{,}000{,}000$. Partition the vertices into $X,Y$ and the colors into triples $A,B$. Call an edge misplaced if its color is in $A$ and it lies within a side, or if its color is in $B$ and it crosses. Suppose each vertex is incident to at most $D$ misplaced edges, where $(D+1)/t\le 10^{-6}$. Then every misplaced edge belongs to a rainbow six-cycle, and at least one such edge exists.

## A three-color walk identity

Write $P_i$ for a color-adjacency matrix divided by $t$, with the vertex set and admissible edges restricted to one of two kinds of blocks: the edges within a single part, colored with the three colors in $B$; or the edges between the two parts, colored with the three colors in $A$. In either block ignore the misplaced edges. Let $S=P_1+P_2+P_3$. Let $R$ be the sum of the six ordered products with three distinct factors. Expanding noncommutatively gives
```math
R=S^3-\sum_{i=1}^3(P_i^2S+P_i S P_i+S P_i^2)+2\sum_{i=1}^3P_i^3.
```
A triple of indices with exactly two equal is subtracted once, and an all-equal triple is subtracted three times and added back twice. In the exact uniform model with $S=3Q$ and $P_iQ=QP_i=Q^2$, where $Q$ is a normalized complete-block matrix, this reduces to $R=2\sum_iP_i^3$. This turns a rainbow path count into a monochromatic walk count.

## Robust form

All norm bounds below use the maximum absolute row sum. Both sides are nonempty, as each vertex has at least $3t-D$ correctly crossing edges. For a vertex in one part the total crossing degree differs from $3t$ by at most $D$: any discrepancy is the number of misplaced $B$ edges crossing minus the number of misplaced $A$ edges not crossing. Hence each part size lies in $[3t-D,3t+D]$.

Let $\eta=(D+1)/t$, and let $Q$ have entry $1/(3t)$ at every slot in the block, zero elsewhere, including the diagonal slots for a within-part block. The row norm of $Q$ is at most $2$, that of each $P_i$ at most $1$, and that of $S$ at most $3$. Since there are at most $D$ misplaced edges per row, and at most one absent loop in the within-part case, $\|S-3Q\|\le\eta$. Also
```math
\|P_iQ-Q^2\|,\ \|QP_i-Q^2\|\le 2\eta.
```
For the first bound, products have identical possible supports (the full within block, or the two same-side blocks in the bipartite case). Each supported entry of $P_iQ$ is $1/(3t)$ times a row degree divided by $t$, between $1-\eta$ and $1$. The corresponding entry of $Q^2$ is $1/(3t)$ times a part size divided by $3t$, within $\eta/3$ of one. The row contains at most $(3+\eta)t$ slots, so the row difference is at most $(4\eta/3)(1+\eta/3)\le2\eta$. The other bound follows by the same entrywise comparison using column degrees; the matrices are symmetric.

It follows by telescoping that $\|S^3-27Q^3\|\le (9+18+36)\eta=63\eta$. Each of $P_i^2Q,P_iQP_i,QP_i^2$ has distance at most $6\eta$ from $Q^3$ by the previous two product bounds and submultiplicativity. Replacing each appearance of $S$ in the nine mixed terms by $3Q$ incurs at most $\eta$ per term. Thus
```math
\left\|R-2\sum_iP_i^3\right\|\le 250\eta.
```

Let $U,V$ have sizes between $t-D$ and $t$; they lie in the one allowed part in the within-part case, and in opposite parts in the bipartite case. The allowed $U,V$ slots contain at least $(1-3\eta)t^2$ correctly colored edges, counted as ordered pairs, since at most $D+1$ slots per row are missing. One color has at least $e=t^2/4$ of those ordered pairs. Regard $U,V$ as disjoint labelled copies for counting even when they overlap. If the actual edge count is $e'\ge e$, at most $e'/4$ edges touch vertices of degree below $e'/(4|U|)$ on the first side and at most $e'/4$ touch vertices of degree below $e'/(4|V|)$ on the second. Sum the degree products over the remaining middle edges. There are at least $e'^3/(32|U||V|)\ge t^4/2048$ monochromatic three-walks alternating between the copies, in particular from $U$ to $V$. The row-norm error costs at most $250\eta t^4$ walks after undoing the normalization. Thus the number of rainbow three-walks between the two sets is at least $t^4/2048$ for $\eta\le 10^{-6}$.

Those walks have four listed vertices. If two of them coincide, or if any equals one of two prescribed vertices, fixing the equality leaves at most three free choices, each in a prescribed part of size at most $4t$. There are at most fourteen equalities to prohibit. Hence at most $960t^3$ walks are unusable for this reason. For $t\ge2{,}000{,}000$ this is strictly less than $t^4/2048$. There is a rainbow three-path, with endpoints in $U,V$, disjoint from the two prescribed vertices.

## Complete a misplaced edge

If the edge $xy$ has color in $A$ and lies within one side, choose the other two $A$ colors in either order. Let $U,V$ be the corresponding correctly crossing neighborhoods of $x,y$ in the opposite part. The three-path in the within-part block uses all three $B$ colors, and with the two chosen edges and $xy$ forms the cycle. If $xy$ has color in $B$ and crosses, use the neighborhoods of $x,y$ in their own parts in the other two $B$ colors, and the three-path in the cross block uses all three $A$ colors. The path avoids $x,y$ in either case. Finally, if there were no misplaced edges, the crossing degree condition would give $|X|=|Y|=3t$, contrary to order $6t+1$.

## The hypothesis is nonvacuous

For any even $t$, let $|X|=3t$ and $|Y|=3t+1$. Put all crossing edges except a matching saturating $X$ in the union palette $A$; add a perfect matching on the $3t$ matched vertices of $Y$ to $A$. Both $A$ and its complement $B$ are $3t$-regular with at most one misplaced edge at each vertex. Each union palette can be split into three spanning $t$-regular subgraphs. Indeed, any even-degree regular graph splits into 2-factors: orient Euler tours so in- and outdegrees agree, split the incidence into a regular bipartite graph of tails and heads, and repeatedly remove a perfect matching by Hall's theorem. Group the factors into three groups of $t/2$ factors each.

No result is claimed here when the partition does not exist, or when its exceptional vertices have high misplaced degree. An important next step is whether a counterexample must approximately exhibit such a partition at all.
