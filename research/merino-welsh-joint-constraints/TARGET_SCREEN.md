# Multiplicative Merino–Welsh conjecture

Research target screen, 21 November 2026. Active coordination is the existing [issue 44](https://github.com/1337isnot1337/solved-conjectures/issues/44). No resolution is claimed. Any partial theorem remains research and does not increase the full-resolution count.

## Exact target

For every connected loopless and bridgeless finite multigraph, prove

```math
T_G(2,0)T_G(0,2)\ge T_G(1,1)^2.
```

The three evaluations count acyclic orientations, totally cyclic orientations, and spanning trees. The exact original statement is Conjecture 2.2 of Rodolfo Conde and Criel Merino, *Comparing the number of acyclic and totally cyclic orientations with the number of spanning trees of a graph* (2009), printed page 4 of the [author manuscript](https://www.matem.unam.mx/~merino/online_papers/conjecture_5.pdf). It is stated for 2-connected loopless graphs, with multiple edges allowed in the source's conventions. The bridgeless connected formulation follows by decomposing into blocks, since all three evaluations multiply over a one-vertex sum. This is not the already refuted extension to arbitrary matroids.

The author manuscript was downloaded and its definitions and Conjectures 2.1–2.4 read. Its SHA-256 is `b129179a9a5d24c7a6e8df5f4ca13c94692f68f1960dd8de7c96e39361906ca9`. The publisher-hosted PDF returned HTTP 412 locally and HTTP 403 through the web opener; the exact author manuscript supplied the source statement.

## Current status and prior work

The repository already has a substantive [literature and reduction note](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/merino-welsh-research.md), committed on 20 November 2026. It was read before beginning this continuation. The earlier worker explicitly parked the target in issue 44. Its pair reduction and spanning-tree marginal bounds are prior work for this continuation.

Both web search engines were used for the exact graph conjecture, later proofs or counterexamples, and convexity variants. The most relevant primary sources were checked:

- [Noble and Royle, arXiv:1303.6416](https://arxiv.org/abs/1303.6416), published in European Journal of Combinatorics 38 (2014), prove the multiplicative conjecture for series-parallel graphs and establish restrictions on smallest counterexamples. The full primary PDF was downloaded; SHA-256 `2dfaff6cef5cc8256743531cd05682c95d27198e836050994d0f34583340203e`.
- [Beke, Csáji, Csikvári and Pituk, Advances in Mathematics 446 (2024), 109674](https://doi.org/10.1016/j.aim.2024.109674), disprove the general matroid extension. Their uniform-matroid thickenings are not graph counterexamples.
- [Chen, Jin and Ma, arXiv:2610.27706](https://arxiv.org/abs/2610.27706), 20 October 2026, Section 5, reduce minimum-size matroid counterexamples to disjoint series and parallel pairs. The minor operations and dual argument apply to the graphical minimum-counterexample problem as explained in the repository's prior note. The full section was read. SHA-256 `3bafa90f723c2a2a4b53cfd25cae28ba1bd44a611c3d14698592c30a32aa6569`.
- [Váli, arXiv:2611.15008](https://arxiv.org/abs/2611.15008), 11 November 2026, still treats the graph assertion as open and proves density ranges. The introduction and exact main theorems were read from the downloaded full primary PDF. SHA-256 `303a5277b8eed399f35764b5b83dacb4b6dd91b0b361666d4c33b09b188485a3`.
- [Xu, Dong and Xu, arXiv:2610.25817](https://arxiv.org/abs/2610.25817), cover the chordal-graph case; [Chen and Xie, arXiv:2609.33680](https://arxiv.org/abs/2609.33680), cover joins. These restricted claims are already credited in the repository note. They are not treated as full resolutions.
- The [sharp matroid threshold](https://arxiv.org/abs/2610.06589) uses an axis parameter strictly greater than two. It does not settle the graph assertion at two.

The complete local Principia archive content search found no Merino–Welsh claim. The repository issue search found only the existing issue 44. This is an initial current-status screen, not a universal priority guarantee; any proposed new theorem needs a separate exact-claim audit before promotion.

## Why this target

The assertion has attracted work from 1999 through current 2026 papers and concerns three central graph-counting invariants. A complete proof would identify a graph-specific reason why spanning trees are controlled by the two opposing classes of orientations. A counterexample would overturn that proposed relation. The known failure for general matroids makes the distinction mathematically substantive: a successful argument must use more than the bare deletion–contraction axioms.

This is a stronger significance case than the recently proposed Grippo–Lin–Moyano–Vera extremal perfect-edge-domination count, which this lane has parked before computation. Tuza's triangle packing/covering conjecture is another established high-value alternative, but the current lane has a more concrete inherited reduction for Merino–Welsh. Chvátal's hereditary-family conjecture has prior full proof manuscripts, including independent later treatments, and is excluded. Seymour's second-neighborhood conjecture has a prior public claimed full proof that this lane has not independently verified; it is parked as a priority conflict, not declared settled here.

## Attack and stopping rules

The existing note proves that, in a minimum-edge graph counterexample, a uniform spanning tree meets every parallel pair with probability strictly between three fifths and four fifths, and contains both edges of every series pair with probability strictly between one fifth and two fifths. Compressing pairs gives edge conductances two and one half and permits exact determinant and effective-resistance calculations.

The proposed route is to couple these marginal restrictions across cycles or cuts, or across several replacement operations. A scalar marginal or Foster-sum contradiction should be tested adversarially before use: edge-transitive cubic cores already suggest an obstruction to such a shortcut. The distinction between a graph's full orientation counts and a local fundamental-bipartite-graph inequality also matters; a local inequality can fail without refuting the global graph conjecture.

Useful progress would be a new structural reduction valid for every hypothetical minimum counterexample, a new graph-specific comparison principle, or an exact counterfamily for the entire assertion. A bounded graph screen, one degree case, a small constant adjustment, or a diagnostic failure of a proposed stronger lemma is not a resolution. If only such diagnostics emerge, record the obstacle and rotate to another substantial target rather than manufacture a result entry.
