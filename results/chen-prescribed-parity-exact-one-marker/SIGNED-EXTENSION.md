# Two checks on the scope of the prescribed-parity proof

Companion to the [complete proof draft](PROOF.md).
Neither observation requires a new structural theorem.

## An alternative parity-free input

The parity-free theorem used in the bipartite block can be recovered
from [the same free-whole-pair lemma](FREE-TERMINALS.md), §§1–3,
without invoking the earlier fractional-packing proof. Indeed, apply
its induction with “eligible” meaning every simple demand path and
s=t. For a sufficiently large tangle order it yields a free set of
2t terminals of t whole demand pairs. Marx–Seymour–Wollan,
[Statement 2.2](https://arxiv.org/pdf/1307.8138#page=8), produces a
rooted g-grid model with these terminals in distinct first-column
cells of the first 2t rows, for any fixed g≥2t+1. Choose a tree in
every model cell containing its connector ends and any root. Give
pair i a private column i+1 and route across the first endpoint's
row, along that column, then back along the second endpoint's row.
Every used row belongs to only one terminal, and every used column
is vertical for only one demand. Thus every cell has load at most
two; a simple grid path lifts simply and the terminal pair is kept.
This contradicts absence of a size-t packing. The base case t=1
is immediate. This proves the parity-free input separately, using
no step of the prescribed-parity wall covering argument.

## Extension to signed edges and arbitrary shared terminals

Assign each supply edge a bit. For each demand between distinct
vertices prescribe the XOR of the bits on its simple route. Allow
different demands to share one or both terminals. The same uniform
bound f(t) works if the demand identities are counted distinctly.

Replace each bit-0 edge by a two-edge subdivided path and each
bit-1 edge by a single edge. For each demand create two private
leaves, one at each terminal, attached by two-edge paths; pair
these leaves and prescribe the demand's original bit as length
parity. The resulting demand pairs are a matching. A simple path
between private leaves cannot visit other pendant gadgets and
restricts to exactly one original simple route; a subdivided supply
edge is traversed in its entirety whenever its interior is used.
The converse lift is unique. A congestion-two packing therefore
contracts to a congestion-two packing of distinct original demands.
Map every cover vertex not in the original graph to an arbitrary
endpoint of its subdivided supply edge, or to the terminal of its
pendant gadget. Every eligible original path lifts to a hit path,
and whichever artificial cover vertex hits it maps to an original
vertex on the path. Collapsing can only decrease the cover size.

No analogous extension to residues modulo an integer greater than
two is asserted: the wall switches in the proof are specific to
parity.
