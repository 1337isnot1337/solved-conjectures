import Conjectures.JuhnkePathsBoundary
import Conjectures.JuhnkeUnimodality

/-!
# Juhnke's conjecture

Log-concavity and unimodality in the two boundary dimensions of the original
statement. The arbitrary-dimensional argument is supplied separately.
-/

namespace Juhnke

open Polynomial

theorem one_coeff_nonneg (i : ℕ) : 0 ≤ (1 : ℝ[X]).coeff i := by
  simp only [coeff_one]
  split_ifs <;> norm_num

theorem one_coeff_strongLogConcave : StrongLogConcave (1 : ℝ[X]).coeff := by
  intro i j _
  simp only [coeff_one]
  simp

theorem one_coeff_unimodal : Unimodal (1 : ℝ[X]).coeff :=
  polynomial_unimodal_of_strongLogConcave one_coeff_nonneg one_coeff_strongLogConcave

theorem dimension_three_coeff (i : ℕ) :
    (X + 3 * X ^ 2 : ℝ[X]).coeff i =
      (if i = 1 then 1 else 0) + (if i = 2 then 3 else 0) := by
  have hthree : (3 : ℝ[X]) = C (3 : ℝ) := (C_ofNat 3).symm
  rw [hthree, coeff_add, coeff_X, coeff_C_mul_X_pow]
  simp only [eq_comm]

theorem dimension_three_coeff_nonneg (i : ℕ) :
    0 ≤ (X + 3 * X ^ 2 : ℝ[X]).coeff i := by
  rw [dimension_three_coeff]
  split_ifs <;> norm_num

theorem dimension_three_strongLogConcave :
    StrongLogConcave (X + 3 * X ^ 2 : ℝ[X]).coeff := by
  have hzero (k : ℕ) (hk : 2 < k) : (X + 3 * X ^ 2 : ℝ[X]).coeff k = 0 := by
    rw [dimension_three_coeff]
    simp [show k ≠ 1 by omega, show k ≠ 2 by omega]
  intro i j hij
  by_cases hj : j ≤ 2
  · have hi : i ≤ 2 := hij.trans hj
    simp only [dimension_three_coeff]
    interval_cases i <;> interval_cases j <;> norm_num at *
  · rw [hzero j (by omega), hzero (j + 1) (by omega)]
    simp

theorem dimension_three_unimodal : Unimodal (X + 3 * X ^ 2 : ℝ[X]).coeff :=
  polynomial_unimodal_of_strongLogConcave dimension_three_coeff_nonneg
    dimension_three_strongLogConcave

end Juhnke
