import Conjectures.LineSizeEulerTrapezoid
import Conjectures.LineSizeEulerStirling
import Conjectures.LineSizeAnalyticProfileIntegral
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

/-! Uniform finite Euler-product correction, with the literal product and
the exact factorial and smooth-integration remainders. -/
noncomputable section
namespace LineSize.EulerKernel

open Real Set Filter MeasureTheory Finset
open scoped Topology

theorem regularIntegral_eq {u : ℝ} (hu : 0 < u) :
    regularIntegral u = u * log u - u + Profile.I u := by
  calc
    regularIntegral u = ∫ x in 0..u, log x + Profile.f x := by
      apply intervalIntegral.integral_congr_Ioo_of_le hu.le
      intro x hx
      rw [smoothLog_eq hx.1]
      simp only [Profile.f, sub_eq_add_neg]
    _ = (∫ x in 0..u, log x) + (∫ x in 0..u, Profile.f x) :=
      intervalIntegral.integral_add intervalIntegrable_log (Profile.intervalIntegrable_f hu.le)
    _ = u * log u - u + Profile.I u := by
      rw [integral_log_from_zero]
      rfl

theorem logEuler_eq_regularSum {r : ℕ} {t : ℝ} (ht : 0 < t) :
    RectangleEuler.logEuler r t =
      regularSum r t - (log (r.factorial : ℝ) + (r : ℝ) * log t) := by
  have hterm (j : ℕ) :
      -log (1 - exp (-((j : ℝ) + 1) * t)) =
        smoothLog (((j : ℝ) + 1) * t) - log (((j : ℝ) + 1) * t) := by
    rw [smoothLog_eq (by positivity)]
    simp only [neg_mul]
    ring
  simp only [RectangleEuler.logEuler, hterm, sum_sub_distrib, sum_log_steps ht, regularSum]

def regularError (r : ℕ) (t : ℝ) : ℝ :=
  regularSum r t -
    (regularIntegral ((r : ℝ) * t) / t + smoothLog ((r : ℝ) * t) / 2)

def logMain (r : ℕ) (t : ℝ) : ℝ :=
  Profile.I ((r : ℝ) * t) / t +
    (log t - log (2 * pi) - log (1 - exp (-((r : ℝ) * t)))) / 2

theorem logEuler_correction_exact {r : ℕ} {t : ℝ} (hr : 0 < r) (ht : 0 < t) :
    RectangleEuler.logEuler r t = logMain r t + regularError r t - stirlingError r := by
  have hrpos : (0 : ℝ) < r := Nat.cast_pos.mpr hr
  have hu : 0 < (r : ℝ) * t := mul_pos hrpos ht
  rw [logEuler_eq_regularSum ht, log_factorial_stirling_exact hr]
  unfold logMain regularError
  rw [regularIntegral_eq hu, smoothLog_eq hu, Real.log_mul hrpos.ne' ht.ne']
  field_simp
  <;> ring

theorem logEuler_correction_uniform {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t : ℝ), 0 < r → 0 < t →
      a ≤ (r : ℝ) * t → (r : ℝ) * t ≤ b →
      |RectangleEuler.logEuler r t - logMain r t| ≤ C * t := by
  obtain ⟨B, hB, hbound⟩ := regularSum_error_uniform hb
  refine ⟨B + 1 / (12 * a), by positivity, ?_⟩
  intro r t hr ht ha' hb'
  have hs : |stirlingError r| ≤ 1 / (12 * (r : ℝ)) := by
    rw [abs_of_nonneg (stirlingError_nonneg hr)]
    exact stirlingError_le hr
  have hrecip : 1 / (12 * (r : ℝ)) ≤ 1 / (12 * a) * t := by
    have hrpos : (0 : ℝ) < r := Nat.cast_pos.mpr hr
    rw [div_mul_eq_mul_div, one_mul]
    apply (div_le_div_iff₀ (by positivity) (by positivity)).mpr
    nlinarith
  rw [logEuler_correction_exact hr ht]
  have heq : logMain r t + regularError r t - stirlingError r - logMain r t =
      regularError r t - stirlingError r := by ring
  rw [heq]
  calc
    _ ≤ |regularError r t| + |stirlingError r| := abs_sub _ _
    _ ≤ B * t + 1 / (12 * (r : ℝ)) := add_le_add (hbound r t hr ht hb') hs
    _ ≤ B * t + 1 / (12 * a) * t := add_le_add_left hrecip _
    _ = (B + 1 / (12 * a)) * t := by ring

def finiteProduct (r : ℕ) (t : ℝ) : ℝ :=
  ∏ j ∈ range r, (1 - exp (-((j : ℝ) + 1) * t))⁻¹

theorem finiteProduct_pos (r : ℕ) {t : ℝ} (ht : 0 < t) : 0 < finiteProduct r t := by
  apply Finset.prod_pos
  intro j hj
  apply inv_pos.mpr
  have h := Profile.one_sub_exp_neg_pos (show 0 < ((j : ℝ) + 1) * t by positivity)
  simpa only [neg_mul] using h

theorem exp_logEuler (r : ℕ) {t : ℝ} (ht : 0 < t) :
    exp (RectangleEuler.logEuler r t) = finiteProduct r t := by
  unfold RectangleEuler.logEuler finiteProduct
  rw [Real.exp_sum]
  apply Finset.prod_congr rfl
  intro j hj
  have hp : 0 < 1 - exp (-((j : ℝ) + 1) * t) := by
    simpa only [neg_mul] using
      Profile.one_sub_exp_neg_pos (show 0 < ((j : ℝ) + 1) * t by positivity)
  rw [Real.exp_neg, Real.exp_log hp]

theorem exp_logMain {r : ℕ} {t : ℝ} (hr : 0 < r) (ht : 0 < t) :
    exp (logMain r t) = exp (Profile.I ((r : ℝ) * t) / t) *
      sqrt (t / (2 * pi * (1 - exp (-((r : ℝ) * t))))) := by
  have hu : 0 < (r : ℝ) * t := mul_pos (Nat.cast_pos.mpr hr) ht
  have hp := Profile.one_sub_exp_neg_pos hu
  have hden : 0 < 2 * pi * (1 - exp (-((r : ℝ) * t))) := by positivity
  have hquot : 0 < t / (2 * pi * (1 - exp (-((r : ℝ) * t)))) := div_pos ht hden
  have hlog : (log t - log (2 * pi) - log (1 - exp (-((r : ℝ) * t)))) / 2 =
      log (sqrt (t / (2 * pi * (1 - exp (-((r : ℝ) * t)))))) := by
    rw [Real.log_sqrt hquot.le, Real.log_div ht.ne' hden.ne',
      Real.log_mul (by positivity : (2 : ℝ) * pi ≠ 0) hp.ne']
    ring
  rw [logMain, Real.exp_add, hlog, Real.exp_log (Real.sqrt_pos.mpr hquot)]

theorem finiteProduct_correction_exact {r : ℕ} {t : ℝ} (hr : 0 < r) (ht : 0 < t) :
    finiteProduct r t = exp (Profile.I ((r : ℝ) * t) / t) *
      sqrt (t / (2 * pi * (1 - exp (-((r : ℝ) * t))))) *
        exp (regularError r t - stirlingError r) := by
  rw [← exp_logEuler r ht, logEuler_correction_exact hr ht,
    show logMain r t + regularError r t - stirlingError r =
      logMain r t + (regularError r t - stirlingError r) by ring,
    Real.exp_add, exp_logMain hr ht]

end LineSize.EulerKernel
