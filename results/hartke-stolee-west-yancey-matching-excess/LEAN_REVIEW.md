# Hartke–Stolee–West–Yancey matching-excess conjecture

Independent mathematical and source-semantics review: passed for the frozen 22-module candidate. The reviewer read all 22 Lean modules, including the three binary-arithmetic dependencies, the recorded proof, and the primary statement. This review made no source edits and ran no Lean compiler. The separate fresh source/audit/kernel checkpoint was still in progress at the time of this review; its result must be bound independently before completion is reported.

## Target and source

The target is Conjecture 9.15, printed page 21 of Hartke, Stolee, West and Yancey's author manuscript dated 5 May 2011, *Extremal graphs with a given number of perfect matchings*. The primary document defines the tail minimum over all matching counts q at least p and conjectures its divergence. Construction 1.1 gives the two-vertex Hetyei extension, Theorem 1.2 credits eventual stabilization to Dudek and Schmitt, and Theorem 2.3 supplies the original binary construction. These statements were checked directly in [the author manuscript](https://dwest.web.illinois.edu/pubs/perfmat.pdf), especially printed pages 2, 4 and 21.

The argument being formalized is the existing repository proof recorded by Cinna Davis at commit `a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7`, `results/hartke-stolee-west-yancey-matching-excess/PROOF.md`. The local reviewed copy is byte-identical to that commit. No claim of a new extremal upper-bound discovery or of settled worldwide priority is made here. The separate stronger growth and proposed exact upper-bound questions are outside the completed target.

## Actual graph and counting semantics

`PerfectMatching G` is the subtype of actual Mathlib subgraphs satisfying `SimpleGraph.Subgraph.IsPerfectMatching`, including the spanning requirement. `perfectMatchingCount` is their cardinality. `splitGraph` is an actual finite simple graph with an independent right class, a clique on the equally sized left class, and the specified cross edges. It is not a graph-shaped name for a path-count recurrence.

The cycle-cover equivalence is proved in both directions. Every right vertex has a unique left mate. Injectivity and equal finite cardinalities make this assignment surjective onto the left class, which excludes all left-clique edges from any perfect matching. The inverse construction gives a spanning matching from every permitted permutation. Thus the directed model genuinely counts all perfect matchings of the constructed graph, without omitting nonbipartite possibilities or quotienting by graph automorphisms.

The permutation is oriented from target to source. Away from target zero its value cannot increase. The proved fixed-above lemma and the remove/insert-return equivalence establish the exact return-fiber recurrence. It is therefore a count of actual permutations, not an assumed recursive proxy. The zero fiber contains precisely the identity permutation. Summing the disjoint fibers gives exactly one plus the selected increasing-path counts.

The base graph's unordered edges are bijective with ordered index pairs: one ordering encodes cross edges and the other ordering encodes left-clique edges. This proves the baseline square edge count with no double counting. Return edges are individually new. The deleted edge has source one and target u with u at least two, so it is neither a loop nor a return edge. The deletion identity subtracts exactly one actual edge.

The undeleted and deleted path weights are derived from the established recurrence. The early interval covers every residue below the Mersenne divisor, including u=2; the later binary positions are disjoint from the early positions. Their union realizes every input t with exactly t+1 perfect matchings and the stated excess bound. The size of the graph grows with t and u; no fixed-size or bounded-input restriction appears.

## Boundedness and the original extremal constant

The mate map is the actual matching involution. Switching two matched pairs along the displayed alternating four-cycle constructs a different spanning perfect matching. An output of this switch has at most four ordered-pair preimages, proved by inspecting the only new adjacency pairs. This uniform fiber bound does not assume that distinct arbitrary cycles always give distinct matchings.

The selected ordered nonmatching pairs and their mate images lie in the universe of ordered pairs excluding a vertex and its mate. Inclusion-exclusion, the exact degree-sum identity and the four-preimage bound prove

```math
|E(G)|\le n^2+\Phi(G)-1
```

for every graph on 2n vertices with a perfect matching. This proves the boundedness needed by the integer supremum. It is an internal bridge to the source's extremal constant, not an additional conjecture result.

`excessValues p` ranges over every simple graph on the canonical vertex set `Fin n ⊕ Fin n`, for every n. This is a labeling of all finite even orders; it does not restrict the extremal family to split graphs. The isomorphism module explicitly preserves both actual perfect-matching cardinality and unordered-edge cardinality. The empty order is harmless: it contributes only the usual empty matching at p=1.

For every positive p, the binary witness proves that the excess set is nonempty, and the universal switch bound proves that it is bounded above. The integer supremum is then proved to be attained. No boundedness, maximum, or earlier stabilization theorem is inserted as an axiom or an endpoint hypothesis.

The two-vertex extension is literal: the new leaf has only the new hub as a neighbor, so every perfect matching uses their edge. Restriction and extension are inverse equivalences of actual matchings. A separate edge-set bijection proves that exactly |V|+1 edges are added. Relabeling preserves counts and excess, and iteration attains the same maximum at every sufficiently large even order.

`extremalEdges n p` takes the finite maximum over all simple graphs on 2n labeled vertices with p matchings; its zero convention for an empty family does not affect the eventual theorem because existence is proved there. `extremalEdges_eventually` gives the exact formula n squared plus `matchingExcess p`, and `matchingExcess_unique` identifies any other eventual constants with this definition. These bridges rule out the weaker interpretation of proving divergence only for a chosen witness-excess sequence.

## Arithmetic and tail quantifiers

The residue argument folds a positive integer's high and low binary blocks. The folded number is positive, smaller, still divisible by the Mersenne number, and has no larger binary weight. This is a proved equivalent implementation of the recorded cyclic-carry argument.

The long-division estimate uses the length of the nonzero remainder as a potential. When the input bit and quotient bit are both zero, that potential increases by one; otherwise the lost potential costs at most u. The nonzero remainder condition is established for every positive prefix by the sparse residue theorem. This proves the same all-input estimate as the source's disjoint zero-run count, without postulating an algorithmic invariant.

The two graph witnesses discharge both arithmetic lower-bound premises. The resulting binary-length quadratic inequality yields the stated square-root bound for every p at least two; `binaryLength_eq_log` supplies the literal integer-log formulation. There is no input cutoff in the quantitative theorem.

The tail set is the actual image of every q at least p. It is nonempty and bounded below for positive p, and its integer infimum is proved to be attained. The explicit cutoff is uniform over all q in the tail. `conjecture_9_15` therefore proves the full tail-minimum divergence, not merely divergence along a subsequence or of a single selected construction. The optional uniqueness wrapper preserves this conclusion for any constants specified by the original eventual extremal formula.

## Frozen binding and verification boundary

The source manifest SHA256 is `91deced4f62f6378d2aa46617cac56d51c0f668e6a64483a26f8947c40eff042`. All 22 reviewed source hashes match that manifest. The accompanying JSON records the exact manifest hash and per-module hashes. Mathematical review found no remaining statement or proof-scope gap. Final fresh strict compilation, complete all-owned/private axiom audit, exact stock-kernel replay, and independent evidence validation remain separate gates; this review does not claim their result in advance.
