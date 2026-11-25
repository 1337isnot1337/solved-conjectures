module

public import Conjectures.LassalleBesselConstants
public import Mathlib.Basic.Real.Basic

@[expose] public section
namespace LassalleRefinement

noncomputable def besselTerm (R : ℝ) (m : ℕ) : ℝ :=
  R^m/((m.factorial:ℝ)*((m+1).factorial:ℝ))

theorem besselTerm_nonneg {R : ℝ} (hR : 0≤R) (m : ℕ) : 0≤besselTerm R m := by
  unfold besselTerm
  positivity

theorem besselTerm_succ (R : ℝ) (m : ℕ) :
    besselTerm R (m+1) =
      (R/((m+1:ℝ)*(m+2:ℝ)))*besselTerm R m := by
  unfold besselTerm
  have hf (n : ℕ) : ((n.factorial:ℕ):ℝ)≠0 := by positivity
  rw [pow_succ,Nat.factorial_succ (m+1),Nat.factorial_succ m]
  push_cast
  field_simp
  ring

theorem besselTerm_small_ratio {R : ℝ} (hR : 0≤R) {j : ℕ} (hj : 8≤j) :
    besselTerm R j≤(R/72)*besselTerm R (j-1) := by
  have hk : j-1+1=j := by omega
  nth_rw 1 [←hk]
  rw [besselTerm_succ]
  apply mul_le_mul_of_nonneg_right _ (besselTerm_nonneg hR _)
  apply div_le_div_of_nonneg_left hR (by norm_num)
  have hh : (7:ℝ)≤(j-1:ℕ) := by exact_mod_cast (by omega : 7≤j-1)
  nlinarith

noncomputable def besselConvolution (R : ℝ) (n : ℕ) : ℝ :=
  ∑ i ∈ Finset.range (n+1), besselTerm R i * besselTerm R (n-i)

theorem besselConvolution_nonneg {R : ℝ} (hR : 0≤R) (n : ℕ) :
    0≤besselConvolution R n := by
  apply Finset.sum_nonneg
  intro i _
  exact mul_nonneg (besselTerm_nonneg hR _) (besselTerm_nonneg hR _)

end LassalleRefinement
