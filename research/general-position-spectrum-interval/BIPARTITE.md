# Interpolation for highly unbalanced complete bipartite graphs

**Theorem.** Let $W_s=\max(2s-2,\lfloor s^2/4\rfloor)$. If $r\ge s\ge2$ and $r\ge\max(4,W_s+s-2)$, the general position spectrum of $K_{r,s}$ is an interval. This is a partial result for the unrestricted [spectrum conjecture](README.md), allowing the smaller part $s$ to grow arbitrarily.

## Redundant profiles of a twin class

The following source of safe moves applies in any undirected graph. Let $X$ be an independent twin class of size $r$, each of whose vertices has precisely the same neighborhood $Y$ of size $s$. In an orientation, the **profile** of an $X$ vertex records which edges to $Y$ point out. For each ordered pair $y,z\in Y$ with $y\ne z$ for which there is a directed two-step path $y\to x\to z$ through $X$, mark one witness vertex $x$. There are at most $s(s-1)$ marked vertices. If no witness is marked, mark any one vertex, as $s\ge2$. Fix a marked profile $P$.

One at a time, change each unmarked vertex's profile to $P$, leaving all other arcs intact. In any step changing $x$, distances among vertices different from $x$ are unchanged from the orientation with $x$ deleted, both before and after the change. Indeed, a shortest path between other vertices using $x$ has a passage $y\to x\to z$ for distinct vertices of $Y$. Before the change the same two-step passage exists via a marked witness; after the change it also exists via a marked vertex of profile $P$. Replacing the passage produces a directed walk of equal length avoiding $x$. A directed walk gives a path of at most the same length, proving both distance equalities. Consequently the two general position numbers differ by at most one: their common metric on the other vertices has an unchanged maximum, and each full orientation is between that maximum and one more.

At the end at least $r-s(s-1)+1$ vertices have identical profile. They are in general position. To see this, if a directed path between two such vertices contained a third one, the successor of the middle twin is also an out-neighbor of the starting twin, yielding a strict shortcut. (If any relevant directed paths do not exist, they cannot witness collinearity.)

Starting from an orientation having the unrestricted minimum, this gives every integer between that minimum and $r-s(s-1)+1$ whenever this interval is nonempty. The argument preserves directed distances in the rest of the graph, regardless of how that rest is oriented.

## An explicit upper band for $K_{r,s}$

Let $r\ge4$, and initially work in $K_{r,2}$ with the smaller side $\{y,z\}$. For any integer $a$ from $\lceil r/2\rceil$ to $r-1$, partition the large side into $U,V$ of sizes $a,r-a$. Orient the edges as $y\to U\to z\to V\to y$. This is the blow-up of a directed four-cycle with the $y,z$ classes singletons. Any three vertices from three different parts lie on a directed geodesic in their cyclic order. Also, between two distinct vertices in the same part the shortest directed path goes once around the cycle, and can pass through any fixed vertex of another part. Thus any general-position set of size at least three is contained in one part, and the number is exactly $a$, attained entirely on the large side. Attach the other $s-2$ small-side vertices as sinks receiving an arc from every large-side vertex. They do not alter the old distances; attaching them to $U$ introduces no collinear triple because all its arcs to the new sinks have length one. The result has general position number exactly $a+s-2$.

To obtain $r+s-2$, orient the arcs of $K_{r,2}$ from at least two large-side sources through $y,z$ to at least two large-side sinks. The large side is in general position, and removing any one vertex leaves a source, a sink, and one of $y,z$, whose directed length-two geodesic forces a collinear triple. Thus its number is $r$. Add $s-2$ extra small-side sinks as above and include them with the whole large side.

To obtain $r+s-1$, orient the whole graph from $s-1$ small-side sources through the large side to one small-side sink. The whole vertex set is not in general position but deleting the sink leaves a general-position set. The value $r+s$ is attained by a one-way bipartite orientation. This proves that the entire interval $[\lceil r/2\rceil+s-2,r+s]$ is covered.

## Sharpening the witness count

