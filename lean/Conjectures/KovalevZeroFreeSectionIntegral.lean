import Conjectures.KovalevZeroFreeDerivative
import Conjectures.KovalevZeroFreeRemainder
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

/-!
# Kovalev's zero-free Taylor polynomial conjecture

The actual integral remainder identity in equation (2) of the recorded proof,
obtained by the fundamental theorem of calculus and the proved beta density.
It holds on the entire closed disk away from the separately treated point `1`.
-/

namespace Conjectures.KovalevZeroFree

open MeasureTheory ProbabilityTheory Set
open scoped Topology

noncomputable section

theorem segment_re_pos {z : ℂ} (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1)
    {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) : 0 < (1 - (t : ℂ) * z).re := by
  have hr := re_lt_one_of_closedDisk_ne_one hz hz1
  simp only [Complex.sub_re, Complex.one_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, zero_mul, sub_zero]
  by_cases h : z.re ≤ 0
  · have hm := mul_nonpos_of_nonneg_of_nonpos ht.1 h
    linarith
  · have hm := mul_le_mul_of_nonneg_right ht.2 (le_of_not_ge h)
    linarith

theorem resolvent_eq_sqrt_ratio {z : ℂ} (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1)
    {t : ℝ} (ht : t ∈ Ioo (0 : ℝ) 1) :
    resolvent z (odds t) =
      Complex.sqrt (1 - (t : ℂ)) / Complex.sqrt (1 - (t : ℂ) * z) := by
  have htC : 1 - (t : ℂ) ≠ 0 := by
    have h : (1 - t : ℝ) ≠ 0 := (sub_pos.mpr ht.2).ne'
    exact_mod_cast h
  have hid : 1 + (1 - z) * (odds t : ℂ) =
      (1 - (t : ℂ) * z) / (1 - (t : ℂ)) := by
    unfold odds
    push_cast
    field_simp
    ring
  rw [resolvent, hid, sqrt_div_eq
    (segment_re_pos hz hz1 ⟨ht.1.le, ht.2.le⟩)
    (by simpa using sub_pos.mpr ht.2) (by simp), inv_div]

theorem real_half_weight_eq_inv_sqrt {t : ℝ} (ht : t < 1) :
    (((1 - t) ^ (-(1 / 2 : ℝ)) : ℝ) : ℂ) =
      (Complex.sqrt (1 - (t : ℂ)))⁻¹ := by
  rw [Complex.ofReal_cpow (sub_nonneg.mpr ht.le)]
  push_cast
  rw [Complex.cpow_neg]
  simp [Complex.sqrt, one_div]

