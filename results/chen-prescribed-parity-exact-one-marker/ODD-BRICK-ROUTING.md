# Rooted parity routing through an aligned odd-brick wall

This eliminates the all-odd-brick outcome of the one-label
Huynh–Joos–Wollan structural theorem in the
[free-terminal reduction for Chen’s prescribed-parity problem](FREE-TERMINALS.md).
It does not handle the distinct bipartite-wall outcome with
pure odd linkage.

Fix a routing target $`t`$. Suppose a tangle of sufficiently
large order (depending only on $`t`$) has an aligned sufficiently
large wall in the supply graph, with every brick an odd cycle.
Assume the union of the terminals of $`9t`$ full demands is free
in that tangle. Then $`t`$ distinct demands can be routed with
their prescribed parities by simple paths of vertex congestion
at most two.

## 1. A signed grid from the same odd wall

In a large rectangular patch of the elementary brick wall,
use coordinates $`(i,j)`$ so the horizontal edges join
$`(i,j)`$ to $`(i,j+1)`$ and consecutive rows $`i,i+1`$ are
joined at the columns $`j`$ with $`i+j`$ even. Take rows and
pairs of columns well inside the wall, avoiding the clipped
corners. In each row group the columns $`2c,2c+1`$ into
one branch cell, with the horizontal edge (or its
subdivision) between them as its branch tree. Between
consecutive cells take the obvious horizontal connector;
between consecutive rows take the unique vertical
connector at the appropriate parity within each pair
of columns. If the wall edges are subdivided, assign the
interior vertices of each connector arbitrarily to one
of its two incident cells, leaving one connector edge.
This preserves their union and keeps each cell a tree.

This yields a model of a square grid of any prescribed size
$`n`$ once the wall is sufficiently large. The lift of each
unit face, via the unique tree path between the two selected
ports in every involved cell, is exactly its original brick:
the two consecutive vertical connectors are two columns
apart, and both horizontal sides traverse those two
elementary edges. Its length is therefore odd.

A separation of order less than $`n`$ cannot put a complete
grid-model row in the small side. Indeed there are $`n`$
disjoint vertical tracks of the original wall through the
selected column pairs (the tracks zigzag inside the pairs
if necessary). A track avoiding the separator meets the
specified row off the separator, so the whole track lies
on that side. It meets every horizontal row of the original
wall. A horizontal row avoiding the separator therefore lies
there too, and alignment orients towards it. The construction
can use full horizontal rows of the original wall that span
all chosen pairs, with tracks extended to all those rows.

## 2. Root without changing the grid's faces

Let $`X`$ be the free set of all $`18t`$ terminals. Choose
$`g\ge18t+2`$ and $`n>|X|(g+2|X|)`$. Apply
[Marx–Seymour–Wollan, *Rooted grid minors*, Statement 2.1](https://arxiv.org/pdf/1307.8138#page=4)
to the specific $`n`$-grid model just built, with $`J=G_n`$.
Its boundary in $`G_n`$ is empty, so the first hypothesis
holds for the branch trees. For the second, a separation
$`(A,B)`$ of order less than $`|X|`$ with $`X\subseteq V(A)`$
and a complete model row in $`B`$ is impossible: if oriented
towards $`B`$ it contradicts freeness of $`X`$; if oriented
towards $`A`$ it puts a full modeled row on the small side,
which §1 excludes.

Statement 2.1 supplies a subgrid isomorphic to the $`g`$-grid
and an augmentation on its first column, with the $`|X|`$
terminals in separate cells in the first $`|X|`$ rows. It
retains every selected model edge and original branch tree;
only the cells hosting terminals may be enlarged. Thus
we may keep each original cell tree and extend it to a tree
in the corresponding enlarged model cell, containing its
terminal. Every 4-cycle of the subgrid is a unit face in
the original grid (every simple 4-cycle in a square grid
is a unit face). Hence all these lifted faces remain odd.

For clarity, put a proper two-colouring $`\gamma`$ on each
cell tree independently. Assign a bit $`1+\gamma(u)+\gamma(v)`$
modulo two to the grid edge whose chosen connector is $`uv`$.
The parity of a simple grid path lifted through the cell
trees equals the sum of its grid-edge bits plus the
two endpoint colours in their cell trees. This follows by
adding the parities of the unique tree paths, because the
parity between two tree vertices is the sum of their
colours. In particular each unit square has sum one.

## 3. Route matched roots with one private parity switch

Consider the $`9t`$ original whole pairs. Each pair conflicts
with at most eight other pairs under the rule that two
pairs conflict when one of their endpoint rows is within
two of an endpoint row of the other. This is because each
of its two endpoint rows has at most four different rows
at such distance, and each row hosts at most one endpoint.
Greedy independent-set selection gives $`t`$ nonconflicting
pairs. Rows of **different** pairs are thus at distance at
least three. Rows of the same pair need not be separated.

For pair $`i`$, let $`r_i<s_i`$ be the endpoint rows.
Assign it column $`c_i=3i+3`$, for $`i=1,\ldots,t`$.
Route it along row $`r_i`$ from column one to $`c_i`$,
then down column $`c_i`$ to $`s_i`$, then back to column
one along row $`s_i`$. Horizontal routes occupy distinct
rows, vertical routes distinct columns, so the grid
congestion is at most two and all paths are simple.

To change the parity of pair $`i`$, replace its horizontal
edge on row $`r_i`$ from column $`c_i-2`$ to $`c_i-1`$ by the
other three sides of the unit square immediately **above**
it if $`r_i>1`$. If $`r_i=1`$ and $`s_i>2`$, use the square below.
If $`r_i=1,s_i=2`$, use row $`s_i`$ as the base instead and
the square below it. In all cases the neighboring row
used for this detour is not another selected endpoint row,
and differs by one from a base row of this pair.
In the above-row case it cannot be the mate's row since
$`r_i<s_i`$. In the other cases this was explicit. The two
detour columns $`c_i-2,c_i-1`$ are not any assigned vertical
column; moreover different pairs have disjoint such
column ranges. Thus the new internal detour cells are
unused by all the other original paths, by the rest of
this path, and by other detours. Congestion is still at
most two. The bit sum on that square is one, so the lift
has its parity changed. Choose the detour precisely for
a pair whose initial parity is wrong.

Finally the selected grid paths lift to simple supply
paths, as each uses each cell at most once and cell trees
are disjoint. A vertex in a cell can be used by at most
the two grid routes that use its cell. The original pairing
was never changed.

## Source boundary

This is the odd-brick outcome of the specialization of
[Huynh–Joos–Wollan](https://arxiv.org/abs/1605.07082)
given as Theorem 7.2(ii)(a) in
[Heinlein’s thesis](https://d-nb.info/125238162X/34).
Their odd-brick packing uses unrestricted endpoint choices.
Here the stronger grid augmentation retains the selected
faces and roots whole prescribed pairs. The bipartite wall
with pure odd linkage may have no two disjoint odd cycles:
the private-face argument cannot be copied to that outcome.
