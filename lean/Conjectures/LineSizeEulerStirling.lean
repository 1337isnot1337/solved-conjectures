import Mathlib.Analysis.SpecialFunctions.Stirling
import Mathlib.Analysis.SpecialFunctions.Log.Sum
import Mathlib.Tactic

/-! Logarithmic Stirling remainder with its literal factorial identity.
The limiting constant is the one proved in Mathlib from Wallis' product. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Filter
open scoped Topology

def stirlingError (r : ℕ) : ℝ :=
  log (Stirling.stirlingSeq r) - log pi / 2

theorem tendsto_stirlingError : Tendsto stirlingError atTop (𝓝 0) := by
  have hlog := (Real.continuousAt_log (Real.sqrt_pos.mpr Real.pi_pos).ne').tendsto.comp
    Stirling.tendsto_stirlingSeq_sqrt_pi
  have h := hlog.sub_const (log pi / 2)
  simpa only [stirlingError, Real.log_sqrt Real.pi_pos.le, sub_self] using h

theorem stirlingError_nonneg {r : ℕ} (hr : 0 < r) : 0 ≤ stirlingError r := by
  have hs := Stirling.sqrt_pi_le_stirlingSeq hr.ne'
  have hlog := Real.log_le_log (Real.sqrt_pos.mpr Real.pi_pos) hs
  rw [Real.log_sqrt Real.pi_pos.le] at hlog
  exact sub_nonneg.mpr hlog

theorem stirlingError_step (n : ℕ) :
    stirlingError (n + 1) - 1 / (12 * ((n : ℝ) + 1)) ≤
      stirlingError (n + 2) - 1 / (12 * ((n : ℝ) + 2)) := by
  have h := Stirling.log_stirlingSeq_sdiff_le (n + 1)
  have htel : 1 / (12 * ((n : ℝ) + 1) * (((n : ℝ) + 1) + 1)) =
      1 / (12 * ((n : ℝ) + 1)) - 1 / (12 * ((n : ℝ) + 2)) := by
    field_simp
    <;> ring
  push_cast at h
  rw [htel] at h
  unfold stirlingError
  linarith

theorem stirlingError_le {r : ℕ} (hr : 0 < r) :
    stirlingError r ≤ 1 / (12 * (r : ℝ)) := by
  have hm : Monotone (fun n : ℕ =>
      stirlingError (n + 1) - 1 / (12 * ((n : ℝ) + 1))) :=
    monotone_nat_of_le_succ (fun n => by simpa [Nat.cast_add, add_assoc] using stirlingError_step n)
  have he : Tendsto (fun n : ℕ => stirlingError (n + 1)) atTop (𝓝 0) :=
    tendsto_stirlingError.comp (tendsto_add_atTop_nat 1)
  have hi : Tendsto (fun n : ℕ => 1 / (12 * ((n : ℝ) + 1))) atTop (𝓝 0) := by
    simpa only [div_div, mul_comm, zero_div] using
      (tendsto_one_div_add_atTop_nhds_zero_nat (𝕜 := ℝ)).div_const 12
  have h := hm.ge_of_tendsto (by simpa using he.sub hi) (r - 1)
  rw [Nat.sub_one_add_one_eq_of_pos hr] at h
  simpa only [Nat.cast_sub hr, Nat.cast_one, sub_add_cancel, sub_nonpos] using h

theorem log_factorial_stirling_exact {r : ℕ} (hr : 0 < r) :
    log (r.factorial : ℝ) =
      (r : ℝ) * log (r : ℝ) - (r : ℝ) + log (r : ℝ) / 2 +
        log (2 * pi) / 2 + stirlingError r := by
  have hr0 : (r : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hr.ne'
  have h := Stirling.log_stirlingSeq_formula r
  rw [Real.log_div hr0 (Real.exp_pos 1).ne', Real.log_exp,
    Real.log_mul (by norm_num : (2 : ℝ) ≠ 0) hr0] at h
  rw [Real.log_mul (by norm_num : (2 : ℝ) ≠ 0) Real.pi_pos.ne']
  unfold stirlingError
  linarith

theorem sum_log_steps {r : ℕ} {t : ℝ} (ht : 0 < t) :
    (∑ j ∈ Finset.range r, log (((j : ℝ) + 1) * t)) =
      log (r.factorial : ℝ) + (r : ℝ) * log t := by
  have hmul (j : ℕ) : log (((j : ℝ) + 1) * t) = log ((j : ℝ) + 1) + log t :=
    Real.log_mul (by positivity) ht.ne'
  simp_rw [hmul]
  rw [Finset.sum_add_distrib, Real.sum_log_add_one_eq_log_factorial]
  simp

end LineSize.EulerKernel
