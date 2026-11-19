import Conjectures.LineSizeEulerProduct
import Conjectures.LineSizeAnalyticProfile
import Mathlib.Analysis.SumIntegralComparisons

/-! Bounds for the literal positive core weights. The finite Euler sum is
compared with its own truncated integral, preserving the global saddle
profile needed outside a fixed compact interval. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set MeasureTheory Finset

theorem logEuler_le_integral (r : ℕ) {t : ℝ} (ht : 0 < t) :
    RectangleEuler.logEuler r t ≤ Profile.I ((r : ℝ) * t) / t := by
  let F : ℝ → ℝ := fun x => Profile.f (x * t)
  have hmono : AntitoneOn F (Ioc 0 (0 + (r : ℝ))) := by
    intro x hx y hy hxy
    exact Profile.f_strictAntiOn.antitoneOn (mul_pos hx.1 ht) (mul_pos hy.1 ht)
      (mul_le_mul_of_nonneg_right hxy ht.le)
  have hi : IntervalIntegrable F volume 0 (r : ℝ) := by
    have h := (Profile.intervalIntegrable_f (u := (r : ℝ) * t) (by positivity)).comp_mul_right (c := t)
    simpa only [zero_div, mul_div_cancel_right₀ _ ht.ne'] using h
  have hfi : IntegrableOn F (Icc 0 (0 + (r : ℝ))) := by
    simpa only [zero_add] using (intervalIntegrable_iff_integrableOn_Icc_of_le
      (by positivity : (0 : ℝ) ≤ r)).mp hi
  have h := hmono.sum_le_integral_of_integrableOn hfi
  have hsum : (∑ j ∈ range r, F (0 + (j + 1 : ℕ))) = RectangleEuler.logEuler r t := by
    simp only [F, RectangleEuler.logEuler, Profile.f, zero_add, Nat.cast_add,
      Nat.cast_one, neg_mul]
  have hint : (∫ x in 0..0 + (r : ℝ), F x) = Profile.I ((r : ℝ) * t) / t := by
    rw [zero_add]
    dsimp [F]
    rw [intervalIntegral.integral_comp_mul_right _ ht.ne']
    simp only [zero_mul, smul_eq_mul, Profile.I, div_eq_mul_inv, mul_comm]
  rw [hsum, hint] at h
  exact h

def coreWeight (r : ℕ) (β t : ℝ) : ℝ :=
  exp ((r : ℝ) * log 2 - t * ((r : ℝ) ^ 2 + β * (r : ℝ))) * finiteProduct r t

theorem coreWeight_pos (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) :
    0 < coreWeight r β t := mul_pos (Real.exp_pos _) (finiteProduct_pos r ht)

theorem coreWeight_eq_exp (r : ℕ) (β : ℝ) {t : ℝ} (ht : 0 < t) :
    coreWeight r β t = exp ((r : ℝ) * log 2 -
      t * ((r : ℝ) ^ 2 + β * (r : ℝ)) + RectangleEuler.logEuler r t) := by
  rw [coreWeight, ← exp_logEuler r ht, ← Real.exp_add]

theorem coreWeight_le_phase (r : ℕ) {β t : ℝ} (hβ : 0 ≤ β) (ht : 0 < t) :
    coreWeight r β t ≤ exp (Profile.Phi ((r : ℝ) * t) / t) := by
  rw [coreWeight_eq_exp r β ht]
  apply Real.exp_le_exp.mpr
  have h := logEuler_le_integral r ht
  have hid : Profile.Phi ((r : ℝ) * t) / t =
      (r : ℝ) * log 2 - t * (r : ℝ) ^ 2 + Profile.I ((r : ℝ) * t) / t := by
    unfold Profile.Phi
    field_simp
    ring
  rw [hid]
  have hnonneg : 0 ≤ t * β * (r : ℝ) := by positivity
  nlinarith

theorem coreWeight_le_gaussian (r : ℕ) {β t : ℝ} (hβ : 0 ≤ β) (ht : 0 < t) :
    coreWeight r β t ≤
      exp ((Profile.A - ((r : ℝ) * t - Profile.u0) ^ 2) / t) := by
  apply (coreWeight_le_phase r hβ ht).trans
  apply Real.exp_le_exp.mpr
  exact div_le_div_of_nonneg_right (Profile.Phi_le_gaussian (by positivity)) ht.le

theorem coreWeight_correction_exact {r : ℕ} {β t : ℝ} (hr : 0 < r) (ht : 0 < t) :
    coreWeight r β t =
      exp (Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t)) *
        sqrt (t / (2 * Real.pi * (1 - exp (-((r : ℝ) * t))))) *
        exp (regularError r t - stirlingError r) := by
  rw [coreWeight, finiteProduct_correction_exact hr ht]
  have hexp : (r : ℝ) * log 2 - t * ((r : ℝ) ^ 2 + β * (r : ℝ)) +
      Profile.I ((r : ℝ) * t) / t =
      Profile.Phi ((r : ℝ) * t) / t - β * ((r : ℝ) * t) := by
    unfold Profile.Phi
    field_simp
    ring
  rw [← hexp, Real.exp_add]
  ring

end LineSize.EulerKernel
