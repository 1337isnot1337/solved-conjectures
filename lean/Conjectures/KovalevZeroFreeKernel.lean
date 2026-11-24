import Conjectures.KovalevZeroFreeGeometry

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

Pointwise kernel comparison from Section 2 of the recorded argument. The
coefficient `2-v` is a valid enlargement of the source's `2/(1+sqrt v)` and has
an elementary first beta moment. This removes no analytic or probability
hypothesis from the eventual theorem; the beta-average identity is separate.
-/

namespace Conjectures.KovalevZeroFree

noncomputable section

theorem sqrt_re_pos {u : ℂ} (hu : 0 < u.re) : 0 < (Complex.sqrt u).re := by
  simp only [Complex.sqrt, Complex.cpow_inv_two_re]
  apply Real.sqrt_pos_of_pos
  have := norm_nonneg u
  linarith

theorem sqrt_ne_zero {u : ℂ} (hu : u ≠ 0) : Complex.sqrt u ≠ 0 := by
  intro h
  apply hu
  have hs := sqrt_sq u
  simpa only [h, zero_pow (by decide : 2 ≠ 0)] using hs.symm

theorem sqrt_im_mul_nonneg {a b : ℂ} (ha : 0 < a.re) (hb : 0 < b.re)
    (hab : 0 ≤ a.im * b.im) :
    0 ≤ (Complex.sqrt a).im * (Complex.sqrt b).im := by
  have hra := sqrt_re_pos ha
  have hrb := sqrt_re_pos hb
  have hia := congrArg Complex.im (sqrt_sq a)
  have hib := congrArg Complex.im (sqrt_sq b)
  simp only [pow_two, Complex.mul_im] at hia hib
  have he : 4 * (Complex.sqrt a).re * (Complex.sqrt b).re *
      ((Complex.sqrt a).im * (Complex.sqrt b).im) = a.im * b.im := by
    rw [← hia, ← hib]
    ring
  by_contra! hn
  have hneg : 4 * (Complex.sqrt a).re * (Complex.sqrt b).re *
      ((Complex.sqrt a).im * (Complex.sqrt b).im) < 0 := by
    exact mul_neg_of_pos_of_neg (by positivity) hn
  rw [he] at hneg
  linarith

theorem sqrt_div_re_pos {a b : ℂ} (ha : 0 < a.re) (hb : 0 < b.re)
    (hab : 0 ≤ a.im * b.im) : 0 < (Complex.sqrt a / Complex.sqrt b).re := by
  have hbn : b ≠ 0 := by intro h; simp [h] at hb
  have hs : 0 < Complex.normSq (Complex.sqrt b) :=
    Complex.normSq_pos.mpr (sqrt_ne_zero hbn)
  rw [Complex.div_re]
  exact add_pos_of_pos_of_nonneg
    (div_pos (mul_pos (sqrt_re_pos ha) (sqrt_re_pos hb)) hs)
    (div_nonneg (sqrt_im_mul_nonneg ha hb hab) hs.le)

theorem sqrt_div_eq {a b : ℂ} (ha : 0 < a.re) (hb : 0 < b.re)
    (hab : 0 ≤ a.im * b.im) :
    Complex.sqrt (a / b) = Complex.sqrt a / Complex.sqrt b := by
  have hr := sqrt_div_re_pos ha hb hab
  have he : (Complex.sqrt a / Complex.sqrt b) ^ 2 = a / b := by
    rw [div_pow, sqrt_sq, sqrt_sq]
  rw [← he, Complex.sqrt]
  exact Complex.sq_cpow_two_inv hr

theorem norm_inv_sqrt_le_one {a : ℂ} (ha : 1 ≤ a.re) :
    ‖(Complex.sqrt a)⁻¹‖ ≤ 1 := by
  have hr := Complex.re_le_norm a
  have hs := norm_sqrt_sq a
  have hn := norm_nonneg (Complex.sqrt a)
  have hge : 1 ≤ ‖Complex.sqrt a‖ := by nlinarith
  rw [norm_inv]
  exact inv_le_one_of_one_le₀ hge

