import Conjectures.LiBasic
import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Matching
import Mathlib.Combinatorics.SimpleGraph.Hall

/-!
# Connected partitions of type `(3, 2^14)` in `Li.T`

This file records the count of connected partitions of type `(3, 2^{14})` of the 31-vertex
tree `Li.T` of `Conjectures/LiBasic.lean`, which is `b_{(3,2^{14})}(Li.T) = 8` as asserted
in `results/li-coefficient-sign/PROOF.md`.

## Contents

* `edgeList`: the 30 edges of `Li.T`;
* `impossible_walk`, `eq_of_reachable_of_isolated`: triviality of any walk ending at a
  vertex that has no neighbours (the core step of leaf removal in a forest);
* `allTriples`: the 33 listed connected triples of `Li.T`;
* `goodTriples`: the 8 connected triples whose complement in `T` has a perfect matching;
* `good1`–`good8`: explicit perfect matchings on the complement of each of the 8 triples,
  checked by kernel computation;
* `goodTriples_card`: the list count `8`.  The actual connected-partition count
  `b_{(3,2^14)}(Li.T) = 8` is proved in `Conjectures/LiTriplesFinal.lean`.

## What is proved and what is not

Proved here: the vertex data of `Li.T`; the listed connected triples; for each of the eight
triples `{0,1,16}, {16,17,18}, …, {28,29,30}` an explicit perfect matching of its
complement in `T`; and the count `goodTriples.length = 8`.

The bridge from these data to the actual connected partitions of type `(3, 2^14)` is
completed in `Conjectures/LiTriplesFinal.lean` via uniqueness of perfect matchings in a
tree and the resulting bijection with `goodTriples`.
-/

open SimpleGraph

namespace Li
namespace LiTriples2

/-! ## The certified data of `Li.T` -/

instance instDecRel : DecidableRel Li.T.Adj := by
  unfold Li.T
  intro u v
  unfold Li.pathEdges
  exact inferInstanceAs (Decidable (u ≠ v ∧ ((u, v) ∈ Li.pathEdges ∨ (v, u) ∈ Li.pathEdges)))

/-- The 30 edges of `Li.T`, as a literal list of unordered pairs. -/
def edgeList : List (Fin 31 × Fin 31) :=
  [(0, 1), (0, 2), (2, 3), (0, 4), (4, 5), (5, 6), (6, 7), (7, 8), (8, 9), (9, 10), (10, 11), (11, 12),
   (12, 13), (13, 14), (8, 15), (0, 16), (16, 17), (17, 18), (18, 19), (19, 20), (20, 21), (21, 22),
   (22, 23), (23, 24), (24, 25), (25, 26), (26, 27), (27, 28), (28, 29), (29, 30)]

/-! ## Counting helpers -/

theorem card_sdiff_singleton {α : Type*} [DecidableEq α] (s : Finset α) (k : α) (hk : k ∈ s) :
    (s \ {k}).card = s.card - 1 := by
  rw [Finset.sdiff_singleton_eq_erase, Finset.card_erase_of_mem hk]

theorem even_of_eq_sub_one_add {c : ℕ} (h : c - 1 + (c - 1) = c) : Even c := by
  rcases Nat.even_or_odd c with hc | ⟨k, hk⟩
  · exact hc
  · omega

/-! ## Triviality of walks into a sink -/

