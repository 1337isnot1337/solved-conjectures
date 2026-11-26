module
public import Conjectures.PomeranceSarkozyRareCumulantBounds
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

theorem bernoulliTiltedProbability_sub_parameter (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    bernoulliTiltedProbability p t-p =
      p*(1-p)*(Real.exp t-1)/bernoulliExponentialDenominator p t := by
  have hd := (bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne'
  unfold bernoulliTiltedProbability
  field_simp
  unfold bernoulliExponentialDenominator
  ring

/-- The first derivative of the centered cumulant admits the same
integrable Gaussian variance weight as the second derivative. -/
theorem bernoulliTiltedProbability_sub_parameter_abs_le (p t : ℝ) (hp₀ : 0≤ p) (hp₁ : p≤ 1) :
    |bernoulliTiltedProbability p t-p| ≤ (Real.exp |t|+1)*Real.exp |t| *(p*(1-p)) := by
  have hV : 0≤ p*(1-p) := mul_nonneg hp₀ (sub_nonneg.mpr hp₁)
  have hD := bernoulliExponentialDenominator_pos hp₀ hp₁ t
  have hExp : |Real.exp t-1| ≤ Real.exp |t|+1 := by
    refine (abs_sub _ _).trans ?_
    rw [abs_of_nonneg (Real.exp_pos _).le,abs_one]
    exact add_le_add (Real.exp_le_exp.mpr (le_abs_self t)) le_rfl
  rw [bernoulliTiltedProbability_sub_parameter p t hp₀ hp₁,abs_div,abs_mul,abs_of_nonneg hV,
    abs_of_pos hD]
  calc
    _ ≤ p*(1-p)*(Real.exp |t|+1)/bernoulliExponentialDenominator p t :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hExp hV) hD.le
    _ ≤ p*(1-p)*(Real.exp |t|+1)/Real.exp (-|t|) :=
      div_le_div_of_nonneg_left (by positivity) (Real.exp_pos _)
        (bernoulliExponentialDenominator_ge p t hp₀ hp₁)
    _ = _ := by rw [div_eq_mul_inv,← Real.exp_neg,neg_neg]; ring

end PomeranceSarkozy
