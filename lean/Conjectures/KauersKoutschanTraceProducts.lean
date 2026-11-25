import Conjectures.KauersKoutschanTracePolynomials

/-! The two-variable Cauchy product, directly in trace–determinant coordinates. -/

open scoped BigOperators

namespace KauersKoutschan

open Polynomial

variable {R : Type*} [CommRing R]

theorem traceComplete_product_step (d : R) (p q : ℕ) :
    traceComplete d (p + 1) * traceComplete d (q + 1) =
      traceComplete d (p + q + 2) + C d * traceComplete d p * traceComplete d q := by
  have hrec (k : ℕ) : traceComplete d (k + 2) =
      X * traceComplete d (k + 1) - C d * traceComplete d k := rfl
  induction p using Nat.twoStepInduction with
  | zero =>
    simp only [Nat.zero_add, traceComplete, mul_one]
    ring
  | one =>
    rw [show 1 + q + 2 = (q + 1) + 2 by omega, hrec (q + 1), hrec q]
    simp only [traceComplete]
    ring
  | more p h₀ h₁ =>
    rw [show p + 2 + 1 = (p + 1) + 2 by omega, hrec (p + 1)]
    rw [sub_mul, mul_assoc, mul_assoc, h₁, h₀]
    rw [show p + 2 + q + 2 = (p + q + 2) + 2 by omega, hrec (p + q + 2), hrec p,
      show p + 1 + q + 2 = (p + q + 2) + 1 by omega]
    ring

/-- The product of the two homogeneous traces splits by the common twist
index j, with one term for every j up to min(p,q). -/
theorem traceComplete_product (d : R) (p q : ℕ) :
    traceComplete d p * traceComplete d q =
      ∑ j ∈ Finset.range (min p q + 1), C d ^ j * traceComplete d (p + q - 2 * j) := by
  induction p generalizing q with
  | zero => simp [traceComplete]
  | succ p ih =>
    cases q with
    | zero => simp [traceComplete]
    | succ q =>
      rw [traceComplete_product_step, mul_assoc (C d), ih q, show min (p + 1) (q + 1) = min p q + 1 by omega]
      rw [Finset.sum_range_succ' (fun j => C d ^ j *
        traceComplete d (p + 1 + (q + 1) - 2 * j)) (min p q + 1)]
      simp only [Nat.mul_zero, Nat.sub_zero, pow_zero, one_mul, Finset.mul_sum]
      rw [show p + 1 + (q + 1) = p + q + 2 by omega, add_comm (traceComplete d (p + q + 2))]
      congr 1
      apply Finset.sum_congr rfl
      intro j _
      rw [show p + q + 2 - 2 * (j + 1) = p + q - 2 * j by omega, pow_succ]
      ring

end KauersKoutschan
