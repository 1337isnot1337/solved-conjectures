# Interpolation for highly unbalanced complete bipartite graphs

**Theorem.** If $r\ge s\ge2$ and $r\ge\max(4,2s^2-8)$, the general position spectrum of $K_{r,s}$ is an interval. This is a partial result for the unrestricted [spectrum conjecture](README.md), allowing the smaller part $s$ to grow arbitrarily.

## Redundant profiles of a twin class

The following source of safe moves applies in any undirected graph. Let $X$ be an independent twin class of size $r$, each of whose vertices has precisely the same neighborhood $Y$ of size $s$. In an orientation, the **profile** of an $X$ vertex records which edges to $Y$ point out. For each ordered pair $y,z\in Y$ with $y\ne z$ for which there is a directed two-step path $y\to x\to z$ through $X$, mark one witness vertex $x$. There are at most $s(s-1)$ marked vertices. If no witness is marked, mark any one vertex, as $s\ge2$. Fix a marked profile $P$.

One at a time, change each unmarked vertex's profile to $P$, leaving all other arcs intact. In any step changing $x$, distances among vertices different from $x$ are unchanged from the orientation with $x$ deleted, both before and after the change. Indeed, a shortest path between other vertices using $x$ has a passage $y\to x\to z$ for distinct vertices of $Y$. Before the change the same two-step passage exists via a marked witness; after the change it also exists via a marked vertex of profile $P$. Replacing the passage produces a directed walk of equal length avoiding $x$. A directed walk gives a path of at most the same length, proving both distance equalities. Consequently the two general position numbers differ by at most one: their common metric on the other vertices has an unchanged maximum, and each full orientation is between that maximum and one more.

At the end at least $r-s(s-1)+1$ vertices have identical profile. They are in general position. To see this, if a directed path between two such vertices contained a third one, the successor of the middle twin is also an out-neighbor of the starting twin, yielding a strict shortcut. (If any relevant directed paths do not exist, they cannot witness collinearity.)

Starting from an orientation having the unrestricted minimum, this gives every integer between that minimum and $r-s(s-1)+1$ whenever this interval is nonempty. The argument preserves directed distances in the rest of the graph, regardless of how that rest is oriented.

## An explicit upper band for $K_{r,s}$

Let $r\ge4$, and initially work in $K_{r,2}$ with the smaller side $\{y,z\}$. For any integer $a$ from $\lceil r/2\rceil$ to $r-1$, partition the large side into $U,V$ of sizes $a,r-a$. Orient the edges as $y\to U\to z\to V\to y$. This is the blow-up of a directed four-cycle with the $y,z$ classes singletons. Any three vertices from three different parts lie on a directed geodesic in their cyclic order. Also, between two distinct vertices in the same part the shortest directed path goes once around the cycle, and can pass through any fixed vertex of another part. Thus any general-position set of size at least three is contained in one part, and the number is exactly $a$, attained entirely on the large side. Attach the other $s-2$ small-side vertices as sinks receiving an arc from every large-side vertex. They do not alter the old distances; attaching them to $U$ introduces no collinear triple because all its arcs to the new sinks have length one. The result has general position number exactly $a+s-2$.

To obtain $r+s-2$, orient the arcs of $K_{r,2}$ from at least two large-side sources through $y,z$ to at least two large-side sinks. The large side is in general position, and removing any one vertex leaves a source, a sink, and one of $y,z$, whose directed length-two geodesic forces a collinear triple. Thus its number is $r$. Add $s-2$ extra small-side sinks as above and include them with the whole large side.

To obtain $r+s-1$, orient the whole graph from $s-1$ small-side sources through the large side to one small-side sink. The whole vertex set is not in general position but deleting the sink leaves a general-position set. The value $r+s$ is attained by a one-way bipartite orientation. This proves that the entire interval $[\lceil r/2\rceil+s-2,r+s]$ is covered.

The two ranges cannot leave a gap when
```math
r-s(s-1)+1\ge \lceil r/2\rceil+s-3,
```
equivalently $\lfloor r/2\rfloor\ge s^2-4$. This proves the theorem.

## Scope and sources

The cyclic two-small-side construction is already in [Theorem 4.28 of the conjecture source](https://arxiv.org/html/2604.15909v1). The source also determines the balanced case $r=s$, and its survey lists the remaining complete bipartite spectra as open. The new part here is the safe-move compression with at most $s(s-1)$ directed two-step witnesses, and its uniform consequence for all sufficiently unbalanced bipartite graphs. This does not determine an explicit formula for the lower endpoint and does not cover every unbalanced pair.
