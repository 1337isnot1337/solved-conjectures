import Conjectures.KauersKoutschanFactorialMoment
import Conjectures.KauersKoutschanTracePolynomials

/-! The exact radial factorial average of the normalized Schur character. -/

namespace KauersKoutschan

open Polynomial

/-- Multiply the homogeneous character by the determinant twist of degree j
and the radial factor X. -/
noncomputable def weightedRadialCharacter (j m : ℕ) : ℚ[X] :=
  X * (1 - X) ^ j * (traceComplete (1 - X : ℚ[X]) m).eval (X - 2)

theorem weightedRadialCharacter_eq_powers (j m : ℕ) :
    weightedRadialCharacter j m =
      C (sign j) * (X - 1) ^ (j + (m + 1)) -
        C (sign (j + (m + 1))) * (X - 1) ^ j := by
  have h := traceComplete_eval_mul_difference (X - 1 : ℚ[X]) (-1 : ℚ[X]) m
  rw [show (X : ℚ[X]) - 1 - -1 = X by ring,
    show ((X : ℚ[X]) - 1) * -1 = 1 - X by ring,
    show (X : ℚ[X]) - 1 + -1 = X - 2 by ring] at h
  unfold weightedRadialCharacter
  calc
    _ = (1 - X) ^ j * (X * (traceComplete (1 - X : ℚ[X]) m).eval (X - 2)) := by ring
    _ = (1 - X) ^ j * ((X - 1) ^ (m + 1) - (-1 : ℚ[X]) ^ (m + 1)) := by rw [h]
    _ = _ := by
      rw [show (1 - X : ℚ[X]) = (-1) * (X - 1) by ring, mul_pow]
      simp only [sign, map_pow, map_neg, map_one, pow_add, map_mul]
      ring

/-- The normalized radial factorial average is exactly the rational divided
difference used in the sixteen-mask recurrence sum. -/
theorem radial_factorial_schur_moment (j m : ℕ) :
    factorialMoment (weightedRadialCharacter j m) / (m + 1 : ℚ) =
      dividedDifference (j + (m + 1)) j := by
  rw [weightedRadialCharacter_eq_powers, map_sub, C_mul', C_mul', map_smul, map_smul,
    factorialMoment_shifted_power, factorialMoment_shifted_power, dividedDifference]
  push_cast
  simp only [smul_eq_mul]
  congr 1
  ring

end KauersKoutschan
