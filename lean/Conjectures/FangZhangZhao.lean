import Mathlib.Tactic.NormNum
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Rat.Defs
import Mathlib.Algebra.BigOperators.Intervals

namespace FangZhangZhao

noncomputable def hoggatt (m n : ℕ) : ℚ :=
  (∑ k ∈ Finset.range (n - 1), ∏ j ∈ Finset.range m,
    (Nat.choose (n + m - 2) (k + j) : ℚ)) /
  (∏ j ∈ Finset.Icc 1 (m - 1), (Nat.choose (n + m - 2) j : ℚ))

def logOp (a : ℕ → ℚ) (n : ℕ) : ℚ := a n * a (n + 2) - a (n + 1)^2

theorem counterexample : logOp (logOp (logOp (hoggatt 6))) 2 < 0 := by
  norm_num [logOp, hoggatt, Finset.sum_range_succ, Finset.prod_range_succ,
    Finset.prod_Icc_succ_top, Nat.choose]

def iterateLog : ℕ → (ℕ → ℚ) → ℕ → ℚ
  | 0, a => a
  | k + 1, a => logOp (iterateLog k a)

def infinitelyLogConvex (a : ℕ → ℚ) : Prop :=
  ∀ k n, 1 ≤ n → 0 ≤ iterateLog k a n

theorem conjecture_false : ¬ ∀ m, 2 ≤ m → infinitelyLogConvex (hoggatt m) := by
  intro h
  have hnonneg := h 6 (by norm_num) 3 2 (by norm_num)
  exact (not_le_of_gt counterexample) hnonneg

end FangZhangZhao