Take an inclusion-minimal set of marked vertices preserving the existence of every ordered two-step passage between distinct points of $Y$. For each marked vertex $x$, choose one passage $y_x\to x\to z_x$ which no other marked vertex witnesses. The selected ordered pairs are distinct. Form a digraph $F$ on $Y$ with one arc $y_x\to z_x$ for each marked vertex. For a fixed $x$, its selected arc crosses from outside its out-neighborhood profile to inside it, but no other selected arc does (by uniqueness of each other witness). Therefore deleting this arc destroys reachability from $y_x$ to $z_x$ in $F$: any alternate directed path would need another crossing. This holds for every arc.

If $F$ has $c$ strong components, its within-component arcs number at most $2(s-c)$. In a component of order $q$, a union of an in-arborescence and an out-arborescence with common root already gives strong connectivity with at most $2q-2$ arcs; an extra arc would not be essential. Between any two strong components there is at most one arc, and no arc can have an alternate directed path through other components. Thus the condensation DAG has no transitive triangle; its underlying triangle-free graph has at most $\lfloor c^2/4\rfloor$ edges by Mantel's theorem. Altogether the number of marked vertices is at most
```math
2(s-c)+\lfloor c^2/4\rfloor\le W_s,
```
where the last inequality follows by maximizing the convex quadratic before rounding at $c=1,s$. If no markings are required, one arbitrary vertex is enough. The lower band obtained from the minimum therefore extends up to $r-W_s+1$.

## Sharpening the explicit upper band

For an auxiliary $K_{r,\ell}$, use $\ell\ge2$ nonempty large-side groups $X_i$ and small-side vertices $y_i$. Orient $x\to y_i$ exactly for $x\in X_i$, and $y_j\to x$ for $x\in X_i$, $j\ne i$. Its general position number is
```math
\max\bigl(\ell,\max_i |X_i|\bigr).
```
In fact, a geodesic of length four between two clones in $X_i$ can pass through any other vertex not in $X_i$: the routes are $x,y_i,x_j,y_j,x'$ for $j\ne i$. Thus a general-position set containing two clones has no other profile or small-side vertex. Otherwise it contains at most one large-side vertex from each group. If it uses both one vertex of $X_i$ and $y_i$, it cannot contain any vertex of another index: for $j\ne i$, the geodesic from $x_i$ to $y_j$ passes through $y_i$, and the geodesic from $x_j$ to $y_i$ passes through $x_i$. Consequently any set with no repeated group has size at most $\ell$. This is attained by the small side alone (its distances between distinct vertices are all two); the largest twin class also gives its stated lower bound.

If $r\ge 2s-1$, for each $2\le\ell\le s$ we can arrange group sizes with any maximum $a$ between $\max(\ell,\lceil r/\ell\rceil)$ and $r-\ell+1$. The score $a$ is attained wholly in the largest large-side group, and adding $s-\ell$ small-side sinks, as before, gives a score of $a+s-\ell$. Thus for each $\ell$ we attain the interval
```math
[\,\max(\ell,\lceil r/\ell\rceil)+s-\ell,\quad r+s-2\ell+1\,].
```
For $\ell\ge3$ its upper endpoint is at least the lower endpoint minus one of the interval for $\ell-1$, since $r-\ell+1\ge\max(\ell-1,\lceil r/(\ell-1)\rceil)$ when $r\ge2\ell-1$. For $\ell=2$ its top is $r+s-3$, and the three highest values were constructed above. This covers $[\max(s,\lceil r/s\rceil),r+s]$.

Set $r_0=\max(4,W_s+s-2)$. We have $r_0\ge 2s-1$ and $r_0\le s^2$, so the upper band starts at $s$ when $r=r_0$, and the lower band reaches at least $s-1$. Increasing $r$ by one increases the lower-band endpoint by one and increases the upper-band starting point by at most one. The bands therefore leave no gap for every $r\ge r_0$, proving the theorem.

## Scope and sources

