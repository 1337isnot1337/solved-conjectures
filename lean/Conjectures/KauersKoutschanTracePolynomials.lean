import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic

/-! The two-variable trace identity supplies an elementary antiderivative
for the Schur moment in the written proof. -/

namespace KauersKoutschan

open Polynomial

variable {R : Type*} [CommRing R]

/-- Complete homogeneous characters in the trace, with determinant fixed. -/
noncomputable def traceComplete (d : R) : ℕ → R[X]
  | 0 => 1
  | 1 => X
  | n + 2 => X * traceComplete d (n + 1) - C d * traceComplete d n

/-- The sum of the two powers of the roots of the characteristic polynomial. -/
noncomputable def tracePower (d : R) : ℕ → R[X]
  | 0 => 2
  | 1 => X
  | n + 2 => X * tracePower d (n + 1) - C d * tracePower d n

theorem tracePower_eval (a b : R) (n : ℕ) :
    (tracePower (a * b) n).eval (a + b) = a ^ n + b ^ n := by
  induction n using Nat.twoStepInduction with
  | zero => norm_num [tracePower]
  | one => simp [tracePower]
  | more n ih₀ ih₁ =>
    rw [tracePower, eval_sub, eval_mul, eval_mul, eval_X, eval_C, ih₀, ih₁]
    simp only [pow_succ]
    ring

theorem traceComplete_eval_mul_difference (a b : R) (n : ℕ) :
    (a - b) * (traceComplete (a * b) n).eval (a + b) = a ^ (n + 1) - b ^ (n + 1) := by
  induction n using Nat.twoStepInduction with
  | zero => simp [traceComplete]
  | one => simp [traceComplete, pow_succ]; ring
  | more n ih₀ ih₁ =>
    rw [traceComplete, eval_sub, eval_mul, eval_mul, eval_X, eval_C]
    simp only [pow_succ] at ih₀ ih₁ ⊢
    linear_combination (a + b) * ih₁ - a * b * ih₀

theorem tracePower_eq_complete_difference (d : R) (n : ℕ) :
    tracePower d (n + 2) = traceComplete d (n + 2) - C d * traceComplete d n := by
  induction n using Nat.twoStepInduction with
  | zero => simp [tracePower, traceComplete]; ring
  | one => simp [tracePower, traceComplete]; ring
  | more n ih₀ ih₁ =>
    change X * tracePower d (n + 3) - C d * tracePower d (n + 2) =
      traceComplete d (n + 4) - C d * traceComplete d (n + 2)
    rw [show traceComplete d (n + 4) =
      X * traceComplete d (n + 3) - C d * traceComplete d (n + 2) by rfl, ih₁, ih₀]
    have hc : traceComplete d (n + 2) =
        X * traceComplete d (n + 1) - C d * traceComplete d n := rfl
    linear_combination C d * hc

/-- Holding the determinant fixed, the derivative of the next power sum is
the degree times the complete homogeneous character. -/
theorem derivative_tracePower (d : R) (n : ℕ) :
    derivative (tracePower d (n + 1)) = ((n + 1 : ℕ) : R[X]) * traceComplete d n := by
  induction n using Nat.twoStepInduction with
  | zero => simp [tracePower, traceComplete]
  | one => simp [tracePower, traceComplete, derivative_mul]; ring
  | more n ih₀ ih₁ =>
    rw [show tracePower d (n + 2 + 1) =
      X * tracePower d (n + 2) - C d * tracePower d (n + 1) by rfl]
    rw [derivative_sub, derivative_mul, derivative_mul, derivative_X, derivative_C, ih₁, ih₀]
    rw [tracePower_eq_complete_difference]
    rw [show traceComplete d (n + 2) =
        X * traceComplete d (n + 1) - C d * traceComplete d n by rfl]
    push_cast
    ring

theorem map_eval_traceComplete {S : Type*} [CommRing S] (f : R →+* S) (d t : R) (n : ℕ) :
    f ((traceComplete d n).eval t) = (traceComplete (f d) n).eval (f t) := by
  induction n using Nat.twoStepInduction with
  | zero => simp [traceComplete]
  | one => simp [traceComplete]
  | more n h₀ h₁ =>
    simp only [traceComplete, eval_sub, eval_mul, eval_X, eval_C, map_sub, map_mul, h₀, h₁]

theorem traceComplete_eval_scale (d t c : R) (n : ℕ) :
    (traceComplete (c ^ 2 * d) n).eval (c * t) = c ^ n * (traceComplete d n).eval t := by
  induction n using Nat.twoStepInduction with
  | zero => simp [traceComplete]
  | one => simp [traceComplete]
  | more n h₀ h₁ =>
    simp only [traceComplete, eval_sub, eval_mul, eval_X, eval_C]
    rw [h₀, h₁]
    simp only [pow_succ]
    ring

theorem traceComplete_eval_equal_roots (a : R) (n : ℕ) :
    (traceComplete (a * a) n).eval (a + a) = ((n + 1 : ℕ) : R) * a ^ n := by
  induction n using Nat.twoStepInduction with
  | zero => simp [traceComplete]
  | one => simp [traceComplete]; ring
  | more n h₀ h₁ =>
    simp only [traceComplete, eval_sub, eval_mul, eval_X, eval_C, h₀, h₁, pow_succ,
      Nat.cast_add, Nat.cast_one, Nat.cast_ofNat]
    ring

end KauersKoutschan
