import Conjectures.OrdinaryDarcaisSaddle
import Conjectures.HeimNeuhauserPlanePartitionFourierCentral

/-! Damping and centered phase of the Fourier transform at a positive radius. -/

namespace OrdinaryDarcais

open Real

noncomputable def intensity (x r : ℝ) (k : ℕ) : ℝ :=
  x * (divisorSum k : ℝ) * r ^ k / k

private theorem intensity_nonneg {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (k : ℕ) :
    0 ≤ intensity x r k := by unfold intensity; positivity

theorem intensity_summable {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    Summable (intensity x r) := by
  refine Summable.of_nonneg_of_le (intensity_nonneg hx hr) (fun k => ?_) ((moment_summable 0 hr hr').mul_left x)
  cases k with
  | zero => simp [intensity, momentTerm, divisorSum]
  | succ k =>
    simp only [intensity, momentTerm, pow_zero, one_mul, ← mul_assoc]
    exact div_le_self (by positivity) (by exact_mod_cast Nat.succ_le_succ (Nat.zero_le k))

theorem intensity_mul_power (x r : ℝ) (k j : ℕ) :
    intensity x r k * (k : ℝ) ^ (j + 1) = x * momentTerm j k r := by
  by_cases hk : k = 0
  · simp [hk, intensity, momentTerm, divisorSum]
  have h : (k : ℝ) ≠ 0 := by exact_mod_cast hk
  unfold intensity momentTerm
  rw [pow_succ]
  field_simp

noncomputable def damping (x r t : ℝ) : ℝ :=
  ∑' k : ℕ, intensity x r k * (1 - cos (k * t))

noncomputable def phase (x r t : ℝ) : ℝ :=
  (∑' k : ℕ, intensity x r k * sin (k * t)) - x * moment 0 r * t

private theorem damping_norm {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (k : ℕ) (t : ℝ) :
    ‖intensity x r k * (1 - cos (k * t))‖ ≤ 2 * intensity x r k := by
  have hi := intensity_nonneg hx hr k
  rw [Real.norm_eq_abs, abs_of_nonneg (mul_nonneg hi (sub_nonneg.mpr (cos_le_one _)))]
  nlinarith only [mul_nonneg hi (by linarith [neg_one_le_cos ((k : ℝ) * t)] : 0 ≤ 1 + cos ((k : ℝ) * t))]

private theorem sine_norm {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (k : ℕ) (t : ℝ) :
    ‖intensity x r k * sin (k * t)‖ ≤ intensity x r k := by
  rw [Real.norm_eq_abs, abs_mul, abs_of_nonneg (intensity_nonneg hx hr k)]
  simpa only [mul_one] using mul_le_mul_of_nonneg_left (abs_sin_le_one ((k : ℝ) * t)) (intensity_nonneg hx hr k)

theorem damping_continuous {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    Continuous (damping x r) :=
  continuous_tsum (fun k => by fun_prop) ((intensity_summable hx hr hr').mul_left 2) (damping_norm hx hr)

theorem phase_continuous {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) :
    Continuous (phase x r) := by
  unfold phase
  exact (continuous_tsum (fun k => by fun_prop) (intensity_summable hx hr hr') (sine_norm hx hr)).sub
    (continuous_const.mul continuous_id)

theorem damping_bound {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) (t : ℝ) :
    damping x r t ≤ (x * moment 1 r) * t ^ 2 / 2 := by
  have hI := intensity_summable hx hr hr'
  have hD : Summable (fun k : ℕ => intensity x r k * (1 - cos (k * t))) :=
    (hI.mul_left 2).of_norm_bounded (fun k => damping_norm hx hr k t)
  have hM := ((moment_summable 1 hr hr').mul_left x).mul_right (t ^ 2 / 2)
  have h (k : ℕ) : intensity x r k * (1 - cos (k * t)) ≤
      (x * momentTerm 1 k r) * (t ^ 2 / 2) := by
    rw [← intensity_mul_power x r k 1]
    calc
      _ ≤ intensity x r k * (((k : ℝ) * t) ^ 2 / 2) :=
        mul_le_mul_of_nonneg_left (by linarith [one_sub_sq_div_two_le_cos (x := (k : ℝ) * t)]) (intensity_nonneg hx hr k)
      _ = _ := by ring
  have hs := hD.tsum_le_tsum h hM
  simpa only [damping, moment, tsum_mul_right, tsum_mul_left, mul_div_assoc] using hs

theorem phase_bound {x r : ℝ} (hx : 0 ≤ x) (hr : 0 ≤ r) (hr' : r < 1) (t : ℝ) :
    |phase x r t| ≤ (x * moment 2 r) * |t| ^ 3 / 6 := by
  have hI := intensity_summable hx hr hr'
  have hS : Summable (fun k : ℕ => intensity x r k * sin (k * t)) :=
    hI.of_norm_bounded (fun k => sine_norm hx hr k t)
  have hM := ((moment_summable 0 hr hr').mul_left x).mul_right t
  have hK := ((moment_summable 2 hr hr').mul_left x).mul_right (|t| ^ 3 / 6)
  have hEq : phase x r t = ∑' k : ℕ,
      (intensity x r k * sin (k * t) - (x * momentTerm 0 k r) * t) := by
    rw [hS.tsum_sub hM]
    simp only [phase, moment, tsum_mul_right, tsum_mul_left]
  have h (k : ℕ) : ‖intensity x r k * sin (k * t) - (x * momentTerm 0 k r) * t‖ ≤
      (x * momentTerm 2 k r) * (|t| ^ 3 / 6) := by
    rw [← intensity_mul_power x r k 0, ← intensity_mul_power x r k 2]
    simp only [Nat.zero_add, pow_one, Nat.reduceAdd, Real.norm_eq_abs, mul_assoc, ← mul_sub,
      abs_mul, abs_of_nonneg (intensity_nonneg hx hr k)]
    have hs := abs_sub_sin_le ((k : ℝ) * t)
    rw [abs_sub_comm ((k : ℝ) * t)] at hs
    simp only [abs_mul, abs_of_nonneg (show 0 ≤ (k : ℝ) by positivity)] at hs
    calc
      _ ≤ intensity x r k * (((k : ℝ) * |t|) ^ 3 / 6) :=
        mul_le_mul_of_nonneg_left hs (intensity_nonneg hx hr k)
      _ = _ := by ring
  rw [hEq, ← Real.norm_eq_abs]
  have hs := tsum_of_norm_bounded hK.hasSum h
  simpa only [moment, tsum_mul_right, tsum_mul_left, mul_div_assoc] using hs

end OrdinaryDarcais
