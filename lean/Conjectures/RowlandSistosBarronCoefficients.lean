import Conjectures.RowlandSistosBarronCoefficientsDegrees
import Conjectures.RowlandSistosBarronCancellationCounts
import Conjectures.RowlandSistosBarronSums

/-!
# Rowland–Sistos Barrón conjecture

The exact all-power coefficient-rank formula from Sections 3–4 of the
existing proof. All summands are degrees of coefficients of the literal
bivariate power; parity and square indicators arise from the proved
cancellation classification.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

theorem sum_rank_residue_zero (M : ℕ) :
    (∑ j ∈ Finset.range M,
      polynomialRank (coefficientPolynomial M (3 * j))) = M * (M + 1) := by
  calc
    _ = ∑ _j ∈ Finset.range M, (M + 1) := by
      apply Finset.sum_congr rfl
      intro j hj
      exact coefficientPolynomial_rank_residue_zero (by simpa using (Finset.mem_range.mp hj).le)
    _ = _ := by simp

theorem sum_rank_residue_one {M : ℕ} (hM : 49 ≤ M) :
    (∑ j ∈ Finset.range M,
      polynomialRank (coefficientPolynomial M (1 + 3 * j))) +
      3 * ((Finset.range M).filter (fun j => 2 * j = M)).card = M * M := by
  calc
    _ = ∑ j ∈ Finset.range M,
        (polynomialRank (coefficientPolynomial M (1 + 3 * j)) +
          3 * (if 2 * j = M then 1 else 0)) := by
      rw [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_boole, Nat.cast_id]
    _ = ∑ _j ∈ Finset.range M, M := by
      apply Finset.sum_congr rfl
      intro j hj
      exact coefficientPolynomial_rank_residue_one hM (Finset.mem_range.mp hj).le
    _ = _ := by simp

theorem sum_rank_residue_two {M : ℕ} (hM : 49 ≤ M) :
    (∑ j ∈ Finset.range M,
      polynomialRank (coefficientPolynomial M (2 + 3 * j))) +
      3 * ((Finset.range M).filter
        (fun (j : ℕ) => ((M : ℚ) - 2 * j) ^ 2 = M)).card = M * (M - 1) := by
  calc
    _ = ∑ j ∈ Finset.range M,
        (polynomialRank (coefficientPolynomial M (2 + 3 * j)) +
          3 * (if ((M : ℚ) - 2 * j) ^ 2 = M then 1 else 0)) := by
      rw [Finset.sum_add_distrib, ← Finset.mul_sum, Finset.sum_boole, Nat.cast_id]
    _ = ∑ _j ∈ Finset.range M, (M - 1) := by
      apply Finset.sum_congr rfl
      intro j hj
      exact coefficientPolynomial_rank_residue_two hM (Finset.mem_range.mp hj).le
    _ = _ := by simp

theorem sum_rank_upper (M : ℕ) :
    (∑ r ∈ Finset.range (M + 1),
      polynomialRank (coefficientPolynomial M (3 * M + r))) =
        ∑ r ∈ Finset.range (M + 1), (M - r + 1) := by
  apply Finset.sum_congr rfl
  intro r hr
  exact coefficientPolynomial_rank_upper (by simpa using Finset.mem_range.mp hr)

/-- Twice the exact degree sum, avoiding truncated natural-number subtraction. -/
theorem coefficientRank_formula {M : ℕ} (hM : 49 ≤ M) :
    2 * coefficientRank M +
      6 * (if M % 2 = 0 then 1 else 0) +
      12 * (if IsSquare M then 1 else 0) = 7 * M ^ 2 + 3 * M + 2 := by
  have h1 := sum_rank_residue_one hM
  have h2 := sum_rank_residue_two hM
  have hp := sum_range_four_blocks
    (fun k => polynomialRank (coefficientPolynomial M k)) M
  change coefficientRank M = _ at hp
  rw [sum_rank_residue_zero, sum_rank_upper] at hp
  have htotal : coefficientRank M +
      3 * ((Finset.range M).filter (fun j => 2 * j = M)).card +
      3 * ((Finset.range M).filter (fun (j : ℕ) => ((M : ℚ) - 2 * j) ^ 2 = M)).card =
      M * (M + 1) + M * M + M * (M - 1) +
        ∑ r ∈ Finset.range (M + 1), (M - r + 1) := by omega
  rw [parity_cancellation_count hM, square_cancellation_count hM] at htotal
  have htail := two_tail_sum M
  have hpred : M - 1 + 1 = M := by omega
  split_ifs at htotal ⊢ <;> nlinarith

end

end RowlandSistosBarron
