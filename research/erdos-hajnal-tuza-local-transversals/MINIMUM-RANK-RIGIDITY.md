# Rigidity at minimum rank for multiple intersection

A structural reduction for [Erdős–Hajnal–Tuza’s local transversal
problem](https://github.com/1337isnot1337/solved-conjectures/issues/1019).
A family that only uses the minimum possible number of non-private
vertices in each edge must use the classical dense core. It cannot
improve the Erdős–Hajnal–Tuza threshold by changing the core.

## General rigidity lemma

Let $`d\ge3`$ and $`u,t\ge1`$ be integers. Suppose every
collection of at most $`d`$ edges of a nonempty family
$`\mathcal H`$ has intersection of size at least $`u`$,
and that $`\tau(\mathcal H)>t`$. If every edge has size at most
$`R=(d-1)t+u`$, then
```math
\mathcal H=\binom{M}{R}
\quad\text{for some set }M\text{ of size }dt+u.
```
Vertices outside all edges are irrelevant. Here $`R`$ really is
the minimum possible upper bound on the edge sizes.

For $`1\le j\le d`$, every intersection of $`j`$ edges has size
at least $`(d-j)t+u`$. Prove this by descending induction
from $`j=d`$: if the current intersection is smaller than the
desired bound, choose up to $`t`$ of its points (all of it if
it has fewer than $`t`$) and take a new edge avoiding them.
This gives a $`(j+1)`$-edge intersection smaller than its
lower bound. The avoiding edge is distinct from the first
$`j`$, since the forbidden set is nonempty unless the
intersection was already empty, which the hypothesis excludes.
In particular every edge has size $`R`$ and every pair
overlaps in at least $`R-t`$.

Starting with $`A_1`$, choose $`A_2,\ldots,A_{d-1}`$
successively avoiding $`t`$ points of the running intersection.
The lower bound just proved forces exactly $`t`$ points to
be lost at each step. For $`i\ge2`$ the missing sets
$`A_1\setminus A_i`$ have size exactly $`t`$ and are disjoint:
they contain the newly lost $`t`$-sets and cannot be bigger
by the pair bound. Also each $`A_i\setminus A_1`$ has size
$`t`$. For any two indices $`i,j\ge2`$ these exterior sets
must be equal, because inside $`A_1`$ the pair shares
$`R-2t`$ points, but globally it shares at least $`R-t`$.
(When $`d=3`$ there is only one exterior set.) Thus
$`M=\bigcup_{i=1}^{d-1} A_i`$ has size $`R+t`$, and the
complements in $`M`$ of these $`d-1`$ chosen edges
are pairwise disjoint $`t`$-sets.

More generally, whenever $`d-1`$ pairwise disjoint
$`t`$-sets in $`M`$ have their complements in $`\mathcal H`$,
every $`t`$-set $`T`$ disjoint from all of them also has
its complement in $`\mathcal H`$. Take an edge avoiding $`T`$.
Each of the $`d-1`$ existing edges contains $`T`$, so the
avoiding edge must contain all its other points to attain
the pair bound $`R-t`$. These existing edges together
cover $`M`$, as $`d-1\ge2`$ and their complements are
disjoint. The avoiding edge therefore contains $`M\setminus T`$
and equals it by size.

Starting from the $`d-1`$ disjoint complement blocks, use
that closure to obtain a $`d`$-th block, leaving $`u`$
spare points. Fix one spare point position. The same rule
allows it to be swapped with any point of any block by
holding the other $`d-1`$ blocks fixed. These swaps generate
all permutations of the blocks’ positions and the chosen
spare position. The other spare points are not needed for
the swaps, but can be brought into a block by first swapping
any selected block point with any one of them. Equivalently,
all transpositions along the complete bipartite graph between
block positions and spare positions are available, and that
graph is connected. Thus every $`t`$-set of $`M`$ occurs
as a complement. Finally any edge $`E`$ outside this
complete $`R`$-graph would have $`R-t\le |E\cap M|<R`$.
Choose a $`t`$-subset of $`E\cap M`$; its complement has
intersection with $`E`$ of size below $`R-t`$, impossible.
The construction conversely is $`d`$-wise $`u`$-intersecting
and has transversal number $`t+1`$.

## Application to the local transversal problem

Suppose $`\mathcal F`$ is $`r`$-uniform, every subfamily
spanning at most $`3r-3`$ vertices has common intersection,
$`r\ge3`$, and $`\tau(\mathcal F)>t`$. As in
[Near-threshold petals](NEAR-THRESHOLD-PETALS.md),
every pair intersects and any triple of empty intersection
would have union at most $`3r-3`$, so the family is
3-wise intersecting. Remove all private vertices
(vertices lying in precisely one edge). This preserves
3-wise intersection (including the distinct smaller families)
and the transversal number: a selected private vertex can
be replaced by any remaining vertex in its unique edge.
Every edge has a remaining vertex because it meets other
edges. Repeated projected edges can be merged.

If every original edge has at most $`2t+1`$ non-private
vertices, the lemma with $`d=3,u=1`$ says the projected
edges are exactly the full $`(2t+1)`$-graph on $`3t+1`$
points. Choose one original edge per projected edge; their
private padding is disjoint. Put $`b=\lfloor(t-1)/3\rfloor`$.
There exist four distinct $`t`$-sets of the core covering
it with common intersection of size $`b`$: fix the common
$`b`$-set, then split the remaining points into three groups
of size $`t-b`$ and a fourth of size $`t-b-e`$, where
$`e=t-1-3b\in\{0,1,2\}`$, and pad the fourth by $`e`$ points
of the first group. The fourth group is nonempty. The
complementary four projected edges have empty intersection
and union of size $`3t+1-b`$. With their private padding
their span is $`4r-5t-3-b`$, so the local condition forces
```math
r\ge5t+1+\lfloor(t-1)/3\rfloor .
```
This is the known [Erdős–Hajnal–Tuza construction threshold](https://doi.org/10.1016/0097-3165(91)90074-Q).
The rigidity proof explains why no different minimum-rank
private-padding core can do better. The conclusion does not
rule out cores with more non-private points, which are needed
for any improvement.

In fact, below the displayed threshold, the subfamily of all
edges with at most 2t+1 non-private vertices (measured in the
whole family) has a transversal of size at most t. Otherwise
apply the same proof to that subfamily, still stripping only
vertices private in the whole family. Its four representatives
would already violate the span window of the original family.

The nearby literature on [maximal multiply intersecting
families](https://doi.org/10.1007/s00493-023-00046-3) and
[uniform 3-wise intersecting families](https://arxiv.org/abs/2210.15361)
optimizes other quantities, not the minimum rank for a fixed
transversal lower bound. This auxiliary lemma is used here as
a proof of the reduction, not as a separate named-conjecture claim.
