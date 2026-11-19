import Conjectures.LineSizeFourierBounds
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Bounds
import Mathlib.Tactic

/-! The literal complex characteristic factor of a geometric variable.
The real majorant is an equality, and its denominator is nonzero for every
frequency. A separate perturbation form is used near frequency zero. -/
noncomputable section
namespace LineSize.Geometric

open Complex Real Finset

def phase (x : ℝ) : ℂ := Complex.exp (Complex.I * (x : ℂ))
def denominator (q x : ℝ) : ℂ := 1 - (q : ℂ) * phase x
def scalarFactor (q x : ℝ) : ℂ := ((1 - q : ℝ) : ℂ) / denominator q x
def factor (q : ℝ) (j : ℕ) (theta : ℝ) : ℂ := scalarFactor q ((j : ℝ) * theta)
def perturbation (q x : ℝ) : ℂ := ((q / (1 - q) : ℝ) : ℂ) * (phase x - 1)

@[simp] theorem phase_zero : phase 0 = 1 := by simp [phase]
@[simp] theorem phase_norm (x : ℝ) : ‖phase x‖ = 1 := Complex.norm_exp_I_mul_ofReal x

@[simp] theorem phase_re (x : ℝ) : (phase x).re = Real.cos x := by
  simp [phase, Complex.exp_re, Complex.mul_re, Complex.mul_im]

@[simp] theorem phase_im (x : ℝ) : (phase x).im = Real.sin x := by
  simp [phase, Complex.exp_im, Complex.mul_re, Complex.mul_im]

theorem phase_sub_one_norm (x : ℝ) : ‖phase x - 1‖ ≤ |x| := by
  simpa only [phase, Real.norm_eq_abs] using
    (Real.norm_exp_I_mul_ofReal_sub_one_le (x := x))

theorem denominator_norm_lower {q : ℝ} (hq : 0 ≤ q) (x : ℝ) :
    1 - q ≤ ‖denominator q x‖ := by
  have h := norm_sub_norm_le (1 : ℂ) ((q : ℂ) * phase x)
  simpa only [denominator, norm_one, norm_mul, Complex.norm_of_nonneg hq,
    phase_norm, mul_one] using h

