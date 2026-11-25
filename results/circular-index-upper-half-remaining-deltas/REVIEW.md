# Independent review and Lean scope

[tomdif](https://github.com/tomdif) supplied the seven explicit graphs,
colourings, SAT encoding and original write-up in [PR #647](https://github.com/1337isnot1337/solved-conjectures/pull/647).
The primary target is the remark after [Mazák–Zrubák, Problem 7](https://arxiv.org/html/2603.08822#S8).
The numbered problems about connectivity and arbitrary denominators are
not resolved by the seven certificates.

The independent exact replay reads certificate data without executing
the optional SAT search. For an edge of colour *j*, it adds an occupancy
at each endpoint in the three windows starting at *j*, *j−1*, and *j−2*
modulo *p*. No occupancy repeats in a vertex/window pair. The replay
also checks simple edges, actual maximum degree, and the strict rational
inequalities. For the lower bound, each block of *q* consecutive colour
classes in any `(p,q)` colouring is a matching in the graph on `2m+1`
vertices. Summing over the *p* cyclic windows gives
`q*|E| ≤ p*m`; every colourable ratio is at least `|E|/m`. The
submitted colouring gives the upper bound. The bounds are equal for
six graphs, not for the degree-15 graph.

[Lean checks the seven literal certificates](../../lean/Conjectures/TomdifCircularIndexCertificates.lean),
including the data and exact density inequalities. It then
[builds the actual simple graphs](../../lean/Conjectures/TomdifCircularIndexGraph.lean),
proves the exact edge count and degree at each vertex, and constructs
the submitted cyclic colouring on the literal graph edges.
[The final theorem](../../lean/Conjectures/TomdifCircularIndexBounds.lean)
proves the actual real circular chromatic index is in the required open
interval for all seven maximum degrees. It also proves the six exact
values and the degree-15 bracket stated in the table. The three earlier
constructions needed for the combined all-degree assertion are outside
this scope. See the [finite-data receipt](verification/receipt.json) and
[real-index receipt](verification/real-index/receipt.json).
