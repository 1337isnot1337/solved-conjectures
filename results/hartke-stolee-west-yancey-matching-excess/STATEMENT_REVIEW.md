# Hartke–Stolee–West–Yancey matching-excess conjecture

Independent root review of the exact statement, definitions and terminal bridges. The separate independent graph/construction review belongs to lean_environment. The frozen source gate and stock-kernel replay remain separate evidence; this report does not claim to rerun them.

## Source and exact scope

The original author manuscript is Stephen G. Hartke, Derrick Stolee, Douglas B. West and Matthew Yancey, *Extremal graphs with a given number of perfect matchings*, dated 5 May 2011, https://dwest.web.illinois.edu/pubs/perfmat.pdf. I reopened the manuscript, read its definition of f(n,p) and Theorem 1.2, and checked Conjecture 9.15 on printed page 21. The target is divergence of the minimum of c_q over all q at least p. The statements after it ask stronger rate questions; those are excluded. Construction 1.1 gives the two-vertex extension, and Theorem 2.3 gives the binary construction. The recorded repository argument at a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7 was read in full.

The frozen endpoint `HartkeMatchingExcess.conjecture_9_15` states `Tendsto tailMinimum atTop atTop`. This is the entire original tail-minimum assertion. The stronger proved bounds apply for every p at least two. No isolated graph, fixed matching count or finite range is being substituted for the original statement.

## Definitions and object identification

`PerfectMatching G` is the subtype of actual `G.Subgraph` values satisfying Mathlib's `IsPerfectMatching`, whose definition is the conjunction of `IsMatching` and `IsSpanning`. `perfectMatchingCount` is its `Nat.card`. The construction count is connected by explicit equivalences to these matchings; it is not a numerical recurrence taken as the meaning of a perfect matching.

`excessValues p` ranges over every natural half-order n and every simple graph on `Fin n ⊕ Fin n` with exactly p perfect matchings. This type is a canonical labeling of an arbitrary even vertex set, not a bipartiteness condition: the graph variable ranges over every simple graph on that type. The independently inspected isomorphism module preserves both actual matching counts and unordered edge counts. The split-clique gadget is only a witness family, not a restriction on the maximum.

The excess uses integer subtraction, so negative values are not truncated. `matchingExcess p` is the integer supremum of this set. The source proves nonemptiness for every positive p from an actual binary graph witness, boundedness using the general alternating-switch edge bound, and attainment using the discrete integer supremum theorem. There is no project-specific extremal axiom.

`extremalEdges n p` is the actual finite maximum of edge counts among all graphs on the canonical 2n-vertex type with the prescribed matching count. A zero value for an empty feasible set is harmless: the eventual formula is proved using feasible graph witnesses for every sufficiently large n. The Hetyei extension gives all such n, rather than a sparse subsequence. `matchingExcess_unique` identifies any constants satisfying the source's eventual extremal formula with the formal constants. Thus the formal definition is tied to the original c_p, not just to an auxiliary lower bound.

`tailValues p` is exactly the image of all q at least p under these constants. Its infimum is shown bounded below and attained for every positive p. This rules out an unproved attainment or nonempty-set assumption in the use of the word minimum. The p=0 convention does not enter the eventual limit.

## Terminal estimates and attribution

The divergence proof combines the actual binary and deleted-return graph witnesses with the Mersenne-division estimate. Its explicit cutoff proves a uniform lower bound for every sufficiently large p, and hence every q in the relevant tail. The square-root bound is proved in the real numbers; `binaryLength_eq_log` identifies binary length with one plus the integer base-two logarithm. `tailMinimum_sqrt_lower_bound` proves the same bound for the attained tail minimum. All constants and quantifiers agree with the recorded argument.

The wrapper credits the existing argument to Cinna Davis, the binary construction to the four original authors, the extension to Hetyei, and the original stabilization theorem to Dudek and Schmitt. The formalization proves boundedness and stabilization directly instead of assuming the cited theorem. It preserves the repository's uncertainty about historical priority. It does not claim the sharper proposed growth rate or proposed exact upper bound.

## Result

Statement and definition audit passed for the seven bound source files. No missing scope condition or proxy-object substitution was found. Final completion still requires the separate full-source proof gate, all-owned/private transitive axiom audit, stock-kernel replay, and the independent graph/construction review.
