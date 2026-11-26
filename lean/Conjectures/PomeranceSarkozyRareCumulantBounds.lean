module
public import Conjectures.PomeranceSarkozyRareCumulant
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

theorem bernoulliExponentialDenominator_ge (p t : ℝ) (hp₀ : 0≤p) (hp₁ : p≤1) :
    Real.exp (-|t|)≤bernoulliExponentialDenominator p t := by
  have h₀ : Real.exp (-|t|)≤1 := Real.exp_le_one_iff.mpr (neg_nonpos.mpr (abs_nonneg _))
  have h₁ : Real.exp (-|t|)≤Real.exp t := Real.exp_le_exp.mpr (by linarith [neg_le_abs t])
  have hh₀ := mul_le_mul_of_nonneg_left h₀ (sub_nonneg.mpr hp₁)
  have hh₁ := mul_le_mul_of_nonneg_left h₁ hp₀
  unfold bernoulliExponentialDenominator
  nlinarith

/-- The exact Bernoulli cumulant second derivative has the common
integrable variance envelope on every bounded t-interval. -/
theorem bernoulliTiltedProbability_derivative_bound (p t : ℝ) (hp₀ : 0≤p) (hp₁ : p≤1) :
    0≤p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2 ∧
    p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2 ≤
      Real.exp (3*|t|)*p*(1-p) := by
  let D := (bernoulliExponentialDenominator p t)^2
  let V := p*(1-p)
  have hV : 0≤V := mul_nonneg hp₀ (sub_nonneg.mpr hp₁)
  have hd : (Real.exp (-|t|))^2≤D :=
    pow_le_pow_left₀ (Real.exp_pos _).le (bernoulliExponentialDenominator_ge p t hp₀ hp₁) 2
  have hEt := Real.exp_le_exp.mpr (le_abs_self t)
  constructor
  · change 0≤V*Real.exp t/D
    exact div_nonneg (mul_nonneg hV (Real.exp_pos _).le) (sq_nonneg _)
  · change V*Real.exp t/D≤_
    calc
      _ ≤ V*Real.exp |t|/D :=
        div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hEt hV) (sq_nonneg _)
      _ ≤ V*Real.exp |t|/(Real.exp (-|t|))^2 :=
        div_le_div_of_nonneg_left (by positivity) (by positivity) hd
      _ = _ := by
        rw [pow_two,← Real.exp_add,mul_div_assoc,← Real.exp_sub,
          show |t|-(-|t|+-|t|)=3*|t| by ring]
        unfold V
        ring

theorem bernoulliTiltedProbability_derivative_strict (p t : ℝ) (hp₀ : 0<p) (hp₁ : p<1) :
    0<p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2 := by
  have hD := bernoulliExponentialDenominator_pos hp₀.le hp₁.le t
  exact div_pos (mul_pos (mul_pos hp₀ (sub_pos.mpr hp₁)) (Real.exp_pos _)) (sq_pos_of_pos hD)

end PomeranceSarkozy
