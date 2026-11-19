import Conjectures.LineSizeGeometricProductBasic
import Conjectures.LineSizeGeometricTaylor

/-! A uniform cubic error for the logarithm of the finite geometric
product. The bound is derived from each literal factor and is valid on
the full compact range `r*t ≤ b`; no central limit theorem is assumed. -/
noncomputable section
namespace LineSize.Geometric

open Real Finset

def termQuadratic (j : ℕ) (t theta : ℝ) : ℂ :=
  linear (theta * (((j : ℝ) + 1) / (exp (((j : ℝ) + 1) * t) - 1))) -
    ((theta ^ 2 * ((((j : ℝ) + 1) ^ 2 * exp (((j : ℝ) + 1) * t)) /
      (exp (((j : ℝ) + 1) * t) - 1) ^ 2) / 2 : ℝ) : ℂ)

def quadratic (r : ℕ) (t theta : ℝ) : ℂ :=
  linear (theta * EulerKernel.weightedMean r t) -
    ((theta ^ 2 * EulerKernel.weightedVariance r t / 2 : ℝ) : ℂ)

theorem sum_termQuadratic (r : ℕ) (t theta : ℝ) :
    (∑ j ∈ range r, termQuadratic j t theta) = quadratic r t theta := by
  unfold termQuadratic quadratic linear EulerKernel.weightedMean EulerKernel.weightedVariance
  simp only [Finset.sum_sub_distrib, Finset.mul_sum, Finset.sum_div,
    Complex.ofReal_sum, Complex.ofReal_mul, Complex.ofReal_div, Complex.ofReal_ofNat]

def cubicConstant (b : ℝ) : ℝ := exp 1 * b ^ 2 + b + 2 / 3

theorem cubicConstant_pos {b : ℝ} (hb : 0 < b) : 0 < cubicConstant b := by
  unfold cubicConstant
  positivity

theorem scalar_quadratic_identity (j : ℕ) {t : ℝ} (ht : 0 < t) (theta : ℝ) :
    ((parameter j t / (1 - parameter j t) : ℝ) : ℂ) * linear (((j : ℝ) + 1) * theta) -
      ((parameter j t / (1 - parameter j t) ^ 2 *
        (((j : ℝ) + 1) * theta) ^ 2 / 2 : ℝ) : ℂ) = termQuadratic j t theta := by
  rw [parameter_mean j ht, parameter_variance j ht]
  unfold termQuadratic linear
  push_cast
  ring

