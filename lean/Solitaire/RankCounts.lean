import Solitaire.ReturnTime
import Mathlib.Logic.Function.Iterate

namespace SolitaireGeneral.LayerRule

/-- Splitting birth ranks into selected and surviving ranks gives the exact
return-time recurrence, tested against any natural-valued weight. -/
theorem sum_returnTime (L : LayerRule) (j : Nat) (h : Nat → Nat) :
    (∑ r ∈ Finset.range j, h (L.returnTime (r+1))) =
      L.picked j*h 1+
        ∑ r ∈ Finset.range (L.remains j), h (1+L.returnTime (r+1)) := by
  induction j with
  | zero => simp [remains,L.zero]
  | succ j ih =>
    rw [Finset.sum_range_succ,ih]
    have hj : j+1-1=j := by omega
    by_cases hs : L.Selected (j+1)
    · have hf := L.remains_selected (j+1) (by omega) hs
      have hp : L.picked (j+1)=L.picked j+1 := by simpa [Selected,hj] using hs
      simp only [hj] at hf
      rw [L.returnTime_selected (j+1) (by omega) hs,hf,hp,Nat.add_mul]
      omega
    · have hf := L.remains_unselected (j+1) (by omega) hs
      have hp := L.picked_flat_of_not_selected (j+1) (by omega) hs
      simp only [hj] at hf hp
      rw [L.returnTime_unselected (j+1) (by omega) hs,hf,hp,Finset.sum_range_succ]
      omega

/-- Cards picked at age `k` are exactly the birth ranks with return time `k+1`. -/
theorem returnTime_count (L : LayerRule) (j k : Nat) :
    (∑ r ∈ Finset.range j, if L.returnTime (r+1)=k+1 then 1 else 0) =
      L.picked ((L.remains^[k]) j) := by
  induction k generalizing j with
  | zero =>
    rw [L.sum_returnTime j (fun t => if t=0+1 then 1 else 0)]
    have hz : (∑ r ∈ Finset.range (L.remains j),
        if 1+L.returnTime (r+1)=0+1 then 1 else 0)=0 := by
      apply Finset.sum_eq_zero
      intro r _
      have hp := L.returnTime_pos (r+1) (by omega)
      exact ite_eq_right (by omega)
    rw [hz]
    simp
  | succ k ih =>
    rw [L.sum_returnTime j (fun t => if t=(k+1)+1 then 1 else 0)]
    have hh : (fun r => if 1+L.returnTime (r+1)=(k+1)+1 then 1 else 0)=
        (fun r => if L.returnTime (r+1)=k+1 then 1 else 0) := by
      funext r
      have he : (1+L.returnTime (r+1)=(k+1)+1) ↔ L.returnTime (r+1)=k+1 := by omega
      simp only [he]
    rw [hh,ih]
    simp [Function.iterate_succ_apply]

theorem returnTime_count_up_to (L : LayerRule) (j N k : Nat) (hj : j ≤ N) :
    L.picked ((L.remains^[k]) j) =
      ∑ r ∈ Finset.range N, if r < j ∧ L.returnTime (r+1)=k+1 then 1 else 0 := by
  rw [← L.returnTime_count j k]
  calc
    (∑ r ∈ Finset.range j, if L.returnTime (r+1)=k+1 then 1 else 0) =
        ∑ r ∈ Finset.range j, if r < j ∧ L.returnTime (r+1)=k+1 then 1 else 0 := by
      apply Finset.sum_congr rfl
      intro r hr
      simp [Finset.mem_range.mp hr]
    _ = _ := by
      apply Finset.sum_subset (Finset.range_mono hj)
      intro r _ hr
      have hnot : ¬r < j := by simpa using hr
      simp [hnot]

end SolitaireGeneral.LayerRule
