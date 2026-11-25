import Conjectures.KovalevZeroFreeCoupling

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The exact beta transport law for all positive parameters, proved from the
actual density calculation. It supplies the independent coupling in Section 2
of the recorded proof without assuming a gamma-distribution identity.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

noncomputable section

theorem lintegral_beta_restrict (a b : ℝ) (g : ℝ → ℝ≥0∞) :
    ∫⁻ t, g t ∂betaMeasure a b =
      ∫⁻ t in Ioo (0 : ℝ) 1, betaPDF a b t * g t := by
  rw [betaMeasure, lintegral_withDensity_eq_lintegral_mul_non_measurable volume
    (measurable_betaPDF a b) (Filter.Eventually.of_forall (fun _ => ENNReal.ofReal_lt_top))]
  symm
  apply setLIntegral_eq_of_support_subset
  apply Function.support_subset_iff'.mpr
  intro t ht
  have hn : ¬ (0 < t ∧ t < 1) := ht
  simp [betaPDF, betaPDFReal, hn]

theorem lintegral_beta_oddsScale_substitution (a b : ℝ) {v : ℝ}
    (hv : 0 < v) (f : ℝ → ℝ≥0∞) :
    ∫⁻ t in Ioo (0 : ℝ) 1, betaPDF a b t * f (oddsScale v t) =
      ∫⁻ t in Ioo (0 : ℝ) 1,
        (ENNReal.ofReal (mobiusJacobian v t) * betaPDF a b (mobius v t)) * f t := by
  rw [← lintegral_mobius_substitution hv (fun t => betaPDF a b t * f (oddsScale v t))]
  apply setLIntegral_congr_fun measurableSet_Ioo
  intro t ht
  dsimp only
  rw [oddsScale_mobius hv ht, mul_assoc]

/-- The exact expectation identity for the beta coupling. -/
theorem lintegral_oddsScale_beta {a b c : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (f : ℝ → ℝ≥0∞) (hf : Measurable f) :
    ∫⁻ v, ∫⁻ t, f (oddsScale v t) ∂betaMeasure (a + b) c ∂betaMeasure a b =
      ∫⁻ t, f t ∂betaMeasure a c := by
  have hm : Measurable (fun p : ℝ × ℝ =>
      (betaPDF a b p.1 *
        (ENNReal.ofReal (mobiusJacobian p.1 p.2) *
          betaPDF (a + b) c (mobius p.1 p.2))) * f p.2) :=
    ((measurable_betaPDF a b).comp measurable_fst).mul
      (measurable_mobiusJacobian.ennreal_ofReal.mul
        ((measurable_betaPDF (a + b) c).comp measurable_mobius)) |>.mul
          (hf.comp measurable_snd)
  calc
    _ = ∫⁻ v in Ioo (0 : ℝ) 1, betaPDF a b v *
        (∫⁻ t in Ioo (0 : ℝ) 1, betaPDF (a + b) c t * f (oddsScale v t)) := by
      rw [lintegral_beta_restrict]
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro v hv
      dsimp only
      rw [lintegral_beta_restrict]
    _ = ∫⁻ v in Ioo (0 : ℝ) 1, ∫⁻ t in Ioo (0 : ℝ) 1,
        (betaPDF a b v *
          (ENNReal.ofReal (mobiusJacobian v t) * betaPDF (a + b) c (mobius v t))) *
            f t := by
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro v hv
      dsimp only
      rw [lintegral_beta_oddsScale_substitution (a + b) c hv.1,
        ← lintegral_const_mul' _ _ (show betaPDF a b v ≠ ∞ from ENNReal.ofReal_ne_top)]
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro t ht
      exact (mul_assoc _ _ _).symm
    _ = ∫⁻ t in Ioo (0 : ℝ) 1, ∫⁻ v in Ioo (0 : ℝ) 1,
        (betaPDF a b v *
          (ENNReal.ofReal (mobiusJacobian v t) * betaPDF (a + b) c (mobius v t))) *
            f t := lintegral_lintegral_swap hm.aemeasurable
    _ = ∫⁻ t in Ioo (0 : ℝ) 1, betaPDF a c t * f t := by
      apply setLIntegral_congr_fun measurableSet_Ioo
      intro t ht
      dsimp only
      have hk : Measurable (fun v : ℝ => betaPDF a b v *
          (ENNReal.ofReal (mobiusJacobian v t) * betaPDF (a + b) c (mobius v t))) := by
        exact (measurable_betaPDF a b).mul
          ((measurable_mobiusJacobian.comp (measurable_id.prodMk measurable_const)).ennreal_ofReal.mul
            ((measurable_betaPDF (a + b) c).comp
              (measurable_mobius.comp (measurable_id.prodMk measurable_const))))
      rw [lintegral_mul_const _ hk, lintegral_beta_joint_density ha hb hc ht]
    _ = _ := (lintegral_beta_restrict a c f).symm

/-- Multiplying independent beta odds by a beta variable produces the exact
smaller-parameter beta distribution. -/
theorem map_oddsScale_beta {a b c : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    Measure.map (fun p : ℝ × ℝ => oddsScale p.1 p.2)
      ((betaMeasure a b).prod (betaMeasure (a + b) c)) = betaMeasure a c := by
  let := isProbabilityMeasureBeta ha hb
  let := isProbabilityMeasureBeta (add_pos ha hb) hc
  apply Measure.ext_of_lintegral
  intro f hf
  rw [lintegral_map hf measurable_oddsScale]
  rw [lintegral_prod (fun p : ℝ × ℝ => f (oddsScale p.1 p.2))
    (hf.comp measurable_oddsScale).aemeasurable]
  exact lintegral_oddsScale_beta ha hb hc f hf

theorem integral_oddsScale_beta {a b c : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c)
    (f : ℝ → ℂ) (hf : Measurable f) :
    ∫ p : ℝ × ℝ, f (oddsScale p.1 p.2)
      ∂(betaMeasure a b).prod (betaMeasure (a + b) c) =
      ∫ t, f t ∂betaMeasure a c := by
  rw [← map_oddsScale_beta ha hb hc,
    integral_map measurable_oddsScale.aemeasurable hf.aestronglyMeasurable]

end

end Conjectures.KovalevZeroFree