theorem denominator_ne_zero {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    denominator q x ≠ 0 := by
  have h := (sub_pos.mpr hq1).trans_le (denominator_norm_lower hq x)
  exact norm_pos_iff.mp h

theorem scalarFactor_ne_zero {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    scalarFactor q x ≠ 0 := by
  apply div_ne_zero
  · exact_mod_cast (sub_pos.mpr hq1).ne'
  · exact denominator_ne_zero hq hq1 x

theorem scalarFactor_norm_le_one {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    ‖scalarFactor q x‖ ≤ 1 := by
  rw [scalarFactor, norm_div, Complex.norm_of_nonneg (sub_pos.mpr hq1).le]
  exact (div_le_one (norm_pos_iff.mpr (denominator_ne_zero hq hq1 x))).mpr
    (denominator_norm_lower hq x)

theorem denominator_normSq (q x : ℝ) :
    Complex.normSq (denominator q x) = (1 - q) ^ 2 + 4 * q * Real.sin (x / 2) ^ 2 := by
  have ht := congrArg (fun y : ℝ => q ^ 2 * y) (Real.sin_sq_add_cos_sq x)
  have hc : 1 - Real.cos x = 2 * Real.sin (x / 2) ^ 2 := by
    have h := Real.cos_two_mul_eq_one_sub (x / 2)
    rw [show 2 * (x / 2) = x by ring] at h
    linarith
  simp only [denominator, Complex.normSq_apply, Complex.sub_re, Complex.one_re,
    Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im, phase_re, phase_im,
    zero_mul, sub_zero, Complex.sub_im, Complex.one_im, Complex.mul_im, add_zero]
  calc
    _ = 1 - 2 * q * Real.cos x + q ^ 2 := by nlinarith [ht]
    _ = (1 - q) ^ 2 + 4 * q * Real.sin (x / 2) ^ 2 := by
      rw [show Real.cos x = 1 - 2 * Real.sin (x / 2) ^ 2 by linarith [hc]]
      ring

def modulusBase (q x : ℝ) : ℝ := 1 + 4 * q / (1 - q) ^ 2 * Real.sin (x / 2) ^ 2

theorem modulusBase_pos {q : ℝ} (hq : 0 ≤ q) (x : ℝ) : 0 < modulusBase q x := by
  unfold modulusBase
  positivity

theorem scalarFactor_norm_sq {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    ‖scalarFactor q x‖ ^ 2 = (modulusBase q x)⁻¹ := by
  have hq0 : 1 - q ≠ 0 := (sub_pos.mpr hq1).ne'
  have hd : Complex.normSq (denominator q x) ≠ 0 := by
    rw [← Complex.sq_norm]
    exact pow_ne_zero _ (norm_ne_zero_iff.mpr (denominator_ne_zero hq hq1 x))
  have hb : modulusBase q x ≠ 0 := (modulusBase_pos hq x).ne'
  rw [scalarFactor, norm_div, div_pow,
    Complex.norm_of_nonneg (sub_pos.mpr hq1).le, Complex.sq_norm, denominator_normSq]
  rw [denominator_normSq] at hd
  unfold modulusBase at hb ⊢
  field_simp

theorem scalarFactor_norm_inv_sqrt {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    ‖scalarFactor q x‖ = (Real.sqrt (modulusBase q x))⁻¹ := by
  apply (sq_eq_sq₀ (norm_nonneg _) (by positivity)).mp
  rw [scalarFactor_norm_sq hq hq1, inv_pow, Real.sq_sqrt (modulusBase_pos hq x).le]

theorem scalarFactor_norm_majorant {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    ‖scalarFactor q x‖ = LineSize.Fourier.geometricMajorant q x := by
  rw [scalarFactor_norm_inv_sqrt hq hq1]
  unfold LineSize.Fourier.geometricMajorant
  change (Real.sqrt (modulusBase q x))⁻¹ = (modulusBase q x) ^ (-(1 / 2 : ℝ))
  rw [Real.rpow_neg (modulusBase_pos hq x).le, Real.sqrt_eq_rpow]

theorem factor_norm_majorant {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (j : ℕ) (theta : ℝ) :
    ‖factor q j theta‖ = LineSize.Fourier.geometricMajorant q ((j : ℝ) * theta) :=
  scalarFactor_norm_majorant hq hq1 _

theorem denominator_continuous (q : ℝ) : Continuous (denominator q) := by
  unfold denominator phase
  fun_prop

theorem scalarFactor_continuous {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) :
    Continuous (scalarFactor q) :=
  continuous_const.div (denominator_continuous q) (denominator_ne_zero hq hq1)

theorem perturbation_norm {q : ℝ} (hq : 0 ≤ q) (hq1 : q < 1) (x : ℝ) :
    ‖perturbation q x‖ ≤ q / (1 - q) * |x| := by
  rw [perturbation, norm_mul, Complex.norm_of_nonneg (div_nonneg hq (sub_pos.mpr hq1).le)]
  exact mul_le_mul_of_nonneg_left (phase_sub_one_norm x) (by positivity)

theorem scalarFactor_eq_inv_one_sub {q : ℝ} (hq1 : q < 1) (x : ℝ) :
    scalarFactor q x = (1 - perturbation q x)⁻¹ := by
  have hq0 : ((1 - q : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (sub_pos.mpr hq1).ne'
  have hden : denominator q x = ((1 - q : ℝ) : ℂ) * (1 - perturbation q x) := by
    unfold denominator perturbation
    push_cast
    have hq0' : (1 : ℂ) - (q : ℂ) ≠ 0 := by exact_mod_cast (sub_pos.mpr hq1).ne'
    field_simp [hq0']
    ring
  rw [scalarFactor, hden]
  calc
    _ = ((1 - q : ℝ) : ℂ) *
        ((((1 - q : ℝ) : ℂ))⁻¹ * (1 - perturbation q x)⁻¹) := by
      rw [div_eq_mul_inv, mul_inv_rev]
      ring
    _ = (1 - perturbation q x)⁻¹ := by
      rw [← mul_assoc, mul_inv_cancel₀ hq0, one_mul]

end LineSize.Geometric