The cyclic two-small-side construction is already in [Theorem 4.28 of the conjecture source](https://arxiv.org/html/2604.15909v1). The source also determines the balanced case $r=s$, and its survey lists the remaining complete bipartite spectra as open. The new ingredients are the safe-move compression by directed two-step witnesses, its quadratic bound by an essential-arc digraph, and the interval of explicit singleton-profile orientations. This does not determine an explicit formula for the lower endpoint and does not cover every unbalanced pair.

## A complementary band from the imbalance

Every $K_{s+d,s}$ with $d\ge1$ and $s\ge2$ also attains every value in $[d+1,2s+d]$. In particular, $K_{s+1,s}$ is full, and $K_{s+2,s}$ has an interval spectrum: the latter attains everything from three up, and two is the only possible missing lower value.

Here is a block argument. Start with $k$ blocks each containing two vertices of each side, each oriented as a directed four-cycle; orient all existing cross-block arcs from earlier to later blocks. The last block contains the remaining $a=b+d$ large-side and $b=s-2k$ small-side vertices, where $b\ge1$. Each block is isometric because directed paths cannot leave and return. Select both large-side vertices of each early block; the last block will have a maximum general-position set consisting of large-side vertices and possibly some small-side sinks. These sets unite to give a general-position set. An earlier selected $x$ can reach a later selected large-side vertex in two edges through its own block, with no direct adjacency, and its distance to a later selected small-side vertex is one. The only possible internal vertex of a cross-block geodesic between selected vertices would thus be on the small side, but the only selected ones are sinks. So the sum of the block maxima is attained, and by isometry it is also an upper bound.

For the last block we can choose these scores:

- **$d+1$:** orient a $K_{b+1,b}$ subgraph by its spanning Hamilton geodesic, and add the other $d-1$ large-side vertices as sources to the small side. These sources do not change old distances. Each directed distance from a new source to an old large-side vertex is two if finite (test whether that old vertex has an in-neighbor), and no reverse path exists. Thus the new sources and any two old large-side vertices are in general position. Deleting the new sources bounds the score above by $2+d-1$.
- **$d+2$ when $b\ge2$:** use instead a Hamilton geodesic on $K_{b,b}$ and add the other $d$ large-side vertices as sources. The same proof applies.
- **$a+b$ or $a+b-1$:** orient all arcs from the large side to the small side for the first score. For the second score when $b\ge2$, make one small-side vertex a source, and all other small-side vertices sinks; the whole set is not in general position, while deleting the source leaves a general-position set. When $b=1$, orient some large-side edges into the one small-side vertex and some out, and use the whole large side; precisely one vertex must be deleted.

The first two choices, with $k\le\lfloor(s-1)/2\rfloor$ and $k\le\lfloor(s-2)/2\rfloor$ respectively, give all values from $d+1$ through $d+s$. The last two choices give all values from $d+s$ upward when $s$ is odd, and from $d+s+1$ upward when $s$ is even. The intervals therefore meet or abut. This proves the asserted band. This argument is an additional analytical subcase, not a claim that every imbalance is solved.

## The whole range $s\le r\le 2s$

The interval conjecture holds for every complete bipartite graph with $2\le s\le r\le2s$. To see what fills the gap between the preceding bands, orient a balanced $K_{s,s}$ by a spanning directed geodesic, then replace each large-side vertex by a nonempty independent class of identical directed twins. When $r\le2s$ the classes can all have size at most two. No general-position set can meet three types: project to the original balanced graph, where their three representatives lie on the spanning geodesic, and lift that subpath with the chosen three endpoints/middle. A shortest subpath remains shortest after the replacement because every path projects to a walk. This orientation therefore has general position number at most four.

Move excess large-side vertices one by one into a single class, always leaving at least one representative of every class. At each step, removing the moved vertex leaves the same metric on all the other vertices both before and after, because there is a remaining twin of both the old and new profiles. Thus the general position number changes by at most one. At the end the large class has $r-s+1$ vertices, giving at least that value. When $r-s\ge3$, the orientations therefore attain four and all values through $r-s+1$; the imbalance band above covers everything higher. By the [exact number-two classification](BIPARTITE-TWO.md), the minimum is at least three in this case. If it equals three, that sole remaining lower value is attained by definition. Imbalance zero is the balanced result of the source, and imbalances one and two were already handled.

More generally the same clone path yields an upper interval starting at most at $\min(2\lceil r/s\rceil,r-s+1)$ for any $r>s$: initially all clone sizes can be at most $\lceil r/s\rceil$, and at most two types occur in a general-position set. This does not determine the minimum beyond the proved ranges.
