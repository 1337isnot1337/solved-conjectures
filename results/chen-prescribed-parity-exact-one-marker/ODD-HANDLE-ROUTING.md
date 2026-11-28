# Rooted parity routing with a bipartite wall and odd handles

This treats the odd-linkage wall branch of the
[free-terminal reduction](FREE-TERMINALS.md) for
[Chen's prescribed-parity problem #1012](https://github.com/1337isnot1337/solved-conjectures/issues/1012).
We use only disjoint odd handles on distinct top nails,
so their being in series, crossing or nested is immaterial.

**Lemma.** Fix a target $`t\ge2`$. Suppose an aligned
sufficiently large bipartite wall $`W`$ has sufficiently
many disjoint paths with distinct top nails as ends and
interiors outside $`W`$. Each path is parity-breaking:
its length modulo two differs from the parity between
its ends in $`W`$. If the terminals of $`s=50t`$ whole demand
pairs form a free set in the tangle, then $`t`$ of those
demands have prescribed-parity simple paths of vertex
congestion at most two. Both size requirements depend only
on $`t`$.

## 1. Root an inner grid of the same wall

Write $`q=2s`$ and $`m=q+t`$. Choose $`g`$ at least
$`q+2m+8t+10`$, and choose $`n>q(g+2q)`$.
As in [the odd-brick case](ODD-BRICK-ROUTING.md), group
consecutive horizontal column pairs of the elementary wall
into tree cells. Vertical connectors zigzag within these
column pairs, and consecutive column pairs have horizontal
connectors. Discard the extreme two column pairs on each
side to avoid clipped corners. This leaves a rectangular
square-grid scaffold (possibly of unequal side lengths)
starting at the top row of the wall. Connector subdivisions
are absorbed into either of the incident cell trees. The
top nails are the chosen degree-two positions of the
elementary top row: they alternate with downward
attachments. Thus away from the clipped ends their cells
are distinct. A choice of a nail along its degree-two
subdivision interval can be used as the corresponding
elementary position in this description.

Take a central $`n`$-square patch with at least $`4m+2`$ scaffold
rows above it. The tangle of $`W`$ rules out any full
modeled row of the patch on the small side of a separation
of order less than $`q`$: a clean vertical track meets that
row and all horizontal rows of $`W`$, as in the odd-brick
case. Therefore the hypotheses of
[Marx–Seymour–Wollan, Statement 2.1](https://arxiv.org/pdf/1307.8138#page=4)
are satisfied for the specific square model and the free
set of $`q`$ terminals. This gives a $`g`$-square subgrid,
with every original cell disjoint from the terminals, and
disjoint enlargements of $`q`$ boundary cells to accommodate
the $`q`$ roots, one per cell. The selected original cell
trees and connectors are unchanged. Denote the selected
**unenlarged** square model by $`D`$. In square-grid
coordinates a subgraph isomorphic to a $`g`$-grid, $`g\ge3`$,
is a contiguous aligned square up to rotation/reflection:
each of its unit four-cycles maps to a unit square, and
adjacent faces must lie on opposite sides of their common
edge. The alignment follows by propagating this rule across
the connected array of faces.

For each terminal, take a path in its enlarged cell to
the original corresponding cell tree and stop at its first
contact. These $`q`$ arms are disjoint, use distinct boundary
cells and otherwise avoid $`D`$. They will be allowed to
change their boundary endpoints while preserving all $`q`$
terminal starts.

## 2. Extend handles to ports, and separate them from the arms

Choose $`m`$ original odd handles whose ends are in the
scaffold, dropping the bounded number that use clipped
end columns. Their $`2m`$ top cell positions are distinct.
Choose $`2m`$ distinct positions in the physical top row
of $`D`$, all at least $`2t+1`$ cells from either corner.
The gap above $`D`$ is enough to connect the two ordered lists
by vertex-disjoint paths in the scaffold lying above $`D`$
until their distinct ends. Here is an explicit wiring:
maintain the active columns in their order. On separate
horizontal rows first slide each right-moving wire to its
final column, processing right-moving wires right to left.
Then slide each left-moving wire to its final column,
processing left-moving wires left to right. Each move has
an unoccupied interval. In the first pass, columns to the
right are already at their final columns or have original
positions at least as large as their final columns, all
beyond the target of the move. All left neighbors are
still strictly to the left of the starting position. In
the second pass, left neighbors are at their final columns
and right neighbors are still strictly beyond the starting
position of the move. Between moves all wires follow their
own vertical tracks. This uses at most $`2m`$ move rows and
can leave empty rows above and before the last connection.
Lifting through the disjoint cell trees gives disjoint wall
paths. At the final cell stop on first contact, so interiors
avoid $`D`$. The original odd handles and these wires make
$`m`$ disjoint extended handles, each still parity-breaking
relative to the wall bipartition, since the extensions
use only wall edges.

For this step only, replace each boundary cell of $`D`$ by a
single dummy port; remove the other cells and all edges
inside $`D`$. Keep the original endpoint as data on each
edge incident to a port; parallel edges cause no difficulty.
Keep all exterior vertices and edges. In this auxiliary
graph choose a vertex-disjoint linkage of the same $`q`$
terminal starts to distinct ports, avoiding ports internally,
with a minimum number of edges outside the union of the
$`m`$ extended handles. The original arms show feasibility.
This standard exchange is the fixed-start version of the
tail rerouting used in [Heinlein, Lemma 6.5](https://d-nb.info/125238162X/34):
if a handle meets the new linkage and neither of its ports
is occupied, follow that handle from one of its ports to
the first arm vertex encountered. Redirect that arm there
to the unoccupied port along the traversed prefix of the
handle. The replacement keeps the start of the arm and
preserves disjointness and the port conditions. Its old tail
had an edge outside the handle union, because the handles
are vertex-disjoint and no arm used either port of this
handle. The new tail uses only handle edges. This contradicts
minimality. Therefore at most $`q`$ handles meet the arms.
Keep any $`t`$ of the other handles. Undo the port compression;
the arms and retained handles are disjoint, with distinct
boundary cells and no other contacts with $`D`$.

## 3. Route in an annular array of tracks

Use grid coordinates of $`D`$. A boundary cell is usable
if on its side its distance from both corner cells is at
least $`2t+1`$ grid edges. There are at most $`4(4t+2)`$
unusable positions (even counting the corners twice).
Discard every whole demand with a terminal arm at an
unusable position. At most that many demands are lost
since the arm ports are distinct, so at least $`t`$ of
the $`50t`$ demands remain. The retained handle ports were
chosen usable. Keep exactly $`t`$ whole demands.

For each usable port draw its radial spoke, perpendicular
to its side, from the boundary to depth $`2t`$. At every
depth $`j=1,\ldots,2t`$ use the concentric square ring of
grid cells whose minimum distance to the four sides is $`j`$.
Spokes are vertex-disjoint, since each avoids all the
corner squares of side $`2t+1`$, and meet each ring at
exactly one cell. Their cyclic order on every ring is
the same as on the boundary.

To connect two ports allocate one ring depth solely to
that connection, follow the two terminal spokes to that
ring, and use either circular arc between the two ring
contacts. All grid vertices then have load at most two:
a vertex belongs to at most one used spoke and at most one
used ring. Each port is used by just one connection.
For a demand requiring **two** connections, involving
its two arm ports and the two ports of its own reserved
handle, choose the matching between arms and handle
ends, and the circular arcs, so their closed angular
intervals are disjoint. This is always possible: of
four distinct points on a circle, two of arm type and
two of handle type, one of the two pairings into adjacent
cyclic pairs pairs unlike types in both pairs. Use the
corresponding disjoint intervals. The two connections
for this demand are then disjoint from each other: their
spokes have different angles; neither spoke angle is in
the other's ring arc; ring depths are distinct. Up to
$`2t`$ connections suffice, so all can have separate rings.

## 4. Prescribed parity and vertex congestion

Fix the bipartition of $`W`$. Each demand's two chosen
external arms have fixed lengths and wall endpoints.
A direct connection through $`D`$ would give their lengths
plus the bipartition parity between those wall points.
If this agrees with the desired parity, use the single
direct connection. Otherwise assign a private retained
odd handle to the demand and make the two connections
from §3 to its two ends. Since all internal connections
are in $`W`$, their parities are fixed by the bipartition.
The handle flips the direct parity because its own
parity disagrees with this bipartition. Either assignment
of arms to its ends has this effect.

Lift the grid connections through the original cell trees.
Each connection uses a cell at most once. In a demand
with two connections, the two use disjoint cell sets.
Each exterior arm and handle visits the selected model
only at its own first-hit port, and those ports are
distinct. Consequently each full demand route is simple.
Exterior portions are disjoint, and a model vertex lies
in at most two routes by the spoke/ring count. This gives
the required congestion-two packing, without changing
any pairing.

No extra minimum-connectivity assumption on the host or
pairing order on the boundary was used.
