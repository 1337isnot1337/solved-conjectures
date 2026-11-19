module

public import Conjectures.FranklSmallCyclicPools

@[expose] public section

/-! Generated exhaustive certificate for the literal period-5 pool.
Reproduce with `generate_small_cyclic_lean.py`. The Python producer is not
trusted: `checked` is proved by Lean's kernel evaluator. -/

namespace FranklSmallCyclic.Period5

def tree : SearchTree (Fin 5) :=
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
            .split {0, 1, 4}
            (
              .split {0, 2, 4}
              (
                .split {1, 2, 4}
                (
                  .split {0, 1, 2, 4}
                  (
                    .split {0, 3, 4}
                    (
                      .split {1, 3, 4}
                      (
                        .split {0, 1, 3, 4}
                        (
                          .split {2, 3, 4}
                          (
                            .split {0, 2, 3, 4}
                            (
                              .split {1, 2, 3, 4}
                              (
                                .empty)
                              (
                                .twoPoint {1, 2, 3, 4} 1 2))
                            (
                              .twoPoint {0, 2, 3, 4} 0 2))
                          (
                            .twoPoint {2, 3, 4} 2 3))
                        (
                          .twoPoint {0, 1, 3, 4} 0 3))
                      (
                        .twoPoint {1, 3, 4} 1 3))
                    (
                      .twoPoint {0, 3, 4} 0 3))
                  (
                    .twoPoint {0, 1, 2, 4} 0 4))
                (
                  .twoPoint {1, 2, 4} 1 4))
              (
                .twoPoint {0, 2, 4} 0 4))
            (
              .twoPoint {0, 1, 4} 0 4))
          (
            .split {2, 3, 4}
            (
              .twoPoint {0, 1, 2, 3} 0 1)
            (
              .twoPoint {2, 3, 4} 2 4)))
        (
          .split {0, 3, 4}
          (
            .twoPoint {1, 2, 3} 1 2)
          (
            .twoPoint {0, 3, 4} 3 4)))
      (
        .split {1, 3, 4}
        (
          .twoPoint {0, 2, 3} 0 2)
        (
          .twoPoint {1, 3, 4} 3 4)))
    (
      .split {2, 3, 4}
      (
        .twoPoint {0, 1, 3} 0 1)
      (
        .twoPoint {2, 3, 4} 3 4)))
  (
    .split {2, 3, 4}
    (
      .twoPoint {0, 1, 2} 0 1)
    (
      .split {1, 3, 4}
      (
        .twoPoint {0, 1, 2} 0 2)
      (
        .split {0, 3, 4}
        (
          .twoPoint {0, 1, 2} 1 2)
        (
          .triple {0, 3, 4} {1, 3, 4} {2, 3, 4} 3))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked : check ∅ (generatorPool 5) tree = true := by decide +kernel

theorem obstruction {G : Finset (Finset (Fin 5))}
    (hspan : FranklSpanFour.CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G :=
  obstruction_of_pool_check tree checked hspan hlarge

end FranklSmallCyclic.Period5
