import Conjectures.KovalevZeroFreeComparison
import Conjectures.KovalevZeroFreeFiniteAlgebra

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The strict bound for the actual remainder combination, for every positive
length and every section degree, as in Section 3 of the recorded argument.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

def correctionRemainder (D n : ℕ) (z : ℂ) : ℂ :=
  remainder n z - ∑ j ∈ range (n / D),
    (correction j : ℂ) * remainder (n - (j + 1) * D) z

theorem section_shift_le {D n j : ℕ} (hj : j ∈ range (n / D)) :
    (j + 1) * D ≤ n :=
  (Nat.mul_le_mul_right D (Nat.succ_le_of_lt (mem_range.mp hj))).trans
    (Nat.div_mul_le_self n D)

theorem remainder_shift_comparison {n k : ℕ} (hk0 : 0 < k) (hkn : k ≤ n)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖((1 + (k : ℝ) / ((n : ℝ) + 1) : ℝ) : ℂ) * remainder n z -
      remainder (n - k) z‖ ≤ (k : ℝ) / ((n : ℝ) + 1) := by
  have hlt : n - k < n := Nat.sub_lt (lt_of_lt_of_le hk0 hkn) hk0
  simpa only [Nat.sub_sub_self hkn] using remainder_comparison hlt hz

theorem correctionRemainder_norm_lt {D : ℕ} (hD : 0 < D) (n : ℕ)
    {z : ℂ} (hz : ‖z‖ ≤ 1) (hz1 : z ≠ 1) :
    ‖correctionRemainder D n z‖ < halfCoeff (n / D) := by
  let p : ℕ → ℝ := fun j => 1 + (((j + 1) * D : ℕ) : ℝ) / ((n : ℝ) + 1)
  have hp : ∀ j ∈ range (n / D),
      p j ≤ 1 + (D : ℝ) * ((j : ℝ) + 1) / ((n : ℝ) + 1) := by
    intro j hj
    dsimp [p]
    push_cast
    rw [mul_comm]
  have hbudget := correction_budget_lt (n / D) D n (Nat.div_mul_le_self n D) p hp
  have hcmp : ∀ j ∈ range (n / D),
      ‖(p j : ℂ) * remainder n z - remainder (n - (j + 1) * D) z‖ ≤ p j - 1 := by
    intro j hj
    have hk : 0 < (j + 1) * D := Nat.mul_pos (by omega) hD
    have h := remainder_shift_comparison hk (section_shift_le hj) hz
    simpa only [p, add_sub_cancel_left] using h
  have h := weighted_correction_norm_lt (n / D) correction p (remainder n z)
    (fun j => remainder (n - (j + 1) * D) z)
    (fun j _ => (correction_pos j).le) (remainder_norm_lt_one n hz hz1) hcmp hbudget
  rw [sum_correction] at h
  simpa only [correctionRemainder, sub_sub_cancel] using h

end

end Conjectures.KovalevZeroFree
