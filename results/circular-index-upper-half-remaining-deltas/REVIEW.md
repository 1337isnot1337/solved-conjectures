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

[Lean](../../lean/Conjectures/TomdifCircularIndexCertificates.lean)
checks the seven literal finite certificates: strict order of the
endpoint pairs, vertex and colour ranges, the attained maximum degree,
cyclic colour separation at each vertex, and exact cross-multiplied
density inequalities. It does not prove the bridge to the real circular
chromatic index or formalize the three earlier constructions needed
for the combined all-degree assertion. See the [scoped replay receipt](verification/receipt.json).
