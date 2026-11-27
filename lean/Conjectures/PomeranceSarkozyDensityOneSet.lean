module
public import Conjectures.PomeranceSarkozyGrowingCutoffs
public import Conjectures.PomeranceSarkozyMovingTail
public import Conjectures.PomeranceSarkozySourceFluctuations

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory
open scoped Topology Asymptotics Classical

/-- The explicit set where the error is at most the three-eighths power of log log n. -/
def sourceFluctuationSet : Set ℕ :=
  {n | |(sourceG n : ℝ) - psL n| ≤ psL n ^ (3/8 : ℝ)}

private theorem source_error_littleO_on_set :
    (fun n : ℕ => (sourceG n : ℝ) - psL n) =o[atTop ⊓ 𝓟 sourceFluctuationSet]
      (fun n : ℕ => Real.sqrt (psL n)) := by
  rw [Asymptotics.isLittleO_iff]
  intro c hc
  apply eventually_inf_principal.mpr
  have hpow := (tendsto_rpow_atTop (by norm_num : (0:ℝ) < 1/8)).comp psL_tendsto
  filter_upwards [psL_tendsto.eventually_gt_atTop 0, hpow.eventually_ge_atTop (1/c)]
    with n hn hb hset
  have h₁ : 1 ≤ c * psL n ^ (1/8:ℝ) := by
    simpa [mul_comm] using (div_le_iff₀ hc).mp hb
  have hs : Real.sqrt (psL n) = psL n ^ (3/8:ℝ) * psL n ^ (1/8:ℝ) := by
    rw [Real.sqrt_eq_rpow, ← Real.rpow_add hn]
    norm_num
  simp only [Real.norm_eq_abs, abs_of_nonneg (Real.sqrt_nonneg _)]
  change |(sourceG n : ℝ) - psL n| ≤ psL n ^ (3/8 : ℝ) at hset
  rw [hs]
  have hmul := mul_le_mul_of_nonneg_left h₁ (Real.rpow_nonneg hn.le (3/8:ℝ))
  exact hset.trans (by linarith)

/-- The three-eighths-power set has natural density one, and on that one set the
literal counting error is little-o of the square-root scale. -/
theorem source_density_one_fluctuations :
    Tendsto (fun X : ℕ => (((Finset.Icc 1 X).filter fun n => n ∉ sourceFluctuationSet).card : ℝ) / X)
      atTop (𝓝 0) ∧
      (fun n : ℕ => (sourceG n : ℝ) - Real.log (Real.log n)) =o[atTop ⊓ 𝓟 sourceFluctuationSet]
        (fun n : ℕ => Real.sqrt (Real.log (Real.log n))) := by
  refine ⟨?_, source_error_littleO_on_set⟩
  let f (n : ℕ) := ((sourceG n : ℝ) - psL n) / psL n ^ (1/4 : ℝ)
  let b (n : ℕ) := psL n ^ (1/8 : ℝ)
  have hb : Tendsto b atTop atTop :=
    (tendsto_rpow_atTop (by norm_num : (0:ℝ) < 1/8)).comp psL_tendsto
  have ht := source_moving_cutoff_zero_density f b source_arithmetic_quarter_gaussian hb
  refine tendsto_counting_proportion_of_eventually_imp ?_ ht
  filter_upwards [psL_tendsto.eventually_gt_atTop 0] with n hn hbad
  have he : psL n ^ (1/8:ℝ) * psL n ^ (1/4:ℝ) = psL n ^ (3/8:ℝ) := by
    rw [← Real.rpow_add hn]
    norm_num
  have hq := Real.rpow_pos_of_pos hn (1/4:ℝ)
  change ¬ |(sourceG n : ℝ) - psL n| ≤ psL n ^ (3/8:ℝ) at hbad
  dsimp only [b, f]
  rw [abs_div, abs_of_pos hq, lt_div_iff₀ hq, he]
  exact lt_of_not_ge hbad

end PomeranceSarkozy
