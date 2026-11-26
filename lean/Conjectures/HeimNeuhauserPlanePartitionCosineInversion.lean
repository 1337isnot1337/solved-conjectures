import Conjectures.HeimNeuhauserPlanePartitionTilt
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Fourier inversion of the centered second difference for an absolutely
summable discrete mass sequence. -/

namespace PlanePartition

open Real Set MeasureTheory
open scoped Interval

private theorem integral_integer_cos (k : ℤ) :
    (∫ t in (0 : ℝ)..π, cos ((k : ℝ) * t)) = if k = 0 then π else 0 := by
  by_cases h : k = 0
  · simp [h]
  · have hk : (k : ℝ) ≠ 0 := by exact_mod_cast h
    rw [intervalIntegral.integral_comp_mul_left cos hk]
    simp [h, integral_cos, sin_int_mul_pi]

private noncomputable def integerMass (k : ℤ) : ℝ := if k = 0 then π else 0

private noncomputable def cosineWeight (k : ℤ) : ℝ :=
  integerMass k - (integerMass (k + 1) + integerMass (k - 1)) / 2

private noncomputable def kernelTerm (k : ℤ) (t : ℝ) :=
  (1 - cos t) * cos ((k : ℝ) * t)

private theorem kernelTerm_continuous (k : ℤ) : Continuous (kernelTerm k) := by
  unfold kernelTerm
  fun_prop

private theorem kernelTerm_integral (k : ℤ) :
    (∫ t in (0 : ℝ)..π, kernelTerm k t) = cosineWeight k := by
  let f (j : ℤ) (t : ℝ) := cos ((j : ℝ) * t)
  have hi (j : ℤ) : IntervalIntegrable (f j) volume 0 π :=
    (show Continuous (f j) by unfold f; fun_prop).intervalIntegrable ..
  have he (t : ℝ) : kernelTerm k t = f k t - (f (k + 1) t + f (k - 1) t) / 2 := by
    simp only [kernelTerm, f, Int.cast_add, Int.cast_sub, Int.cast_one, add_mul, sub_mul, one_mul,
      cos_add, cos_sub]
    ring
  simp_rw [he]
  rw [intervalIntegral.integral_sub (hi k) (((hi (k + 1)).add (hi (k - 1))).div_const 2),
    intervalIntegral.integral_div, intervalIntegral.integral_add (hi (k + 1)) (hi (k - 1))]
  simp only [f, integral_integer_cos, cosineWeight, integerMass]

private theorem kernelTerm_norm (k : ℤ) (t : ℝ) : ‖kernelTerm k t‖ ≤ 2 := by
  rw [kernelTerm, Real.norm_eq_abs, abs_mul, abs_of_nonneg (sub_nonneg.mpr (cos_le_one _))]
  calc
    _ ≤ (1 - cos t) * 1 :=
      mul_le_mul_of_nonneg_left (abs_cos_le_one _) (sub_nonneg.mpr (cos_le_one _))
    _ ≤ _ := by linarith [neg_one_le_cos t]

/-- Integrate the centered cosine series term by term. The kernel retains
exactly the central mass and its two neighbors. -/
theorem centered_cosine_inversion (a : ℕ → ℝ) (ha : Summable (fun k => |a k|))
    {n : ℕ} (hn : 0 < n) :
    (∫ t in (0 : ℝ)..π, (1 - cos t) * ∑' k : ℕ, a k * cos (((k : ℤ) - n : ℤ) * t)) =
      π * (a n - (a (n - 1) + a (n + 1)) / 2) := by
  let F (k : ℕ) (t : ℝ) := a k * kernelTerm ((k : ℤ) - n) t
  have hi (k : ℕ) : IntervalIntegrable (F k) volume 0 π :=
    (continuous_const.mul (kernelTerm_continuous ((k : ℤ) - n))).intervalIntegrable ..
  have hnorm (k : ℕ) (t : ℝ) : ‖F k t‖ ≤ |a k| * 2 := by
    rw [show F k t = a k * kernelTerm ((k : ℤ) - n) t from rfl, norm_mul, Real.norm_eq_abs (a k)]
    exact mul_le_mul_of_nonneg_left (kernelTerm_norm _ _) (abs_nonneg _)
  have hsum : Summable (fun k => ∫ t in Ioc (0 : ℝ) π, ‖F k t‖) := by
    apply Summable.of_nonneg_of_le (fun _ => integral_nonneg fun _ => norm_nonneg _) _ (ha.mul_right (2 * π))
    intro k
    calc
      _ ≤ ∫ _ in Ioc (0 : ℝ) π, |a k| * 2 :=
        integral_mono (hi k).1.norm (integrableOn_const (by simp : volume (Ioc (0 : ℝ) π) ≠ ⊤)) (hnorm k)
      _ = _ := by simp [Real.volume_real_Ioc_of_le pi_pos.le]; ring
  have he (t : ℝ) :
      (1 - cos t) * ∑' k : ℕ, a k * cos (((k : ℤ) - n : ℤ) * t) = ∑' k : ℕ, F k t := by
    rw [← tsum_mul_left]
    congr 1
    funext k
    unfold F kernelTerm
    ring
  simp_rw [he]
  rw [intervalIntegral.integral_of_le pi_pos.le, ← integral_tsum_of_summable_integral_norm (fun k => (hi k).1) hsum]
  simp_rw [← intervalIntegral.integral_of_le pi_pos.le, F, intervalIntegral.integral_const_mul, kernelTerm_integral]
  rw [tsum_eq_sum (s := {n - 1, n, n + 1})]
  · have ha₁ : n - 1 ≠ n := by omega
    have ha₂ : n - 1 ≠ n + 1 := by omega
    have hminus : ((n - 1 : ℕ) : ℤ) - n = -1 := by omega
    simp [ha₁, ha₂, hminus, cosineWeight, integerMass]
    ring
  · intro k hk
    simp only [Finset.mem_insert, Finset.mem_singleton] at hk
    simp only [cosineWeight, integerMass]
    rw [ite_eq_right (by omega : (k : ℤ) - n ≠ 0),
      ite_eq_right (by omega : (k : ℤ) - n + 1 ≠ 0), ite_eq_right (by omega : (k : ℤ) - n - 1 ≠ 0)]
    ring

end PlanePartition
