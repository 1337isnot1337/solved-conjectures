# Highly connected blocks for prescribed-parity demands

Partial result for Chen's [prescribed-parity conjecture](https://github.com/1337isnot1337/solved-conjectures/issues/1012).
There is no bound on the number of blocks or on the global odd cycle
transversal number.

**Theorem.** Fix integers $`t\ge 1`$ and $`w,x\ge 0`$. Suppose the
supply graph has a vertex set $`X`$ of size at most $`x`$ such that each
block of $`G-X`$ is bipartite, has treewidth at most $`w`$, or is
$`50t`$-connected. For arbitrary distinct demand pairs with prescribed
parities, either $`t`$ demands have eligible simple paths at
congestion at most two, or a transversal has size at most
```math
x+(t-1)\max\{1,f(t),(t-1)(w+1),6t-6\}.
```
Here $`f`$ is the proved parity-free bound. Parity constraints in the
block can permit both lengths, without counting one pair twice.

## A local integral alternative

Let $`J`$ be a $`50t`$-connected supply graph. Then either $`t`$
distinct prescribed demands have **vertex-disjoint** paths, or at
most $`6t-6`$ vertices hit every eligible path.

Use the parity linkage theorem of Kawarabayashi and Reed stated as
Theorem 3 in [Joos, arXiv:1411.6554v4](https://arxiv.org/pdf/1411.6554).
A $`50t`$-connected graph with no odd cycle transversal of size
$`4t-4`$ is parity-$`t`$-linked. If this applies, take a maximal
matching in the graph of admissible demand pairs. With at least
$`t`$ matching edges, the linkage theorem gives the desired paths,
selecting one admissible parity per pair. Otherwise the at most
$`2t-2`$ endpoints of the matching hit all the demand pairs and
hence all eligible paths.

In the other case take an odd cycle transversal $`Y`$ with
$`|Y|\le 4t-4`$. The graph $`J-Y`$ is bipartite and still at least
$`26t`$-connected. Keep the surviving pairs whose admissible parities
include the unique parity given by the bipartition. If a maximal
matching of these pairs has size at least $`t`$, use Theorem 4
of Joos with $`I=\emptyset`$ on $`J-Y`$. Its nice partition is the
bipartition (the minimum odd cycle transversal is empty).
The theorem gives vertex-disjoint paths between the selected
endpoints. Their parities are already forced by the bipartition.
If the matching has size less than $`t`$, its endpoints together
with $`Y`$ form a cover of size at most $`6t-6`$. An eligible path
avoiding $`Y`$ cannot have a discarded pair.

For matching demands in the local problem, one endpoint per selected
pair suffices in each cover branch, and the bound drops to $`5t-5`$.
For a general block of the global problem, projected entry pairs
may not be a matching, even if the original pairs are.

## Lift the local alternative

First put $`X`$ in the cover and work in $`G-X`$. Use the block
footprints from [block localization](BLOCK-LOCALIZATION.md).
Either $`t`$ footprints are pairwise disjoint, giving an integral
packing, or at most $`t-1`$ block or cutvertex nodes hit all
eligible footprints. A cutvertex node costs one vertex.

At a block node, retain the two projected entries of each path using
an edge of the block. Preserve its admissible local parities by
checking its attachments in the single-gate components outside the
block. For every local pair and parity fix one witnessing original
demand and its attachments. Distinct local pairs represent distinct
original demands: the original endpoints determine their entries.
A local packing preserves congestion on lifting, because every
fringe vertex can occur only in paths already visiting its gate.
A local transversal hits every eligible path using a block edge.

For a bipartite block use the parity-free theorem, and for a block
of treewidth at most $`w`$ use the subtree transversal of its
tree decomposition. For the remaining blocks use the local
integral alternative just proved. Summing the cover sizes gives
the displayed bound. If $`t=1`$, the claim follows immediately from
the existence of one eligible path.

## Exact scope and a discarded shortcut

The theorem itself uses existing parity linkage; its contribution
here is routing for arbitrary demand sets through a block mixture.
It is not a claim of a new parity linkage theorem. It covers, for
example, arbitrary cutvertex sums mixing large complete graphs,
bipartite blocks of arbitrary treewidth and bounded-treewidth odd
blocks. Even at $`x=0`$, no single bounded-treewidth or global odd
transversal hypothesis subsumes that class.

We also checked a plausible but unproductive two-gate shortcut.
Suppose every simple path between any two vertices of a proposed
bipartite core has the parity of their colors. This holds, for
example, if every outside fringe has one or two gates and every
two-gate through path can be replaced by a core edge of the same
parity. The side condition already forces every block meeting the
core in at least two vertices to be bipartite. Indeed in a
nonbipartite 2-connected graph every two distinct vertices have
paths of both parities: take vertex-disjoint arms to distinct
vertices of an odd cycle by Menger, and use its two opposite-parity
arcs. Thus balanced core shortcuts with bounded-treewidth fringes
do not bypass the earlier bounded-odd-block theorem. Unbalanced
two-gate interfaces inside a low-connectivity nonbipartite block
remain a genuine obstruction to this line of proof.
