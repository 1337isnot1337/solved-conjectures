# Ádám’s conjecture

**Status: candidate; strict Lean, axiom audit and kernel replay pending.** Tracking [#514](https://github.com/1337isnot1337/solved-conjectures/issues/514).

## Primary source and attribution

A. Ádám, Research Problem 2–10, Journal of Combinatorial Theory 2 (1967), p. 393. Bernard Elspas and James Turner, [Graphs with circulant adjacency matrices](https://doi.org/10.1016/S0021-9800(70)80068-0), JCT 9 (1970), 297–307, §2, p. 299. The published undirected counterexample uses exactly the two connection sets S={1,2,7,9,14,15} and T={2,3,5,11,13,14} in Z/16Z. The displayed permutation fixes even vertices and adds 4 to odd vertices. Its inverse subtracts 4 from odd vertices. The source rules out relatively prime multipliers by considering the image of the 1- and 2-chords.

## Scope and audit

The conjecture asserts for all positive orders and loopless symmetric connection sets that their undirected circulant graphs are isomorphic exactly when their sets are related by multiplication by a unit. The formal statement uses Mathlib's actual `SimpleGraph.circulantGraph` and `SimpleGraph.Iso`, with the loopless symmetric condition explicitly checked. Finite connection sets lose no generality in a finite cyclic group. The endpoint `PublishedAdam.adams_conjecture_false` negates the entire assertion. It does not prove the later classification of orders for which the conjecture holds.

The exact source sets and permutation were independently checked by enumerating all 256 vertex pairs and all 16 candidate multipliers, including nonunits. No multiplier works. The Lean development checks the same conditions with kernel reduction, not a native computation axiom.

[Lean source](../../../lean/Conjectures/PublishedAdam.lean). Run `python3 scripts/verify_published_adam.py` for strict source compilation, transitive audit, independent kernel replay and hash receipt.

Repository main/research path searches found related circular-index work but no Ádám conjecture development; pinned Mathlib contains the reusable circulantGraph construction and graph-isomorphism definitions. This is a bounded search, not a claim of formalization priority. Published result, not an original discovery.
