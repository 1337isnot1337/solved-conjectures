module

public import Conjectures.PomeranceSarkozyWindowCounts
import Mathlib.Data.Nat.Choose.Bounds
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

/-- A single power bounds both CRT counting errors, including the next-rank remainder. -/
theorem crtWindowL1Bound_le_growing_errors (J : Finset Incidence) (N R : ℕ) :
    (crtWindowL1Bound J N R : ℝ) ≤
      3 * (((4 * J.card + 4 : ℕ) : ℝ) ^ (R + 1) / N) +
      ((2 : ℝ) ^ (R + 1) + 1) *
        (2 * ((incidenceReciprocalMass J : ℝ) ^ (R + 1) / ((R + 1).factorial : ℝ))) := by
  let M := J.card
  let k := R + 1
  have h₁ : (2 * M + 1) ^ R ≤ (4 * M + 4) ^ k :=
    (Nat.pow_le_pow_left (by omega : 2 * M + 1 ≤ 4 * M + 4) R).trans
      (Nat.pow_le_pow_right (by omega) (by dsimp [k]; omega))
  have h₂ : (2 ^ k + 1) * M.choose k ≤ 2 * (4 * M + 4) ^ k := by
    have hpos : 0 < 2 ^ k := by positivity
    calc
      _ ≤ (2 * 2 ^ k) * M ^ k :=
        Nat.mul_le_mul (by omega) (Nat.choose_le_pow M k)
      _ = 2 * (2 * M) ^ k := by rw [mul_pow, Nat.mul_assoc]
      _ ≤ _ := Nat.mul_le_mul_left _ (Nat.pow_le_pow_left (by omega) k)
  have r₁ : ((2 * (M : ℝ) + 1) ^ R) / N ≤ (4 * (M : ℝ) + 4) ^ k / N :=
    div_le_div_of_nonneg_right (by exact_mod_cast h₁) (by positivity)
  have r₂ : ((2 : ℝ) ^ k + 1) * (M.choose k : ℝ) / N ≤ 2 * (4 * (M : ℝ) + 4) ^ k / N :=
    div_le_div_of_nonneg_right (by exact_mod_cast h₂) (by positivity)
  unfold crtWindowL1Bound
  push_cast
  dsimp [M, k] at r₁ r₂
  simp only [div_eq_mul_inv] at r₁ r₂ ⊢
  linarith only [r₁, r₂]

end PomeranceSarkozy
