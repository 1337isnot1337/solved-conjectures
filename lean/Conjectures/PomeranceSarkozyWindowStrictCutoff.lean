module
public import Conjectures.PomeranceSarkozyGrowingCutoffs
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology

/-- Every offset in the growing window leaves a positive shifted integer. -/
theorem psH_lt_psStart : ∀ᶠ X : ℕ in atTop, psH X < psStart X := by
  have h := (isLittleO_log_rpow_atTop (by norm_num : (0 : ℝ) < 1 / 2)).bound
    (by norm_num : (0 : ℝ) < 1 / 10)
  filter_upwards [tendsto_natCast_atTop_atTop.eventually h,
    psL_tendsto.eventually_ge_atTop 0, eventually_ge_atTop 2] with X hx hL hX
  have hX' : (1 : ℝ) < X := by exact_mod_cast (show 1 < X by omega)
  have hlog := Real.log_pos hX'
  simp only [Real.norm_eq_abs, abs_of_nonneg hlog.le, ← Real.sqrt_eq_rpow,
    abs_of_nonneg (Real.sqrt_nonneg _)] at hx
  have h₁ : psL X < Real.log X := by
    have hloglog := Real.log_le_sub_one_of_pos hlog
    change Real.log (Real.log X) < Real.log X
    linarith
  have h₂ := Nat.floor_le (show 0 ≤ 10 * psL X by positivity)
  have h₃ := Nat.le_ceil (Real.sqrt (X : ℝ))
  exact_mod_cast (show (⌊10 * psL X⌋₊ : ℝ) < (⌈Real.sqrt (X : ℝ)⌉₊ : ℝ) by linarith)

end PomeranceSarkozy
