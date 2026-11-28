# Erdős's same-vertex-set cycles problem

Working on the unrestricted asymptotic order of [Erdős #585](https://www.erdosproblems.com/585) under [issue #1110](https://github.com/1337isnot1337/solved-conjectures/issues/1110). Let ex_same(n) be the maximum edge count of a simple n-vertex graph containing no two edge-disjoint cycles on the same vertex set. This note does not resolve its asymptotic order.

## Status and exact target

[Erdős's original Problem 29](https://arxiv.org/html/2404.07190v1#bib.bib19) asks for the order. The [published Chakraborti–Janzer–Methuku–Montgomery paper](https://doi.org/10.1016/j.aim.2025.110228) gives an n polylog(n) upper bound and cites the Pyber–Rödl–Szemerédi Omega(n log log n) construction without any 4-regular subgraph. It explicitly asks whether the upper bound can be brought to O(n log log n). The [2026 ICM survey on expansion](https://epubs.siam.org/doi/10.1137/25M1807915) still leaves this gap. [Janzer–Janzer–Steiner–Sudakov](https://doi.org/10.1112/blms.70262) resolve a different chromatic question negatively; this is not an upper bound for ex_same(n). These sources and the [problem wiki](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0585) were checked for prior resolution. No claim of paper priority is made for the observations here.

## Reduction to high-girth regular bipartite cores

For any fixed integers r>=4 and g>=3, there is a constant K(r,g) such that any n-vertex graph with average degree at least K(r,g) log log n has an r-regular bipartite subgraph of girth at least g. All graphs can be taken simple and nonempty. Consequently it suffices for the candidate sharp upper bound on ex_same(n) to prove that for some fixed pair (r,g) every r-regular bipartite graph of girth at least g contains the desired cycles. Equivalently, if ex_same(n) is not O(n log log n), for every pair (r,g) there is a connected r-regular bipartite graph of girth at least g with no such pair of cycles. The reverse implication to that equivalence is not claimed.

Take a bipartite subgraph retaining at least half the edges. Apply [Janzer–Sudakov, Theorem 1.2](https://doi.org/10.1017/fmp.2023.19) to obtain a D-regular subgraph H, where D is a sufficiently large constant depending on r,g. Its maximum degree is now at most D. Keep its edges independently with probability p=D^(-1+1/g). If H has N vertices, the expected retained edge count is N D^(1/g)/2. The number of cycles of length ell is at most N D^(ell−1), by choosing a start and the first ell−1 steps and noting that the closing edge is determined. Thus for ell<g the expected surviving number is at most N D^(-1+ell/g)<=N D^(-1/g). Count each cycle once, or use the overcounting bound as stated. Erase an edge from each surviving short cycle that remains present. For some outcome the resulting graph has average degree at least D^(1/g)−2g D^(-1/g), which for sufficiently large D exceeds the threshold C(r) log log D of the **maximum-degree** version of Janzer–Sudakov. Apply it again to recover exact r-regularity after erasing the short cycles. Pass to a connected component if necessary. The large-girth sampling step is also present in substance in Janzer–Sudakov's discussion of Thomassen's problem; the second regularization retains the girth and explains its use here.

If the asymptotic upper bound fails, choose a graph violating it with enough edges to run this argument at any fixed (r,g); taking subgraphs preserves the forbidden-cycle condition. This is a reduction, not proof that such regular graphs always contain the pair.

## Structural follow-ups

- [High-girth replacement](HIGH-GIRTH-REPLACEMENT.md): degree-saturating cycle packings project through a vertex splice. In particular there are bipartite, 4-edge-connected and 4-regular graphs of arbitrarily large girth still without the pair of cycles. A bare 4-factor cannot close the proof.
- [Simultaneous switching](SIMULTANEOUS-SWITCHING.md): a family of alternating switches with two compatible incidence trees merges both factors at once. For square switches the common-tree condition has an exact graphic-matroid intersection test; longer switches give a criterion usable in high girth. Forcing such a certificate in a sufficiently high-degree regular core remains open.

- [Hamilton-decomposable modules](HAMILTON-MODULES.md): an elementary girth-raising switch preserves all prescribed Hamilton factors; this also gives the positive direction for a compatible vertex splice.
- [Four-edge cuts](FOUR-EDGE-CUTS.md): a balanced four-edge interface has just two signatures; a crossing pair exists exactly when the two shores share one. In high girth either outcome can be realized with the same shores, even at degree and edge connectivity four.
- [Bipartite spectral certificate](BIPARTITE-SPECTRAL-CERTIFICATE.md): a sufficiently strong constant spectral ratio yields a Hamilton path between any opposite-side endpoints after bounded-degree deletion, giving packing and flexible interface signatures.
- [Cube-cover obstruction](CUBE-COVER-OBSTRUCTION.md): global mixing cannot be a general extraction step. At degrees arbitrarily above log log(order) and with girth growing, every subgraph with an edge has a matching cut. This precludes either strong normalized spectral expansion or bipartite joinedness and small-set expansion together.
- [Covers preserving cycles](COVERS-PRESERVING-CYCLES.md): a three-edge switch preserves specified single-cycle lifts while raising girth. Applying it to a cube face makes the expander-extraction obstruction coexist with a known witness pair. Lack of global joinedness therefore cannot rule out the pair.

- [Overlapping cycle lifts](OVERLAPPING-CYCLE-LIFTS.md): with prime sheet number, a five-edge switch can preserve every specified simple cycle preimage, including edge-sharing ones. This simultaneously retains every base witness if all simple base cycles are designated.
- [Euler-tour covers](EULER-TOUR-COVERS.md): every connected even-regular graph has a Hamilton-decomposable finite cover. For the same quartic base, another connected cover of the same sheet number avoids the pair. Thus existence in a chosen cover does not imply existence downstairs.

- [Balanced quotient packing](BALANCED-QUOTIENT-PACKING.md): a lossless transfer for spanning packings over a suitable choice of ports gives arbitrarily high-girth, maximally edge-connected bipartite examples with an exact deficit in every even degree. At degree greater than four this does not exclude a pair on a proper support.

- [Nonspanning necessity](NONSPANNING-NECESSITY.md): a one-sided substitution gives maximally edge-connected bipartite graphs without even one Hamilton cycle in every degree and at any girth, including a sequence far above the $`n\log\log n`$ density scale. This blocks finding spanning witnesses in the host, not extracting them on proper support.

- [Density-critical profile](DENSITY-CRITICAL-PROFILE.md): at the conjectured density scale, an induced critical subgraph has resilient small-set vertex expansion, many Pósa endpoints after bounded-degree deletion, and explicit lower bounds on balanced separators and matching-cut shores. This does not supply global joinedness or a simultaneous closure.

- [Paired rotations](PAIRED-ROTATIONS.md): if one endpoint can rotate to a neighbour of a fresh vertex that is also adjacent to a distinct endpoint of the other path, both paths extend on the same support. The density profile gives many candidates outside the support or a large rotation cloud, but the compatibility step is missing.

- [Disjoint reserve rotations](DISJOINT-RESERVE-ROTATIONS.md): balanced reserve colouring makes every choice from the two endpoint clouds compatible without losing all small-set expansion. Edges outside the common support need not retain the colouring. A third reserve can be left for closure edges.

- [Paired-path lower bound](PAIRED-PATH-LOWER-BOUND.md): a layered random construction forbids even the initial two paths at density $`\Omega(n\log\log n)`$, with girth growing. It gives a matching lower bound for bounded-degree common-support tree packing, whose upper bound follows from regular extraction and arboricity. Forcing paths rather than trees is still open in this approach.

- [Path-seed closure gap](PATH-SEED-CLOSURE-GAP.md): two spanning paths can coexist with no same-support cycle pair, even in arbitrarily large girth. A closure argument must use spare structure.

## Current bottleneck

Force compatible common-support paths or cycles using weaker, non-global structure. A proof cannot simply extract a balanced, globally joined expander from the high-girth regular core. Neither cube-cover result is a counterexample to the conjectured extremal order.
