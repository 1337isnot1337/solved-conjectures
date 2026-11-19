module

public import Conjectures.FranklSmallCyclicPools

@[expose] public section

/-! Generated exhaustive certificate for the literal period-6 pool.
Reproduce with `generate_small_cyclic_lean.py`. The Python producer is not
trusted: `checked` is proved by Lean's kernel evaluator. -/

namespace FranklSmallCyclic.Period6

def tree : SearchTree (Fin 6) :=
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
              .split {1, 2, 4}
              (
                .split {0, 3, 4}
                (
                  .split {1, 3, 4}
                  (
                    .split {2, 3, 4}
                    (
                      .split {1, 2, 3, 4}
                      (
                        .split {0, 1, 5}
                        (
                          .split {0, 2, 5}
                          (
                            .split {1, 2, 5}
                            (
                              .split {0, 1, 2, 5}
                              (
                                .split {0, 3, 5}
                                (
                                  .split {2, 3, 5}
                                  (
                                    .split {0, 4, 5}
                                    (
                                      .split {1, 4, 5}
                                      (
                                        .split {0, 1, 4, 5}
                                        (
                                          .split {2, 4, 5}
                                          (
                                            .split {3, 4, 5}
                                            (
                                              .split {0, 3, 4, 5}
                                              (
                                                .split {2, 3, 4, 5}
                                                (
                                                  .empty)
                                                (
                                                  .twoPoint {2, 3, 4, 5} 2 3))
                                              (
                                                .twoPoint {0, 3, 4, 5} 0 3))
                                            (
                                              .twoPoint {3, 4, 5} 3 4))
                                          (
                                            .twoPoint {2, 4, 5} 2 4))
                                        (
                                          .twoPoint {0, 1, 4, 5} 0 4))
                                      (
                                        .twoPoint {1, 4, 5} 1 4))
                                    (
                                      .twoPoint {0, 4, 5} 0 4))
                                  (
                                    .twoPoint {2, 3, 5} 2 5))
                                (
                                  .twoPoint {0, 3, 5} 0 5))
                              (
                                .twoPoint {0, 1, 2, 5} 0 5))
                            (
                              .twoPoint {1, 2, 5} 1 5))
                          (
                            .twoPoint {0, 2, 5} 0 5))
                        (
                          .twoPoint {0, 1, 5} 0 5))
                      (
                        .split {0, 1, 5}
                        (
                          .split {0, 3, 5}
                          (
                            .twoPoint {1, 2, 3, 4} 2 4)
                          (
                            .twoPoint {0, 3, 5} 3 5))
                        (
                          .twoPoint {0, 1, 5} 1 5)))
                    (
                      .split {0, 3, 5}
                      (
                        .twoPoint {2, 3, 4} 2 4)
                      (
                        .twoPoint {0, 3, 5} 3 5)))
                  (
                    .split {0, 4, 5}
                    (
                      .split {2, 4, 5}
                      (
                        .twoPoint {1, 3, 4} 1 3)
                      (
                        .twoPoint {2, 4, 5} 4 5))
                    (
                      .twoPoint {0, 4, 5} 4 5)))
                (
                  .split {2, 3, 5}
                  (
                    .twoPoint {0, 3, 4} 0 4)
                  (
                    .twoPoint {2, 3, 5} 3 5)))
              (
                .split {0, 1, 5}
                (
                  .twoPoint {1, 2, 4} 2 4)
                (
                  .split {0, 3, 4}
                  (
                    .twoPoint {0, 1, 5} 1 5)
                  (
                    .split {2, 3, 5}
                    (
                      .twoPoint {0, 3, 4} 0 4)
                    (
                      .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 5 | 3 => 3 | 4 => 4 | _ => 2))))))
            (
              .split {1, 2, 5}
              (
                .twoPoint {0, 1, 4} 0 4)
              (
                .split {2, 3, 4}
                (
                  .twoPoint {1, 2, 5} 1 5)
                (
                  .split {0, 3, 5}
                  (
                    .twoPoint {2, 3, 4} 2 4)
                  (
                    .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 4 | 3 => 3 | 4 => 5 | _ => 2))))))
          (
            .split {1, 3, 4}
            (
              .split {1, 4, 5}
              (
                .split {3, 4, 5}
                (
                  .twoPoint {0, 1, 2, 3} 0 2)
                (
                  .split {0, 1, 4}
                  (
                    .split {1, 2, 4}
                    (
                      .twoPoint {3, 4, 5} 3 5)
                    (
                      .split {0, 1, 5}
                      (
                        .twoPoint {1, 2, 4} 2 4)
                      (
                        .split {0, 3, 4}
                        (
                          .twoPoint {0, 1, 5} 1 5)
                        (
                          .triple {1, 2, 4} {0, 3, 4} {3, 4, 5} 4))))
                  (
                    .split {1, 2, 5}
                    (
                      .twoPoint {0, 1, 4} 0 4)
                    (
                      .split {2, 3, 4}
                      (
                        .twoPoint {1, 2, 5} 1 5)
                      (
                        .triple {0, 1, 4} {2, 3, 4} {3, 4, 5} 4)))))
              (
                .split {0, 3, 4}
                (
                  .split {2, 3, 4}
                  (
                    .twoPoint {1, 4, 5} 1 5)
                  (
                    .split {0, 3, 5}
                    (
                      .twoPoint {2, 3, 4} 2 4)
                    (
                      .split {0, 1, 4}
                      (
                        .twoPoint {0, 3, 5} 3 5)
                      (
                        .triple {0, 1, 4} {2, 3, 4} {1, 4, 5} 4))))
                (
                  .split {2, 3, 5}
                  (
                    .twoPoint {0, 3, 4} 0 4)
                  (
                    .split {1, 2, 4}
                    (
                      .twoPoint {2, 3, 5} 3 5)
                    (
                      .triple {1, 2, 4} {0, 3, 4} {1, 4, 5} 4)))))
            (
              .split {0, 4, 5}
              (
                .split {2, 4, 5}
                (
                  .twoPoint {1, 3, 4} 1 3)
                (
                  .split {0, 3, 5}
                  (
                    .split {2, 3, 5}
                    (
                      .twoPoint {1, 3, 4} 1 4)
                    (
                      .split {1, 2, 4}
                      (
                        .twoPoint {2, 3, 5} 3 5)
                      (
                        .triple {1, 2, 4} {2, 3, 5} {2, 4, 5} 2)))
                  (
                    .split {0, 1, 4}
                    (
                      .twoPoint {0, 3, 5} 3 5)
                    (
                      .triple {0, 1, 4} {1, 3, 4} {2, 4, 5} 4))))
              (
                .split {0, 3, 5}
                (
                  .split {2, 3, 5}
                  (
                    .twoPoint {1, 3, 4} 1 4)
                  (
                    .split {1, 2, 4}
                    (
                      .twoPoint {2, 3, 5} 3 5)
                    (
                      .triple {1, 2, 4} {1, 3, 4} {0, 4, 5} 4)))
                (
                  .split {0, 1, 4}
                  (
                    .twoPoint {0, 3, 5} 3 5)
                  (
                    .triple {0, 1, 4} {0, 3, 5} {0, 4, 5} 0))))))
        (
          .split {0, 2, 5}
          (
            .split {2, 4, 5}
            (
              .twoPoint {1, 2, 3} 1 3)
            (
              .split {0, 1, 5}
              (
                .split {0, 3, 5}
                (
                  .twoPoint {2, 4, 5} 2 4)
                (
                  .split {0, 1, 4}
                  (
                    .twoPoint {0, 3, 5} 3 5)
                  (
                    .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 4 | 3 => 5 | 4 => 3 | _ => 2))))
              (
                .split {0, 3, 4}
                (
                  .twoPoint {0, 1, 5} 1 5)
                (
                  .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 5 | 3 => 4 | 4 => 3 | _ => 2)))))
          (
            .split {1, 4, 5}
            (
              .split {3, 4, 5}
              (
                .twoPoint {0, 2, 5} 0 2)
              (
                .split {0, 1, 4}
                (
                  .split {0, 3, 4}
                  (
                    .twoPoint {0, 2, 5} 2 5)
                  (
                    .triple {1, 2, 3} {0, 3, 4} {3, 4, 5} 3))
                (
                  .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 4 | 3 => 5 | 4 => 2 | _ => 3))))
            (
              .split {0, 1, 4}
              (
                .split {0, 3, 4}
                (
                  .twoPoint {0, 2, 5} 2 5)
                (
                  .pasch (fun i => match i.val with | 0 => 0 | 1 => 2 | 2 => 5 | 3 => 4 | 4 => 3 | _ => 1)))
              (
                .triple {1, 2, 3} {0, 1, 4} {1, 4, 5} 1)))))
      (
        .split {1, 3, 4}
        (
          .split {3, 4, 5}
          (
            .twoPoint {0, 2, 3} 0 2)
          (
            .split {0, 1, 4}
            (
              .split {1, 2, 4}
              (
                .twoPoint {3, 4, 5} 3 5)
              (
                .split {0, 1, 5}
                (
                  .twoPoint {1, 2, 4} 2 4)
                (
                  .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 5 | 3 => 3 | 4 => 2 | _ => 4))))
            (
              .split {1, 2, 3}
              (
                .split {1, 2, 5}
                (
                  .twoPoint {0, 1, 4} 0 4)
                (
                  .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 4 | 3 => 3 | 4 => 2 | _ => 5)))
              (
                .triple {0, 2, 3} {1, 2, 3} {3, 4, 5} 3))))
        (
          .split {0, 4, 5}
          (
            .split {2, 4, 5}
            (
              .twoPoint {1, 3, 4} 1 3)
            (
              .split {0, 1, 5}
              (
                .split {0, 3, 5}
                (
                  .twoPoint {2, 4, 5} 2 4)
                (
                  .triple {0, 2, 3} {1, 3, 4} {0, 3, 5} 3))
              (
                .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 5 | 3 => 2 | 4 => 3 | _ => 4))))
          (
            .split {1, 2, 5}
            (
              .split {2, 3, 5}
              (
                .twoPoint {0, 4, 5} 0 4)
              (
                .triple {0, 2, 3} {1, 3, 4} {2, 3, 5} 3))
            (
              .pasch (fun i => match i.val with | 0 => 0 | 1 => 2 | 2 => 3 | 3 => 4 | 4 => 5 | _ => 1))))))
    (
      .split {0, 2, 5}
      (
        .split {0, 4, 5}
        (
          .twoPoint {0, 1, 3} 1 3)
        (
          .split {1, 2, 5}
          (
            .split {2, 3, 5}
            (
              .twoPoint {0, 4, 5} 0 4)
            (
              .split {1, 2, 4}
              (
                .twoPoint {2, 3, 5} 3 5)
              (
                .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 5 | 4 => 4 | _ => 2))))
          (
            .split {0, 2, 3}
            (
              .split {2, 3, 4}
              (
                .twoPoint {1, 2, 5} 1 5)
              (
                .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 4 | 4 => 5 | _ => 2)))
            (
              .triple {0, 1, 3} {0, 2, 3} {0, 4, 5} 0))))
      (
        .split {1, 4, 5}
        (
          .split {3, 4, 5}
          (
            .twoPoint {0, 2, 5} 0 2)
          (
            .split {1, 2, 4}
            (
              .split {1, 2, 5}
              (
                .twoPoint {0, 1, 3} 0 3)
              (
                .triple {0, 2, 5} {1, 2, 5} {3, 4, 5} 5))
            (
              .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 5 | 4 => 2 | _ => 4))))
        (
          .split {0, 3, 4}
          (
            .split {2, 3, 4}
            (
              .twoPoint {1, 4, 5} 1 5)
            (
              .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 3 | 3 => 2 | 4 => 5 | _ => 4)))
          (
            .triple {0, 1, 3} {0, 3, 4} {0, 2, 5} 0)))))
  (
    .split {1, 3, 4}
    (
      .split {1, 4, 5}
      (
        .twoPoint {0, 1, 2} 0 2)
      (
        .split {0, 3, 4}
        (
          .split {2, 3, 4}
          (
            .twoPoint {1, 4, 5} 1 5)
          (
            .split {0, 1, 3}
            (
              .split {0, 3, 5}
              (
                .twoPoint {2, 3, 4} 2 4)
              (
                .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 2 | 3 => 3 | 4 => 5 | _ => 4)))
            (
              .triple {0, 1, 2} {0, 1, 3} {1, 4, 5} 1)))
        (
          .split {1, 2, 3}
          (
            .split {2, 3, 5}
            (
              .twoPoint {0, 3, 4} 0 4)
            (
              .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 2 | 3 => 3 | 4 => 4 | _ => 5)))
          (
            .triple {0, 1, 2} {1, 2, 3} {1, 4, 5} 1))))
    (
      .split {0, 4, 5}
      (
        .split {2, 4, 5}
        (
          .twoPoint {1, 3, 4} 1 3)
        (
          .split {0, 1, 5}
          (
            .split {0, 3, 5}
            (
              .twoPoint {2, 4, 5} 2 4)
            (
              .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 2 | 3 => 5 | 4 => 3 | _ => 4)))
          (
            .triple {0, 1, 2} {1, 3, 4} {0, 1, 5} 1)))
      (
        .split {1, 2, 5}
        (
          .split {2, 3, 5}
          (
            .twoPoint {0, 4, 5} 0 4)
          (
            .pasch (fun i => match i.val with | 0 => 0 | 1 => 1 | 2 => 2 | 3 => 5 | 4 => 4 | _ => 3)))
        (
          .triple {0, 1, 2} {1, 3, 4} {1, 2, 5} 1))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem checked : check ∅ (generatorPool 6) tree = true := by decide +kernel

theorem obstruction {G : Finset (Finset (Fin 6))}
    (hspan : FranklSpanFour.CyclicSpanFour G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) : Obstruction G :=
  obstruction_of_pool_check tree checked hspan hlarge

end FranklSmallCyclic.Period6
