# Lean scope for Tom–Vailaya’s weighted trace conjecture

Partial verification of the [written proof](PROOF.md) of [Conjecture 74](https://doi.org/10.37236/14403) by Foster Tom and Aarush Vailaya.

[The color trace module](../../lean/Conjectures/TomVailayaColorTrace.lean) indexes arcs individually and proves that their product is zero for an improper coloring and $q$ to the ascent count for a proper coloring. Identifying the endpoints changes only the arc endpoints. The trace theorem uses a bijection from the actual closure colorings to colorings with equal endpoint colors and checks the variable product under that bijection. The loop and the two-vertex path-edge lemmas follow from the literal definitions.

[The gluing module](../../lean/Conjectures/TomVailayaColorGluing.lean) splits every coloring of the literal glued graph into input colorings with the same color at the shared vertex. The vertex and arc products factor under this bijection. Summing over the shared color gives the exact matrix product, with the right graph's matrix acting on the left.

[The path test modules](../../lean/Conjectures/TomVailayaWeightedPathRows.lean) prove that at the specialization $q=1$, the $k$-th path row is the evaluation of a common polynomial of degree $k$ with leading coefficient $(-1)^k$. Evaluation at distinct color values gives independent rows. Lean proves the symbolic determinant is nonzero and transports independence to the rational function field in $q$. The [path test receipt](verification/weighted-path-rows/receipt.json) records the audited three-module closure.

[The path-series module](../../lean/Conjectures/TomVailayaPathSeries.lean) gives the weighted path action on the paper’s explicit color-basis columns. It checks the generating identity by telescoping a color product, extracts the coefficient recurrence, and derives the column sums and exact finite-color support. The [path-series receipt](verification/weighted-path-columns/receipt.json) records the audited two-module closure.

Color-basis invertibility, the clique preparation and the comparison with the original forest-triple matrix remain written. The [gluing receipt](verification/gluing/receipt.json) records strict pinned Lean compilation, the all-owned axiom audit and stock-kernel replay of the current two-module closure. The [color trace receipt](verification/color-trace/receipt.json) records the first publication's source snapshot.
