# Erdős–Hajnal conjecture

**Status (2026-11-24).** The general conjecture remains open in this
investigation. The checkpoint gives a general sufficient condition for the
mixed-block hypothesis in the Huang–Ju–Zhou reduction. It applies to all
radius-two trees. It also identifies and proves an obstruction to using
endpoint-rooted path purification for their combs. These are written partial
results with no external review, Lean verification, or priority claim.
[Tracking issue #332](https://github.com/1337isnot1337/solved-conjectures/issues/332).

## Target and source check

For every fixed finite simple graph $H$, the conjecture asks for $c(H)>0$
such that every induced-$`H`$-free graph on $n\ge 1$ vertices has a clique
or independent set of size at least $n^{c(H)}$. This would improve
the general subpolynomial lower bound to a polynomial lower bound
for every fixed forbidden induced graph.
[Erdős–Hajnal, 1977](https://www.renyi.hu/~p_erdos/1977-19.pdf),
[Erdős–Hajnal, 1989](https://users.renyi.hu/~p_erdos/1989-24.pdf).

The 2026-11-24 search used the conjecture's standard name, its hereditary
class formulation, and the exact induced-subgraph quantifier. It located
no general resolution. Nguyen and Huang–Zhou–Zhou independently prove
the result for every path. Nguyen also handles the subdivided stars
with three arms of lengths $1,2,t$ and several nearby graphs.
The published scope of each route matters because the present
investigation uses radius-two trees with arbitrarily many length-two arms.
[Nguyen, Theorems 1.2–1.3](https://arxiv.org/abs/2610.24887),
[Huang–Zhou–Zhou, Theorem 1.1 and independent-work note](https://arxiv.org/abs/2611.01963).

Huang–Ju–Zhou's reduction separates three requirements called
leaf-reducibility, wonderfulness, and generalized niceness.
Huang–Zhou–Zhou prove wonderfulness for paths using an auxiliary
two-labeled lift. We use a subset of the mandatory lift edges
to establish a different sufficient condition. The proof below
follows their mixed-block counting argument.
[Huang–Ju–Zhou, Lemma 1.12](https://arxiv.org/abs/2606.06258v3),
[Huang–Zhou–Zhou, Definition 2.8 and Lemma 3.5](https://arxiv.org/html/2611.01963v1).

## The mixed-block hypothesis

Call a graph $y^4$-restricted if it or its complement has maximum
degree at most $y^4$ times its order. The following proposition
proves the property called wonderfulness, even without requiring
the blocks to be anticonnected.

**Proposition.** Let $H$ have a vertex $v_0$ whose nonneighbors other than
$v_0$ form an independent set. Assume $H-v_0$ has the Erdős–Hajnal property
with exponent $c>0$. There is $a\ge 6$ with the following property for
every $0<y<1/2$. Let $G$ be induced-$`\overline H`$-free and let
$B_1,\ldots,B_\ell$ be pairwise disjoint blocks, all of the same
positive size $W$, with $\ell\ge y^{-a}$. For each pair of blocks
assume that they are complete to each other or each vertex of either
block has at most $y^aW$ neighbors in the other. Then one of the
following holds.

- There is a $y^4$-restricted induced subgraph of $G$ of order at least $W$.
- Some block has at most $y|G|$ outside vertices $u$ with
  $0<|N_G(u)\cap B_i|<W/2$, where outside means outside the union of all blocks.

Assume first that $q=|H-v_0|\ge1$ and take
$a=\max(6,2q,2+5/c)$. For any outside vertex $u$, let $I(u)$
consist of the indices for which it satisfies the last degree condition.
If every $|I(u)|\le y\ell$, double counting gives the second conclusion.
Otherwise fix $u$ with $|I(u)|>y\ell$. Form the graph $Q$ on $I(u)$
with an edge for each pair of blocks that is not complete.

We claim $Q$ is induced-$`(H-v_0)`$-free. Given an induced copy of $H-v_0$
in $Q$, assign one block to each of its vertices. First, for every
nonneighbor of $v_0$ in $H-v_0$, choose a representative in the assigned
block adjacent to $u$ in $G$. Their blocks are pairwise complete in $G$
because those vertices are independent in $H$. Now, for each neighbor
of $v_0$ in $H-v_0$, choose a representative from the nonneighbors of
$u$ in its block, a set larger than $W/2$. For each already chosen
representative whose target vertex is adjacent in $H$ to the current
one, avoid its at most $y^aW$ neighbors in the assigned block. The
total forbidden count is at most $(q-1)y^aW\lt W/2$. All target
nonedges are enforced by complete block pairs in $G$. Thus the
chosen vertices together with $u$ induce $H$ in $\overline G$,
with $u$ representing $v_0$. This proves the claim. It is the direct
transversal version of using the mandatory edges in a two-labeled lift.

By the Erdős–Hajnal property, $Q$ has a clique or independent set of
size $r\ge |I(u)|^c\ge (y\ell)^c$. If it is a clique, the union of its
blocks has maximum degree in $G$ at most $(1/r+y^a)$ times its order.
If it is independent, the union has maximum degree in $\overline G$
at most $1/r$ times its order. The choice of $a$ gives
$1/r+y^a\le y^{c(a-1)}+y^a\le 2y^5\le y^4$. Either union
has size at least $W$. If $H=K_1$, no nonempty admissible $G$ exists.

A tree of radius at most two satisfies the hypotheses. Choose a center
as $v_0$. Its nonneighbors are distance-two leaves and hence independent.
Deleting the center leaves disjoint stars. Stars and disjoint unions of
stars have the Erdős–Hajnal property by the Alon–Pach–Solymosi
substitution theorem, starting from singletons and the two graphs on
two vertices. For the star with three length-two arms, deleting
the end of one arm gives the E-graph, so leaf-reducibility follows from
Huang–Ju–Zhou. Generalized niceness is still needed for the reduction
to conclude the Erdős–Hajnal property for that target.
[Alon–Pach–Solymosi, Theorem 1.1](https://doi.org/10.1007/s004930100016),
[Huang–Ju–Zhou](https://arxiv.org/abs/2606.06258v3).

## The missing rooted pattern in a comb

For $h\ge3$, let $S_h$ be a star in which each of its $h$ edges has
been subdivided once. Fix an induced-$`S_h`$-free graph $K$ and work in
$G=\overline K$. Take a comb in $G$ with teeth $B_i$, apices $a_i$,
and special vertex $s$ in the sense of Huang–Zhou–Zhou. Equivalently,
in $K$, $a_i$ is anticomplete to $B_i$ and complete to every
other tooth, while $s$ is adjacent to all apices and anticomplete
to all teeth. Edges between apices and edges within and between
the teeth can otherwise vary.

Fix $i$ and $u$ in a different tooth. The path $u,a_i,s$
is an induced length-two arm from $u$ with its last two vertices
anticomplete to $B_i$. If there were an induced $S_{h-1}$ in
$`\{u\}\cup B_i`$ centered at $u$, it would extend to an induced
$S_h$ in $K$. This gives the exact rooted obstruction supplied
by a comb. For $h=3$ the missing pattern is a five-vertex path
rooted at its **middle**. In the all-path proof the analogous
argument uses paths rooted at an **endpoint**.
[Huang–Zhou–Zhou, Lemma 6.2](https://arxiv.org/html/2611.01963v1).

There is an elementary characterization for $h=3$. For a root $u$
and a tooth $Y$, partition $Y$ into $A=N_K(u)\cap Y$ and
$C=Y\setminus A$. For $a,a'\in A$ adjacent in $G$, set

```math
L=(N_G(a)\setminus N_G(a'))\cap C,\qquad
R=(N_G(a')\setminus N_G(a))\cap C.
```

There is no induced $P_5$ centered at $u$ inside
$`\{u\}\cup Y`$ exactly when every such $L,R$ is anticomplete in $G$.
If $l\in L$ and $r\in R$ are adjacent in $G$, then
$r,a,u,a',l$ is the induced path in $K$. Conversely the two
neighbors of a centered path must lie in $A$ and the two
endpoints in $C$. Its four nonroot vertices give precisely
such an edge between $L$ and $R$. In particular, either
an eligible pair has a large anticomplete pair of differences,
or all its differences are nested up to the size that would
already give the desired anticomplete pair. Converting this
condition across many roots into polynomial-width blockades
is the unresolved quantitative step.

## Endpoint-rooted paths can still be arbitrarily long

The comb hypotheses cannot supply the endpoint-rooted path
exclusion for any fixed order. Here is an explicit family that
also verifies this distinction for arbitrarily long and wide
combs. Work in the complement $K$ and fix a comb length
$\ell\ge2$ and a path order $m\ge2$.

- The first tooth is the path $p_1,\ldots,p_m$ and each other
  tooth is a single vertex $u_j$ with $2\le j\le\ell$.
- All apices form a clique. Their adjacencies to the teeth and
  special vertex $s$ are exactly those required above.
- The only edge between distinct teeth is $u_2p_1$.

This graph has no induced $S_3$. The special vertex and each
$u_j$ have no independent triple in their neighborhoods.
At a path vertex, the path neighbors are each adjacent to
every apex that is also adjacent to that vertex. The eligible
apices form a clique. At $p_1$ the extra neighbor $u_2$ can
contribute to an independent neighborhood set of size at
most two because it occurs where only one path neighbor exists.
There is therefore no independent triple at any path vertex.
For an apex $a_j$ with $j\ge2$, its nonneighbors consist of
just its own tooth, so it cannot have three distinct
second-level leaves. At $a_1$, all second-level leaves would
have to lie on the path tooth. Its neighbors that can attach
to that tooth are the other apices and $u_2$, which supply
at most two pairwise nonadjacent first-level vertices. This
exhausts potential centers. Since every $S_h$ with $h\ge3$
contains $S_3$, the same bound applies to every $h$.

In this graph $u_2,p_1,\ldots,p_m$ is an induced path rooted
at $u_2$ into the first tooth. Replace each tooth vertex by a
clique of any desired common size and preserve every adjacency
between the corresponding fibers. This preserves induced-$`S_3`$-
freeness because an induced tree on at least three vertices
cannot take two vertices from a clique fiber. If it did, any
neighbor outside the fiber would make a triangle, and when
there is no such neighbor the chosen vertices would disconnect
the tree. The induced rooted path persists by taking one
vertex per relevant fiber, and the comb width grows without
bound. One can also make $G$ arbitrarily sparse in maximum
degree relative to its order by adjoining isolated vertices in
$G$. These are universal vertices in $K$, and no universal
vertex can belong to an induced $S_3$.

The construction addresses an attempted direct use of
endpoint-rooted purification. It leaves open a separate
purification for the centered pattern, a different comb
argument, and the full conjecture.
