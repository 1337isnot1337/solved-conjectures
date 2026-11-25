module

public import Conjectures.LassalleTailWeight
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.Analysis.Normed.Group.FunctionSeries

@[expose] public section
namespace LassalleRefinement

noncomputable def besselMajorant : ℕ → ℝ
  | 0 => 1
  | n+1 => 2*(2/3:ℝ)^n

theorem besselMajorant_summable : Summable besselMajorant := by
  apply (summable_nat_add_iff 1).1
  exact (summable_geometric_of_lt_one (by norm_num : (0:ℝ)≤2/3) (by norm_num)).mul_left 2

theorem besselTerm_ratio_unitInterval {R : ℝ} (hR : 0≤R) (hR4 : R≤4)
    (m : ℕ) (hm : 1≤m) :
    besselTerm R (m+1)≤(2/3:ℝ)*besselTerm R m := by
  rw [besselTerm_succ]
  apply mul_le_mul_of_nonneg_right _ (besselTerm_nonneg hR _)
  have h' : (1:ℝ)≤m := by exact_mod_cast hm
  apply (div_le_iff₀ (by positivity)).mpr
  nlinarith

theorem besselTerm_le_majorant {R : ℝ} (hR : 0≤R) (hR4 : R≤4) (m : ℕ) :
    besselTerm R m≤besselMajorant m := by
  cases m with
  | zero => simp [besselTerm,besselMajorant]
  | succ m =>
    induction m with
    | zero => norm_num [besselTerm,besselMajorant,Nat.factorial]; linarith
    | succ m ih =>
      calc
        _ ≤ (2/3:ℝ)*besselTerm R (m+1) := besselTerm_ratio_unitInterval hR hR4 _ (by omega)
        _ ≤ (2/3:ℝ)*besselMajorant (m+1) := mul_le_mul_of_nonneg_left ih (by norm_num)
        _ = _ := by rw [besselMajorant,besselMajorant,pow_succ]; ring

theorem besselTerm_summable {R : ℝ} (hR : 0≤R) (hR4 : R≤4) :
    Summable (besselTerm R) :=
  Summable.of_nonneg_of_le (besselTerm_nonneg hR) (besselTerm_le_majorant hR hR4)
    besselMajorant_summable

noncomputable def besselRealSeries (R : ℝ) : ℝ := ∑' n, (-1:ℝ)^n*besselTerm R n

noncomputable def besselRealPartial (R : ℝ) (m : ℕ) : ℝ :=
  ∑ i ∈ Finset.range m,(-1:ℝ)^i*besselTerm R i

theorem besselRealSeries_continuousOn : ContinuousOn besselRealSeries (Set.Icc 0 4) := by
  unfold besselRealSeries
  refine continuousOn_tsum (u:=besselMajorant) ?_ besselMajorant_summable ?_
  · intro i
    unfold besselTerm
    fun_prop
  · intro i R hR
    rw [Real.norm_eq_abs,abs_mul,abs_pow,abs_neg,abs_one,one_pow,one_mul,
      abs_of_nonneg (besselTerm_nonneg hR.1 _)]
    exact besselTerm_le_majorant hR.1 hR.2 _

end LassalleRefinement
