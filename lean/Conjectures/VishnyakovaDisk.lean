module

public import Conjectures.VishnyakovaReflection
public import Conjectures.VishnyakovaJacobi

/-!
# Disk exclusion for the literal factorial transform

The source coefficient recurrence supplies a finite Jacobi vector whenever a
diagonal value vanishes.  The proved weighted estimate excludes that zero;
polar differentiation then transfers exclusion to independent real
parameters.  Reflection supplies the remaining real-root bounds.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial
open scoped BigOperators ComplexConjugate

theorem binomial_jacobi_relation (beta z t r : ℂ) (hr : r ≠ 0)
    (hr2 : r ^ 2 = -t * (1 - t)) (c : ℕ → ℂ)
    (hc : ∀ k : ℕ, (beta + (k : ℂ)) * c (k + 1) = (z - (k : ℂ)) * c k)
    (j : ℕ) :
    (z - (j : ℂ) + (2 * (j : ℂ) + beta) * t) *
        (binomialValue c t j / r ^ j) =
      r * ((beta + (j : ℂ)) * (binomialValue c t (j + 1) / r ^ (j + 1)) +
        (j : ℂ) * (binomialValue c t (j - 1) / r ^ (j - 1))) := by
  cases j with
  | zero =>
    have h0 : (z + beta * t) * binomialValue c t 0 = beta * binomialValue c t 1 := by
      have h := hc 0
      simp only [Nat.cast_zero, add_zero, sub_zero] at h
      simp only [binomialValue]
      linear_combination -h
    simp only [Nat.cast_zero, sub_zero, zero_mul, mul_zero, zero_add, add_zero, pow_zero,
      div_one, pow_one]
    calc
      (z + beta * t) * binomialValue c t 0 = beta * binomialValue c t 1 := h0
      _ = r * (beta * (binomialValue c t 1 / r)) := by field_simp [hr]
  | succ j =>
    have hrec :
        (z - ((j + 1 : ℕ) : ℂ) + (2 * ((j + 1 : ℕ) : ℂ) + beta) * t) *
            binomialValue c t (j + 1) =
          (beta + ((j + 1 : ℕ) : ℂ)) * binomialValue c t (j + 2) +
            ((j + 1 : ℕ) : ℂ) * r ^ 2 * binomialValue c t j := by
      rw [hr2]
      linear_combination -(binomial_three_term beta z t c hc j)
    simp only [Nat.add_sub_cancel]
    calc
      _ = ((z - ((j + 1 : ℕ) : ℂ) + (2 * ((j + 1 : ℕ) : ℂ) + beta) * t) *
          binomialValue c t (j + 1)) / r ^ (j + 1) := by ring
      _ = ((beta + ((j + 1 : ℕ) : ℂ)) * binomialValue c t (j + 2) +
          ((j + 1 : ℕ) : ℂ) * r ^ 2 * binomialValue c t j) / r ^ (j + 1) := by rw [hrec]
      _ = _ := by
        simp only [show j + 2 = (j + 1) + 1 by omega, pow_succ]
        field_simp [hr]

/-- A zero of a nondegenerate diagonal produces the precise weighted Jacobi
recurrence used in the disk estimate. -/
theorem source_diagonal_root_disk (beta : ℝ) (hbeta : 0 < beta) (z t : ℂ)
    (n : ℕ) (ht : 0 ≤ t.im) (hz : 0 < z.im)
    (hzero : binomialValue (sourceCoefficient beta z) t (n + 1) = 0) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ (n : ℝ) + beta / 2 := by
  by_cases ht0 : t = 0
  · have hn : monicDiagonalValue beta z t (n + 1) ≠ 0 := by
      rw [ht0, monicDiagonalValue_at_zero beta hbeta]
      exact fallingProduct_ne_zero z hz.ne' _
    exact False.elim (hn (by simp [monicDiagonalValue, hzero]))
  by_cases ht1 : t = 1
  · have hn : monicDiagonalValue beta z t (n + 1) ≠ 0 := by
      rw [ht1, monicDiagonalValue_at_one beta hbeta]
      apply ascendingProduct_ne_zero
      simpa using hz.ne'
    exact False.elim (hn (by simp [monicDiagonalValue, hzero]))
  have hprod : t * (1 - t) ≠ 0 :=
    mul_ne_zero ht0 (sub_ne_zero.mpr (Ne.symm ht1))
  obtain ⟨s, hs⟩ := IsAlgClosed.exists_pow_nat_eq (t * (1 - t)) (by decide : 0 < (2 : ℕ))
  have hs0 : s ≠ 0 := by
    intro h
    exact hprod (by simpa [h] using hs.symm)
  let r : ℂ := Complex.I * s
  have hr : r ≠ 0 := mul_ne_zero Complex.I_ne_zero hs0
  have hr2 : r ^ 2 = -t * (1 - t) := by
    dsimp [r]
    rw [mul_pow, Complex.I_sq, hs]
    ring
  let q : ℕ → ℂ := fun j => binomialValue (sourceCoefficient beta z) t j / r ^ j
  have hq0 : q 0 ≠ 0 := by simp [q, binomialValue, sourceCoefficient_zero]
  have hqn : q (n + 1) = 0 := by simp [q, hzero]
  apply jacobi_disk_bound beta hbeta q hq0 z t s n hs ht hz hqn
  intro j hj
  exact binomial_jacobi_relation (beta : ℂ) z t r hr hr2
    (sourceCoefficient beta z) (sourceCoefficient_step beta hbeta z) j

