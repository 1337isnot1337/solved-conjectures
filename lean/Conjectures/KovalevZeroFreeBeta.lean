import Conjectures.KovalevZeroFreeCoefficients
import Mathlib.Probability.Distributions.Beta
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Tactic.FunProp

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

Concrete beta distributions, their support, normalization, and first moment.
These are the distributions used in Section 2 of the recorded proof; none of
their normalization or moment identities is introduced as a hypothesis.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

noncomputable section

theorem betaPDFReal_nonneg {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (x : ℝ) :
    0 ≤ betaPDFReal a b x := by
  by_cases hx : 0 < x ∧ x < 1
  · exact (betaPDFReal_pos hx.1 hx.2 ha hb).le
  · simp [betaPDFReal, hx]

theorem measurable_betaPDF (a b : ℝ) : Measurable (betaPDF a b) := by
  exact (measurable_betaPDFReal a b).ennreal_ofReal

theorem beta_ae_mem (a b : ℝ) : ∀ᵐ x ∂betaMeasure a b, x ∈ Ioo (0 : ℝ) 1 := by
  rw [betaMeasure, ae_withDensity_iff (measurable_betaPDF a b)]
  filter_upwards [] with x hx
  by_contra h
  apply hx
  simp only [mem_Ioo] at h
  simp [betaPDF, betaPDFReal, h]

theorem integral_beta_density {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (f : ℝ → E) :
    ∫ x, f x ∂betaMeasure a b = ∫ x, betaPDFReal a b x • f x := by
  rw [betaMeasure, integral_withDensity_eq_integral_toReal_smul
    (measurable_betaPDF a b) (Filter.Eventually.of_forall (fun _ => ENNReal.ofReal_lt_top))]
  apply integral_congr_ae
  filter_upwards [] with x
  rw [betaPDF, ENNReal.toReal_ofReal (betaPDFReal_nonneg ha hb x)]

theorem integral_beta_weight {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (f : ℝ → E) :
    ∫ x, f x ∂betaMeasure a b =
      ∫ x in Ioo (0 : ℝ) 1, (1 / beta a b * x ^ (a - 1) * (1 - x) ^ (b - 1)) • f x := by
  rw [integral_beta_density ha hb, ← integral_indicator measurableSet_Ioo]
  apply integral_congr_ae
  filter_upwards [] with x
  by_cases hx : x ∈ Ioo (0 : ℝ) 1
  · simp [betaPDFReal, hx.1, hx.2, hx]
  · simp only [mem_Ioo] at hx
    simp [betaPDFReal, hx]

theorem integral_betaPDFReal {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫ x, betaPDFReal a b x = 1 := by
  let := isProbabilityMeasureBeta ha hb
  have h : ∫ x, (1 : ℝ) ∂betaMeasure a b = 1 := by simp
  rw [integral_beta_density ha hb] at h
  simpa only [smul_eq_mul, mul_one] using h

theorem beta_add_one_left {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    beta (a + 1) b = a / (a + b) * beta a b := by
  unfold beta
  rw [show a + 1 + b = (a + b) + 1 by ring,
    Real.Gamma_add_one ha.ne', Real.Gamma_add_one (add_pos ha hb).ne']
  field_simp

theorem betaPDFReal_mul_id {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (x : ℝ) :
    betaPDFReal a b x * x = a / (a + b) * betaPDFReal (a + 1) b x := by
  by_cases hx : 0 < x ∧ x < 1
  · have hbeta := (beta_pos ha hb).ne'
    have hab := (add_pos ha hb).ne'
    have hpow : x ^ a = x ^ (a - 1) * x := by
      calc
        x ^ a = x ^ ((a - 1) + 1) := by ring_nf
        _ = _ := by rw [Real.rpow_add hx.1, Real.rpow_one]
    simp only [betaPDFReal, ite_eq_left hx, add_sub_cancel_right]
    rw [beta_add_one_left ha hb, hpow]
    field_simp
  · simp [betaPDFReal, hx]

theorem integral_beta_id {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫ x, x ∂betaMeasure a b = a / (a + b) := by
  rw [integral_beta_density ha hb]
  simp only [smul_eq_mul, betaPDFReal_mul_id ha hb]
  rw [integral_const_mul, integral_betaPDFReal (by linarith) hb, mul_one]

theorem beta_integrable_id {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    Integrable (fun x : ℝ => x) (betaMeasure a b) := by
  let := isProbabilityMeasureBeta ha hb
  apply (integrable_const (1 : ℝ)).mono' measurable_id.aestronglyMeasurable
  filter_upwards [beta_ae_mem a b] with x hx
  change ‖x‖ ≤ 1
  rw [Real.norm_eq_abs, abs_of_pos hx.1]
  exact hx.2.le

theorem integral_beta_one_sub {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∫ x, 1 - x ∂betaMeasure a b = b / (a + b) := by
  let := isProbabilityMeasureBeta ha hb
  rw [integral_sub (integrable_const _) (beta_integrable_id ha hb),
    integral_beta_id ha hb]
  have hone : ∫ x, (1 : ℝ) ∂betaMeasure a b = 1 := by simp
  rw [hone]
  field_simp
  ring

end

end Conjectures.KovalevZeroFree
