module
public import Conjectures.PomeranceSarkozyTailCross

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

/-- The shifted tail-product sum is the expected positive part of
the difference of independent atom indices minus the offset d.
This is the exact infinite-threshold identity behind the process covariance. -/
theorem shifted_tail_cross_tsum (p q : ℕ→ℝ≥0∞) (d : ℕ) :
    (∑' h,survivalAtoms p (h+d)*lowerAtoms q h) =
      ∑' k,∑' l,((k-(l+d):ℕ):ℝ≥0∞)*(p k*q l) := by
  let f (h k l : ℕ) := if l≤h ∧ h+d<k then p k*q l else 0
  have hterm (h : ℕ) : survivalAtoms p (h+d)*lowerAtoms q h=∑' k,∑' l,f h k l := by
    unfold survivalAtoms lowerAtoms
    rw [← ENNReal.tsum_mul_right]
    apply tsum_congr
    intro k
    rw [← ENNReal.tsum_mul_left]
    apply tsum_congr
    intro l
    by_cases hk : h+d<k <;> by_cases hl : l≤h <;> simp [f,hk,hl]
  have hinner (k l : ℕ) :
      (∑' h,f h k l)=((k-(l+d):ℕ):ℝ≥0∞)*(p k*q l) := by
    rw [tsum_eq_sum (s:=Finset.Ico l (k-d))]
    · have he (h : ℕ) (hh : h∈Finset.Ico l (k-d)) : f h k l=p k*q l := by
        have hx := Finset.mem_Ico.mp hh
        exact ite_eq_left ⟨hx.1,by omega⟩
      rw [Finset.sum_congr rfl he,Finset.sum_const,Nat.card_Ico,nsmul_eq_mul]
      congr 2
      omega
    · intro h hh
      exact ite_eq_right (fun hh' => hh (Finset.mem_Ico.mpr ⟨hh'.1,by omega⟩))
  calc
    _ = ∑' h,∑' k,∑' l,f h k l := by simp_rw [hterm]
    _ = ∑' k,∑' h,∑' l,f h k l := ENNReal.tsum_comm
    _ = ∑' k,∑' l,∑' h,f h k l := by
      apply tsum_congr
      intro k
      exact ENNReal.tsum_comm
    _ = _ := by simp_rw [hinner]

end PomeranceSarkozy
