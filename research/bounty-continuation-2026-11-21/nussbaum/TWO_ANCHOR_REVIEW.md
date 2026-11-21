# Independent review of the two-anchor lemma

21 November 2026. Reviewed Sections 1–2 of
[the authored note](two-anchor-and-clique-stabilizers.md).
This review does not certify a solution of the full Nussbaum period problem.

The two-anchor system-of-distinct-representatives theorem is correct as stated.
The fibers indexed by the set of free coordinates outside the anchor-difference
set are disjoint, and each chosen fiber remains available inside every assigned
face. Within one fiber, a face containing both anchors contains every other
face there, so the antichain condition makes that case a singleton.

For the remaining faces, the two families of opposite corners are antichains
in the Boolean lattice. Every neighbor of a collided corner lies outside both
families, because that corner belongs to both antichains. The cube-degree
double count gives Hall's condition for every subset of collided corners.
Lower neighbors are available in the first-anchor face, upper neighbors in the
second-anchor face; moving the corresponding representative therefore removes
all collisions without creating any new one. This handles empty/free-set
endpoints and the case of a one-coordinate difference set. Coincident anchors
are handled separately and correctly.

Both stated geometric consequences follow. Two compatibility cliques have
Boolean anchors by the coordinatewise Helly property of cube faces. For twin
bundles over a cycle of length at least four, adjacent-clique anchors must be
distinct. Their hull is a nontrivial cube contained in every face of the middle
bundle. Factoring its free coordinates gives at least twice the multiplicity
in each bundle union. Every Boolean vertex belongs to at most two bundle
unions, giving the claimed total bound. This uses actual cube intersections
and does not assume the abstract cyclic action extends to the ambient cube.

No correction was found. Section 3 and any proposed global reduction beyond
these two lemmas are outside this bounded review.