theorem source_diagonal_nonzero (beta : ℝ) (hbeta : 0 < beta) (z t : ℂ)
    (n : ℕ) (hn : 0 < n) (ht : 0 ≤ t.im) (hz : 0 < z.im)
    (houtside : (n : ℝ) - 1 + beta / 2 < ‖z + ((beta / 2 : ℝ) : ℂ)‖) :
    binomialValue (sourceCoefficient beta z) t n ≠ 0 := by
  cases n with
  | zero => omega
  | succ n =>
    intro hzero
    have h := source_diagonal_root_disk beta hbeta z t n ht hz hzero
    simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at houtside
    exact not_lt_of_ge h houtside

/-- Independent real parameters satisfy the upper-half-plane disk bound. -/
theorem source_upper_root_disk (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (hn : 0 < as.length) (z : ℂ) (hz : 0 < z.im)
    (hzero : coefficientPairing (sourceCoefficient beta z) (parameterPolynomial as) = 0) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ (as.length : ℝ) - 1 + beta / 2 := by
  by_contra h
  apply coefficientPairing_product_ne_zero as (sourceCoefficient beta z) _ hzero
  intro t ht
  exact source_diagonal_nonzero beta hbeta z t as.length hn ht hz (lt_of_not_ge h)

theorem sourceCoefficient_conj (beta : ℝ) (z : ℂ) (n : ℕ) :
    sourceCoefficient beta (conj z) n = conj (sourceCoefficient beta z n) := by
  simp [sourceCoefficient, fallingProduct, map_prod]

theorem coefficientPairing_product_conj (as : List ℝ) (c : ℕ → ℂ) :
    coefficientPairing (fun k => conj (c k)) (parameterPolynomial as) =
      conj (coefficientPairing c (parameterPolynomial as)) := by
  induction as generalizing c with
  | nil => simp [parameterPolynomial, coefficientPairing_one]
  | cons a as ih =>
    simp only [parameterPolynomial_cons, coefficientPairing_linear_mul, ih,
      map_add, map_mul, Complex.conj_ofReal]

theorem source_product_conj (beta : ℝ) (z : ℂ) (as : List ℝ) :
    coefficientPairing (sourceCoefficient beta (conj z)) (parameterPolynomial as) =
      conj (coefficientPairing (sourceCoefficient beta z) (parameterPolynomial as)) := by
  have heq : sourceCoefficient beta (conj z) = fun k => conj (sourceCoefficient beta z k) :=
    funext (sourceCoefficient_conj beta z)
  rw [heq, coefficientPairing_product_conj]

/-- The stronger disk theorem for every finite independent parameter vector
in `[0,1]`, using the source's literal factorial coefficients. -/
theorem source_root_disk (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (hn : 0 < as.length) (ha : ∀ a ∈ as, 0 ≤ a ∧ a ≤ 1) (z : ℂ)
    (hzero : coefficientPairing (sourceCoefficient beta z) (parameterPolynomial as) = 0) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ (as.length : ℝ) - 1 + beta / 2 := by
  rcases lt_trichotomy z.im 0 with hz | hz | hz
  · have hconj : coefficientPairing (sourceCoefficient beta (conj z))
        (parameterPolynomial as) = 0 := by rw [source_product_conj, hzero, map_zero]
    have him : 0 < (conj z).im := by simpa using neg_pos.mpr hz
    have h := source_upper_root_disk beta hbeta as hn (conj z) him hconj
    have heq : conj z + ((beta / 2 : ℝ) : ℂ) = conj (z + ((beta / 2 : ℝ) : ℂ)) := by
      rw [map_add, Complex.conj_ofReal]
    simpa only [heq, Complex.norm_conj] using h
  · have heq : z = (z.re : ℂ) := by
      apply Complex.ext <;> simp [hz]
    rw [heq] at hzero ⊢
    have hinterval := source_real_root_interval beta hbeta as ha z.re hzero
    rw [← Complex.ofReal_add, Complex.norm_real, Real.norm_eq_abs, abs_le]
    constructor <;> linarith
  · exact source_upper_root_disk beta hbeta as hn z hz hzero

theorem source_root_modulus (beta : ℝ) (hbeta : 0 < beta) (as : List ℝ)
    (hn : 0 < as.length) (ha : ∀ a ∈ as, 0 ≤ a ∧ a ≤ 1) (z : ℂ)
    (hzero : coefficientPairing (sourceCoefficient beta z) (parameterPolynomial as) = 0) :
    ‖z‖ ≤ (as.length : ℝ) - 1 + beta := by
  have h := source_root_disk beta hbeta as hn ha z hzero
  have hnorm : ‖((beta / 2 : ℝ) : ℂ)‖ = beta / 2 := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos (by positivity)]
  have htri := norm_sub_le (z + ((beta / 2 : ℝ) : ℂ)) ((beta / 2 : ℝ) : ℂ)
  rw [add_sub_cancel_right, hnorm] at htri
  linarith

end VishnyakovaRootRadius
