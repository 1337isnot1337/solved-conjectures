import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic.Ring

/-! The reduced polynomial in Dukes's revstack formula satisfies a
first-order Eulerian recurrence with one product remainder. -/

open Polynomial

namespace DukesRevstack

variable {R : Type*} [CommRing R]

/-- The Eulerian derivative operator for polynomials after removing the
common factor `X` from the shifted Eulerian polynomials. -/
noncomputable def eulerianOperator (n : ℕ) (p : R[X]) : R[X] :=
  (1 + C (n : R) * X) * p + X * (1 - X) * p.derivative

noncomputable def eulerian : ℕ → R[X]
  | 0 => 1
  | n + 1 => eulerianOperator n (eulerian n)

@[simp] theorem eulerian_zero : (eulerian (R := R) 0 : R[X]) = 1 := rfl

theorem eulerian_succ (n : ℕ) :
    (eulerian (R := R) (n + 1) : R[X]) = eulerianOperator n (eulerian n) := rfl

@[simp] theorem eval_eulerian_zero (n : ℕ) : (eulerian (R := R) n).eval 0 = 1 := by
  induction n with
  | zero => simp
  | succ n ih => simp [eulerian_succ, eulerianOperator, ih]

def leftSize (n : ℕ) : ℕ := (n - 1) / 2

def rightSize (n : ℕ) : ℕ := n / 2

theorem split_size_add {n : ℕ} (hn : 0 < n) : leftSize n + rightSize n = n - 1 := by
  unfold leftSize rightSize
  omega

/-- The polynomial after dividing the Eulerian formula for `W_n` by `X`. -/
noncomputable def reducedRevstack (n : ℕ) : R[X] :=
  eulerian n - X * (eulerian (leftSize n) * eulerian (rightSize n))

@[simp] theorem eval_reducedRevstack_zero (n : ℕ) : (reducedRevstack (R := R) n).eval 0 = 1 := by
  simp [reducedRevstack]

private theorem eulerianOperator_sub (n : ℕ) (p q : R[X]) :
    eulerianOperator n (p - q) = eulerianOperator n p - eulerianOperator n q := by
  unfold eulerianOperator
  rw [derivative_sub]
  ring

private theorem eulerianOperator_split_product (n a b : ℕ) (hsum : a + b + 1 = n) :
    eulerianOperator n (X * (eulerian a * eulerian b) : R[X]) =
      X * (eulerian (a + 1) * eulerian b) + X * (eulerian a * eulerian (b + 1)) := by
  rw [eulerian_succ a, eulerian_succ b]
  unfold eulerianOperator
  simp only [derivative_mul, derivative_X, one_mul]
  have hcast : (n : R) = (a : R) + (b : R) + 1 := by rw [← hsum]; push_cast; rfl
  rw [hcast, map_add, map_add, map_one]
  ring

private theorem split_product_succ (n : ℕ) (hn : 0 < n) :
    (eulerian (leftSize (n + 1)) * eulerian (rightSize (n + 1)) : R[X]) =
      eulerian (leftSize n + 1) * eulerian (rightSize n) := by
  unfold leftSize rightSize
  by_cases h : n % 2 = 0
  · rw [show (n + 1 - 1) / 2 = (n - 1) / 2 + 1 by omega,
      show (n + 1) / 2 = n / 2 by omega]
  · rw [show (n + 1 - 1) / 2 = n / 2 by omega,
      show (n + 1) / 2 = (n - 1) / 2 + 1 by omega, mul_comm]

theorem reducedRevstack_succ (n : ℕ) (hn : 0 < n) :
    (reducedRevstack (R := R) (n + 1) : R[X]) =
      eulerianOperator n (reducedRevstack n) + X * (eulerian (leftSize n) * eulerian (rightSize n + 1)) := by
  have hsum := split_size_add hn
  unfold reducedRevstack
  rw [eulerian_succ n, eulerianOperator_sub, eulerianOperator_split_product _ _ _ (by omega),
    split_product_succ n hn]
  ring

theorem eval_reducedRevstack_succ_at_root (n : ℕ) (hn : 0 < n) (x : R)
    (hx : (reducedRevstack (R := R) n).eval x = 0) :
    (reducedRevstack (R := R) (n + 1)).eval x =
      x * (1 - x) * (reducedRevstack n).derivative.eval x +
        x * ((eulerian (leftSize n)).eval x * (eulerian (rightSize n + 1)).eval x) := by
  rw [reducedRevstack_succ n hn]
  simp [eulerianOperator, hx]

end DukesRevstack