theorem term_logarithm_error {b t theta : ℝ} {r j : ℕ}
    (hb : 0 < b) (ht : 0 < t) (hr : (r : ℝ) * t ≤ b) (hj : j ∈ range r)
    (htheta : |theta| ≤ t / 2) (hbtheta : b * |theta| ≤ t) :
    ‖Complex.log (scalarFactor (parameter j t) (((j : ℝ) + 1) * theta)) -
      termQuadratic j t theta‖ ≤ cubicConstant b * |theta| ^ 3 / t ^ 3 := by
  have hs : 0 < (j : ℝ) + 1 := by positivity
  have hsr : (j : ℝ) + 1 ≤ (r : ℝ) := by
    exact_mod_cast Nat.succ_le_iff.mpr (Finset.mem_range.mp hj)
  have hst : ((j : ℝ) + 1) * t ≤ b :=
    (mul_le_mul_of_nonneg_right hsr ht.le).trans hr
  have hx : |((j : ℝ) + 1) * theta| ≤ 1 := by
    rw [abs_mul, abs_of_pos hs]
    have h := mul_le_mul_of_nonneg_right hst (abs_nonneg theta)
    nlinarith
  have hw : ‖perturbation (parameter j t) (((j : ℝ) + 1) * theta)‖ ≤ 1 / 2 :=
    (parameter_perturbation_le j ht theta).trans ((div_le_iff₀ ht).mpr (by linarith))
  have hscalar := scalarFactor_log_quadratic_error (parameter_pos j t).le
    (parameter_lt_one j ht) hx hw
  rw [scalar_quadratic_identity j ht theta] at hscalar
  have ha0 : 0 ≤ parameter j t / (1 - parameter j t) :=
    div_nonneg (parameter_pos j t).le (sub_pos.mpr (parameter_lt_one j ht)).le
  have ha := parameter_mean_le j ht
  have ha2 := pow_le_pow_left₀ ha0 ha 2
  have ha3 := pow_le_pow_left₀ ha0 ha 3
  have hcoefficient := add_le_add
    (add_le_add (mul_le_mul_of_nonneg_left ha (Real.exp_pos 1).le) ha2)
    (mul_le_mul_of_nonneg_left ha3 (by norm_num : (0 : ℝ) ≤ 2 / 3))
  have hs2 := pow_le_pow_left₀ (mul_pos hs ht).le hst 2
  have hcompact := add_le_add_right
    (add_le_add (mul_le_mul_of_nonneg_left hs2 (Real.exp_pos 1).le) hst) (2 / 3 : ℝ)
  calc
    _ ≤ (exp 1 * (parameter j t / (1 - parameter j t)) +
        (parameter j t / (1 - parameter j t)) ^ 2 +
        (2 / 3 : ℝ) * (parameter j t / (1 - parameter j t)) ^ 3) *
        |((j : ℝ) + 1) * theta| ^ 3 := hscalar
    _ ≤ (exp 1 * (1 / (((j : ℝ) + 1) * t)) +
        (1 / (((j : ℝ) + 1) * t)) ^ 2 +
        (2 / 3 : ℝ) * (1 / (((j : ℝ) + 1) * t)) ^ 3) *
        |((j : ℝ) + 1) * theta| ^ 3 :=
      mul_le_mul_of_nonneg_right hcoefficient (by positivity)
    _ = (exp 1 * (((j : ℝ) + 1) * t) ^ 2 +
        ((j : ℝ) + 1) * t + 2 / 3) * |theta| ^ 3 / t ^ 3 := by
      rw [abs_mul, abs_of_pos hs]
      field_simp
      ring
    _ ≤ cubicConstant b * |theta| ^ 3 / t ^ 3 := by
      unfold cubicConstant
      exact div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_right hcompact (by positivity)) (by positivity)

theorem logarithm_quadratic_error {b t theta : ℝ} (r : ℕ)
    (hb : 0 < b) (ht : 0 < t) (hr : (r : ℝ) * t ≤ b)
    (htheta : |theta| ≤ t / 2) (hbtheta : b * |theta| ≤ t) :
    ‖logarithm r t theta - quadratic r t theta‖ ≤
      b * cubicConstant b * |theta| ^ 3 / t ^ 4 := by
  have hid : logarithm r t theta - quadratic r t theta =
      ∑ j ∈ range r,
        (Complex.log (scalarFactor (parameter j t) (((j : ℝ) + 1) * theta)) -
          termQuadratic j t theta) := by
    rw [Finset.sum_sub_distrib, sum_termQuadratic]
    rfl
  rw [hid]
  calc
    _ ≤ ∑ j ∈ range r,
        ‖Complex.log (scalarFactor (parameter j t) (((j : ℝ) + 1) * theta)) -
          termQuadratic j t theta‖ := norm_sum_le _ _
    _ ≤ ∑ _j ∈ range r, cubicConstant b * |theta| ^ 3 / t ^ 3 :=
      Finset.sum_le_sum (fun j hj => term_logarithm_error hb ht hr hj htheta hbtheta)
    _ = (r : ℝ) * (cubicConstant b * |theta| ^ 3 / t ^ 3) := by
      rw [Finset.sum_const, Finset.card_range, nsmul_eq_mul]
    _ = ((r : ℝ) * t) * cubicConstant b * |theta| ^ 3 / t ^ 4 := by
      field_simp
      ring
    _ ≤ b * cubicConstant b * |theta| ^ 3 / t ^ 4 := by
      exact div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_right
          (mul_le_mul_of_nonneg_right hr (cubicConstant_pos hb).le) (by positivity))
        (by positivity)

end LineSize.Geometric
