import Conjectures.SteinerbergerFeldheimAnalysis
import Mathlib.Probability.Distributions.Exponential
import Mathlib.MeasureTheory.Integral.Layercake
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Integral.Prod

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The absolutely continuous quadratic-hazard probability law used in the
repository's disproof of Steinerberger's two quantitative tail guesses.
The explicit source and attribution are given in the analysis module.
-/

open Set MeasureTheory Real Filter
open scoped Topology ENNReal

namespace Conjectures.SteinerbergerFeldheim

lemma survival_pos (x : ℝ) : 0 < survival x := exp_pos _

@[fun_prop] lemma continuous_survival : Continuous survival := by unfold survival; fun_prop

@[fun_prop] lemma continuous_density : Continuous density := by unfold density; fun_prop

lemma density_pos {x : ℝ} (hx : 0 ≤ x) : 0 < density x := by
  unfold density
  exact mul_pos (by positivity) (survival_pos x)

lemma survival_le_exp (x : ℝ) : survival x ≤ exp (-x) := by
  unfold survival
  apply exp_le_exp.mpr
  nlinarith [sq_nonneg x]

lemma survival_tendsto : Tendsto survival atTop (𝓝 0) :=
  squeeze_zero (fun x => (survival_pos x).le) survival_le_exp
    (Real.tendsto_exp_atBot.comp tendsto_neg_atTop_atBot)

lemma hasDerivAt_neg_survival (x : ℝ) : HasDerivAt (fun x => -survival x) (density x) x := by
  unfold density survival
  convert ((((hasDerivAt_id x).neg.sub (((hasDerivAt_id x).pow 2).div_const 200)).exp).neg)
    using 1 <;> first | rfl | (dsimp; ring)

lemma density_integrableOn {a : ℝ} (ha : 0 ≤ a) : IntegrableOn density (Ioi a) := by
  apply integrableOn_Ioi_deriv_of_nonneg' (fun x _ => hasDerivAt_neg_survival x)
  · intro x hx
    exact (density_pos (ha.trans hx.le)).le
  · simpa using survival_tendsto.neg

lemma integral_density_tail {a : ℝ} (ha : 0 ≤ a) :
    (∫ x in Ioi a, density x) = survival a := by
  have h := integral_Ioi_of_hasDerivAt_of_nonneg' (fun x (_ : x ∈ Ici a) => hasDerivAt_neg_survival x)
    (fun x (hx : x ∈ Ioi a) => (density_pos (ha.trans hx.le)).le)
    (show Tendsto (fun x => -survival x) atTop (𝓝 0) by simpa using survival_tendsto.neg)
  simpa using h

noncomputable def law : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity (fun x => ENNReal.ofReal (density x))

lemma law_absolutelyContinuous : law ≪ volume :=
  (withDensity_absolutelyContinuous _ _).trans Measure.absolutelyContinuous_restrict

instance law_noAtoms : NullSingletonClass law := by
  unfold law
  infer_instance

lemma law_Ioi {a : ℝ} (ha : 0 ≤ a) : law (Ioi a) = ENNReal.ofReal (survival a) := by
  unfold law
  rw [withDensity_apply _ measurableSet_Ioi, Measure.restrict_restrict measurableSet_Ioi]
  have hinter : Ioi a ∩ Ioi (0 : ℝ) = Ioi a := inter_eq_left.mpr (Ioi_subset_Ioi ha)
  rw [hinter]
  rw [← ofReal_integral_eq_lintegral_ofReal]
  · rw [integral_density_tail ha]
  · exact density_integrableOn ha
  · filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    exact (density_pos (ha.trans hx.le)).le

lemma law_univ : law univ = 1 := by
  unfold law
  rw [withDensity_apply _ MeasurableSet.univ, Measure.restrict_univ,
    ← ofReal_integral_eq_lintegral_ofReal (density_integrableOn (le_refl (0 : ℝ)))]
  · rw [integral_density_tail (le_refl (0 : ℝ))]
    simp [survival]
  · filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    exact (density_pos hx.le).le

