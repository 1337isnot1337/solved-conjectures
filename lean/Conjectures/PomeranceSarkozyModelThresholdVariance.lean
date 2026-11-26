module
public import Conjectures.PomeranceSarkozyModelThresholdMoment
public import Conjectures.PomeranceSarkozyModelThresholdTails

@[expose] public section
namespace PomeranceSarkozy

open Filter
open scoped NNReal Topology

/-- Leading variance of the indicators with offsets from 1 through H. -/
theorem model_threshold_variance_tendsto (b : ℕ → ℝ≥0) (H : ℕ → ℕ)
    (hb : Tendsto (fun n => (b n : ℝ)) atTop atTop)
    (hH : ∀ᶠ n in atTop, 2 * (b n : ℝ) ≤ H n) :
    Tendsto (fun n => (∑ h ∈ Finset.Icc 1 (H n),
      (poissonSurvival (b n) h).toReal * (1 - (poissonSurvival (b n) h).toReal)) /
      Real.sqrt (b n : ℝ)) atTop (𝓝 (1 / Real.sqrt Real.pi)) := by
  let v (n h : ℕ) := (poissonSurvival (b n) h).toReal *
    (1 - (poissonSurvival (b n) h).toReal)
  let tail (n : ℕ) := (∑' h, v n h) - ∑ h ∈ Finset.Icc 1 (H n), v n h
  have hs : Tendsto (fun n => Real.sqrt (b n : ℝ)) atTop atTop := by
    simp_rw [Real.sqrt_eq_rpow]
    exact (tendsto_rpow_atTop (by norm_num : (0 : ℝ) < 1 / 2)).comp hb
  have ht : Tendsto (fun n => tail n / Real.sqrt (b n : ℝ)) atTop (𝓝 0) := by
    have hbound : Tendsto (fun n => (2 : ℝ) / Real.sqrt (b n : ℝ)) atTop (𝓝 0) :=
      tendsto_const_nhds.div_atTop hs
    apply squeeze_zero_norm' _ hbound
    filter_upwards [hb.eventually_gt_atTop 0, hH] with n hn hh
    rw [Real.norm_eq_abs, abs_div, abs_of_nonneg (Real.sqrt_nonneg _)]
    exact div_le_div_of_nonneg_right
      (poissonSurvival_truncated_variance_bound (b n) (H n) (by exact_mod_cast hn) hh)
      (Real.sqrt_nonneg _)
  have h := (poisson_threshold_variance_tsum_tendsto b hb).sub ht
  rw [sub_zero] at h
  refine h.congr (fun n => ?_)
  dsimp only [tail, v, Pi.sub_apply]
  ring

end PomeranceSarkozy
