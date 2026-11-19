import Solitaire.Interlacing
import Mathlib.Data.Multiset.Sort
import Mathlib.Data.List.GetD

namespace SolitaireGeneral

/-- The canonical descending pile sequence, padded with zeros. -/
def columns (s : Multiset Nat) (k : Nat) : Nat :=
  (s.sort (fun a b => b ≤ a)).getD k 0

def sequencePiles (r : Nat → Nat) (N : Nat) : Multiset Nat :=
  ((Finset.range N).val.map r).filter (0 < ·)

theorem getD_zero_of_all_zero (l : List Nat) (hz : ∀ j ∈ l, j=0) (k : Nat) :
    l.getD k 0=0 := by
  induction l generalizing k with
  | nil => simp
  | cons j l ih =>
    have hj := hz j (by simp)
    have hl : ∀ q ∈ l, q=0 := fun q hq => hz q (by simp [hq])
    cases k with
    | zero => simp [hj]
    | succ k => simpa using ih hl k

theorem filter_positive_eq_nil_of_zero (l : List Nat) (hz : ∀ j ∈ l, j=0) :
    l.filter (fun j => decide (0 < j))=[] := by
  induction l with
  | nil => rfl
  | cons j l ih =>
    have hj := hz j (by simp)
    have hl : ∀ q ∈ l, q=0 := fun q hq => hz q (by simp [hq])
    simp [hj,ih hl]

theorem getD_filter_positive (l : List Nat) (hs : l.Pairwise (fun a b => b ≤ a))
    (k : Nat) : (l.filter (fun j => decide (0 < j))).getD k 0=l.getD k 0 := by
  induction l generalizing k with
  | nil => simp
  | cons j l ih =>
    obtain ⟨hj,hl⟩ := List.pairwise_cons.mp hs
    by_cases hz : j=0
    · have hall : ∀ q ∈ j::l, q=0 := by
        intro q hq
        rcases List.mem_cons.mp hq with he|he
        · omega
        · have hh := hj q he
          omega
      rw [filter_positive_eq_nil_of_zero _ hall,getD_zero_of_all_zero _ hall]
      simp
    · have hp : 0 < j := by omega
      cases k with
      | zero => simp [hp]
      | succ k => simpa [hp] using ih hl k

theorem sequencePiles_eq_list (r : Nat → Nat) (N : Nat) :
    sequencePiles r N=
      (((List.range N).map r).filter (fun j => decide (0 < j)) : Multiset Nat) := by
  rfl

/-- A decreasing finite sequence and its sorted multiset have identical
zero-padded columns. -/
theorem columns_sequencePiles (r : Nat → Nat) (N : Nat) (hr : Antitone r)
    (hz : ∀ k, N ≤ k → r k=0) (k : Nat) : columns (sequencePiles r N) k=r k := by
  let l := (List.range N).map r
  have hsort : l.Pairwise (fun a b => b ≤ a) := by
    dsimp [l]
    rw [List.pairwise_map]
    apply (List.sortedLT_range N).pairwise.imp
    intro a b hab
    exact hr (Nat.le_of_lt hab)
  have hfilter := hsort.filter (fun j => decide (0 < j))
  have hperm : ((sequencePiles r N).sort (fun a b => b ≤ a)).Perm
      (l.filter (fun j => decide (0 < j))) := by
    apply Multiset.coe_eq_coe.mp
    rw [Multiset.sort_eq]
    exact sequencePiles_eq_list r N
  have heq := hperm.eq_of_pairwise' (Multiset.pairwise_sort _ _) hfilter
  rw [columns,heq,getD_filter_positive l hsort k]
  by_cases hk : k < N
  · rw [List.getD_eq_getElem l 0 (by simp [l,hk])]
    simp [l]
  · rw [List.getD_eq_default l 0 (by simp [l]; omega),hz k (by omega)]

namespace LayerRule.Cycle

variable {L : LayerRule} {n p : Nat} [NeZero p]

/-- The chronological age profile is exactly the canonical sorted profile
of the actual state. -/
theorem columns_eq_age (C : Cycle L n p) (hn : 0 < n) (t : ZMod p) :
    columns (C.piles t)=C.age t := by
  funext k
  rw [C.piles_eq_ages]
  exact columns_sequencePiles (C.age t) n (C.age_antitone hn t)
    (C.age_eq_zero t) k

end LayerRule.Cycle
end SolitaireGeneral
