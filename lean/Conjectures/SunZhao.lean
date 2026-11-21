import Mathlib.Tactic.NormNum
import Mathlib.Data.Rat.Defs

namespace SunZhao

def P : ℕ → ℚ
  | 0 => 1
  | 1 => 8
  | n + 2 => (8 * (3 * ((n:ℚ)+2)^2 - 3*((n:ℚ)+2) + 1) * P (n+1) - 128*((n:ℚ)+1)^2 * P n) / ((n:ℚ)+2)^2

def ratios : ℕ → (ℕ → ℚ) → ℕ → ℚ
  | 0, a => a
  | k + 1, a => fun n => ratios k a (n+1) / ratios k a n

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem counterexample : ratios 12 P 12 * ratios 12 P 14 < (ratios 12 P 13)^2 := by
  norm_num [ratios, P]

def evenClause : Prop :=
  ∀ k, 1 ≤ k → Even k → ∀ n, k ≤ n →
    (ratios k P (n+1))^2 ≤ ratios k P n * ratios k P (n+2)

theorem conjecture_false : ¬ evenClause := by
  intro h
  have hn := h 12 (by norm_num) (by exact ⟨6, rfl⟩) 12 (by norm_num)
  exact (not_le_of_gt counterexample) hn

end SunZhao
