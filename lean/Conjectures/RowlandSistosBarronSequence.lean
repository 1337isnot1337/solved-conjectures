import Conjectures.RowlandSistosBarronRecurrence
import Conjectures.RowlandSistosBarronCoefficientsBasic
import Mathlib.Algebra.Algebra.Rat

/-!
# Rowland–Sistos Barrón conjecture

The actual integer sequence of the recorded counterexample, its pointwise
powers, and their minimum eventual recurrence rank. The theorem is valid over
every field of characteristic zero, including the rational, real and complex
numbers; the coefficient calculation itself remains over the rationals.
-/

noncomputable section

namespace RowlandSistosBarron

open Polynomial Finset

/-- The integer sequence in Section 1 of the existing proof. -/
def integerSequence (n : ℕ) : ℤ := (n : ℤ) * (1 + 8 ^ n) + 2 ^ n - 16 ^ n

variable {K : Type*} [Field K] [CharZero K]

/-- The actual pointwise `M`th power, interpreted in a characteristic-zero field. -/
def poweredSequence (M : ℕ) (n : ℕ) : K := (integerSequence n : K) ^ M

omit [CharZero K] in
theorem integerSequence_cast (n : ℕ) :
    (integerSequence n : K) = (n : K) * (1 + 8 ^ n) + 2 ^ n - 16 ^ n := by
  simp [integerSequence]

theorem basePolynomial_eval₂ (n : ℕ) :
    basePolynomial.eval₂ (eval₂RingHom (algebraMap ℚ K) (n : K)) ((2 : K) ^ n) =
      (integerSequence n : K) := by
  have h8 : ((2 : K) ^ n) ^ 3 = (8 : K) ^ n := by
    rw [← pow_mul, Nat.mul_comm n 3, pow_mul]
    norm_num
  have h16 : (2 : K) ^ n * (8 : K) ^ n = (16 : K) ^ n := by
    rw [← mul_pow]
    norm_num
  simp only [basePolynomial, eval₂_add, eval₂_mul, eval₂_C, eval₂_one,
    eval₂_pow, eval₂_X, eval₂_sub, coe_eval₂RingHom, h8, integerSequence_cast]
  rw [mul_sub, mul_one, h16]
  ring

theorem two_pow_injective : Function.Injective (fun n : ℕ => (2 : K) ^ n) := by
  intro m n h
  apply Nat.pow_right_injective (by decide : 2 ≤ (2 : ℕ))
  apply (Nat.cast_injective (R := K))
  simpa only [Nat.cast_pow, Nat.cast_ofNat] using h

theorem recurrenceWeight_map_rat (p : ℚ[X]) :
    recurrenceWeight (p.map (algebraMap ℚ K)) = polynomialRank p := by
  have hi : Function.Injective (algebraMap ℚ K) := (algebraMap ℚ K).injective
  by_cases hp : p = 0
  · simp [recurrenceWeight, polynomialRank, hp]
  · have hm : p.map (algebraMap ℚ K) ≠ 0 := (Polynomial.map_eq_zero_iff hi).not.mpr hp
    simp [recurrenceWeight, polynomialRank, hp, hm, natDegree_map_eq_of_injective hi]

theorem poweredSequence_eq_exponential_sum (M : ℕ) :
    poweredSequence (K := K) M =
      ∑ k : Fin (4 * M + 1), exponentialPolynomial ((2 : K) ^ (k : ℕ))
        ((coefficientPolynomial M k).map (algebraMap ℚ K)) := by
  funext n
  simp only [poweredSequence, Finset.sum_apply, exponentialPolynomial_apply]
  rw [Fin.sum_univ_eq_sum_range (fun k : ℕ =>
    ((2 : K) ^ k) ^ n * ((coefficientPolynomial M k).map (algebraMap ℚ K)).eval (n : K))]
  rw [← basePolynomial_eval₂ n, ← eval₂_pow]
  rw [eval₂_eq_sum_range' _ (Nat.lt_succ_of_le (basePolynomial_pow_natDegree_le M))]
  apply sum_congr rfl
  intro k _
  simp only [coe_eval₂RingHom, coefficientPolynomial, eval_map]
  rw [← pow_mul, Nat.mul_comm n k, pow_mul]
  ring

theorem poweredSequence_hasTailRecurrenceOrder (M : ℕ) :
    HasTailRecurrenceOrder (poweredSequence (K := K) M) (coefficientRank M) := by
  rw [poweredSequence_eq_exponential_sum]
  have h := exponentialPolynomial_hasTailRecurrenceOrder
    (fun k : Fin (4 * M + 1) => (2 : K) ^ (k : ℕ))
    (two_pow_injective.comp Fin.val_injective)
    (fun _ => pow_ne_zero _ (by norm_num : (2 : K) ≠ 0))
    (fun k => (coefficientPolynomial M k).map (algebraMap ℚ K))
  simpa only [recurrenceWeight_map_rat,
    Fin.sum_univ_eq_sum_range (fun k => polynomialRank (coefficientPolynomial M k))
      (4 * M + 1), coefficientRank] using h

theorem poweredSequence_tailRecurrenceRank (M : ℕ) :
    tailRecurrenceRank (poweredSequence (K := K) M) = coefficientRank M := by
  rw [poweredSequence_eq_exponential_sum, exponentialPolynomial_tailRecurrenceRank]
  · simp only [recurrenceWeight_map_rat, coefficientRank]
    exact Fin.sum_univ_eq_sum_range
      (fun k => polynomialRank (coefficientPolynomial M k)) (4 * M + 1)
  · exact two_pow_injective.comp Fin.val_injective
  · intro k
    exact pow_ne_zero _ (by norm_num : (2 : K) ≠ 0)

theorem integerSequence_rank_six :
    tailRecurrenceRank (fun n => (integerSequence n : K)) = 6 := by
  have h := poweredSequence_tailRecurrenceRank (K := K) 1
  rw [coefficientRank_one] at h
  change tailRecurrenceRank (fun n => (integerSequence n : K) ^ 1) = 6 at h
  simpa only [pow_one] using h

end RowlandSistosBarron
