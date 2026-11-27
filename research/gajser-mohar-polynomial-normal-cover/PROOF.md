# Gajser–Mohar’s polynomial normal-cover conjecture

A normal cover of a finite simple graph is a pair of families
$`\mathcal C,\mathcal S`$, where $`\mathcal C`$ covers the vertices by
cliques, $`\mathcal S`$ covers the vertices by stable sets, and every
member of $`\mathcal C`$ meets every member of $`\mathcal S`$. Let $`N(c,s)`$
be the largest order of a graph admitting such a cover with each
clique of size at most $`c`$ and each stable set of size at most $`s`$.

The last paragraph of §4 of [Gajser and Mohar, *Minimal Normal Graph
Covers*](https://arxiv.org/pdf/1601.01129#page=15) asks whether, for
every fixed positive integer $`c`$, the function $`N(c,s)`$ is bounded
above by a polynomial in $`s`$. **Yes. The optimal degree is $`c`$.**
More precisely, for all positive integers $`c,s`$,

```math
N(c,s)\le s+s^2+\cdots+s^c.
```

If $`s\ge c+1`$ and $`b=\lfloor(s-1)/c\rfloor+1`$, then

```math
N(c,s)\ge b+b^2+\cdots+b^c.
```

Thus $`N(c,s)=\Theta_c(s^c)`$ as $`s`$ tends to infinity with $`c`$ fixed.
This does not determine the two-parameter extremal function or the
sharp leading constant for fixed $`c`$.

## Upper bound: split the clique family at one stable set

Fix any member $`S_0`$ of $`\mathcal S`$. Each clique $`C`$ of
$`\mathcal C`$ meets $`S_0`$ in exactly one vertex: a stable set cannot
contain two vertices of a clique. For $`v\in S_0`$, put

```math
X_v=\bigcup_{C\in\mathcal C:\ v\in C}(C\setminus\{v\}).
```

Every vertex outside $`S_0`$ belongs to at least one $`X_v`$,
because it is covered by some clique.

For nonempty $`X_v`$, the induced graph on $`X_v`$ has a normal cover:

1. Use the cliques $`C\setminus\{v\}`$ for members $`C`$ of
   $`\mathcal C`$ containing $`v`$, with empty sets omitted.
2. Use $`S\cap X_v`$ for members $`S`$ of $`\mathcal S`$ not containing $`v`$.

The first family covers by definition. The second covers since every
vertex of $`X_v`$ is adjacent to $`v`$, so no stable set containing such
a vertex contains $`v`$. Every listed stable set meets every listed
clique: its original intersection with $`C`$ is a vertex different
from $`v`$, and that vertex belongs to $`X_v`$. In particular these
restricted stable sets are nonempty. The size bounds are $`c-1`$
and $`s`$.

For $`c=1`$, no information about the edge set is needed: the singleton cliques
cover every vertex, so every member of $`\mathcal S`$ must contain
every vertex. Hence $`N(1,s)=s`$, attained by the edgeless graph.
For $`c>1`$, the induced covers just constructed and the union bound
give

```math
|V(G)|\le |S_0|+\sum_{v\in S_0}|X_v|
\le s(1+N(c-1,s)).
```

The first inequality need not be equality; overlap among the $`X_v`$
only makes the bound stronger. Induction on $`c`$ gives the upper bound
and also proves finiteness without the original exponential bound.

## Lower bound: a prefix tree

The construction below extends the binary-prefix construction in
Gajser and Mohar, Proposition 2.1. The original keeps only one
final child at each depth-(c−1) vertex; here we retain all final
children and vary the branching. Take the rooted $`b`$-ary tree of depth $`c`$ and use its nonroot nodes
as vertices. Two nodes are adjacent exactly when one is an
ancestor of the other. The clique cover consists of all full
root-to-leaf paths, with the root removed. Each has $`c`$ vertices.

For each path from the root to depth $`c-1`$, form a stable set:
at every step include all children of the current path vertex
except the child used to continue the path, and at the final
vertex include all $`b`$ children. Distinct chosen vertices are
incomparable in the ancestor order: any earlier off-path branch
does not contain any later chosen vertex, and children of the
same parent are incomparable. Thus these are stable sets, each
of size $`(c-1)(b-1)+b=c(b-1)+1\le s`$.

They cover every node. A node at depth less than $`c`$ can be selected
by following its ancestors and continuing through a different child
of its parent; $`b\ge 2`$ ensures such a child. A node at depth $`c`$
is selected by the path ending at its parent. Each full
root-to-leaf path meets every such stable set exactly once: use
the first step at which it differs from the stable set's defining
path, or the final child if there is no difference before then.
This is the required normal cover, with $`b+\cdots+b^c`$ vertices.

The tree gives the polynomial lower bound for every fixed $`c`$,
not just the small parameters explicitly treated in the original
paper.

## A second upper bound: disjoint permutation events

For each vertex $`v`$, choose a covering clique $`C_v`$ and
a covering stable set $`S_v`$ that both contain it. In a
uniform random ordering of all vertices, consider the event
that every other vertex of $`C_v`$ precedes $`v`$ and every
other vertex of $`S_v`$ follows $`v`$. These events are
pairwise disjoint. In fact, if the events for distinct
$`u,v`$ both held, a vertex in $`C_u\cap S_v`$ would put
$`v`$ at or before $`u`$ in the ordering, while a vertex
in $`C_v\cap S_u`$ would put $`u`$ at or before $`v`$.
This is impossible in a total order. This argument explicitly
allows either intersection vertex to be one of the pivots.

Each chosen pair meets only in its pivot. If its sizes are
$`a_v=|C_v|`$ and $`b_v=|S_v|`$, the probability of the
event is $`(a_v-1)!(b_v-1)!/(a_v+b_v-1)!`$. Summing gives
the weighted inequality

```math
\sum_{v\in V(G)}
\frac{(a_v-1)!(b_v-1)!}{(a_v+b_v-1)!}\le 1.
```

The reciprocal of an individual probability increases with
either size, so this yields a second uniform bound

```math
N(c,s)\le \frac{(c+s-1)!}{(c-1)!(s-1)!}.
```

This also gives degree $`c`$ for fixed $`c`$, independently
of the recursive decomposition. It refines the upper leading
constant to $`1/(c-1)!`$ for fixed $`c`$, without asserting
that the constant is sharp. The permutation method is in the
spirit of Bollobás's set-pair inequality, but the chosen
clique and stable set meet at their pivot and are not an
ordinary disjoint pair.

The weighted argument also applies to arbitrary cross-intersecting
set families if every point is the singleton intersection of some
chosen pair. Other intersections in those families need not be singletons.
