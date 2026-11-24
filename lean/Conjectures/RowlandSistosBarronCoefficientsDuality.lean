import Conjectures.RowlandSistosBarronCoefficientsExpansion

/-!
# Rowland–Sistos Barrón conjecture

The binomially weighted Krawtchouk duality in Section 2, equation (5),
proved by the symmetry of the actual bivariate generating polynomial.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

theorem coeff_linear_pow (a b : Polynomial ℚ) (M r : ℕ) :
    ((C a * X + C b) ^ M).coeff r =
      if r ≤ M then C (M.choose r : ℚ) * a ^ r * b ^ (M - r) else 0 := by
  have heq : (C a * X + C b) ^ M =
      ∑ i ∈ Finset.range (M + 1),
        C ((M.choose i : ℚ[X]) * a ^ i * b ^ (M - i)) * X ^ i := by
    rw [add_pow]
    apply Finset.sum_congr rfl
    intro i hi
    simp only [map_mul, map_pow, mul_pow, map_natCast]
    ring
  rw [heq]
  simp only [finsetSum_coeff, coeff_C_mul_X_pow, Finset.sum_ite_eq,
    Finset.mem_range, Nat.lt_succ_iff, C_eq_natCast]

/-- Exchange the two polynomial variables using their universal evaluation map. -/
def transpose : Polynomial (Polynomial ℚ) →+* Polynomial (Polynomial ℚ) :=
  eval₂RingHom (mapRingHom C) (C X)

theorem transpose_C (p : Polynomial ℚ) : transpose (C p) = p.map C := by
  simp [transpose]

theorem transpose_X : transpose X = C X := by
  simp [transpose]

theorem transpose_C_X : transpose (C X) = X := by
  rw [transpose_C]
  simp

theorem transpose_monomial_monomial (n m : ℕ) (c : ℚ) :
    transpose (monomial n (monomial m c)) = monomial m (monomial n c) := by
  change eval₂ (mapRingHom C) (C X) (monomial n (monomial m c)) = _
  rw [eval₂_monomial]
  change (monomial m c).map C * (C X) ^ n = _
  rw [Polynomial.map_monomial]
  simp only [← C_mul_X_pow_eq_monomial, C_mul, C_pow]
  ring

theorem coeff_coeff_swap (p : Polynomial (Polynomial ℚ)) (i j : ℕ) :
    ((transpose p).coeff i).coeff j = (p.coeff j).coeff i := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq => simp only [map_add, coeff_add, hp, hq]
  | monomial n a =>
    induction a using Polynomial.induction_on' with
    | add a b ha hb => simp only [map_add, coeff_add, ha, hb]
    | monomial m c =>
      rw [transpose_monomial_monomial]
      simp only [coeff_monomial]
      split_ifs <;> simp_all [coeff_monomial]

def krawtchoukGenerator : Polynomial (Polynomial ℚ) :=
  C (1 - X) * X + C (1 + X)

theorem krawtchoukGenerator_swap :
    transpose krawtchoukGenerator = krawtchoukGenerator := by
  unfold krawtchoukGenerator
  simp only [C_sub, C_add, C_1]
  simp only [map_add, map_mul, map_sub, map_one, transpose_C_X, transpose_X]
  ring

theorem krawtchoukGenerator_coeff {M r : ℕ} (hr : r ≤ M) :
    (krawtchoukGenerator ^ M).coeff r =
      C (M.choose r : ℚ) * krawtchoukPolynomial M r := by
  rw [krawtchoukGenerator, coeff_linear_pow, ite_eq_left hr]
  unfold krawtchoukPolynomial
  ring

/-- Exact coefficient duality, not an assumed formula for the coefficient sequence. -/
theorem krawtchouk_duality {M r j : ℕ} (hr : r ≤ M) (hj : j ≤ M) :
    (M.choose r : ℚ) * krawtchouk M r j =
      (M.choose j : ℚ) * krawtchouk M j r := by
  have h := coeff_coeff_swap (krawtchoukGenerator ^ M) r j
  rw [map_pow, krawtchoukGenerator_swap, krawtchoukGenerator_coeff hr,
    krawtchoukGenerator_coeff hj, coeff_C_mul, coeff_C_mul] at h
  exact h

theorem coefficientPolynomial_coeff_krawtchouk {M r j : ℕ}
    (hr : r ≤ M) (hj : j ≤ M) :
    (coefficientPolynomial M (r + 3 * j)).coeff (M - r) =
      (M.choose j : ℚ) * krawtchouk M j r := by
  rw [coefficientPolynomial_coeff_sub_congr hr, krawtchouk_duality hr hj]

end

end RowlandSistosBarron
