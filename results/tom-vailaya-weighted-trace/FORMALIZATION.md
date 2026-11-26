# Lean scope for Tom–Vailaya’s weighted trace conjecture

Partial verification of the [written proof](PROOF.md) of [Conjecture 74](https://doi.org/10.37236/14403) by Foster Tom and Aarush Vailaya.

[The color trace module](../../lean/Conjectures/TomVailayaColorTrace.lean) indexes arcs individually and proves that their product is zero for an improper coloring and $q$ to the ascent count for a proper coloring. Identifying the endpoints changes only the arc endpoints. The trace theorem uses a bijection from the actual closure colorings to colorings with equal endpoint colors and checks the variable product under that bijection. The loop and the two-vertex path-edge lemmas follow from the literal definitions.

[The gluing module](../../lean/Conjectures/TomVailayaColorGluing.lean) splits every coloring of the literal glued graph into input colorings with the same color at the shared vertex. The vertex and arc products factor under this bijection. Summing over the shared color gives the exact matrix product, with the right graph's matrix acting on the left.

The path and clique basis argument and the identification with the original forest-triple matrix remain written. The [gluing receipt](verification/gluing/receipt.json) records strict pinned Lean compilation, the all-owned axiom audit and stock-kernel replay of the current two-module closure. The [color trace receipt](verification/color-trace/receipt.json) records the first publication's source snapshot.
