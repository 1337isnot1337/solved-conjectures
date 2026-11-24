import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-!
# Rowland–Sistos Barrón conjecture

The exact finite index partition and triangular sum used to assemble
the coefficient-degree calculation in Section 3 of the recorded proof.
-/

open scoped BigOperators

namespace RowlandSistosBarron

theorem sum_range_three_blocks (f : ℕ → ℕ) (M : ℕ) :
    (∑ k ∈ Finset.range (3 * M), f k) =
      (∑ j ∈ Finset.range M, f (3 * j)) +
        (∑ j ∈ Finset.range M, f (1 + 3 * j)) +
        (∑ j ∈ Finset.range M, f (2 + 3 * j)) := by
  induction M with
  | zero => simp
  | succ M ih =>
    simp only [Nat.mul_succ, Finset.sum_range_succ, ih]
    rw [Nat.add_comm 1 (3 * M), Nat.add_comm 2 (3 * M)]
    omega

theorem sum_range_four_blocks (f : ℕ → ℕ) (M : ℕ) :
    (∑ k ∈ Finset.range (4 * M + 1), f k) =
      (∑ j ∈ Finset.range M, f (3 * j)) +
        (∑ j ∈ Finset.range M, f (1 + 3 * j)) +
        (∑ j ∈ Finset.range M, f (2 + 3 * j)) +
        (∑ r ∈ Finset.range (M + 1), f (3 * M + r)) := by
  have heq : 4 * M + 1 = 3 * M + (M + 1) := by omega
  rw [heq, Finset.sum_range_add, sum_range_three_blocks]

theorem two_tail_sum (M : ℕ) :
    2 * (∑ r ∈ Finset.range (M + 1), (M - r + 1)) = (M + 1) * (M + 2) := by
  have hreflect := Finset.sum_range_reflect (fun r : ℕ => r + 1) (M + 1)
  simp only [Nat.add_sub_cancel] at hreflect
  rw [hreflect, Finset.sum_add_distrib]
  simp only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, mul_one]
  have hsum := Finset.sum_range_id_mul_two (M + 1)
  simp only [Nat.add_sub_cancel] at hsum
  nlinarith

end RowlandSistosBarron
