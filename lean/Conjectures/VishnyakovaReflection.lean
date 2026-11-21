module

public import Conjectures.VishnyakovaBinomial

/-!
# Reflection and the real roots of the factorial transform

This file proves the source's reflection formula by finite binomial algebra.
Positivity on the nonnegative orthant then excludes the two exterior real
intervals for parameters in `[0,1]`.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial
open scoped BigOperators

theorem coefficientPairing_coeff_add (c d : ℕ → ℂ) (p : ℂ[X]) :
    coefficientPairing (fun k => c k + d k) p =
      coefficientPairing c p + coefficientPairing d p := by
  classical
  simp [coefficientPairing, Polynomial.sum, mul_add, Finset.sum_add_distrib]

theorem coefficientPairing_coeff_mul (a : ℂ) (c : ℕ → ℂ) (p : ℂ[X]) :
    coefficientPairing (fun k => a * c k) p = a * coefficientPairing c p := by
  classical
  simp only [coefficientPairing, Polynomial.sum, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  ring

theorem coefficientPairing_coeff_neg (c : ℕ → ℂ) (p : ℂ[X]) :
    coefficientPairing (fun k => -c k) p = -coefficientPairing c p := by
  simpa using coefficientPairing_coeff_mul (-1) c p

theorem parameterPolynomial_nil : parameterPolynomial [] = 1 := by
  simp [parameterPolynomial]

theorem parameterPolynomial_cons (a : ℝ) (as : List ℝ) :
    parameterPolynomial (a :: as) =
      (Polynomial.C (a : ℂ) + Polynomial.X) * parameterPolynomial as := by
  simp [parameterPolynomial]

theorem parameterPolynomial_eq_map (as : List ℝ) :
    parameterPolynomial as =
      (as.map (fun a : ℝ => Polynomial.C (a : ℂ) + Polynomial.X)).prod := by
  induction as with
  | nil => rw [parameterPolynomial_nil]; rfl
  | cons a as ih => rw [parameterPolynomial_cons, List.map_cons, List.prod_cons, ih]

/-- Finite binomial duality under independent parameter complementation. -/
theorem coefficientPairing_parameter_reflect (as : List ℝ) (c d : ℕ → ℂ)
    (h : ∀ k, k ≤ as.length → binomialValue d 1 k = (-1 : ℂ) ^ k * c k) :
    coefficientPairing d (parameterPolynomial (as.map (fun a => 1 - a))) =
      (-1 : ℂ) ^ as.length * coefficientPairing c (parameterPolynomial as) := by
  induction as generalizing c d with
  | nil =>
    have h0 := h 0 (by simp)
    simpa [parameterPolynomial, coefficientPairing_one, binomialValue] using h0
  | cons a as ih =>
    have h0 : ∀ k, k ≤ as.length →
        binomialValue d 1 k = (-1 : ℂ) ^ k * c k := by
      intro k hk
      exact h k (by simp only [List.length_cons]; omega)
    have h1 : ∀ k, k ≤ as.length →
        binomialValue (fun j => d (j + 1)) 1 k =
          (-1 : ℂ) ^ k * (-c k - c (k + 1)) := by
      intro k hk
      have hk0 := h0 k hk
      have hk1 := h (k + 1) (by simp only [List.length_cons]; omega)
      rw [binomialValue, one_mul, pow_succ] at hk1
      linear_combination hk1 - hk0
    simp only [List.map_cons, List.length_cons, parameterPolynomial_cons,
      coefficientPairing_linear_mul]
    rw [ih c d h0, ih (fun k => -c k - c (k + 1)) (fun k => d (k + 1)) h1]
    have hfun : (fun k => -c k - c (k + 1)) =
        (fun k => (-c k) + (-c (k + 1))) := by
      funext k
      ring
    rw [hfun, coefficientPairing_coeff_add, coefficientPairing_coeff_neg,
      coefficientPairing_coeff_neg, pow_succ]
    push_cast
    ring

theorem ascendingProduct_neg (z : ℂ) (n : ℕ) :
    ascendingProduct (-z) n = (-1 : ℂ) ^ n * fallingProduct z n := by
  induction n with
  | zero => simp [ascendingProduct, fallingProduct]
  | succ n ih =>
    rw [ascendingProduct_succ, fallingProduct_succ, ih, pow_succ]
    ring

/-- The Chu--Vandermonde identity needed by reflection, obtained from the
proved diagonal three-term recurrence at `t = 1`. -/
theorem sourceCoefficient_reflected_binomial (beta : ℝ) (hbeta : 0 < beta)
    (z : ℂ) (n : ℕ) :
    binomialValue (sourceCoefficient beta (-z - (beta : ℂ))) 1 n =
      (-1 : ℂ) ^ n * sourceCoefficient beta z n := by
  have hr : (risingProduct beta n : ℂ) ≠ 0 := by
    exact_mod_cast (risingProduct_pos beta hbeta n).ne'
  have h := monicDiagonalValue_at_one beta hbeta (-z - (beta : ℂ)) n
  have hz : -z - (beta : ℂ) + (beta : ℂ) = -z := by ring
  rw [hz, ascendingProduct_neg] at h
  unfold monicDiagonalValue at h
  apply mul_left_cancel₀ hr
  rw [h]
  unfold sourceCoefficient
  field_simp [hr]

/-- Exact reflection for the literal polynomial with roots `-a_i`. -/
theorem source_reflection (beta : ℝ) (hbeta : 0 < beta) (z : ℂ) (as : List ℝ) :
    coefficientPairing (sourceCoefficient beta (-z - (beta : ℂ)))
        (parameterPolynomial (as.map (fun a => 1 - a))) =
      (-1 : ℂ) ^ as.length *
        coefficientPairing (sourceCoefficient beta z) (parameterPolynomial as) := by
  apply coefficientPairing_parameter_reflect
  intro k hk
  exact sourceCoefficient_reflected_binomial beta hbeta z k

theorem coefficientPairing_product_re_nonneg (as : List ℝ) (c : ℕ → ℂ)
    (ha : ∀ a ∈ as, 0 ≤ a) (hc : ∀ k, k ≤ as.length → 0 ≤ (c k).re) :
    0 ≤ (coefficientPairing c (parameterPolynomial as)).re := by
  induction as generalizing c with
  | nil =>
    simpa [parameterPolynomial, coefficientPairing_one] using hc 0 (by simp)
  | cons a as ih =>
    have ha0 : 0 ≤ a := ha a (by simp)
    have ha' : ∀ b ∈ as, 0 ≤ b := by
      intro b hb
      exact ha b (by simp [hb])
    have hc0 : ∀ k, k ≤ as.length → 0 ≤ (c k).re := by
      intro k hk
      exact hc k (by simp only [List.length_cons]; omega)
    have hc1 : ∀ k, k ≤ as.length → 0 ≤ (c (k + 1)).re := by
      intro k hk
      exact hc (k + 1) (by simp only [List.length_cons]; omega)
    rw [parameterPolynomial_cons, coefficientPairing_linear_mul]
    simp only [Complex.add_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      zero_mul, sub_zero]
    exact add_nonneg (mul_nonneg ha0 (ih c ha' hc0)) (ih _ ha' hc1)

theorem coefficientPairing_product_re_pos (as : List ℝ) (c : ℕ → ℂ)
    (ha : ∀ a ∈ as, 0 ≤ a) (hc : ∀ k, k ≤ as.length → 0 ≤ (c k).re)
    (hlast : 0 < (c as.length).re) :
    0 < (coefficientPairing c (parameterPolynomial as)).re := by
  induction as generalizing c with
  | nil =>
    simpa [parameterPolynomial, coefficientPairing_one] using hlast
  | cons a as ih =>
    have ha0 : 0 ≤ a := ha a (by simp)
    have ha' : ∀ b ∈ as, 0 ≤ b := by
      intro b hb
      exact ha b (by simp [hb])
    have hc0 : ∀ k, k ≤ as.length → 0 ≤ (c k).re := by
      intro k hk
      exact hc k (by simp only [List.length_cons]; omega)
    have hc1 : ∀ k, k ≤ as.length → 0 ≤ (c (k + 1)).re := by
      intro k hk
      exact hc (k + 1) (by simp only [List.length_cons]; omega)
    rw [parameterPolynomial_cons, coefficientPairing_linear_mul]
    simp only [Complex.add_re, Complex.mul_re, Complex.ofReal_re, Complex.ofReal_im,
      zero_mul, sub_zero]
    apply add_pos_of_nonneg_of_pos
    · exact mul_nonneg ha0 (coefficientPairing_product_re_nonneg as c ha' hc0)
    · exact ih _ ha' hc1 hlast

theorem sourceCoefficient_real_pos (beta : ℝ) (hbeta : 0 < beta) (x : ℝ) (n : ℕ)
    (hx : ∀ k, k < n → (k : ℝ) < x) :
    0 < (sourceCoefficient beta (x : ℂ) n).re := by
  have hp : 0 < ∏ k ∈ Finset.range n, (x - (k : ℝ)) := by
    apply Finset.prod_pos
    intro k hk
    exact sub_pos.mpr (hx k (Finset.mem_range.mp hk))
  have heq : fallingProduct (x : ℂ) n =
      ((∏ k ∈ Finset.range n, (x - (k : ℝ)) : ℝ) : ℂ) := by
    simp [fallingProduct]
  unfold sourceCoefficient
  rw [heq, ← Complex.ofReal_div, Complex.ofReal_re]
  exact div_pos hp (risingProduct_pos beta hbeta n)

/-- There is no real root to the right of `n-1` for nonnegative parameters. -/
theorem source_real_upper_nonzero (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (ha : ∀ a ∈ as, 0 ≤ a) (x : ℝ) (hx : (as.length : ℝ) - 1 < x) :
    coefficientPairing (sourceCoefficient beta (x : ℂ)) (parameterPolynomial as) ≠ 0 := by
  have hcoeff : ∀ k, k ≤ as.length → 0 < (sourceCoefficient beta (x : ℂ) k).re := by
    intro k hk
    apply sourceCoefficient_real_pos beta hbeta x k
    intro j hj
    have hjn : j + 1 ≤ as.length := (Nat.succ_le_iff.mpr hj).trans hk
    have hjn' : (j : ℝ) + 1 ≤ as.length := by exact_mod_cast hjn
    linarith
  have hp := coefficientPairing_product_re_pos as (sourceCoefficient beta (x : ℂ)) ha
    (fun k hk => (hcoeff k hk).le) (hcoeff as.length le_rfl)
  intro heq
  rw [heq, Complex.zero_re] at hp
  exact lt_irrefl _ hp

/-- Parameter complementation excludes real roots to the left of
`-beta-n+1` whenever all parameters are at most one. -/
theorem source_real_lower_nonzero (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (ha : ∀ a ∈ as, a ≤ 1) (x : ℝ) (hx : x < -beta - (as.length : ℝ) + 1) :
    coefficientPairing (sourceCoefficient beta (x : ℂ)) (parameterPolynomial as) ≠ 0 := by
  have ha' : ∀ a ∈ as.map (fun b => 1 - b), 0 ≤ a := by
    intro a ha0
    obtain ⟨b, hb, rfl⟩ := List.mem_map.mp ha0
    exact sub_nonneg.mpr (ha b hb)
  have hx' : ((as.map (fun b => 1 - b)).length : ℝ) - 1 < -x - beta := by
    simp only [List.length_map]
    linarith
  have hn := source_real_upper_nonzero beta hbeta _ ha' (-x - beta) hx'
  have href := source_reflection beta hbeta (x : ℂ) as
  push_cast at hn
  rw [href] at hn
  intro hz
  exact hn (by rw [hz, mul_zero])

/-- Every real root for parameters in `[0,1]` lies in the source interval. -/
theorem source_real_root_interval (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (ha : ∀ a ∈ as, 0 ≤ a ∧ a ≤ 1) (x : ℝ)
    (hx : coefficientPairing (sourceCoefficient beta (x : ℂ)) (parameterPolynomial as) = 0) :
    -beta - (as.length : ℝ) + 1 ≤ x ∧ x ≤ (as.length : ℝ) - 1 := by
  constructor
  · by_contra h
    exact source_real_lower_nonzero beta hbeta as (fun a ha0 => (ha a ha0).2) x
      (lt_of_not_ge h) hx
  · by_contra h
    exact source_real_upper_nonzero beta hbeta as (fun a ha0 => (ha a ha0).1) x
      (lt_of_not_ge h) hx

theorem parameterPolynomial_replicate (a : ℝ) (n : ℕ) :
    parameterPolynomial (List.replicate n a) = (Polynomial.C (a : ℂ) + Polynomial.X) ^ n := by
  induction n with
  | zero => simp [parameterPolynomial_nil]
  | succ n ih => rw [List.replicate_succ, parameterPolynomial_cons, ih, pow_succ']

/-- The extremal endpoint is attained by the source polynomial `(1+w)^n`. -/
theorem source_extremal_zero (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n) :
    coefficientPairing (sourceCoefficient beta (-(beta : ℂ) - (n - 1 : ℕ)))
      (parameterPolynomial (List.replicate n 1)) = 0 := by
  rw [parameterPolynomial_replicate, ← binomialValue_eq_pairing]
  have hr : (risingProduct beta n : ℂ) ≠ 0 := by
    exact_mod_cast (risingProduct_pos beta hbeta n).ne'
  have h := monicDiagonalValue_at_one beta hbeta (-(beta : ℂ) - (n - 1 : ℕ)) n
  have hz : -(beta : ℂ) - (n - 1 : ℕ) + (beta : ℂ) = -((n - 1 : ℕ) : ℂ) := by ring
  rw [hz] at h
  have hzprod : ascendingProduct (-((n - 1 : ℕ) : ℂ)) n = 0 := by
    unfold ascendingProduct
    apply Finset.prod_eq_zero (i := n - 1)
    · exact Finset.mem_range.mpr (Nat.sub_lt hn (by decide : 0 < (1 : ℕ)))
    · simp
  rw [hzprod] at h
  exact (mul_eq_zero.mp h).resolve_left hr

end VishnyakovaRootRadius
