import Conjectures.RowlandSistosBarronCoefficientsBasic
import Mathlib.Algebra.Polynomial.BigOperators

/-!
# Rowland–Sistos Barrón conjecture

Exact two-variable coefficient extraction for the polynomial in the
recorded proof, Section 2. Every coefficient here belongs to the actual
power of `basePolynomial`.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

def plusFactor : Polynomial ℚ := 1 + X ^ 3

def minusFactor : Polynomial ℚ := X * (1 - X ^ 3)

theorem basePolynomial_eq_factors :
    basePolynomial = C X * plusFactor.map C + minusFactor.map C := by
  simp [basePolynomial, plusFactor, minusFactor]

theorem basePolynomial_pow_expansion (M : ℕ) :
    basePolynomial ^ M =
      ∑ i ∈ Finset.range (M + 1),
        C (X ^ i) *
          (plusFactor ^ i * minusFactor ^ (M - i) * C (M.choose i : ℚ)).map C := by
  rw [basePolynomial_eq_factors, add_pow]
  apply Finset.sum_congr rfl
  intro i hi
  simp only [Polynomial.map_mul, Polynomial.map_pow, Polynomial.map_C, mul_pow, C_pow]
  simp only [C_eq_natCast]
  ring

theorem double_coeff_C_X_pow_mul_map (i k t : ℕ) (p : Polynomial ℚ) :
    ((C (X ^ i) * p.map C).coeff k).coeff t =
      if t = i then p.coeff k else 0 := by
  rw [coeff_C_mul, coeff_map, coeff_mul_C, coeff_X_pow]
  split_ifs <;> simp

theorem coefficientPolynomial_coeff (M k t : ℕ) :
    (coefficientPolynomial M k).coeff t =
      if t ≤ M then
        (M.choose t : ℚ) * (plusFactor ^ t * minusFactor ^ (M - t)).coeff k
      else 0 := by
  rw [coefficientPolynomial, basePolynomial_pow_expansion]
  simp only [finsetSum_coeff, double_coeff_C_X_pow_mul_map]
  simp only [Finset.sum_ite_eq, Finset.mem_range, Nat.lt_succ_iff, coeff_mul_C]
  split_ifs <;> first | exact mul_comm _ _ | rfl

theorem coefficientPolynomial_coeff_above {M k t : ℕ} (ht : M < t) :
    (coefficientPolynomial M k).coeff t = 0 := by
  rw [coefficientPolynomial_coeff, ite_eq_right (by omega)]

theorem coefficientPolynomial_natDegree_le (M k : ℕ) :
    (coefficientPolynomial M k).natDegree ≤ M := by
  apply natDegree_le_iff_coeff_eq_zero.mpr
  exact fun t ht => coefficientPolynomial_coeff_above ht

/-- The polynomial whose coefficients are the Krawtchouk values. -/
def krawtchoukPolynomial (M j : ℕ) : Polynomial ℚ :=
  (1 + X) ^ (M - j) * (1 - X) ^ j

def krawtchouk (M j r : ℕ) : ℚ :=
  (krawtchoukPolynomial M j).coeff r

theorem factors_eq_expand {M r : ℕ} (_hr : r ≤ M) :
    plusFactor ^ (M - r) * minusFactor ^ r =
      X ^ r * expand ℚ 3 (krawtchoukPolynomial M r) := by
  simp only [plusFactor, minusFactor, krawtchoukPolynomial, map_mul,
    map_pow, map_add, map_sub, map_one, expand_X, mul_pow]
  ring

theorem coefficientPolynomial_coeff_sub {M r : ℕ} (hr : r ≤ M) (k : ℕ) :
    (coefficientPolynomial M k).coeff (M - r) =
      (M.choose r : ℚ) *
        (X ^ r * expand ℚ 3 (krawtchoukPolynomial M r)).coeff k := by
  rw [coefficientPolynomial_coeff, ite_eq_left (Nat.sub_le M r),
    Nat.sub_sub_self hr, Nat.choose_symm hr, factors_eq_expand hr]

theorem coefficientPolynomial_coeff_sub_congr {M r j : ℕ} (hr : r ≤ M) :
    (coefficientPolynomial M (r + 3 * j)).coeff (M - r) =
      (M.choose r : ℚ) * krawtchouk M r j := by
  rw [coefficientPolynomial_coeff_sub hr]
  rw [Nat.add_comm r, coeff_X_pow_mul, coeff_expand_mul' (by decide : 0 < 3)]
  rfl

theorem coefficientPolynomial_coeff_sub_zero_of_lt {M r k : ℕ}
    (hr : r ≤ M) (hk : k < r) :
    (coefficientPolynomial M k).coeff (M - r) = 0 := by
  rw [coefficientPolynomial_coeff_sub hr, coeff_X_pow_mul', ite_eq_right (by omega), mul_zero]

theorem coefficientPolynomial_coeff_sub_zero_of_mod {M r k : ℕ}
    (hr : r ≤ M) (hk : r ≤ k) (hmod : ¬ 3 ∣ k - r) :
    (coefficientPolynomial M k).coeff (M - r) = 0 := by
  rw [coefficientPolynomial_coeff_sub hr, coeff_X_pow_mul', ite_eq_left hk,
    coeff_expand (by decide : 0 < 3), ite_eq_right hmod, mul_zero]

theorem krawtchoukPolynomial_natDegree_le {M j : ℕ} (hj : j ≤ M) :
    (krawtchoukPolynomial M j).natDegree ≤ M := by
  unfold krawtchoukPolynomial
  calc
    _ ≤ (M - j) + j := by compute_degree
    _ = M := Nat.sub_add_cancel hj

theorem coefficientPolynomial_coeff_sub_zero_of_top {M r k : ℕ}
    (hr : r ≤ M) (hk : r + 3 * M < k) :
    (coefficientPolynomial M k).coeff (M - r) = 0 := by
  rw [coefficientPolynomial_coeff_sub hr, coeff_X_pow_mul', ite_eq_left (by omega),
    coeff_expand (by decide : 0 < 3)]
  split_ifs with hd
  · rw [coeff_eq_zero_of_natDegree_lt, mul_zero]
    exact lt_of_le_of_lt (krawtchoukPolynomial_natDegree_le hr) (by omega)
  · exact mul_zero _

end

end RowlandSistosBarron
