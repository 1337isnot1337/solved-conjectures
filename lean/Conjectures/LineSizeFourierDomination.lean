import Mathlib.Analysis.SpecialFunctions.ImproperIntegrals
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.Tactic.FunProp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Domination on the rescaled Fourier interval

The damping `exp (-c * min (t⁻¹) y²)` has an integrable bound independent
of `t` on the support `t³ y² ≤ pi²`.  The constant below uses the elementary
cubic estimate `x³ ≤ 27 * exp x`; no Taylor remainder or fractional power
estimate is needed.  The bound holds for every positive `t`.
-/

noncomputable section

open Set MeasureTheory
open scoped Topology

namespace LineSize.Fourier

def dominationConstant (c : ℝ) : ℝ := 1 + 1/c + 27 * Real.pi^2/c^3

def polynomialEnvelope (c y : ℝ) : ℝ := dominationConstant c / (1+y^2)

theorem dominationConstant_pos {c : ℝ} (hc : 0 < c) : 0 < dominationConstant c := by
  unfold dominationConstant
  positivity

theorem polynomialEnvelope_nonneg {c : ℝ} (hc : 0 < c) (y : ℝ) :
    0 ≤ polynomialEnvelope c y := by
  unfold polynomialEnvelope
  exact div_nonneg (dominationConstant_pos hc).le (by positivity)

theorem linear_exp_bound {c : ℝ} (hc : 0 < c) (s : ℝ) :
    s * Real.exp (-c*s) ≤ 1/c := by
  have hs : c*s ≤ Real.exp (c*s) := by linarith [Real.add_one_le_exp (c*s)]
  have hm := mul_le_mul_of_nonneg_right hs (Real.exp_pos (-c*s)).le
  have he : Real.exp (c*s) * Real.exp (-c*s) = 1 := by
    rw [← Real.exp_add, show c*s+(-c*s) = 0 by ring, Real.exp_zero]
  rw [he] at hm
  apply (le_div_iff₀ hc).2
  nlinarith

theorem cubic_exp_bound {c s : ℝ} (hc : 0 < c) (hs : 0 ≤ s) :
    s^3 * Real.exp (-c*s) ≤ 27/c^3 := by
  have hz : 0 ≤ c*s/3 := by positivity
  have hzexp : c*s/3 ≤ Real.exp (c*s/3) := by
    linarith [Real.add_one_le_exp (c*s/3)]
  have hpow := pow_le_pow_left₀ hz hzexp 3
  have hexp : Real.exp (c*s/3)^3 = Real.exp (c*s) := by
    calc
      Real.exp (c*s/3)^3 = Real.exp (c*s/3+c*s/3+c*s/3) := by
        rw [Real.exp_add, Real.exp_add]
        ring
      _ = Real.exp (c*s) := by congr 1; ring
  rw [hexp] at hpow
  have hm := mul_le_mul_of_nonneg_right hpow (Real.exp_pos (-c*s)).le
  have he : Real.exp (c*s) * Real.exp (-c*s) = 1 := by
    rw [← Real.exp_add, show c*s+(-c*s) = 0 by ring, Real.exp_zero]
  rw [he] at hm
  apply (le_div_iff₀ (pow_pos hc 3)).2
  nlinarith

theorem integrable_polynomialEnvelope (c : ℝ) : Integrable (polynomialEnvelope c) := by
  unfold polynomialEnvelope
  simpa only [div_eq_mul_inv] using
    integrable_inv_one_add_sq.const_mul (dominationConstant c)

