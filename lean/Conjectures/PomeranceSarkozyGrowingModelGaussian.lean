module
public import Conjectures.PomeranceSarkozyGrowingPrimeMass
public import Conjectures.PomeranceSarkozyModelThresholdLaw
public import Conjectures.PomeranceSarkozyModelThresholdVariance

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory
open scoped NNReal Topology

private theorem psRate_sub_psL_div_rpow_tendsto {p : ℝ} (hp : 0 < p) :
    Tendsto (fun X => ((psRate X : ℝ) - psL X) / psL X ^ p) atTop (𝓝 0) := by
  obtain ⟨C, hC⟩ := psRate_approx
  have hlog : Tendsto (fun X => Real.log (psL X) / psL X ^ p) atTop (𝓝 0) :=
    (isLittleO_log_rpow_atTop hp).tendsto_div_nhds_zero.comp psL_tendsto
  have hbound := hlog.const_mul C
  rw [mul_zero] at hbound
  apply squeeze_zero_norm' _ hbound
  filter_upwards [hC, psL_tendsto.eventually_ge_atTop 1] with X hX hL
  have hpX := Real.rpow_nonneg (zero_le_one.trans hL) p
  rw [Real.norm_eq_abs, abs_div, abs_of_nonneg hpX, ← mul_div_assoc]
  exact div_le_div_of_nonneg_right hX hpX

private theorem psRate_div_psL_tendsto :
    Tendsto (fun X => (psRate X : ℝ) / psL X) atTop (𝓝 1) := by
  have hdiff : Tendsto (fun X => ((psRate X : ℝ) - psL X) / psL X) atTop (𝓝 0) := by
    simpa only [Real.rpow_one] using psRate_sub_psL_div_rpow_tendsto (show (0 : ℝ) < 1 by norm_num)
  have h := hdiff.add (tendsto_const_nhds (x := (1 : ℝ)))
  rw [zero_add] at h
  refine h.congr' ?_
  filter_upwards [psL_tendsto.eventually_gt_atTop 0] with X hL
  rw [sub_div, div_self hL.ne', sub_add_cancel]

private theorem psRate_tendsto : Tendsto (fun X => (psRate X : ℝ)) atTop atTop := by
  apply tendsto_atTop_mono' _ _ (psL_tendsto.const_mul_atTop (show (0 : ℝ) < 1/2 by norm_num))
  filter_upwards [psRate_div_psL_tendsto.eventually (Ioi_mem_nhds (show (1 : ℝ)/2 < 1 by norm_num)),
    psL_tendsto.eventually_gt_atTop 0] with X hratio hL
  exact (le_div_iff₀ hL).mp (le_of_lt hratio)

private theorem psH_ge_two_psRate : ∀ᶠ X in atTop, 2 * (psRate X : ℝ) ≤ (psH X : ℝ) := by
  filter_upwards [psRate_le, psL_tendsto.eventually_ge_atTop 1] with X hrate hL
  have hfloor := Nat.lt_floor_add_one (10 * psL X)
  change 10 * psL X < (psH X : ℝ) + 1 at hfloor
  linarith

private theorem psGaussian_scale_tendsto :
    Tendsto (fun X => psL X ^ (1/4 : ℝ)) atTop atTop :=
  (tendsto_rpow_atTop (show (0 : ℝ) < 1/4 by norm_num)).comp psL_tendsto

private theorem growing_model_threshold_centering :
    Tendsto (fun X => (poissonThresholdMean (psOffsets X) (psRate X) - (psL X - 1)) /
      psL X ^ (1/4 : ℝ)) atTop (𝓝 0) := by
  have htail : Tendsto (fun X => (1 + poissonThresholdMean (psOffsets X) (psRate X) -
      (psRate X : ℝ)) / psL X ^ (1/4 : ℝ)) atTop (𝓝 0) := by
    apply squeeze_zero_norm' _ ((tendsto_const_nhds (x := (1 : ℝ))).div_atTop psGaussian_scale_tendsto)
    filter_upwards [psRate_tendsto.eventually_gt_atTop 0, psH_ge_two_psRate,
      psL_tendsto.eventually_ge_atTop 0] with X hb hH hL
    have hscale := Real.rpow_nonneg hL (1/4 : ℝ)
    rw [Real.norm_eq_abs, abs_div, abs_of_nonneg hscale]
    exact div_le_div_of_nonneg_right
      (poissonSurvival_truncated_mean_bound (psRate X) (psH X) (by exact_mod_cast hb) hH) hscale
  have h := htail.add (psRate_sub_psL_div_rpow_tendsto (show (0 : ℝ) < 1/4 by norm_num))
  rw [add_zero] at h
  refine h.congr (fun X => ?_)
  rw [← add_div]
  congr 1
  ring

private theorem growing_model_threshold_variance :
    Tendsto (fun X => poissonThresholdVariance (psOffsets X) (psRate X) /
      (psL X ^ (1/4 : ℝ))^2) atTop (𝓝 (1 / Real.sqrt Real.pi)) := by
  have hvar : Tendsto (fun X => poissonThresholdVariance (psOffsets X) (psRate X) /
      Real.sqrt (psRate X : ℝ)) atTop (𝓝 (1 / Real.sqrt Real.pi)) :=
    model_threshold_variance_tendsto psRate psH psRate_tendsto psH_ge_two_psRate
  have hsqrt (X : ℕ) := Real.sqrt_div (psRate X).coe_nonneg (psL X)
  have hsqrtRatio : Tendsto (fun X => Real.sqrt (psRate X : ℝ) / Real.sqrt (psL X)) atTop (𝓝 1) := by
    simpa only [hsqrt, Real.sqrt_one] using psRate_div_psL_tendsto.sqrt
  have h := hvar.mul hsqrtRatio
  rw [mul_one] at h
  refine h.congr' ?_
  filter_upwards [psRate_tendsto.eventually_gt_atTop 0, psL_tendsto.eventually_gt_atTop 0] with X hb hL
  have hscale : (psL X ^ (1/4 : ℝ))^2 = Real.sqrt (psL X) := by
    rw [← Real.rpow_mul_natCast hL.le (1/4 : ℝ) 2, Real.sqrt_eq_rpow]
    congr 1
    norm_num
  rw [hscale]
  field_simp [ne_of_gt (Real.sqrt_pos.mpr hb), ne_of_gt (Real.sqrt_pos.mpr hL)]

/-- The growing-window independent Poisson model, with the count centered at
`log log X - 1` and divided by `(log log X)^(1/4)`, converges weakly to the
centered Gaussian with variance `1 / sqrt π`. -/
theorem growing_model_threshold_gaussian :
    Tendsto (fun X => poissonThresholdScaledLaw (psOffsets X) (psRate X) (psL X - 1)
      (psL X ^ (1/4 : ℝ))) atTop
      (𝓝 (⟨gaussianReal 0 (Real.toNNReal (1 / Real.sqrt Real.pi)), inferInstance⟩ :
        ProbabilityMeasure ℝ)) := by
  refine poisson_threshold_scaledLaw_tendsto psOffsets psRate (fun X => psL X - 1)
    (fun X => psL X ^ (1/4 : ℝ)) psGaussian_scale_tendsto _ growing_model_threshold_centering ?_
  rw [Real.coe_toNNReal _ (by positivity)]
  exact growing_model_threshold_variance

end PomeranceSarkozy
