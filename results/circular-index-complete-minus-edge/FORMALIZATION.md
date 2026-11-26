# Mazák–Zrubák conjecture on complete graphs minus an edge

## Scope

This is an incomplete Lean formalization of the existing entry. The checked
checkpoint proves Steps 1–3 of [the recorded argument](PROOF.md): a real circular
edge coloring below the integer threshold yields a linear order of the actual
edge set, with consecutive incidence and the required cyclic color pattern.
It does not yet prove the circular chromatic index equality. Its contribution
to the count of complete formalizations is zero.

The original target is Conjecture 2 of Ján Mazák and Filip Zrubák,
*Circular chromatic index of small graphs*,
[arXiv:2603.08822v1](https://arxiv.org/abs/2603.08822v1), 9 March 2026:
for every even integer `d >= 6`, deleting any one edge from `K_(d+1)` leaves
circular chromatic index `d+1`. The formal development uses arbitrary finite
vertex types and actual `SimpleGraph` edges. The intended final parameter is
`n = 2*h-1 = d+1`, so the original range is `h >= 4`.

The accepted repository proof is credited to **@aadrianvv**. Its exact source
for this checkpoint is
[`PROOF.md` at research `be913b1896316b5b0f08658b1b531cb0b260652e`](https://github.com/1337isnot1337/solved-conjectures/blob/be913b1896316b5b0f08658b1b531cb0b260652e/results/circular-index-complete-minus-edge/PROOF.md),
SHA-256 `617f5250c6d0f453fd3d3e605bba2d88ffce870e4e68d197d819f667177388e6`.
The source's literature search was bounded to 21 November 2026. This
formalization does not establish a broader priority claim. Guichard's theorem
is credited in that source through Zhu's survey; Guichard's original paper was
not directly read. The direction used here is proved in Lean, not assumed.

## Actual objects and terminal statement

The reused `CircularIndex.RealCircularEdgeColoring G r` is an actual function
from `G.edgeSet` to the interval `[0,r)`. Incident distinct edges have absolute
color difference at least `1` and at most `r-1`. The circular index is the infimum
of the set of radii admitting such a coloring.

The ten new modules end at
[`real_coloring_gives_linear_order`](../../lean/Conjectures/CircularCompleteMinusEdgeOrder.lean).
Its hypotheses are `h >= 2`, an actual finite graph with `2*h-1` vertices and
`(2*h-1)*(h-1)-1` edges, a nonempty edge type, a real circular coloring, and
`r < 2*h-1`. Its conclusion supplies an actual proper coloring `C'` and a
`LinearEdgeOrder C'`. The latter contains an equivalence

**Lean excerpt**

```lean
G.edgeSet ≃ Fin (Fintype.card G.edgeSet)
```

and proves that every directed consecutive-color adjacency increases the
position, consecutive positions are incident, and the color of each edge is
its position plus one modulo `2*h-1`. There is no assumed Hamiltonian order,
acyclic certificate, expansion axiom, or numerical screen in this endpoint.
The result is stated for every graph with these actual counts; the separate
[graph module](../../lean/Conjectures/CircularCompleteMinusEdgeGraph.lean)
proves the required counts for `(top : SimpleGraph V).deleteEdges {s(u,v)}`
when `u != v`. It also constructs an actual coloring giving the elementary
upper bound. The lower bound is still missing.

## Proof correspondence

| Modules | Checked mathematical content |
| --- | --- |
| `Acyclic` | Floors a real circular coloring; the explicit real potential decreases along the reversed cyclic-color relation, proving well-foundedness. This is the needed direction of Step 1. |
| `Matchings`, `Classes`, `Rotation` | Actual endpoint coverage and Hall transversals; cardinalities of the actual color fibers; the unique deficient class; rotation putting it at color zero. |
| `Sources`, `Transversals` | The exact three-versus-one missing-vertex conditions, unique source and sink, endpoint expansion, and the source/sink deficits needed by Hall. |
| `Levels`, `Path` | Finite well-founded levels, predecessor and coverage facts, and a spanning path from an injective successor map with exactly one source and sink. Every original arc increases the resulting order. |
| `Graph`, `Order` | Actual complete-minus-edge cardinalities and upper coloring; assembly of the all-edge order from any hypothesized smaller real radius. |

The formal Step 3 is a finite Hall reformulation of the source's level
argument. This adaptation is proved, not added as an extra premise. The
expansion conditions give bijections between successive full matching classes;
the last full class with its sink removed maps bijectively to the deficient
class; and the deficient class maps to the first full class with precisely the
source omitted. The selected finite digraph has indegree one except at the
source and outdegree one except at the sink. Well-foundedness excludes a
separate cycle or component. Its path contains every actual edge. Any original
arc pointing backwards would create a directed cycle, so all original arcs
increase the path order. The source and sink exclusions are explicit in the
Lean construction.

An [independent source and statement review](LEAN_REVIEW.md) checked all ten
new frozen modules against Steps 1–3 and found no scope mismatch. The review
also records the generic graph hypotheses rather than treating the final
complete-minus-edge specialization as an implicit assumption.

## Verification

The [original receipt](../../docs/verification/lean-circular-complete-minus-edge-partial-20261124-162051/receipt.json)
finished at **2026-11-24 20:06:40 UTC**. Its SHA-256 is
`274987ac5b90724de1be2ff3a401efa84cf533143c05d5af319759662faa307e`.
All sixteen exact project modules were rebuilt using the pinned Lean 4.35.0,
with warnings treated as errors. The closure includes ten new modules and six
unchanged `CircularIndex` dependencies; those dependencies are reused, not
counted as new results.

The generated all-owned audit includes every declaration owned by the exact
closure, including any private declarations. It checked **526 declarations,
417 theorem declarations, zero private declarations, and all twelve required
endpoints**. The only transitive axioms are `propext`, `Classical.choice`, and
`Quot.sound`. There is no `sorry`, `admit`, project-specific axiom, or
native-computation axiom. The pinned stock checker replayed exactly the same
sixteen modules. The receipt binds source files, object files, compiler and
checker executables, verification controls, every command log, generated audit
source, and declaration inventory. Source/audit compilation used two threads;
stock replay used one thread.

The [preserved evidence directory](../../docs/verification/lean-circular-complete-minus-edge-partial-20261124-162051/)
contains the unchanged receipt and logs, declaration inventory, generated audit,
original verification driver, its six control snapshots, and independent
review. Publication reuses that exact checked proof evidence after comparing
all sixteen source hashes and six original control hashes. A portable preflight
checks the publication registrations and exact closure. A preflight is not a
new compilation, axiom audit, or kernel replay.

To reproduce the scoped proof check from a normal checkout with the pinned
Lean toolchain and Mathlib cache installed:

```sh
cd lean
lake env python3 ../scripts/verify_circular_complete_minus_edge.py
```

The dedicated workflow invokes that full command and uploads its evidence.
The original successful local run remains distinct from any later hosted run.
The portable runner's `--preflight` option checks only registration, exact
closure, source/control hashes, and checker pinning. This result-level gate
does not replace `scripts/verify_lean.sh`; repository-wide and hosted/deployment
limitations remain separately tracked in
[#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

## Remaining obligations

This frozen checkpoint stops after Step 3. The following work is not included
in its receipt:

1. Step 4: actual vertex runs, gap saturation, and the distinguished vertex.
2. Step 5: special-column counts and paired starts, construction of cuts from
   actual incident-edge traces, and the table's unique-meeting and boundary
   bijection properties.
3. Steps 6–7: boundary separation, ranks, and the forced junction positions.
4. Step 8: two distinct normal vertices forced to meet at two positions.
5. Assembly of the no-smaller-real-coloring theorem and the infimum lower
   bound, giving the full equality for every even `d >= 6`.

Later draft modules are deliberately outside this frozen checkpoint and its
verification claim. The exceptional `d=4` value and the distinct supplements
in the complete-minus-a-few-edges entry are also outside this formalization.
