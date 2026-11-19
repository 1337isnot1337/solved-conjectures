module

public import Conjectures.FranklSmallCyclicPools

@[expose] public section

/-! Generated exhaustive certificate for the literal period-4 pool.
Reproduce with `generate_small_cyclic_lean.py`. The Python producer is not
trusted: `checked` is proved by Lean's kernel evaluator. -/

namespace FranklSmallCyclic.Period4

def tree : SearchTree (Fin 4) :=
  .split {0, 1, 2}
  (
    .split {0, 1, 3}
    (
      .split {0, 2, 3}
      (
        .split {1, 2, 3}
        (
          .split {0, 1, 2, 3}
          (
            .empty)
          (
            .twoPoint {0, 1, 2, 3} 0 1))
        (
          .twoPoint {1, 2, 3} 1 2))
      (
        .twoPoint {0, 2, 3} 0 2))
    (
      .twoPoint {0, 1, 3} 0 1))
  (
    .twoPoint {0, 1, 2} 0 1)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked : check ∅ (generatorPool 4) tree = true := by decide +kernel

theorem obstruction {G : Finset (Finset (Fin 4))}
    (hspan : FranklSpanFour.CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G :=
  obstruction_of_pool_check tree checked hspan hlarge

end FranklSmallCyclic.Period4
