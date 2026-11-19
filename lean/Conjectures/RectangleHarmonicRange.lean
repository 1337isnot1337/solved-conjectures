import Conjectures.RectangleParameterBounds
import Conjectures.RectangleEulerUpper
import Mathlib.Algebra.BigOperators.Intervals

/-! Exact harmonic-range identities and logarithmic bounds for the
active rectangle heights. -/

namespace RectangleAsymptotics

open Finset

theorem harmonicSum_eq_Icc (n : ℕ) : RectangleEuler.harmonicSum n=
    ∑ a ∈ Icc 1 n,1/(a : ℝ) := by
  rw [RectangleEuler.harmonicSum_eq]
  simp only [harmonic_eq_sum_Icc,Rat.cast_sum,Rat.cast_inv,Rat.cast_natCast,one_div]

theorem reciprocal_Icc_eq_harmonicSub (A M : ℕ) (hA : 1 ≤ A) (hAM : A ≤ M+1) :
    (∑ a ∈ Icc A M,1/(a : ℝ)) =
      RectangleEuler.harmonicSum M-RectangleEuler.harmonicSum (A-1) := by
  have hs := Finset.sum_Ico_consecutive (fun a : ℕ => 1/(a : ℝ)) hA hAM
  have he₁ : Ico 1 A=Icc 1 (A-1) := by ext a; simp only [mem_Ico,mem_Icc]; omega
  have he₂ : Ico A (M+1)=Icc A M := by ext a; simp only [mem_Ico,mem_Icc]; omega
  have he₃ : Ico 1 (M+1)=Icc 1 M := by ext a; simp only [mem_Ico,mem_Icc]; omega
  rw [he₁,he₂,he₃,← harmonicSum_eq_Icc,← harmonicSum_eq_Icc] at hs
  linarith

theorem L_eq_harmonicSub (ε : ℝ) (h w : ℕ) (hA : 1 ≤ a0 ε h) (hAM : a0 ε h ≤ M ε h w+1) :
    L ε h w=RectangleEuler.harmonicSum (M ε h w)-RectangleEuler.harmonicSum (a0 ε h-1) :=
  reciprocal_Icc_eq_harmonicSub _ _ hA hAM

theorem L_nonneg (ε : ℝ) (h w : ℕ) : 0 ≤ L ε h w := by
  exact sum_nonneg (fun a ha => by positivity)

theorem L_pos (ε : ℝ) (h w : ℕ) (hA : 0 < a0 ε h) (hAM : a0 ε h ≤ M ε h w) :
    0 < L ε h w := by
  apply Finset.sum_pos'
  · intro a ha
    positivity
  · refine ⟨a0 ε h,Finset.mem_Icc.mpr ⟨le_rfl,hAM⟩,?_⟩
    have hp : (0 : ℝ) < a0 ε h := by exact_mod_cast hA
    exact one_div_pos.mpr hp

theorem L_le_log_height (ε : ℝ) (h w : ℕ) (hh : 2 ≤ h) (hw : h ≤ w) (hε : 0 < ε) :
    L ε h w ≤ 1+Real.log (h : ℝ) := by
  have hm : M ε h w ≤ h := by
    exact_mod_cast (M_le_U ε h w (by omega) hw hε.le).trans (U_le_height h w)
  have hsub : active ε h w ⊆ Icc 1 h := by
    intro a ha
    have hp := active_positive ε h w hε hh a ha
    have hmax := (Finset.mem_Icc.mp ha).2
    exact Finset.mem_Icc.mpr ⟨by omega,hmax.trans hm⟩
  have hs : L ε h w ≤ ∑ a ∈ Icc 1 h,1/(a : ℝ) :=
    Finset.sum_le_sum_of_subset_of_nonneg hsub (fun a ha hn => by positivity)
  rw [← harmonicSum_eq_Icc] at hs
  exact hs.trans (RectangleEuler.harmonicSum_le h)

theorem L_lower (ε : ℝ) (h w : ℕ) (hh : 2 ≤ h) (hw : h ≤ w) (hε : 0 < ε)
    (hAM : a0 ε h ≤ M ε h w) :
    (1-4*ε)*Real.log (U h w)-1 ≤ L ε h w := by
  have hha : (0 : ℝ) < h := by exact_mod_cast (show 0 < h by omega)
  have hA : 1 < a0 ε h := active_positive ε h w hε hh _ (Finset.mem_Icc.mpr ⟨le_rfl,hAM⟩)
  have hpredpos : (0 : ℝ) < (a0 ε h-1 : ℕ) := by exact_mod_cast (show 0 < a0 ε h-1 by omega)
  have hceil := Nat.ceil_lt_add_one (Real.rpow_nonneg hha.le ε)
  change (a0 ε h : ℝ) < (h : ℝ)^ε+1 at hceil
  have hpred : ((a0 ε h-1 : ℕ) : ℝ) < (h : ℝ)^ε := by
    rw [Nat.cast_sub (by omega : 1 ≤ a0 ε h),Nat.cast_one]
    linarith
  have hlogpred := Real.log_le_log hpredpos hpred.le
  rw [Real.log_rpow hha] at hlogpred
  have hupper : RectangleEuler.harmonicSum (a0 ε h-1) ≤ 1+ε*Real.log (h : ℝ) := by
    exact (RectangleEuler.harmonicSum_le _).trans (add_le_add le_rfl hlogpred)
  have hU := U_pos (by omega : 0 < h) hw
  have hfloor := Nat.lt_floor_add_one ((U h w)^(1-2*ε))
  change (U h w)^(1-2*ε) < (M ε h w : ℝ)+1 at hfloor
  have hlogM := Real.log_le_log (Real.rpow_pos_of_pos hU _) hfloor.le
  rw [Real.log_rpow hU] at hlogM
  have hhar : Real.log ((M ε h w : ℝ)+1) ≤ RectangleEuler.harmonicSum (M ε h w) := by
    simpa only [RectangleEuler.harmonicSum_eq,Nat.cast_add,Nat.cast_one] using log_add_one_le_harmonic (M ε h w)
  have hlower := hlogM.trans hhar
  have hlogU := log_U_lower (by omega : 1 ≤ h) hw
  have heps := mul_le_mul_of_nonneg_left
    (show Real.log (h : ℝ) ≤ 2*Real.log (U h w) by linarith) hε.le
  rw [L_eq_harmonicSub ε h w (by omega) (by omega)]
  nlinarith only [hupper,hlower,heps]

end RectangleAsymptotics
