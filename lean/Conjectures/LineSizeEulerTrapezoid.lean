import Conjectures.LineSizeEulerKernel
import Mathlib.MeasureTheory.Integral.IntervalIntegral.TrapezoidalRule
import Mathlib.Analysis.Normed.Group.Bounded

/-! The endpoint correction for the regular part of the finite Euler sum.
The error is uniform when the moving right endpoint stays in a fixed bounded
interval. The singular logarithm is handled separately by Stirling's formula. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set Filter MeasureTheory Finset
open scoped Topology Interval

def regularSum (r : ℕ) (t : ℝ) : ℝ :=
  ∑ j ∈ range r, smoothLog (((j : ℝ) + 1) * t)

def regularIntegral (u : ℝ) : ℝ := ∫ x in 0..u, smoothLog x

theorem regularSum_split {r : ℕ} (hr : 0 < r) (t : ℝ) :
    regularSum r t =
      (∑ j ∈ range (r - 1), smoothLog (((j : ℝ) + 1) * t)) +
        smoothLog ((r : ℝ) * t) := by
  unfold regularSum
  conv_lhs => rw [← Nat.sub_one_add_one_eq_of_pos hr]
  rw [sum_range_succ]
  congr 1
  congr 1
  simp only [Nat.cast_sub hr, Nat.cast_one, sub_add_cancel]

theorem trapezoidal_regularSum {r : ℕ} (hr : 0 < r) (t : ℝ) :
    trapezoidal_integral smoothLog r 0 ((r : ℝ) * t) =
      t * (regularSum r t - smoothLog ((r : ℝ) * t) / 2) := by
  have hr0 : (r : ℝ) ≠ 0 := Nat.cast_ne_zero.mpr hr.ne'
  have harg (j : ℕ) :
      ((j : ℝ) + 1) * ((r : ℝ) * t) / (r : ℝ) = ((j : ℝ) + 1) * t := by
    field_simp [hr0]
  have hstep : ((r : ℝ) * t) / (r : ℝ) = t := by
    field_simp [hr0]
  simp only [trapezoidal_integral, sub_zero, zero_add, smoothLog_zero, hstep, harg]
  rw [regularSum_split hr]
  ring

theorem smoothLog_second_derivative_bound (b : ℝ) (hb : 0 ≤ b) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ x ∈ Icc 0 b, |iteratedDeriv 2 smoothLog x| ≤ C := by
  obtain ⟨C, hC⟩ := isCompact_Icc.exists_bound_of_continuousOn
    (ContDiff.continuous_iteratedDeriv' 2 (smoothLog_contDiff 2)).continuousOn
  have hzero := hC 0 (show (0 : ℝ) ∈ Icc 0 b from ⟨le_rfl, hb⟩)
  refine ⟨C, (norm_nonneg _).trans hzero, ?_⟩
  intro x hx
  simpa only [Real.norm_eq_abs] using hC x hx

theorem regularSum_error_bound {r : ℕ} {t C : ℝ}
    (hr : 0 < r) (ht : 0 < t) (hC : 0 ≤ C)
    (hbound : ∀ x ∈ Icc 0 ((r : ℝ) * t),
      |iteratedDeriv 2 smoothLog x| ≤ C) :
    |regularSum r t -
      (regularIntegral ((r : ℝ) * t) / t + smoothLog ((r : ℝ) * t) / 2)| ≤
      (r : ℝ) * t ^ 2 * C / 12 := by
  have hrpos : (0 : ℝ) < r := Nat.cast_pos.mpr hr
  have hu : 0 < (r : ℝ) * t := mul_pos hrpos ht
  have hbound' : ∀ x,
      |iteratedDerivWithin 2 smoothLog (uIcc 0 ((r : ℝ) * t)) x| ≤ C := by
    rw [uIcc_of_le hu.le]
    intro x
    by_cases hx : x ∈ Icc 0 ((r : ℝ) * t)
    · rw [iteratedDerivWithin_eq_iteratedDeriv (uniqueDiffOn_Icc hu)
        (smoothLog_contDiff 2).contDiffAt hx]
      exact hbound x hx
    · rw [iteratedDerivWithin_succ, derivWithin_zero_of_notMem_closure
        (by rwa [closure_Icc]), abs_zero]
      exact hC
  have herr := trapezoidal_error_le_of_c2
    (f := smoothLog) (a := 0) (b := (r : ℝ) * t)
    (smoothLog_contDiff 2).contDiffOn hbound' hr
  rw [trapezoidal_error, trapezoidal_regularSum hr] at herr
  simp only [sub_zero, abs_of_pos hu] at herr
  have halgebra :
      t * (regularSum r t - smoothLog ((r : ℝ) * t) / 2) -
        regularIntegral ((r : ℝ) * t) =
      t * (regularSum r t -
        (regularIntegral ((r : ℝ) * t) / t + smoothLog ((r : ℝ) * t) / 2)) := by
    field_simp
    ring
  change |t * (regularSum r t - smoothLog ((r : ℝ) * t) / 2) -
      regularIntegral ((r : ℝ) * t)| ≤ ((r : ℝ) * t) ^ 3 * C / (12 * (r : ℝ) ^ 2) at herr
  rw [halgebra, abs_mul, abs_of_pos ht] at herr
  have hright : ((r : ℝ) * t) ^ 3 * C / (12 * (r : ℝ) ^ 2) =
      t * ((r : ℝ) * t ^ 2 * C / 12) := by
    field_simp
  rw [hright] at herr
  exact (mul_le_mul_iff_right₀ ht).mp herr

theorem regularSum_error_uniform {b : ℝ} (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < r → 0 < t → (r : ℝ) * t ≤ b →
      |regularSum r t -
        (regularIntegral ((r : ℝ) * t) / t + smoothLog ((r : ℝ) * t) / 2)| ≤ C * t := by
  obtain ⟨B, hB, hbound⟩ := smoothLog_second_derivative_bound b hb.le
  refine ⟨b * B / 12 + 1, by positivity, ?_⟩
  intro r t hr ht hu
  have h := regularSum_error_bound hr ht hB (fun x hx => hbound x ⟨hx.1, hx.2.trans hu⟩)
  calc
    _ ≤ (r : ℝ) * t ^ 2 * B / 12 := h
    _ = ((r : ℝ) * t) * B / 12 * t := by ring
    _ ≤ (b * B / 12) * t := by gcongr
    _ ≤ (b * B / 12 + 1) * t := by gcongr; linarith

end LineSize.EulerKernel
