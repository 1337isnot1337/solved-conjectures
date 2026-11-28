# Block localization for prescribed-parity demands

Partial progress on Chen's second question, arXiv:2609.26158,
Problem 6.5. This is not the unrestricted theorem.

Let a demand be a pair of distinct vertices with a prescribed path
length parity. A path is eligible only if its endpoints are a demand and
its length has that parity. Packing always counts different original
demands. The supply graph is undirected and paths are simple.

**Theorem.** For every $w,t$ there is $h(w,t)$ such that, if each
nonbipartite block of the supply graph has treewidth at most $w$, there
are $t$ eligible paths of distinct demands with vertex congestion at
most two, or a set of at most $h(w,t)$ vertices meeting every eligible
path. Bipartite blocks may have arbitrary treewidth. The supply graph
may have arbitrarily many odd cycles and arbitrarily large odd cycle
transversal number. In particular, for each fixed $q$, the prescribed-
parity conjecture holds on the class excluding the singly parity-breaking
grid of order $q$ as an odd minor.

## 1. Localize to block footprints

Use the block-cut forest. The footprint of a path contains the block
node for every block in which it uses an edge, and the cutvertex node
for every cutvertex that it visits, including an endpoint. This is a
nonempty connected subtree: consecutive edges in different blocks meet
at their common cutvertex, and any additional visited cutvertex is
adjacent to a traversed block. Disjoint footprints give vertex-disjoint
paths. A shared cutvertex would give a common cutvertex node, while a
shared non-cutvertex would lie in an edge-traversed block common to the
two paths. Vertex-disjoint eligible paths have different demands.

For connected subtrees of a forest, the maximum number of disjoint
subtrees equals the minimum number of nodes meeting them all. For a
proof, root each tree and choose a subtree whose nearest-to-root
vertex $v$ is deepest among those remaining. Each remaining subtree
intersecting the chosen subtree contains $v$: its nearest-to-root
vertex is an ancestor of the intersection and is no deeper than $v$.
Select the subtree for packing, put $v$ in the transversal and discard
the subtrees containing $v$. Repeat in each component. Thus, unless
there is already an integral packing of size $t$, a set of at most
$t-1$ block or cutvertex nodes hits every eligible footprint.

Pay one vertex for a selected cutvertex node. For a selected block
node $B$, it remains to hit eligible paths using an edge of $B$.

## 2. Reduce a block node to a local routing or cover

Each component of $G-V(B)$ in the connected component of $B$ has
neighbors in $B$ only at a single gate. This follows from the
block-cut tree; two distinct gates would give an external path between
vertices of $B$, whose edges would belong to $B$ instead. A simple
path that uses a block edge therefore has exactly one contiguous
positive-length segment in $B$. The entries of its two endpoints into
$B$ are fixed: an endpoint in $B$ enters at itself, and an endpoint
outside enters at its unique gate. The two entries are distinct, since
leaving and returning to the same gate would repeat a vertex. The
fringes for two distinct entries are disjoint. Here a fringe includes
all the components attached at that entry, but not the gate itself.

For each original demand that has an eligible path using an edge of
$B$, admit its entry pair with every local parity that can be completed
by simple endpoint-to-entry paths outside $B$ to meet the original
parity. A zero-length attachment is used for an endpoint already in
$B$. For each entry pair and admissible parity, fix one witnessing
original demand and two corresponding attachments. Every simple path
for this entry pair of that parity lifts by these fixed attachments to
an eligible path. Conversely, every eligible path using $B$ projects
to one of the admissible local paths.

A local packing of distinct entry pairs lifts to distinct original
demands, since one original demand has only one entry pair in $B$.
The packing retains congestion two. Any fringe vertex is used only by
paths whose block segments contain its gate, and concatenation never
changes the load inside $B$. A set in $B$ meeting all admissible
local paths meets all eligible paths that use an edge of $B$.

## 3. Two types of block

If $B$ is bipartite, every path between the same entries has the same
parity. Keep each entry pair for which that parity is admissible, and
apply the [parity-free theorem](PARITY-FREE-HALF-INTEGRAL.md) to these
ordinary demand pairs. This gives either a local packing of size $t$
or a local transversal of size at most $f(t)$, where $f$ is the
parity-free bound.

If $B$ has treewidth at most $w$, take a tree decomposition with
bags of size at most $w+1$. For every admissible local path the nodes
whose bags meet it form a subtree: the node sets for its successive
vertices meet whenever the vertices are adjacent. Disjoint such
subtrees give vertex-disjoint local paths, which necessarily have
different entry pairs. Otherwise at most $t-1$ nodes hit every path
subtree. The union of their bags is a transversal of size at most
$(t-1)(w+1)$.

Taking the union over selected block and cutvertex nodes proves the
theorem with

```math
h(w,t)=(t-1)\max\{1,f(t),(t-1)(w+1)\}.
```

If $t=1$, either an eligible path exists or the empty set is a
transversal, as required.

For the stated odd-minor corollary, use Fiorini, Gollin, Huynh,
Keil, Kwon, Oum, Sharma and Weltge, [Combinatorial optimization with
bounded subdeterminants](https://arxiv.org/abs/2611.13065), Lemma 4.3:
excluding a fixed singly parity-breaking grid as an odd minor bounds
the treewidth of every nonbipartite block. The source establishes this
structural input, not the prescribed-pair packing conclusion. The
argument also proves a reduction to 2-connected host graphs: if a
uniform bound for all prescribed-parity demands is proved on blocks,
apply it once to each admissible parity separately, and take the union
of the two covers if neither produces a packing. One need not solve the
cutvertex interfaces, and this reduction does not bound the difficulty
inside an arbitrary nonbipartite 2-connected graph.