instance law_isProbabilityMeasure : IsProbabilityMeasure law := ⟨law_univ⟩

lemma law_pos_ae : ∀ᵐ x ∂law, 0 < x := by
  apply (withDensity_absolutelyContinuous (volume.restrict (Ioi (0 : ℝ)))
    (fun x => ENNReal.ofReal (density x))).ae_le
  exact ae_restrict_mem measurableSet_Ioi

lemma law_nonneg_ae : ∀ᵐ x ∂law, 0 ≤ x := law_pos_ae.mono (fun _ hx => hx.le)

lemma law_unbounded (a : ℝ) : 0 < law (Ioi a) := by
  by_cases ha : 0 ≤ a
  · rw [law_Ioi ha]
    exact ENNReal.ofReal_pos.mpr (survival_pos a)
  · have hsubset : Ioi (0 : ℝ) ⊆ Ioi a := Ioi_subset_Ioi (le_of_not_ge ha)
    have h0 : law (Ioi (0 : ℝ)) = 1 := by rw [law_Ioi (le_refl 0)]; simp [survival]
    have hm := measure_mono (μ := law) hsubset
    rw [law_Ioi (le_refl 0)] at hm
    simpa [survival] using hm.trans_lt' (ENNReal.ofReal_pos.mpr (survival_pos 0))

lemma law_Ici {a : ℝ} (ha : 0 ≤ a) : law (Ici a) = ENNReal.ofReal (survival a) := by
  rw [← measure_congr (Ioi_ae_eq_Ici (μ := law)), law_Ioi ha]

lemma survival_median : survival medianValue = 1 / 2 := by
  unfold survival
  rw [show -medianValue - medianValue ^ 2 / 200 = -log 2 by linarith [medianValue_equation],
    exp_neg, exp_log (by norm_num)]
  norm_num

lemma median_upper_half : law (Ici medianValue) = 1 / 2 := by
  rw [law_Ici medianValue_pos.le, survival_median]
  norm_num [ENNReal.ofReal_div_of_pos]

lemma median_lower_half : law (Iic medianValue) = 1 / 2 := by
  have htail : law (Ioi medianValue) = 1 / 2 := by
    rw [law_Ioi medianValue_pos.le, survival_median]
    norm_num [ENNReal.ofReal_div_of_pos]
  rw [← compl_Ioi, measure_compl measurableSet_Ioi (measure_ne_top _ _), law_univ, htail]
  norm_num

lemma law_lintegral_id : (∫⁻ x, ENNReal.ofReal x ∂law) = ENNReal.ofReal meanValue := by
  rw [lintegral_eq_lintegral_meas_lt law law_nonneg_ae (by fun_prop)]
  calc
    _ = ∫⁻ t in Ioi (0 : ℝ), ENNReal.ofReal (survival t) := by
      apply setLIntegral_congr_fun measurableSet_Ioi
      intro t ht
      exact law_Ioi ht.le
    _ = _ := (ofReal_integral_eq_lintegral_ofReal survival_integrable
      (Filter.Eventually.of_forall fun x => (survival_pos x).le)).symm

lemma law_integrable_id : Integrable (fun x : ℝ => x) law := by
  apply (lintegral_ofReal_ne_top_iff_integrable (by fun_prop) law_nonneg_ae).mp
  rw [law_lintegral_id]
  exact ENNReal.ofReal_ne_top

lemma law_mean : (∫ x, x ∂law) = meanValue := by
  rw [law_integrable_id.integral_eq_integral_meas_lt law_nonneg_ae]
  apply setIntegral_congr_fun measurableSet_Ioi
  intro t ht
  change (law (Ioi t)).toReal = survival t
  rw [law_Ioi ht.le, ENNReal.toReal_ofReal (survival_pos t).le]

end Conjectures.SteinerbergerFeldheim