/-- A walk into a vertex with no neighbours reachable from it is trivial. -/
theorem impossible_walk {G : SimpleGraph V} {w : V} (hiso : ∀ u, ¬ G.Adj w u) :
    ∀ (n : ℕ) (u : V) (p : G.Walk u w), p.length = n → u = w := by
  intro n
  induction n using Nat.strong_induction_on with
  | _ n ih =>
    intro u p hpn
    cases p with
    | nil => rfl
    | @cons a b' c' hab hbc =>
      have hpn' : hbc.length + 1 = n := by
        simpa only [SimpleGraph.Walk.length_cons] using hpn
      have hlt : hbc.length < n := by omega
      exact absurd ((ih _ hlt b' hbc rfl) ▸ hab) (fun h => hiso _ h.symm)

/-- A vertex reachable from an isolated vertex is that vertex. -/
theorem eq_of_reachable_of_isolated {G : SimpleGraph V} {w : V}
    (hiso : ∀ u, ¬ G.Adj w u) : ∀ u, G.Reachable u w → u = w := by
  intro u h
  rcases h with ⟨p⟩
  exact impossible_walk hiso _ _ p rfl

/-! ## Connected partitions and the 8 triples -/

/-- The 33 connected triples of `Li.T` as `List ℕ`s, ordered `a < b < c`. -/
def allTriples : List (List ℕ) :=
  [ [0, 1, 2], [0, 1, 4], [0, 1, 16], [0, 2, 3], [0, 2, 4], [0, 2, 16],
    [0, 4, 5], [0, 4, 16], [0, 16, 17],
    [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9], [7, 8, 15],
    [8, 9, 10], [8, 9, 15], [9, 10, 11], [10, 11, 12], [11, 12, 13], [12, 13, 14],
    [16, 17, 18], [17, 18, 19], [18, 19, 20], [19, 20, 21], [20, 21, 22],
    [21, 22, 23], [22, 23, 24], [23, 24, 25], [24, 25, 26], [25, 26, 27],
    [26, 27, 28], [27, 28, 29], [28, 29, 30] ]

theorem allTriples_card : allTriples.length = 33 := rfl

/-- The 8 good connected triples of `Li.T`. -/
def goodTriples : List (List ℕ) :=
  [ [0, 1, 16], [16, 17, 18], [18, 19, 20], [20, 21, 22],
    [22, 23, 24], [24, 25, 26], [26, 27, 28], [28, 29, 30] ]

theorem goodTriples_card : goodTriples.length = 8 := rfl

/-! ## Explicit perfect matchings on the complements -/

/-- `Fin 31` from a numeral `< 31`. -/
def f (n : ℕ) : Fin 31 := ⟨n % 31, Nat.mod_lt _ (by decide)⟩

/-- The complement of a vertex set. -/
def compS (S : Finset (Fin 31)) : Finset (Fin 31) := Finset.univ \ S

/-- Decidable check that `edges` is a perfect matching on `S ⊆ Fin 31` inside `T`. -/
def IsPerfectMatchingOn (edges : List (Fin 31 × Fin 31)) (S : Finset (Fin 31)) : Bool :=
  let allEdges : Bool := edges.all (fun (a, b) => Li.T.Adj a b && a ∈ S && b ∈ S)
  let endsList : List (Fin 31) := edges.flatMap (fun (a, b) => [a, b])
  let allDistinct : Bool := (endsList.eraseDups.length == endsList.length)
  let covers : Bool := (endsList.eraseDups.toFinset == S)
  allEdges && allDistinct && covers

/-- Perfect matching on `T - {0,1,16}`. -/
def m1 : List (Fin 31 × Fin 31) :=
  [(f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12), (f 13, f 14),
   (f 17, f 18), (f 19, f 20), (f 21, f 22), (f 23, f 24), (f 25, f 26), (f 27, f 28), (f 29, f 30)]

theorem good1 : IsPerfectMatchingOn m1 (compS {0, 1, 16}) = true := by decide

theorem good2 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 19, f 20), (f 21, f 22), (f 23, f 24), (f 25, f 26), (f 27, f 28),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {16, 17, 18}) = true := by decide

theorem good3 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 21, f 22), (f 23, f 24), (f 25, f 26), (f 27, f 28),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {18, 19, 20}) = true := by decide

theorem good4 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 18, f 19), (f 23, f 24), (f 25, f 26), (f 27, f 28),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {20, 21, 22}) = true := by decide

theorem good5 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 18, f 19), (f 20, f 21), (f 25, f 26), (f 27, f 28),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {22, 23, 24}) = true := by decide

theorem good6 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 18, f 19), (f 20, f 21), (f 22, f 23), (f 27, f 28),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {24, 25, 26}) = true := by decide

theorem good7 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 18, f 19), (f 20, f 21), (f 22, f 23), (f 24, f 25),
      (f 29, f 30)] : List (Fin 31 × Fin 31))
    (compS {26, 27, 28}) = true := by decide

theorem good8 : IsPerfectMatchingOn
    ([(f 0, f 1), (f 2, f 3), (f 4, f 5), (f 6, f 7), (f 8, f 15), (f 9, f 10), (f 11, f 12),
      (f 13, f 14), (f 16, f 17), (f 18, f 19), (f 20, f 21), (f 22, f 23), (f 24, f 25),
      (f 26, f 27)] : List (Fin 31 × Fin 31))
    (compS {28, 29, 30}) = true := by decide

/-- The number of good triples is `8`.  The actual connected-partition count is
`Li.LiFinal325.b_triple_pairs` in `Conjectures/LiTriplesFinal.lean`. -/
theorem goodTriples_count : goodTriples.length = 8 := goodTriples_card

end LiTriples2
end Li
