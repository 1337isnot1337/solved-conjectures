# Cameron–Clow’s independence-four path-perfect conjecture

Every graph with independence number at most four is path-perfect.
This answers [Cameron–Clow, Problem 7.2](https://arxiv.org/html/2506.19100v1#S7)
affirmatively. Four is the exact universal threshold: an earlier
13-vertex nontraceable critical graph has independence number five.

## Two-vertex cuts in a vertex-critical graph

Let $H$ be vertex-critical, with chromatic number $k$ and at least
three vertices. It is connected: the largest chromatic number of
a component is the chromatic number of the union. It has no cut
vertex. Otherwise each side together with the cut vertex would
be a proper induced subgraph, and we could permute the names of
its $k-1$ colors to agree at the shared vertex. This would give
a $(k-1)$-coloring of the whole graph.

If $`\{x,y\}`$ is a vertex cut, write $Q_1,\ldots,Q_s$ for the
components of $`H-\{x,y\}`$. Each induced graph
$`H[Q_i\cup\{x,y\}]`$ admits a $(k-1)$-coloring. A color
permutation can make two such colorings agree on the cut
if and only if both colorings give the same relation between
the colors on $x$ and $y$: equal or different.

For each $i$, record the nonempty subset of these two relations
that is possible on its side. If there is a relation allowed
on every side, the colorings glue to a $(k-1)$-coloring of $H$.
Thus the intersection is empty. The only way nonempty subsets
of a two-element set have empty intersection is that one subset
is the equal singleton and a second is the different singleton.
The induced union of those two sides with $`\{x,y\}`$ has no
$(k-1)$-coloring. By vertex criticality it cannot be proper, so
$s=2$. This is the standard two-cut argument of Dirac, included
here to cover the vertex-critical convention directly.

## Applying the structural traceability theorem

We use [Jedličková–Kratochvíl, Theorem 3.7(d)](https://arxiv.org/html/2403.03668v1#S3.SS3)
([journal version](https://doi.org/10.1016/j.jcss.2025.103754)).
For a connected graph of independence number at most four that
is 2-connected but not 3-connected, a Hamiltonian path exists
exactly when deletion of any minimum two-vertex cut leaves at
most three components. The theorem's other obstructions apply
only at cut vertices, so they are vacuous here.

Now let $G$ have independence number at most four, and fix
any nonempty induced subgraph $G'$. By taking a smallest induced
subgraph of $G'$ with the same chromatic number, obtain a
vertex-critical graph $H$ with $\chi(H)=\chi(G')$ and
$\alpha(H)\le4$. If $H$ has one or two vertices it has a
spanning path directly. Otherwise $H$ is 2-connected as
above. If it is 3-connected, the Chvátal–Erdős traceability
condition $\alpha(H)\le\kappa(H)+1$ gives a spanning path.
At connectivity two, the preceding cut argument verifies
Theorem 3.7(d), giving a spanning path in this case also.

That path is a path of $G'$. Its vertex span still induces
$H$ because $H$ is induced in $G'$. Consequently
$r(G')\ge\chi(H)=\chi(G')$, and the opposite inequality follows
from taking induced subgraphs. Since $G'$ was arbitrary,
$G$ is path-perfect. The empty case is immediate.

## Sharpness

Use the explicit [13-vertex path witness in the Erdős Problem 640 working report](https://erdosproblemaday.com/report/640#explicit-13-vertex-path-witness).
The witness and its chromatic property are credited to that
source; the role here is to give the sharp independence boundary.

There are three independent hubs $a,b,c$; a vertex $z$ joined to
all three; a triangle on $x_a,x_b,x_c$ with each $x_i$ joined
to hub $i$; and six vertices $y_{ij}$, $i\ne j$, joined to hubs
$i,j$. For each $i$ the two vertices $y_{ij},y_{ik}$ are adjacent.
There are no other edges.

Removing the hubs leaves one triangle, three edges and one
isolated vertex. This gives an independent set of five, taking
one vertex from each component. Without hubs one cannot do better.
With exactly one hub, at most two vertices of type $y$ remain
available, at most one triangle vertex can be chosen, and $z$ is
forbidden. With at least two hubs no $y$ is available, and the
triangle contributes at most one. Thus $\alpha=5$.

There is no 3-coloring. The vertex $z$ forces the hubs to have
at most two different colors. If they all have one color, the
$x$-triangle would have only two colors available. Otherwise
the two $y$-vertices indexed first by the unique hub having
its color both see the two hub colors and are adjacent, so
cannot both use the only remaining color.

The graph is 4-vertex-critical. By symmetry it is enough to
3-color the four deletions $a,z,x_a,y_{ab}$; explicit colorings
are tabulated in [WITNESS.md](WITNESS.md). Adding a fourth color
for the deleted vertex proves $\chi=4$. Finally deleting the
three hubs from a simple path leaves at most four nonempty
pieces, whereas deleting them from the graph leaves five
components. Hence no path spans the graph. Every proper induced
subgraph is 3-colorable by vertex criticality, and the
$x$-triangle supplies a path whose span needs three colors.
Thus $r=3<4=\chi$ at independence number five.
