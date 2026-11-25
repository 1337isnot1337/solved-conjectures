# Ferroni–Morales–Panova’s cylindric Ehrhart-positivity conjecture

**Partial Lean verification of the existing standard-boundary proof.** This checks three general steps of §5 of the [written resolution](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/fmp-cylindric/PROOF.md). It is not a new mathematical discovery, does not verify all-shape positivity, and does not change the catalogue status on `main`. The [relaxed-seam counterexamples](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/fmp-cylindric/FORMALIZATION.md) are separate; see #460 and #607. The newly checked sections apply to arbitrarily many cells and rows, not a finite range.

| Module | What the checker establishes |
| --- | --- |
| `FMPCylindricIdealCuts` | For any finite preorder and chain lengths `a,b`, splitting a monotone map at color `a` gives an explicit equivalence to two maps on a lower ideal and its complement. The proof counts each cut separately and establishes the exact finite sum identity. |
| `FMPCylindricBoundary` | A set of cells closed under earlier same-row cells, earlier occupied rows in a column, and the predecessor at the periodic seam is a row prefix. Its cutoff is a weakly decreasing periodic boundary between the two original boundaries. This is the geometric cut lemma, not yet an order isomorphism for the full cell-poset construction. |
| `FMPCylindricCoefficient` | For rational polynomials obeying the count identity at all nonnegative natural arguments, the translation and derivative identities follow by polynomial uniqueness. Nonnegative constant and linear coefficients for every shape then imply nonnegativity in every degree. |

The proof still needs the identification of actual cell-order restrictions with the two cut diagrams, the determinant identity for the standard-boundary count, and the single-linear-coefficient positivity argument using cylinder-path cancellation. These gaps are not hypotheses of a theorem advertised as complete. We do not address the original pinned boundary convention here.

Ferroni, Morales and Panova posed the question ([Conjecture 7.9](https://doi.org/10.1112/plms.70204)); Proposition 3.1 gives the order-polynomial coproduct. Cinna Davis is credited for the written repository argument; the earlier Gessel–Krattenthaler determinant is credited in the [source audit](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/fmp-cylindric/AUDIT.md). This checkpoint makes no new claim of priority.

Pinned Lean 4.35.0, Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`: all three strict compilations and stock kernel replays passed. [Target audit](TargetAudit.lean) checked 53 module-owned declarations, including 38 theorems, eight private declarations and seven named endpoints; only `propext`, `Classical.choice`, and `Quot.sound` were allowed. [Exact source receipt](lean-receipt.json). Aggregate CI and site publication were not run for this research-only checkpoint.
