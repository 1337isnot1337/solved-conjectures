import Conjectures.LineSizeCoefficientAsymptoticBridge
import Mathlib.Analysis.Asymptotics.AsymptoticEquivalent

/-! The sharp asymptotic for the actual number of line-size records of
finite configurations in the real plane. All analytic and geometric
inputs are supplied by the import closure. -/
noncomputable section
namespace LineSize.CoefficientAsymptotic

open Real Filter Asymptotics
open scoped Topology

theorem count_div_rate_eq {n : ℕ} (hn : 0 < n) :
    (lineSizeCount n : ℝ)/rate n=normalizedCount n*fourthRoot Profile.A := by
  have hnorm : normalizer n ≠ 0 := (normalizer_pos hn).ne'
  have hr : rate n ≠ 0 := (rate_pos hn).ne'
  calc
    _ = ((lineSizeCount n : ℝ)/normalizer n)*(normalizer n/rate n) := by
      field_simp [hnorm,hr] <;> ring
    _ = _ := by rw [normalizer_div_rate hn]; rfl

theorem count_div_rate_tendsto :
    Tendsto (fun n : ℕ => (lineSizeCount n : ℝ)/rate n) atTop (𝓝 sharpConstant) := by
  have h := normalizedCount_tendsto.mul_const (fourthRoot Profile.A)
  rw [normalizedConstant_mul_fourthRoot] at h
  apply h.congr'
  filter_upwards [eventually_gt_atTop (0 : ℕ)] with n hn
  exact (count_div_rate_eq hn).symm

theorem ratio_tendsto_one :
    Tendsto (fun n : ℕ => (lineSizeCount n : ℝ)/sharpModel n) atTop (𝓝 1) := by
  have h := count_div_rate_tendsto.div_const sharpConstant
  rw [div_self sharpConstant_pos.ne'] at h
  apply h.congr'
  exact Filter.Eventually.of_forall (fun n => by
    rw [sharpModel,div_div]
    congr 1
    ring)

theorem lineSizeCount_asymptotic :
    (fun n : ℕ => (lineSizeCount n : ℝ)) ~[atTop] sharpModel := by
  exact Asymptotics.isEquivalent_of_tendsto_one ratio_tendsto_one

/-- The coefficient is the actual configuration-record count, with the
constant from the stated sharp asymptotic. Here `A = π²/12 + (log 2)²/2`. -/
theorem lineSizeCount_sharp_ratio :
    Tendsto (fun n : ℕ => (lineSizeCount n : ℝ)/
      ((3/(16*Real.sqrt (6*Real.pi)*Profile.A^(1/4 : ℝ)))*
        (n : ℝ)^(-(1/4 : ℝ))*Real.exp (2*Real.sqrt (Profile.A*(n : ℝ)))))
      atTop (𝓝 1) := by
  simpa only [sharpModel_eq_rpow] using ratio_tendsto_one

theorem lineSizeCount_sharp_asymptotic :
    (fun n : ℕ => (lineSizeCount n : ℝ)) ~[atTop]
      (fun n : ℕ => (3/(16*Real.sqrt (6*Real.pi)*Profile.A^(1/4 : ℝ)))*
        (n : ℝ)^(-(1/4 : ℝ))*Real.exp (2*Real.sqrt (Profile.A*(n : ℝ)))) := by
  exact Asymptotics.isEquivalent_of_tendsto_one lineSizeCount_sharp_ratio

end LineSize.CoefficientAsymptotic
