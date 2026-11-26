module
public import Mathlib.Analysis.SpecialFunctions.Log.Deriv
public import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

noncomputable def bernoulliExponentialDenominator (p t : ℝ) : ℝ :=
  1+(Real.exp t-1)*p

noncomputable def bernoulliCenteredCumulant (p t : ℝ) : ℝ :=
  Real.log (bernoulliExponentialDenominator p t)-t*p

noncomputable def bernoulliTiltedProbability (p t : ℝ) : ℝ :=
  p*Real.exp t/bernoulliExponentialDenominator p t

theorem bernoulliExponentialDenominator_pos {p : ℝ} (hp₀ : 0≤p) (hp₁ : p≤1) (t : ℝ) :
    0<bernoulliExponentialDenominator p t := by
  unfold bernoulliExponentialDenominator
  by_cases h : 0<p
  · nlinarith [mul_pos h (Real.exp_pos t)]
  · have he : p=0 := le_antisymm (le_of_not_gt h) hp₀
    rw [he,mul_zero,add_zero]
    norm_num

theorem bernoulliCenteredCumulant_at_zero (p : ℝ) :
    bernoulliCenteredCumulant p 0=0 := by
  simp [bernoulliCenteredCumulant,bernoulliExponentialDenominator]

theorem bernoulliCenteredCumulant_endpoints (t : ℝ) :
    bernoulliCenteredCumulant 0 t=0 ∧ bernoulliCenteredCumulant 1 t=0 := by
  simp [bernoulliCenteredCumulant,bernoulliExponentialDenominator]

theorem bernoulliCenteredCumulant_symmetry {p : ℝ} (hp₀ : 0≤p) (hp₁ : p≤1) (t : ℝ) :
    bernoulliCenteredCumulant (1-p) t=bernoulliCenteredCumulant p (-t) := by
  have he : bernoulliExponentialDenominator (1-p) t=
      Real.exp t*bernoulliExponentialDenominator p (-t) := by
    unfold bernoulliExponentialDenominator
    rw [Real.exp_neg]
    field_simp
    ring
  unfold bernoulliCenteredCumulant
  rw [he,Real.log_mul (Real.exp_pos _).ne'
    (bernoulliExponentialDenominator_pos hp₀ hp₁ _).ne',Real.log_exp]
  ring

theorem bernoulliExponentialDenominator_hasDerivAt (p t : ℝ) :
    HasDerivAt (bernoulliExponentialDenominator p) (p*Real.exp t) t := by
  unfold bernoulliExponentialDenominator
  simpa only [mul_comm p] using ((Real.hasDerivAt_exp t).sub_const 1 |>.mul_const p).const_add 1

/-- Exact first derivative of the rare-deviation Bernoulli cumulant. -/
theorem bernoulliCenteredCumulant_hasDerivAt {p : ℝ} (hp₀ : 0≤p) (hp₁ : p≤1) (t : ℝ) :
    HasDerivAt (bernoulliCenteredCumulant p) (bernoulliTiltedProbability p t-p) t := by
  unfold bernoulliCenteredCumulant bernoulliTiltedProbability
  have h := (bernoulliExponentialDenominator_hasDerivAt p t).log
    (bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne'
  have hh : HasDerivAt (fun y => Real.log (bernoulliExponentialDenominator p y)-y*p)
      (p*Real.exp t/bernoulliExponentialDenominator p t-(1:ℝ)*p) t :=
    h.sub ((hasDerivAt_id t).mul_const p)
  simpa only [one_mul] using hh

/-- Exact second derivative, as given in the written cumulant proof. -/
theorem bernoulliTiltedProbability_hasDerivAt {p : ℝ} (hp₀ : 0≤p) (hp₁ : p≤1) (t : ℝ) :
    HasDerivAt (bernoulliTiltedProbability p)
      (p*(1-p)*Real.exp t/(bernoulliExponentialDenominator p t)^2) t := by
  unfold bernoulliTiltedProbability
  have h := ((Real.hasDerivAt_exp t).const_mul p).div
    (bernoulliExponentialDenominator_hasDerivAt p t)
    (bernoulliExponentialDenominator_pos hp₀ hp₁ t).ne'
  convert h using 1
  unfold bernoulliExponentialDenominator
  ring

end PomeranceSarkozy
