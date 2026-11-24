# Hajós’s conjecture

**Status: candidate; Lean checks pending.** Tracking [#523](https://github.com/1337isnot1337/solved-conjectures/issues/523).

## Source

György Hajós proposed that every graph of chromatic number k contains a subdivision of the complete graph K_k. Paul A. Catlin, [Hajós' graph-coloring conjecture: Variations and counterexamples](https://doi.org/10.1016/0095-8956(79)90062-5), JCT B 26 (1979), 268–274, §2, Propositions 1–2, pp. 268–269, gives the counterexample family L(t C_(2n+1)). The instance t=3, n=2 is the line graph of the threefold 5-cycle, equivalently the graph on five 3-cliques with complete joins between consecutive cliques.

## Full scope and proof

The formal statement quantifies over all finite simple graphs and every exact chromatic number k; it asserts a subdivision certificate with k branch vertices. The certificate is the standard path characterization: an injective choice of branch vertices and simple paths for all branch pairs, with no other branch vertices and with distinct unordered edge paths sharing only common endpoints. A graph subdivision supplies this certificate by orienting each edge path in both directions. Each path is encoded by its finite sequence and irrelevant values beyond the length; no bounded-length assumption is imposed.

The 15-vertex counterexample has a literal proper 8-coloring, and every color class has at most two elements, so seven colors cannot suffice. Any eight proposed branch vertices include two in non-neighboring cliques. Remove the six vertices in the two cliques neighboring the first clique; this separates those two branch vertices. The generic path lemma proves that every path crossing the separation meets the cut. From a hypothetical subdivision, construct seven distinct vertices of the cut: for each other branch, either use that branch itself if in the cut, or select a cut vertex of an edge path crossing the separation. The edge-path intersection and branch-avoidance axioms of the subdivision certificate ensure the selections are distinct. Seven distinct cut vertices contradict its cardinality six.

This proves the unrestricted conjecture false, not just a fixed-k conjecture. It does not assert Catlin's stronger family of failures for every k≥7. It is a historical formalization, not a new result. The separate Hajós cycle-decomposition conjecture in the repository is unrelated.

[Lean candidate](../../../lean/Conjectures/PublishedHajos.lean). Run `python3 scripts/verify_published_hajos.py` for strict source, transitive axiom audit and kernel replay. Mathlib's native graph and coloring definitions are reused. No preexisting formalization was found in the bounded repository/pinned Mathlib path search.
