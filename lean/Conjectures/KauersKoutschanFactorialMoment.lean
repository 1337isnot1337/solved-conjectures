import Conjectures.KauersKoutschanDividedSum
import Mathlib.Algebra.Polynomial.Derivative

/-! The factorial moment of a power of X - 1 is the literal derangement moment. -/

namespace KauersKoutschan

open Polynomial

variable {R : Type*} [CommRing R]

/-- The exact linear moment functional sending X^k to k factorial. -/
noncomputable def factorialMoment : R[X] →ₗ[R] R :=
  Polynomial.lsum (R := R) (fun k : ℕ => (k.factorial : R) • (LinearMap.id : R →ₗ[R] R))

theorem factorialMoment_monomial (k : ℕ) (a : R) :
    factorialMoment (monomial k a) = (k.factorial : R) * a := by
  simp [factorialMoment, Polynomial.lsum, sum_monomial_index, smul_eq_mul]

theorem factorialMoment_C (a : R) : factorialMoment (C a) = a := by
  simpa using factorialMoment_monomial 0 a

theorem factorialMoment_X_pow (k : ℕ) : factorialMoment (X ^ k : R[X]) = k.factorial := by
  rw [show (X ^ k : R[X]) = monomial k 1 by simp [← C_mul_X_pow_eq_monomial]]
  simp [factorialMoment_monomial]

/-- Formal integration by parts for the factorial functional. -/
theorem factorialMoment_derivative (p : R[X]) :
    factorialMoment (derivative p) = factorialMoment p - p.eval 0 := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq =>
    rw [derivative_add, map_add, map_add, hp, hq, eval_add]
    ring
  | monomial k a =>
    cases k with
    | zero => simp [factorialMoment_C]
    | succ k =>
      rw [derivative_monomial_succ, factorialMoment_monomial, factorialMoment_monomial, eval_monomial]
      simp [Nat.factorial_succ]
      ring

/-- The source's shifted factorial moment is exactly the derangement sequence
used in the finite divided differences. -/
theorem factorialMoment_shifted_power (n : ℕ) :
    factorialMoment ((X - 1 : ℚ[X]) ^ n) = derangement n := by
  induction n with
  | zero =>
    rw [pow_zero, show (1 : ℚ[X]) = C (1 : ℚ) by simp, factorialMoment_C]
    norm_num [derangement, moment, sign]
  | succ n ih =>
    have h := factorialMoment_derivative ((X - 1 : ℚ[X]) ^ (n + 1))
    rw [derivative_pow_succ, derivative_sub, derivative_X, derivative_one, sub_zero,
      mul_one, C_mul', map_smul, ih] at h
    simp only [smul_eq_mul, eval_pow, eval_sub, eval_X, eval_one, zero_sub] at h
    rw [derangement_succ, sign]
    linear_combination -h

theorem map_factorialMoment {S : Type*} [CommRing S] (f : R →+* S) (p : R[X]) :
    f (factorialMoment p) = factorialMoment (p.map f) := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq => simp only [map_add, Polynomial.map_add, hp, hq]
  | monomial n a => simp [factorialMoment_monomial]

end KauersKoutschan