theorem remainder_eq_segment_integral (M : ℕ) {z : ℂ}
    (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    remainder M z = ((((M : ℝ) + 1 / 2) * halfCoeff M : ℝ) : ℂ) *
      ∫ t : ℝ in (0 : ℝ)..1,
        (t : ℂ) ^ M * (Complex.sqrt (1 - (t : ℂ) * z))⁻¹ := by
  rw [remainder, integral_beta_weight (show 0 < (M : ℝ) + 1 by positivity)
    (show 0 < (1 / 2 : ℝ) by norm_num),
    intervalIntegral.integral_of_le (show (0 : ℝ) ≤ 1 by norm_num),
    integral_Ioc_eq_integral_Ioo, ← integral_const_mul]
  apply setIntegral_congr_fun measurableSet_Ioo
  intro t ht
  dsimp only
  have hb : 1 / beta ((M : ℝ) + 1) (1 / 2) *
      t ^ (((M : ℝ) + 1) - 1) * (1 - t) ^ ((1 / 2 : ℝ) - 1) =
      betaPDFReal ((M : ℝ) + 1) (1 / 2) t := by
    simp [betaPDFReal, ht.1, ht.2]
  rw [hb, halfCoeff_beta_density M ht, Complex.real_smul]
  push_cast
  rw [real_half_weight_eq_inv_sqrt ht.2, resolvent_eq_sqrt_ratio hz hz1 ht]
  have hq : Complex.sqrt (1 - (t : ℂ)) ≠ 0 := sqrt_ne_zero (by
    have h : (1 - t : ℝ) ≠ 0 := (sub_pos.mpr ht.2).ne'
    exact_mod_cast h)
  field_simp

theorem segment_section_hasDerivAt (M : ℕ) {z : ℂ}
    (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) {t : ℝ} (ht : t ∈ Icc (0 : ℝ) 1) :
    HasDerivAt
      (fun u : ℝ => Complex.sqrt (1 - (u : ℂ) * z) * invSection M ((u : ℂ) * z))
      (-((((M : ℝ) + 1 / 2) * halfCoeff M : ℝ) : ℂ) * z ^ (M + 1) *
        ((t : ℂ) ^ M * (Complex.sqrt (1 - (t : ℂ) * z))⁻¹)) t := by
  have h := (sqrt_mul_invSection_hasDerivAt M (segment_re_pos hz hz1 ht)).comp
    (t : ℂ) ((hasDerivAt_id (t : ℂ)).mul_const z)
  have hr := h.comp_ofReal
  simp only [Function.comp_def, one_mul] at hr
  apply hr.congr_deriv
  rw [mul_pow, pow_succ]
  ring

theorem segment_kernel_continuousOn (M : ℕ) {z : ℂ}
    (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    ContinuousOn (fun t : ℝ =>
      (t : ℂ) ^ M * (Complex.sqrt (1 - (t : ℂ) * z))⁻¹) (Icc (0 : ℝ) 1) := by
  intro t ht
  apply ContinuousAt.continuousWithinAt
  have hs : ContinuousAt (fun u : ℝ => Complex.sqrt (1 - (u : ℂ) * z)) t := by
    exact ContinuousAt.comp (f := fun u : ℝ => 1 - (u : ℂ) * z) (x := t)
      (Complex.continuousAt_sqrt (Or.inl (segment_re_pos hz hz1 ht).le))
      (show ContinuousAt (fun u : ℝ => 1 - (u : ℂ) * z) t by fun_prop)
  have hn : Complex.sqrt (1 - (t : ℂ) * z) ≠ 0 := sqrt_ne_zero (by
    intro h
    have hp := segment_re_pos hz hz1 ht
    simp only [h, Complex.zero_re, lt_self_iff_false] at hp)
  exact (show ContinuousAt (fun u : ℝ => (u : ℂ) ^ M) t by fun_prop).mul
    (hs.inv₀ hn)

/-- Equation (2) for the concrete beta average, with its normalization and
all analytic inputs proved. -/
theorem invSection_remainder_identity (M : ℕ) {z : ℂ}
    (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    Complex.sqrt (1 - z) * invSection M z = 1 - z ^ (M + 1) * remainder M z := by
  have hi := (segment_kernel_continuousOn M hz hz1).intervalIntegrable_of_Icc
    (μ := volume) (show (0 : ℝ) ≤ 1 by norm_num)
  have hd := intervalIntegral.integral_eq_sub_of_hasDerivAt
    (fun t ht => segment_section_hasDerivAt M hz hz1
      (by simpa only [uIcc_of_le (show (0 : ℝ) ≤ 1 by norm_num)] using ht))
    (hi.const_mul (-((((M : ℝ) + 1 / 2) * halfCoeff M : ℝ) : ℂ) * z ^ (M + 1)))
  rw [intervalIntegral.integral_const_mul] at hd
  simp only [Complex.ofReal_one, one_mul, Complex.ofReal_zero, zero_mul, sub_zero,
    Complex.sqrt_one, invSection_zero, mul_one] at hd
  rw [remainder_eq_segment_integral M hz hz1]
  linear_combination -hd

end

end Conjectures.KovalevZeroFree
