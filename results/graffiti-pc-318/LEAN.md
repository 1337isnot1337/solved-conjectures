# Checked Lean scope

**Result and proof credit: [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334).**
This formalization follows the contributed [proof and sharpness example](PROOF.md).
The authorship credit remains unchanged.

`Graffiti318.conjecture318` proves the all-order theorem for every finite simple connected graph with at least two vertices.
Its hypothesis compares the maximum even-distance count with the number of complement edges.
Its conclusions cover every total dominating set, every inclusion-minimal total dominating set, and the total domination number.

## Definitions and exact theorem

The graph is a Mathlib `SimpleGraph`.
`evenDistanceCount G v` counts vertices `w` for which `Even (G.dist v w)` holds.
This count includes `v`, whose distance from itself is zero.
`missingEdgeCount G` is `Gᶜ.edgeFinset.card`, so each undirected complement edge contributes once.

`TotalDominating G D` requires every vertex to have a neighbor in `D`.
This requirement includes vertices in `D`.
`MinimalTotalDominating` uses inclusion, while `MinimumTotalDominating` compares cardinalities.
`WellTotalDominated` requires every minimal total dominating set to have minimum cardinality.

`totalDominationNumber G` is the infimum of the cardinalities of all total dominating sets.
The theorem proves that a total dominating pair exists before it identifies this infimum as two.

The main declaration has this statement:

```lean
theorem Graffiti318.conjecture318
    {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (hconnected : G.Connected) (horder : 2 ≤ Fintype.card V)
    (hbound : Graffiti318.missingEdgeCount G ≤ Graffiti318.maxEvenDistanceCount G) :
    (∀ D : Finset V, Graffiti318.TotalDominating G D →
      ∃ a b : V, a ∈ D ∧ b ∈ D ∧ G.Adj a b ∧
        Graffiti318.TotalDominating G {a,b}) ∧
    (∀ D : Finset V, Graffiti318.MinimalTotalDominating G D → D.card = 2) ∧
    Graffiti318.WellTotalDominated G ∧ Graffiti318.totalDominationNumber G = 2
```

Adjacency implies that `a` and `b` are distinct.
The pair in the first conclusion therefore contains exactly two vertices.
The proof applies to all finite graph orders and uses no finite graph enumeration.

## Modules and exports

| Module | Main exports |
| --- | --- |
| [Graffiti318Basic.lean](../../lean/Conjectures/Graffiti318Basic.lean) | `totalDominating_contains_pair`, `minimalTotalDominating_card_eq_two`, `wellTotalDominated_of_uniqueNonneighborAway` |
| [Graffiti318.lean](../../lean/Conjectures/Graffiti318.lean) | `evenDistanceCount_le_complement_degree_add_one`, `remaining_missing_edges_le_one`, `conjecture318` |
| [Graffiti318Sharpness.lean](../../lean/Conjectures/Graffiti318Sharpness.lean) | `sharp_distance`, `sharp_four_minimalTotalDominating`, `sharpness` |

All names in this table belong to the `Graffiti318` namespace.
The counting proof leaves at most one complement edge after it removes the edges incident to a suitable vertex.
The structural proof then extracts an adjacent total dominating pair from each total dominating set.

## Sharpness

`sharpGraph` has vertex type `Fin 5`.
Vertex `0` is universal, and the other edges are `{1,2}` and `{3,4}`.
The proof uses actual graph distances to establish the following facts:

| Export | Checked statement |
| --- | --- |
| `sharp_connected` | The graph is connected. |
| `sharp_missingEdgeCount` | The complement has four edges. |
| `sharp_evenDistanceCount` | The count is one at vertex `0` and three at every other vertex. |
| `sharp_maxEvenDistanceCount` | The maximum count is three. |
| `sharp_pair_totalDominating` | `{0,1}` is a total dominating set. |
| `sharp_four_minimalTotalDominating` | `{1,2,3,4}` is an inclusion-minimal total dominating set. |
| `sharp_totalDominationNumber` | The total domination number is two. |
| `sharp_not_wellTotalDominated` | The graph is not well total dominated. |

`sharpness` combines these facts and proves the relaxed inequality `missingEdgeCount sharpGraph - 1 ≤ maxEvenDistanceCount sharpGraph`.
Thus the one-unit relaxation of the original hypothesis admits this counterexample.
The finite checks for this explicit graph use `decide +kernel`.

## Local verification receipt

On 2026-11-18 (America/Chicago), all three modules passed source compilation and independent `leanchecker` replay.
The source compilation produced no warnings or errors.
The toolchain is `leanprover/lean4:v4.35.0`.
The pinned Mathlib revision is `56a005855ea17e0b0958f73ec801ae140b0a1679`.

The transitive axiom audit covered these exports:

```lean
import Conjectures.Graffiti318Sharpness

#print axioms Graffiti318.totalDominating_contains_pair
#print axioms Graffiti318.evenDistanceCount_le_complement_degree_add_one
#print axioms Graffiti318.conjecture318
#print axioms Graffiti318.sharp_distance
#print axioms Graffiti318.sharpness
```

Each audit reported only `propext`, `Classical.choice`, and `Quot.sound`.
The source contains no `sorry`, `admit`, `native_decide`, custom axiom, or `unsafe` declaration.
Local receipts and hosted CI results are separate. All three graph modules
are registered in the accepted package through `Conjectures`, the required
endpoint audit, and the ordinary kernel-replay gate. Integration is tracked in
issue [#15](https://github.com/1337isnot1337/solved-conjectures/issues/15).

The [hosted Candidate base job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44448033989/job/135304859956)
passed at commit `98b3433a16e3418ee833d388c8f69c47e8b5c2b3`.
It rebuilt all three graph modules, audited declarations by owning module
(including private theorems), and independently replayed their kernels.
That job also checked other family and helper modules: its combined receipt
contains 798 project theorems and 31 project modules.

From the `lean` directory, run these checks sequentially:

```bash
for proof_module in Graffiti318Basic Graffiti318 Graffiti318Sharpness; do
  LEAN_NUM_THREADS=1 lake env lean -j1 -M4500 \
    -DwarningAsError=true -Dlinter.all=false \
    -o ".lake/build/lib/lean/Conjectures/${proof_module}.olean" \
    "Conjectures/${proof_module}.lean" || exit 1
  LEAN_NUM_THREADS=1 lake env leanchecker "Conjectures.${proof_module}" || exit 1
done
```
