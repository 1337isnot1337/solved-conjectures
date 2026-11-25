import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Data.Rat.Cast.Order
import Mathlib.Tactic.Linarith

namespace FMPCylindricCoefficient

open Polynomial
open scoped BigOperators

private theorem eq_nat_eval (p q : ℚ[X]) (h : ∀ n : ℕ, p.eval (n : ℚ) = q.eval (n : ℚ)) :
    p = q := by
  apply eq_of_infinite_eval_eq
  refine (Set.infinite_range_of_injective (f := fun n : ℕ => (n : ℚ)) Nat.cast_injective).mono ?_
  rintro _ ⟨n,rfl⟩
  exact h n

variable {S I : Type*} (P : S → ℚ[X]) (cuts : S → Finset I)
  (lower upper : S → I → S)

theorem translation_identity
    (hcount : ∀ s a b, (P s).eval ((a+b : ℕ) : ℚ) =
      ∑ i ∈ cuts s, (P (lower s i)).eval (a : ℚ) * (P (upper s i)).eval (b : ℚ))
    (s : S) (a : ℕ) :
    (P s).comp (C (a : ℚ) + X) =
      ∑ i ∈ cuts s, C ((P (lower s i)).eval (a : ℚ)) * P (upper s i) := by
  apply eq_nat_eval
  intro b
  simpa only [eval_comp, eval_add, eval_C, eval_X, eval_finsetSum, eval_mul, Nat.cast_add]
    using hcount s a b

theorem derivative_identity
    (hcount : ∀ s a b, (P s).eval ((a+b : ℕ) : ℚ) =
      ∑ i ∈ cuts s, (P (lower s i)).eval (a : ℚ) * (P (upper s i)).eval (b : ℚ))
    (s : S) :
    derivative (P s) = ∑ i ∈ cuts s, C ((P (upper s i)).coeff 1) * P (lower s i) := by
  apply eq_nat_eval
  intro a
  have h := congrArg (fun f : ℚ[X] => (derivative f).eval 0)
    (translation_identity P cuts lower upper hcount s a)
  simp only [derivative_comp, derivative_add, derivative_C, derivative_X, zero_add, one_mul,
    eval_comp, eval_add, eval_C, eval_X, add_zero, derivative_sum, derivative_C_mul,
    eval_finsetSum, eval_mul] at h
  simp only [← coeff_zero_eq_eval_zero, coeff_derivative, Nat.cast_zero, zero_add, mul_one] at h
  rw [h]
  simp only [eval_finsetSum, eval_mul, eval_C, mul_comm]

/-- Linear-coefficient positivity propagates to every coefficient for a
family closed under all lower-ideal cuts. Distinct cuts may have the same two
shapes: the index finset carries those terms separately. -/
theorem all_coeff_nonneg
    (hcount : ∀ s a b, (P s).eval ((a+b : ℕ) : ℚ) =
      ∑ i ∈ cuts s, (P (lower s i)).eval (a : ℚ) * (P (upper s i)).eval (b : ℚ))
    (hzero : ∀ s, 0 ≤ (P s).coeff 0)
    (hlinear : ∀ s, 0 ≤ (P s).coeff 1) :
    ∀ k s, 0 ≤ (P s).coeff k := by
  intro k
  induction k with
  | zero => exact hzero
  | succ k ih =>
    intro s
    have h := congrArg (fun p : ℚ[X] => p.coeff k)
      (derivative_identity P cuts lower upper hcount s)
    simp only [coeff_derivative, finsetSum_coeff, coeff_C_mul] at h
    have hs : 0 ≤ ∑ i ∈ cuts s,
        (P (upper s i)).coeff 1 * (P (lower s i)).coeff k :=
      Finset.sum_nonneg fun i _ => mul_nonneg (hlinear _) (ih _)
    have hp : 0 < (k : ℚ) + 1 := by positivity
    exact nonneg_of_mul_nonneg_left (by rw [h]; exact hs) hp

end FMPCylindricCoefficient