theorem norm_inv_sqrt_lt_one {a : ℂ} (ha : 1 < a.re) :
    ‖(Complex.sqrt a)⁻¹‖ < 1 := by
  have hr := Complex.re_le_norm a
  have hs := norm_sqrt_sq a
  have hn := norm_nonneg (Complex.sqrt a)
  have hgt : 1 < ‖Complex.sqrt a‖ := by nlinarith
  rw [norm_inv]
  exact inv_lt_one_of_one_lt₀ hgt

theorem one_add_ne_zero {w : ℂ} (hw : 0 ≤ w.re) : 1 + w ≠ 0 := by
  intro h
  have hr := congrArg Complex.re h
  simp only [Complex.add_re, Complex.one_re, Complex.zero_re] at hr
  linarith

theorem cayley_norm_le_one {w : ℂ} (hw : 0 ≤ w.re) :
    ‖(1 - w) / (1 + w)‖ ≤ 1 := by
  have hden : 0 < ‖1 + w‖ := norm_pos_iff.mpr (one_add_ne_zero hw)
  rw [norm_div, div_le_one₀ hden]
  apply (sq_le_sq₀ (norm_nonneg _) (norm_nonneg _)).mp
  simp only [Complex.sq_norm, Complex.normSq_apply, Complex.sub_re, Complex.one_re,
    Complex.sub_im, Complex.one_im, Complex.add_re, Complex.add_im, zero_sub, zero_add]
  nlinarith

theorem affine_ratio_inDiameter {v : ℝ} {w : ℂ}
    (hv1 : v ≤ 1) (hw : 0 ≤ w.re) :
    InDiameter v ((1 + (v : ℂ) * w) / (1 + w)) := by
  apply (inDiameter_iff_norm hv1 _).mpr
  have hn := one_add_ne_zero hw
  have hid : (1 + (v : ℂ) * w) / (1 + w) - (((1 + v) / 2 : ℝ) : ℂ) =
      (((1 - v) / 2 : ℝ) : ℂ) * ((1 - w) / (1 + w)) := by
    push_cast
    field_simp
    ring
  rw [hid, norm_mul, Complex.norm_real, Real.norm_eq_abs,
    abs_of_nonneg (show 0 ≤ (1 - v) / 2 by linarith)]
  exact mul_le_of_le_one_right (by linarith) (cayley_norm_le_one hw)

theorem inDiameter_rescale {s : ℝ} {u : ℂ} (hs0 : 0 ≤ s) (hs1 : s ≤ 1)
    (hu : InDiameter s u) :
    ‖((2 / (1 + s) : ℝ) : ℂ) * u - 1‖ ≤ 2 / (1 + s) - 1 := by
  have hp : 0 < 1 + s := by linarith
  have hu' := (inDiameter_iff_norm hs1 u).mp hu
  have hid : ((2 / (1 + s) : ℝ) : ℂ) * u - 1 =
      ((2 / (1 + s) : ℝ) : ℂ) * (u - (((1 + s) / 2 : ℝ) : ℂ)) := by
    have hpC : 1 + (s : ℂ) ≠ 0 := by exact_mod_cast hp.ne'
    push_cast
    field_simp [hpC]
  rw [hid, norm_mul, Complex.norm_real, Real.norm_eq_abs, abs_of_pos (by positivity)]
  calc
    _ ≤ (2 / (1 + s)) * ((1 - s) / 2) := mul_le_mul_of_nonneg_left hu' (by positivity)
    _ = _ := by field_simp; ring

