# Hajós’s conjecture

**Status:** Lean candidate, source and scope reviewed; compilation, axiom audit, and kernel replay pending. This is a published resolution, not a new mathematical discovery.

## Attribution and target

G. Hajós (1961), graph-coloring conjecture (not the unrelated cycle-decomposition conjecture). The 1961 original was not directly retrieved; the exact conjecture and subdivision definition are stated in the resolution paper:

Paul A. Catlin, [Hajós' Graph-Coloring Conjecture: Variations and Counterexamples](https://doi.org/10.1016/0095-8956(79)90062-5), JCT B 26 (1979), 268–274. Section 2, Propositions 1 and 2 (pp. 268–269), [full text](https://math.wvu.edu/~hlai2/Pdf/Catlin_Pdf/Catlin14.pdf). The page images and text were consulted.

The conjecture says that every finite simple graph with chromatic number at least k contains a subdivision of K_k. The Lean statement negates this universally quantified claim over all finite vertex types (at universe zero), graphs, and natural k. Its witness also has chromatic number exactly 8, matching the original equality wording. The stronger results of Catlin for every k ≥ 7, the general formula for the subdivision number, and the open k=5 and k=6 cases are not claimed. A full universal refutation is logically complete using one witness; it is not a fixed-dimension proof of a positive conjecture.

## Source proof and Lean representation

Let G be the line graph of the cycle C5 with every edge replaced by three parallel edges. Its vertices are the fifteen pairs (cycle edge group, parallel edge index). Two distinct vertices are adjacent exactly when their groups coincide or are consecutive modulo five.

- In the source's counting argument, independent sets have size at most 2. Seven colors cover at most fourteen vertices. An explicit 8-coloring makes the chromatic number exactly 8.
- Any eight branch vertices include two in distinct non-neighboring groups: a clique spans at most two adjacent groups, each with three vertices.
- Removing the six vertices in the two adjacent groups to the first vertex separates it from the second. A subdivision of K8 would supply seven internally vertex-disjoint routes between the pair. The Lean proof makes the cut counting explicit by assigning to every branch index other than the first either its own cut vertex (if present) or an interior vertex of a crossing path. Different unordered edges have disjoint interiors, and these interiors avoid every branch vertex.

The `Subdivision` model uses actual mathlib graph walks with nodup support, injective branch map, interiors excluding endpoints and all branch vertices, and disjoint interiors for distinct unordered edges. It represents paths in both orientations; a genuine subdivision supplies these by reversing the chosen path. The final declaration `PublishedHajos.conjecture_false` refers to this model and the ordinary mathlib `chromaticNumber`.

## Prior formalization screen and verification

Bounded search of repository issues and code and Mathlib did not identify an existing proof. DeepMind's [formal-conjectures statement](https://google-deepmind.github.io/formal-conjectures/src/FormalConjectures/Wikipedia/HajosConjecture/) uses mathlib paths and still has a proof hole in the universal disproof. We do not claim first formalization priority.

Candidate: `lean/Conjectures/HajosColoring.lean`. Required endpoints: `walk_cross`, `separator_lower_bound`, `no_seven_coloring`, `chromatic_eq`, `no_subdivision`, `conjecture_false`. Run the dedicated hosted candidate gate with the pinned Lean/mathlib toolchain, all project theorem axiom collection, and unchanged leanchecker replay. No successful elaboration or kernel check is claimed yet. Tracking issue [#516](https://github.com/1337isnot1337/solved-conjectures/issues/516).
