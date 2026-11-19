import Mathlib.Tactic

/-! Checked finite memo tables. A malformed branch ordering can only miss a
cached value and use the exact fallback. Every returned cached value is
proved equal to that fallback by the complete finite table check. -/

namespace Loneliness.Modular.Memo

inductive Tree where
  | empty
  | entry (key value : ℕ)
  | branch (pivot : ℕ) (left right : Tree)

def lookup (fallback : ℕ → ℕ) : Tree → ℕ → ℕ
  | .empty, key => fallback key
  | .entry stored value, key => if stored=key then value else fallback key
  | .branch pivot left right, key =>
      if key<pivot then lookup fallback left key else lookup fallback right key

def check (fallback : ℕ → ℕ) : Tree → Bool
  | .empty => true
  | .entry key value => decide (value=fallback key)
  | .branch _ left right => check fallback left && check fallback right

theorem lookup_eq (fallback : ℕ → ℕ) (tree : Tree)
    (hcheck : check fallback tree=true) : ∀ key, lookup fallback tree key=fallback key := by
  revert hcheck
  induction tree with
  | empty => intro _hcheck key; rfl
  | entry stored value =>
    intro hcheck key
    have hvalue : value=fallback stored := of_decide_eq_true hcheck
    by_cases h : stored=key
    · rw [lookup,ite_eq_left h]
      simpa only [h] using hvalue
    · simp only [lookup,ite_eq_right h]
  | branch pivot left right ihleft ihright =>
    intro hcheck
    have hh := Bool.and_eq_true_iff.mp hcheck
    intro key
    by_cases h : key<pivot
    · simpa only [lookup,ite_eq_left h] using ihleft hh.1 key
    · simpa only [lookup,ite_eq_right h] using ihright hh.2 key

theorem example_checked :
    check (fun n => n*n) (.branch 5 (.entry 3 9) (.entry 7 49))=true := by
  decide +kernel

end Loneliness.Modular.Memo
