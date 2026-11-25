import Conjectures.SokalAperyMoments
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic
import Mathlib.RingTheory.Polynomial.ShiftedLegendre

/-! The first circle average in the Legendre representation of the Apéry polynomials. -/

namespace SokalApery

open Finset Complex Polynomial
open scoped Interval

/-- The ordinary Legendre polynomial evaluated at a complex argument. -/
noncomputable def legendre (n : ℕ) (z : ℂ) : ℂ :=
  aeval ((1 - z) / 2) (shiftedLegendre n)

theorem legendre_one_add (n : ℕ) (u : ℂ) :
    legendre n (1 + 2 * u) =
      ∑ k ∈ range (n + 1), (n.choose k : ℂ) * ((n + k).choose k : ℂ) * u ^ k := by
  unfold legendre shiftedLegendre
  rw [show (1 - (1 + 2 * u)) / 2 = -u by ring]
  simp only [map_sum, map_mul, aeval_C, map_pow, aeval_X]
  apply sum_congr rfl
  intro k _
  rw [Nat.choose_symm_add (a := n) (b := k)]
  simp only [map_neg, map_one, map_natCast]
  rw [show -u = (-1 : ℂ) * u by ring, mul_pow]
  calc
    _ = ((-1 : ℂ) ^ k * (-1) ^ k) *
      ((n.choose k : ℂ) * ((n + k).choose k : ℂ) * u ^ k) := by ring
    _ = _ := by rw [← mul_pow]; simp

private noncomputable def circleMode (k : ℤ) (θ : ℝ) : ℂ :=
  Complex.exp ((k : ℂ) * I * θ)

private theorem circleMode_add (k l : ℤ) (θ : ℝ) :
    circleMode k θ * circleMode l θ = circleMode (k + l) θ := by
  rw [circleMode, circleMode, circleMode, ← Complex.exp_add, Int.cast_add]
  congr 1
  ring

private theorem circleMode_pow (k : ℤ) (θ : ℝ) (n : ℕ) :
    circleMode k θ ^ n = circleMode (k * n) θ := by
  induction n with
  | zero => simp [circleMode]
  | succ n IH =>
    rw [pow_succ, IH, circleMode_add, Nat.cast_succ, mul_add, mul_one]

private theorem continuous_circleMode (k : ℤ) : Continuous (circleMode k) := by
  unfold circleMode
  fun_prop

private theorem integral_circleMode (m : ℤ) :
    (∫ θ in (0 : ℝ)..2 * Real.pi, circleMode m θ) =
      if m = 0 then ((2 * Real.pi : ℝ) : ℂ) else 0 := by
  by_cases h : m = 0
  · simp [h, circleMode, intervalIntegral.integral_const]
  · simp only [circleMode, ite_eq_right h]
    rw [integral_exp_mul_complex (mul_ne_zero (by exact_mod_cast h) I_ne_zero)]
    have he : ((m : ℂ) * I) * ((2 * Real.pi : ℝ) : ℂ) = (m : ℂ) * (2 * (Real.pi : ℂ) * I) := by
      push_cast
      ring
    rw [he, Complex.exp_int_mul_two_pi_mul_I]
    simp

private theorem legendre_circle (n : ℕ) (r : ℝ) (m : ℤ) (θ : ℝ) :
    legendre n (1 + 2 * ((r : ℂ) * circleMode m θ)) =
      ∑ k ∈ range (n + 1),
        ((n.choose k : ℂ) * ((n + k).choose k : ℂ) * (r : ℂ) ^ k) * circleMode (m * k) θ := by
  rw [legendre_one_add]
  apply sum_congr rfl
  intro k _
  rw [mul_pow, circleMode_pow]
  ring

/-- Phase averaging extracts exactly the squares of the Legendre coefficients. -/
theorem integral_legendre_product (n : ℕ) (r : ℝ) :
    (∫ θ in (0 : ℝ)..2 * Real.pi,
      legendre n (1 + 2 * ((r : ℂ) * Complex.exp (I * θ))) *
      legendre n (1 + 2 * ((r : ℂ) * Complex.exp (-I * θ)))) =
      ((2 * Real.pi : ℝ) : ℂ) * (apery (r ^ 2) n : ℂ) := by
  let c := fun k : ℕ => (n.choose k : ℂ) * ((n + k).choose k : ℂ) * (r : ℂ) ^ k
  have hform (θ : ℝ) :
      legendre n (1 + 2 * ((r : ℂ) * Complex.exp (I * θ))) *
        legendre n (1 + 2 * ((r : ℂ) * Complex.exp (-I * θ))) =
      ∑ k ∈ range (n + 1), ∑ l ∈ range (n + 1),
        (c k * c l) * circleMode ((k : ℤ) - l) θ := by
    have hm₁ : circleMode 1 θ = Complex.exp (I * θ) := by simp [circleMode]
    have hm₂ : circleMode (-1) θ = Complex.exp (-I * θ) := by simp [circleMode]
    rw [← hm₁, ← hm₂, legendre_circle, legendre_circle, sum_mul]
    simp only [one_mul, neg_one_mul]
    apply sum_congr rfl
    intro k _
    rw [mul_sum]
    apply sum_congr rfl
    intro l _
    change (c k * circleMode k θ) * (c l * circleMode (-(l : ℤ)) θ) = _
    rw [show (c k * circleMode k θ) * (c l * circleMode (-(l : ℤ)) θ) =
      (c k * c l) * (circleMode k θ * circleMode (-(l : ℤ)) θ) by ring,
      circleMode_add, sub_eq_add_neg]
  simp_rw [hform]
  rw [intervalIntegral.integral_finsetSum]
  · calc
      _ = ∑ k ∈ range (n + 1), (c k * c k) * ((2 * Real.pi : ℝ) : ℂ) := by
        apply sum_congr rfl
        intro k hk
        rw [intervalIntegral.integral_finsetSum]
        · simp_rw [intervalIntegral.integral_const_mul, integral_circleMode]
          rw [sum_eq_single k]
          · simp
          · intro l _ hl
            have h : (k : ℤ) - l ≠ 0 := by omega
            simp [h]
          · exact fun h => (h hk).elim
        · exact fun l _ => ((continuous_circleMode _).const_mul _).intervalIntegrable ..
      _ = _ := by
        simp only [apery, Complex.ofReal_sum, Complex.ofReal_mul, Complex.ofReal_pow, Complex.ofReal_natCast,
          mul_sum]
        apply sum_congr rfl
        intro k _
        dsimp only [c]
        rw [← pow_mul, mul_comm 2 k, pow_mul]
        ring
  · intro k _
    exact (continuous_finsetSum _ fun l _ => (continuous_circleMode _).const_mul (c k * c l)).intervalIntegrable ..

end SokalApery
