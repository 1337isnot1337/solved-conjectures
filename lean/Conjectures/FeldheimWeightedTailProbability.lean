import Conjectures.FeldheimWeightedTailLaw
import Mathlib.MeasureTheory.Integral.Prod

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The actual product-measure conditioning identity and finite-window lower
bound from §4 of the recorded proof. The integral uses the laws themselves,
so atoms and singular laws are included without a density assumption.
-/

open Set MeasureTheory ProbabilityTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem conditional_survival_integrable (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] (t m : ℝ) :
    Integrable (fun x => survival ν ((m-t*x)/(1-t))) μ := by
  have hm : Measurable (fun x : ℝ => survival ν ((m-t*x)/(1-t))) :=
    (survival_antitone ν).measurable.comp (by fun_prop)
  apply (integrable_const (1 : ℝ)).mono' hm.aestronglyMeasurable
  filter_upwards [] with x
  rw [Real.norm_eq_abs, abs_of_nonneg (survival_nonneg ν _)]
  exact survival_le_one ν _

/-- Fubini's theorem for the literal weighted-sum upper-tail event. -/
theorem weightedTail_eq_integral (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    {t : ℝ} (ht1 : t < 1) (m : ℝ) :
    weightedTail μ ν t m = ∫ x, survival ν ((m-t*x)/(1-t)) ∂μ := by
  let E : Set (ℝ × ℝ) := {p | m < t*p.1+(1-t)*p.2}
  have hE : MeasurableSet E := by
    apply measurableSet_lt measurable_const
    fun_prop
  have hI : Integrable (E.indicator (1 : ℝ × ℝ → ℝ)) (μ.prod ν) :=
    (integrable_const (1 : ℝ)).indicator hE
  change (μ.prod ν).real E = _
  rw [← integral_indicator_one hE, integral_prod _ hI]
  apply integral_congr_ae
  filter_upwards [] with x
  have he : (fun y : ℝ => E.indicator (1 : ℝ × ℝ → ℝ) (x,y)) =
      (Ioi ((m-t*x)/(1-t))).indicator (1 : ℝ → ℝ) := by
    funext y
    have hy : m < t*x+(1-t)*y ↔ (m-t*x)/(1-t) < y := by
      rw [div_lt_iff₀ (show 0 < 1-t by linarith)]
      constructor <;> intro h <;> nlinarith
    simp only [indicator_apply, E, mem_ofPred_eq, mem_Ioi, Pi.one_apply, hy]
  rw [he, integral_indicator_one measurableSet_Ioi]
  rfl

theorem inverse_survival_integrableOn (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : UnboundedLaw μ) (a b : ℝ) :
    IntegrableOn (fun x => (survival μ x)⁻¹) (Ioc a b) μ := by
  have hm : Measurable (fun x => (survival μ x)⁻¹) := (survival_antitone μ).measurable.inv
  apply (integrable_const ((survival μ b)⁻¹)).mono' hm.aestronglyMeasurable
  filter_upwards [ae_restrict_mem measurableSet_Ioc] with x hx
  rw [Real.norm_eq_abs, abs_of_pos (inv_pos.mpr (hμ x))]
  exact inv_anti₀ (hμ b) (survival_antitone μ hx.2)

/-- A pointwise log-tail window estimate yields an actual conditional probability lower bound. -/
theorem tailRatio_lower_integral (μ ν : Measure ℝ)
    [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (hμ : UnboundedLaw μ) (hν : UnboundedLaw ν)
    {t a m B : ℝ} (ht1 : t < 1)
    (hB : ∀ x ∈ Ioc a m,
      logTail μ x+logTail ν ((m-t*x)/(1-t))-(logTail μ m+logTail ν m) ≤ B) :
    Real.exp (-B)*(∫ x in Ioc a m, (survival μ x)⁻¹ ∂μ) ≤ tailRatio μ ν t m := by
  let K := Real.exp (-B)*survival μ m*survival ν m
  have hI := inverse_survival_integrableOn μ hμ a m
  have hJ := conditional_survival_integrable μ ν t m
  have hpoint (x : ℝ) (hx : x ∈ Ioc a m) :
      K*(survival μ x)⁻¹ ≤ survival ν ((m-t*x)/(1-t)) := by
    dsimp only [K]
    rw [← exp_neg_logTail μ hμ m, ← exp_neg_logTail ν hν m,
      ← exp_logTail μ hμ x, ← exp_neg_logTail ν hν ((m-t*x)/(1-t))]
    rw [← Real.exp_add, ← Real.exp_add, ← Real.exp_add]
    apply Real.exp_le_exp.mpr
    linarith [hB x hx]
  have hcomp := setIntegral_mono_on (hI.const_mul K) hJ.integrableOn
    measurableSet_Ioc hpoint
  rw [integral_const_mul] at hcomp
  have hfull : (∫ x in Ioc a m, survival ν ((m-t*x)/(1-t)) ∂μ) ≤
      ∫ x, survival ν ((m-t*x)/(1-t)) ∂μ :=
    setIntegral_le_integral hJ (Eventually.of_forall (fun x => survival_nonneg ν _))
  rw [← weightedTail_eq_integral μ ν ht1 m] at hfull
  have hprob := hcomp.trans hfull
  change _ ≤ weightedTail μ ν t m/(survival μ m*survival ν m)
  apply (le_div_iff₀ (mul_pos (hμ m) (hν m))).mpr
  convert hprob using 1
  dsimp only [K]
  ring

end

end Conjectures.FeldheimWeightedTail