theorem damped_min_le_polynomialEnvelope {c t y : ℝ} (hc : 0 < c) (ht : 0 < t)
    (hsupport : t^3*y^2 ≤ Real.pi^2) :
    Real.exp (-c * min t⁻¹ (y^2)) ≤ polynomialEnvelope c y := by
  have htinv : 0 < t⁻¹ := inv_pos.mpr ht
  have hden : 0 < 1+y^2 := by positivity
  unfold polynomialEnvelope
  apply (le_div_iff₀ hden).2
  by_cases hmin : t⁻¹ ≤ y^2
  · rw [min_eq_left hmin]
    have hexp : Real.exp (-c*t⁻¹) ≤ 1 := by
      rw [← Real.exp_zero]
      apply Real.exp_le_exp.mpr
      exact mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hc.le) htinv.le
    have hy : y^2 ≤ Real.pi^2*(t⁻¹)^3 := by
      have hy' : y^2 ≤ Real.pi^2/t^3 := (le_div_iff₀ (pow_pos ht 3)).2 (by
        nlinarith [hsupport])
      simpa only [div_eq_mul_inv, inv_pow] using hy'
    have hprod := mul_le_mul_of_nonneg_right hy (Real.exp_pos (-c*t⁻¹)).le
    have hcubic := cubic_exp_bound hc htinv.le
    have hscaled := mul_le_mul_of_nonneg_left hcubic (sq_nonneg Real.pi)
    have hinv : 0 ≤ 1/c := by positivity
    have hterm : y^2 * Real.exp (-c*t⁻¹) ≤ 27 * Real.pi^2/c^3 := by
      calc
        y^2 * Real.exp (-c*t⁻¹) ≤ Real.pi^2*(t⁻¹)^3 * Real.exp (-c*t⁻¹) := hprod
        _ = Real.pi^2*((t⁻¹)^3 * Real.exp (-c*t⁻¹)) := by ring
        _ ≤ Real.pi^2*(27/c^3) := hscaled
        _ = 27 * Real.pi^2/c^3 := by ring
    calc
      Real.exp (-c*t⁻¹) * (1+y^2) =
          Real.exp (-c*t⁻¹) + y^2 * Real.exp (-c*t⁻¹) := by ring
      _ ≤ 1 + 27 * Real.pi^2/c^3 := add_le_add hexp hterm
      _ ≤ dominationConstant c := by unfold dominationConstant; linarith
  · rw [min_eq_right (le_of_not_ge hmin)]
    have hexp : Real.exp (-c*y^2) ≤ 1 := by
      rw [← Real.exp_zero]
      apply Real.exp_le_exp.mpr
      exact mul_nonpos_of_nonpos_of_nonneg (neg_nonpos.mpr hc.le) (sq_nonneg y)
    have hlinear := linear_exp_bound hc (y^2)
    have htail : 0 ≤ 27 * Real.pi^2/c^3 := by positivity
    unfold dominationConstant
    nlinarith

theorem rescaled_fourier_support {t y : ℝ} (ht : 0 ≤ t)
    (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) : t^3*y^2 ≤ Real.pi^2 := by
  have hs := pow_le_pow_left₀ (abs_nonneg (t * Real.sqrt t * y)) hsupport 2
  have hid : (t * Real.sqrt t * y)^2 = t^3*y^2 := by
    rw [mul_pow, mul_pow, Real.sq_sqrt ht]
    ring
  simpa only [sq_abs, hid] using hs

theorem rescaled_fourier_bound {c t y : ℝ} (hc : 0 < c) (ht : 0 < t)
    (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) :
    Real.exp (-c * min t⁻¹ (y^2)) ≤ polynomialEnvelope c y :=
  damped_min_le_polynomialEnvelope hc ht (rescaled_fourier_support ht.le hsupport)

def supportedDamping (c t y : ℝ) : ℝ :=
  if |t * Real.sqrt t * y| ≤ Real.pi then Real.exp (-c * min t⁻¹ (y^2)) else 0

theorem measurable_supportedDamping (c t : ℝ) : Measurable (supportedDamping c t) := by
  have hs : MeasurableSet {y : ℝ | |t * Real.sqrt t * y| ≤ Real.pi} :=
    measurableSet_le (by fun_prop) measurable_const
  exact Measurable.ite hs (by fun_prop) measurable_const

theorem supportedDamping_nonneg (c t y : ℝ) : 0 ≤ supportedDamping c t y := by
  unfold supportedDamping
  split_ifs
  · exact (Real.exp_pos _).le
  · exact le_rfl

theorem supportedDamping_le_polynomialEnvelope {c t : ℝ} (hc : 0 < c) (ht : 0 < t)
    (y : ℝ) : supportedDamping c t y ≤ polynomialEnvelope c y := by
  unfold supportedDamping
  split_ifs with hs
  · exact rescaled_fourier_bound hc ht hs
  · exact polynomialEnvelope_nonneg hc y

theorem integrable_supportedDamping {c t : ℝ} (hc : 0 < c) (ht : 0 < t) :
    Integrable (supportedDamping c t) := by
  apply (integrable_polynomialEnvelope c).mono' (measurable_supportedDamping c t).aestronglyMeasurable
  apply ae_of_all
  intro y
  rw [Real.norm_eq_abs, abs_of_nonneg (supportedDamping_nonneg c t y)]
  exact supportedDamping_le_polynomialEnvelope hc ht y

end LineSize.Fourier
