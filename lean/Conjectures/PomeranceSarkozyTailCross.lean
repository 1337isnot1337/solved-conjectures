module
public import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
public import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.Positivity

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

noncomputable def survivalAtoms (p : ℕ→ℝ≥0∞) (h : ℕ) : ℝ≥0∞ :=
  ∑' k,if h<k then p k else 0

noncomputable def lowerAtoms (p : ℕ→ℝ≥0∞) (h : ℕ) : ℝ≥0∞ :=
  ∑' k,if k≤h then p k else 0

theorem lower_add_survival (p : ℕ→ℝ≥0∞) (h : ℕ) :
    lowerAtoms p h+survivalAtoms p h=∑' k,p k := by
  unfold lowerAtoms survivalAtoms
  rw [← ENNReal.tsum_add]
  apply tsum_congr
  intro k
  by_cases he : k≤h
  · simp [he,not_lt.mpr he]
  · simp [he,lt_of_not_ge he]

/-- A tail-product sum equals the expected positive difference for
independent draws: the inner threshold interval has length k-l.
This works before any normal approximation or passage to an integral. -/
theorem tail_cross_tsum (p q : ℕ→ℝ≥0∞) :
    (∑' h,survivalAtoms p h*lowerAtoms q h) =
      ∑' k,∑' l,((k-l:ℕ):ℝ≥0∞)*(p k*q l) := by
  let f (h k l : ℕ) := if l≤h ∧ h<k then p k*q l else 0
  have hterm (h : ℕ) : survivalAtoms p h*lowerAtoms q h=∑' k,∑' l,f h k l := by
    unfold survivalAtoms lowerAtoms
    rw [← ENNReal.tsum_mul_right]
    apply tsum_congr
    intro k
    rw [← ENNReal.tsum_mul_left]
    apply tsum_congr
    intro l
    by_cases hk : h<k <;> by_cases hl : l≤h <;> simp [f,hk,hl]
  have hinner (k l : ℕ) :
      (∑' h,f h k l)=((k-l:ℕ):ℝ≥0∞)*(p k*q l) := by
    rw [tsum_eq_sum (s:=Finset.Ico l k)]
    · have he (h : ℕ) (hh : h∈Finset.Ico l k) : f h k l=p k*q l :=
        ite_eq_left (Finset.mem_Ico.mp hh)
      rw [Finset.sum_congr rfl he,Finset.sum_const,Nat.card_Ico,nsmul_eq_mul]
    · intro h hh
      exact ite_eq_right (fun hh' => hh (Finset.mem_Ico.mpr hh'))
  calc
    _ = ∑' h,∑' k,∑' l,f h k l := by simp_rw [hterm]
    _ = ∑' k,∑' h,∑' l,f h k l := ENNReal.tsum_comm
    _ = ∑' k,∑' l,∑' h,f h k l := by
      apply tsum_congr
      intro k
      exact ENNReal.tsum_comm
    _ = _ := by simp_rw [hinner]

end PomeranceSarkozy