/-- The source's sharp pointwise comparison coefficient. -/
theorem inverse_sqrt_comparison {v : ℝ} {w : ℂ}
    (hv0 : 0 ≤ v) (hv1 : v ≤ 1) (hw : 0 ≤ w.re) :
    ‖((2 / (1 + Real.sqrt v) : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹‖ ≤ 2 / (1 + Real.sqrt v) - 1 := by
  have ha : 0 < (1 + (v : ℂ) * w).re := by
    simp only [Complex.add_re, Complex.one_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, zero_mul, sub_zero]
    positivity
  have hb : 0 < (1 + w).re := by simpa using (show 0 < 1 + w.re by linarith)
  have hab : 0 ≤ (1 + (v : ℂ) * w).im * (1 + w).im := by
    simp only [Complex.add_im, Complex.one_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, zero_mul, add_zero, zero_add]
    nlinarith [sq_nonneg w.im]
  have hgeo := sqrt_inDiameter hv0 hv1 (affine_ratio_inDiameter hv1 hw)
  rw [sqrt_div_eq ha hb hab] at hgeo
  have hs1 : Real.sqrt v ≤ 1 := by
    exact (Real.sqrt_le_one).mpr hv1
  have hbound := inDiameter_rescale (Real.sqrt_nonneg v) hs1 hgeo
  have han : 1 + (v : ℂ) * w ≠ 0 := by intro h; simp [h] at ha
  have hbn := one_add_ne_zero hw
  have hnorm := norm_inv_sqrt_le_one (show 1 ≤ (1 + (v : ℂ) * w).re by
    simp only [Complex.add_re, Complex.one_re, Complex.mul_re, Complex.ofReal_re,
      Complex.ofReal_im, zero_mul, sub_zero]
    nlinarith)
  have factor (P A B : ℂ) (hA : A ≠ 0) :
      P * B⁻¹ - A⁻¹ = (P * (A / B) - 1) * A⁻¹ := by
    field_simp
  have hid : ((2 / (1 + Real.sqrt v) : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹ =
      (((2 / (1 + Real.sqrt v) : ℝ) : ℂ) *
        (Complex.sqrt (1 + (v : ℂ) * w) / Complex.sqrt (1 + w)) - 1) *
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹ := by
    exact factor _ _ _ (sqrt_ne_zero han)
  rw [hid, norm_mul]
  exact (mul_le_mul_of_nonneg_left hnorm (norm_nonneg _)).trans (by simpa using hbound)

/-- Enlarging the source coefficient to `2-v` retains the comparison and
requires only the first moment of the beta variable. -/
theorem inverse_sqrt_linear_comparison {v : ℝ} {w : ℂ}
    (hv0 : 0 ≤ v) (hv1 : v ≤ 1) (hw : 0 ≤ w.re) :
    ‖((2 - v : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹‖ ≤ 1 - v := by
  let p : ℝ := 2 / (1 + Real.sqrt v)
  have hs0 := Real.sqrt_nonneg v
  have hs1 : Real.sqrt v ≤ 1 := (Real.sqrt_le_one).mpr hv1
  have hs := Real.sq_sqrt hv0
  have hp : p ≤ 2 - v := by
    dsimp [p]
    apply (div_le_iff₀ (show 0 < 1 + Real.sqrt v by positivity)).mpr
    have hvs : v ≤ Real.sqrt v := by nlinarith
    nlinarith
  have hbound := inverse_sqrt_comparison hv0 hv1 hw
  have hn := norm_inv_sqrt_le_one (show 1 ≤ (1 + w).re by simpa using hw)
  have hid : ((2 - v : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹ =
      (((2 - v - p : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹) +
      ((p : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
        (Complex.sqrt (1 + (v : ℂ) * w))⁻¹) := by push_cast; ring
  rw [hid]
  calc
    _ ≤ ‖((2 - v - p : ℝ) : ℂ) * (Complex.sqrt (1 + w))⁻¹‖ +
        ‖(p : ℂ) * (Complex.sqrt (1 + w))⁻¹ -
          (Complex.sqrt (1 + (v : ℂ) * w))⁻¹‖ := norm_add_le _ _
    _ ≤ (2 - v - p) + (p - 1) := by
      apply add_le_add
      · rw [norm_mul, Complex.norm_real, Real.norm_eq_abs,
          abs_of_nonneg (show 0 ≤ 2 - v - p by linarith)]
        exact mul_le_of_le_one_right (by linarith) hn
      · exact hbound
    _ = 1 - v := by ring

end

end Conjectures.KovalevZeroFree
