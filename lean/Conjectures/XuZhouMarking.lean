module

public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic

@[expose] public section
namespace XuZhou
open Finset
open scoped BigOperators

variable {n : ℕ}

def leftNeighbor (j : Fin n) : Option (Fin n) :=
  if h : 0 < j.val then some ⟨j.val-1,by have := j.isLt; omega⟩ else none

def rightNeighbor (j : Fin n) : Option (Fin n) :=
  if h : j.val+1 < n then some ⟨j.val+1,h⟩ else none

def leftSize (a : Fin n→ℕ) (j : Fin n) : ℕ :=
  ((leftNeighbor j).map a).getD 0

def rightSize (a : Fin n→ℕ) (j : Fin n) : ℕ :=
  ((rightNeighbor j).map a).getD 0

def optionSet {α : Type*} (o : Option α) : Finset α :=
  match o with
  | none => ∅
  | some a => {a}

theorem optionSet_card_le_one {α : Type*} (o : Option α) : (optionSet o).card ≤ 1 := by
  cases o <;> simp [optionSet]

theorem leftNeighbor_of_succ {i j : Fin n} (h : i.val+1=j.val) :
    leftNeighbor j = some i := by
  have hp : 0 < j.val := by omega
  simp only [leftNeighbor,dite_eq_left hp,Option.some.injEq]
  apply Fin.ext
  change j.val-1=i.val
  omega

theorem rightNeighbor_of_succ {i j : Fin n} (h : i.val+1=j.val) :
    rightNeighbor i = some j := by
  have hp : i.val+1 < n := by rw [h]; exact j.isLt
  simp only [rightNeighbor,dite_eq_left hp,Option.some.injEq]
  exact Fin.ext h

/-- A large layer has two marking tokens. If both neighbors are size two,
its left token marks itself instead: the left neighbor already marks itself.
This implements duplicate-mark charging without counting duplicates. -/
def marksFrom (a : Fin n→ℕ) (i : Fin n) : Finset (Fin n) :=
  if a i=2 then {i} else if 3 ≤ a i then
    (if leftSize a i=2 ∧ rightSize a i=2 then {i} else optionSet (leftNeighbor i)) ∪
      optionSet (rightNeighbor i)
  else ∅

def marked (a : Fin n→ℕ) : Finset (Fin n) := Finset.univ.biUnion (marksFrom a)

theorem marksFrom_card_le (a : Fin n→ℕ) (i : Fin n) :
    (marksFrom a i).card ≤ a i-1 := by
  unfold marksFrom
  by_cases h : a i=2
  · simp [h]
  · by_cases hi : 3 ≤ a i
    · simp only [h,hi,ite_false,ite_true]
      refine (Finset.card_union_le _ _).trans ?_
      have hl : (if leftSize a i=2 ∧ rightSize a i=2 then ({i} : Finset (Fin n))
          else optionSet (leftNeighbor i)).card ≤ 1 := by
        split
        · simp
        · exact optionSet_card_le_one _
      have hr := optionSet_card_le_one (rightNeighbor i)
      omega
    · simp [h,hi]

theorem marked_card_le (a : Fin n→ℕ) :
    (marked a).card ≤ ∑ i,(a i-1) := by
  unfold marked
  exact Finset.card_biUnion_le.trans (Finset.sum_le_sum (fun i _ => marksFrom_card_le a i))

theorem mem_marked_of_mem_marksFrom {a : Fin n→ℕ} {i j : Fin n}
    (h : j ∈ marksFrom a i) : j ∈ marked a :=
  Finset.mem_biUnion.mpr ⟨i,Finset.mem_univ _,h⟩

theorem marked_of_two {a : Fin n→ℕ} {i : Fin n} (hi : a i=2) : i ∈ marked a :=
  mem_marked_of_mem_marksFrom (i:=i) (by simp [marksFrom,hi])

theorem marked_right_of_large {a : Fin n→ℕ} {i j : Fin n}
    (hi : 3 ≤ a i) (hij : i.val+1=j.val) : j ∈ marked a := by
  apply mem_marked_of_mem_marksFrom (i:=i)
  have hneq : a i ≠ 2 := by omega
  simp only [marksFrom,hneq,hi,ite_false,ite_true]
  apply Finset.mem_union_right
  simp [rightNeighbor_of_succ hij,optionSet]

theorem marked_left_of_large {a : Fin n→ℕ} {i j : Fin n}
    (hi : 3 ≤ a i) (hji : j.val+1=i.val) : j ∈ marked a := by
  have hleft := leftNeighbor_of_succ hji
  by_cases h : leftSize a i=2 ∧ rightSize a i=2
  · apply marked_of_two
    simpa [leftSize,hleft] using h.1
  · apply mem_marked_of_mem_marksFrom (i:=i)
    have hneq : a i ≠ 2 := by omega
    simp only [marksFrom,hneq,hi,h,ite_false,ite_true]
    apply Finset.mem_union_left
    simp [hleft,optionSet]

theorem marked_of_large_with_two_neighbors {a : Fin n→ℕ} {i : Fin n}
    (hi : 3 ≤ a i) (h : leftSize a i=2 ∧ rightSize a i=2) : i ∈ marked a := by
  apply mem_marked_of_mem_marksFrom (i:=i)
  have hneq : a i ≠ 2 := by omega
  simp only [marksFrom,hneq,hi,h,ite_false,ite_true]
  exact Finset.mem_union_left _ (Finset.mem_singleton.mpr rfl)

theorem leftSize_le_two_of_unmarked {a : Fin n→ℕ} {i : Fin n}
    (hi : i ∉ marked a) : leftSize a i ≤ 2 := by
  unfold leftSize leftNeighbor
  split
  · next h =>
    let j : Fin n := ⟨i.val-1,by have := i.isLt; omega⟩
    change a j ≤ 2
    by_contra! hn
    exact hi (marked_right_of_large (show 3 ≤ a j by omega)
      (show j.val+1=i.val by dsimp [j]; omega))
  · change (0:ℕ) ≤ 2
    decide

theorem rightSize_le_two_of_unmarked {a : Fin n→ℕ} {i : Fin n}
    (hi : i ∉ marked a) : rightSize a i ≤ 2 := by
  unfold rightSize rightNeighbor
  split
  · next h =>
    let j : Fin n := ⟨i.val+1,h⟩
    change a j ≤ 2
    by_contra! hn
    exact hi (marked_left_of_large (show 3 ≤ a j by omega) rfl)
  · change (0:ℕ) ≤ 2
    decide

theorem large_unmarked_neighbor_sum_le_three {a : Fin n→ℕ} {i : Fin n}
    (hi : i ∉ marked a) (ha : 3 ≤ a i) : leftSize a i+rightSize a i ≤ 3 := by
  have hl := leftSize_le_two_of_unmarked hi
  have hr := rightSize_le_two_of_unmarked hi
  have hb : ¬ (leftSize a i=2 ∧ rightSize a i=2) :=
    fun h => hi (marked_of_large_with_two_neighbors ha h)
  omega

end XuZhou
