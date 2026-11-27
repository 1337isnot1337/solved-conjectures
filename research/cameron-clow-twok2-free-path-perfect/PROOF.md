# Cameron–Clow’s 2K₂-free path-perfect conjecture

Let $r(G)$ be the largest chromatic number of the subgraph induced by
the vertices of a simple path of $G$. A graph is path-perfect if
$r(H)=\chi(H)$ for each of its induced subgraphs $H$.
The 2K₂-free assertion of
[Cameron–Clow, Conjecture 7.3](https://arxiv.org/html/2506.19100v1#S7)
is false. So is their $P_5$-free Conjecture 7.4. An infinite family
has chromatic number exactly one more than its path chromatic span.

## Construction

Use $m\ge2$ groups of vertices with sizes $d_1,\ldots,d_m\ge2$.
Let $B$ be the clique consisting of these groups
$B_1,\ldots,B_m$, and put $D=|B|=\sum_j d_j$.
Make another clique $A=\{a_1,\ldots,a_m\}$. Join $a_j$ to every
vertex of $B$ except those in $B_j$.

A transversal $T$ chooses exactly one vertex from each $B_j$.
For every transversal add one vertex $x_T$. The set $X$ of all
such vertices is independent. Join $x_T$ to every vertex of
$A$ and to every vertex of $B\setminus T$, and to no other vertex.

## No induced pair of disjoint edges

An induced $2K_2$ inside $A\cup B$ must use exactly two vertices
from each clique, its two internal edges being the desired edges.
But two distinct vertices $a_i,a_j$ have no common nonneighbor
in $B$.

If exactly one vertex of a putative induced $2K_2$ lies in $X$,
write its edge as $x_Tu$. The two endpoints of the other edge
must both lie in $T$, and hence come from different groups.
A vertex $u$ in $B$ is adjacent to both of them. A vertex
$u=a_j$ is adjacent to at least one of them. Either is a
contradiction.

If exactly two vertices lie in $X$, their two partners must
lie in $A\cup B$. A partner in $A$ would also meet the other
vertex in $X$. If both partners lie in $B$, their own edge
is forbidden. Finally, three independent vertices cannot
lie in a $2K_2$. This proves the claim.

## Exact coloring and vertex criticality

In any proper $D$-coloring of $A\cup B$, the clique $B$
uses each color exactly once. The color of $a_j$ must equal
the color of some $b_j\in B_j$. Thus the coloring selects
the transversal $T=\{b_j:1\le j\le m\}$.
Every color occurs among the neighbors of $x_T$: a color
represented at a vertex of $T$ also appears on its corresponding
$a_j$; all other colors appear in $B\setminus T$.
Consequently $G$ is not $D$-colorable.

Conversely, choose any transversal $T$, assign distinct
colors to all vertices of $B$, and give $a_j$ the color of the
vertex of $T$ in its group. For any transversal $U\neq T$,
choose a vertex $b\in U\setminus T$ and give $x_U$ the color of
$b$. No vertex of $A$ uses that color and $x_U$ is not adjacent
to $b$, so this extends the coloring to $G-x_T$. Giving $x_T$
a new color proves $\chi(G)=D+1$.

In fact every vertex is critical. If $a_j$ is deleted, color
$B$ distinctly and match every remaining $a_i$ to a vertex of
its own group. Each $x_U$ can use the color of its vertex
of $U$ in $B_j$, a color not reused in $A$. If a vertex of $B$
is deleted, each group still has a vertex left. Color the
remaining $B$ vertices distinctly and give each $a_j$ a color
from its own group. This uses $D-1$ colors; give all of $X$ one
additional color. In all deletion cases the result is
$D$-colorable.

## Exact path span and the least forbidden induced path

A simple path contains at most $|A|+|B|+1$ vertices from the
independent set $X$: consecutive occurrences from $X$ require
distinct intervening vertices outside $X$. Hence if

```math
\prod_{j=1}^{m}d_j > m+D+1 ,
```

every path misses some $x_T$, and its induced subgraph is
$D$-colorable by the preceding deletion coloring. The clique
$B$ has a spanning path, so $r(G)=D<\chi(G)$. This holds for
all $d_j=2$ and $m\ge4$, since $2^m>3m+1$ in that range.
It also gives a $k$-vertex-critical example for every $k\ge8$:
take two group sizes $3$ and $k-4$, so $D=k-1$ and
$3(k-4)>k+2$. In particular sizes $3$ and $4$ give a graph on
21 vertices with $\chi(G)=8$ and $r(G)=7$.

The graph $P_5$ contains an induced $2K_2$ on the endpoints of
its first and last edges, so our graph is $P_5$-free.
This refutes Conjecture 7.4. The authors' Theorem 1.5 proves all
$P_4$-free graphs path-perfect, and a graph that is $P_t$-free
for smaller $t$ is also $P_4$-free. Therefore the answer to the
forbidden-path question following Conjecture 7.4 is exactly
$t=5$. The separate co-diamond assertion in Conjecture 7.3 is
addressed [in its own repository result](https://github.com/1337isnot1337/solved-conjectures/pull/1004).
Neither the unrestricted Erdős–Hajnal question nor the fixed
path-span-three conjecture follows from this construction.
