import Conjectures.LineSizeTuples
import Mathlib.Data.List.GetD

/-! Sorted lists and finite vectors realize the canonical tuple enumeration. -/
namespace LineSize

open Finset

theorem tupleValues_eq_of_sortedGT (l : List ℕ) (hl : l.SortedGT) :
    tupleValues l.toFinset=l := by
  unfold tupleValues
  apply (List.toFinset_sort (r := (· ≥ ·)) hl.nodup).mpr
  exact hl.pairwise.imp (fun {_ _} h => h.le)

theorem tupleAt_eq_getD_of_sortedGT (l : List ℕ) (hl : l.SortedGT) (i : ℕ) :
    tupleAt l.toFinset i=l.getD i 0 := by
  rw [tupleAt,tupleValues_eq_of_sortedGT l hl]

theorem tupleCost_eq_of_sortedGT (l : List ℕ) (hl : l.SortedGT) :
    tupleCost l.toFinset=pointCost (fun i => l.getD i 0) l.length := by
  unfold tupleCost
  rw [List.toFinset_card_of_nodup hl.nodup]
  apply congrArg (fun f => pointCost f l.length)
  funext i
  exact tupleAt_eq_getD_of_sortedGT l hl i

theorem tupleAt_append_left (l t : List ℕ) (hlt : (l++t).SortedGT)
    (i : ℕ) (hi : i < l.length) : tupleAt (l++t).toFinset i=l.getD i 0 := by
  rw [tupleAt_eq_getD_of_sortedGT (l++t) hlt,List.getD_append l t 0 i hi]

theorem tupleAt_append_right (l t : List ℕ) (hlt : (l++t).SortedGT)
    (i : ℕ) (hi : l.length ≤ i) :
    tupleAt (l++t).toFinset i=t.getD (i-l.length) 0 := by
  rw [tupleAt_eq_getD_of_sortedGT (l++t) hlt,List.getD_append_right l t 0 i hi]

theorem ofFn_sortedGT_of_decreasing (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k) :
    (List.ofFn (fun i : Fin k => d i.val)).SortedGT := by
  apply List.sortedGT_ofFn_iff.mpr
  intro i j hij
  exact hd i.val j.val hij j.isLt

theorem ofFn_getD (d : ℕ → ℕ) (k i : ℕ) (hi : i < k) :
    (List.ofFn (fun j : Fin k => d j.val)).getD i 0=d i := by
  rw [List.getD_eq_getElem _ 0 (by simpa only [List.length_ofFn] using hi),
    List.getElem_ofFn]

theorem tupleAt_ofFn (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k)
    (i : ℕ) (hi : i < k) :
    tupleAt (List.ofFn (fun j : Fin k => d j.val)).toFinset i=d i := by
  rw [tupleAt_eq_getD_of_sortedGT _ (ofFn_sortedGT_of_decreasing d k hd),ofFn_getD d k i hi]

theorem card_ofFn_of_decreasing (d : ℕ → ℕ) (k : ℕ) (hd : Decreasing d k) :
    (List.ofFn (fun i : Fin k => d i.val)).toFinset.card=k := by
  rw [List.toFinset_card_of_nodup (ofFn_sortedGT_of_decreasing d k hd).nodup,List.length_ofFn]

end LineSize
