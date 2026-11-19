import Conjectures.MotzkinBinarySearch

/-! Arithmetic accounting for binary search with a supplied oracle cost.
The terminal branch uses subtraction and comparison. A nonterminal branch
adds midpoint addition/division and its Boolean branch test, then the oracle
charge and the recursive search charge. -/
namespace Motzkin.Search

def operations (P : ℕ → Bool) (oracleCost : ℕ → ℕ) (lo hi : ℕ) : ℕ :=
  if h : hi-lo ≤ 1 then 2 else
  let mid := (lo+hi)/2
  if P mid then 5+oracleCost mid+operations P oracleCost mid hi
  else 5+oracleCost mid+operations P oracleCost lo mid
termination_by hi-lo
decreasing_by all_goals omega

private theorem operations_le_calls_aux (P : ℕ → Bool) (C : ℕ → ℕ)
    (B : ℕ) (hC : ∀ x, C x ≤ B) (w : ℕ) :
    ∀ lo hi : ℕ, hi-lo=w → operations P C lo hi ≤ 2+(5+B)*calls P lo hi := by
  induction w using Nat.strong_induction_on with
  | h w ih =>
    intro lo hi hw
    by_cases hs : hi-lo ≤ 1
    · simp only [operations,calls,dite_eq_left hs,mul_zero,add_zero]
      exact le_rfl
    have hm := midpoint_bounds lo hi (by omega)
    rw [operations,calls,dite_eq_right hs,dite_eq_right hs]
    dsimp only
    by_cases hp : P ((lo+hi)/2)=true
    · rw [ite_eq_left hp,ite_eq_left hp]
      have hr := ih (hi-(lo+hi)/2) (by omega) ((lo+hi)/2) hi rfl
      have hc := hC ((lo+hi)/2)
      nlinarith
    · rw [ite_eq_right hp,ite_eq_right hp]
      have hr := ih ((lo+hi)/2-lo) (by omega) lo ((lo+hi)/2) rfl
      have hc := hC ((lo+hi)/2)
      nlinarith

theorem operations_le_calls (P : ℕ → Bool) (C : ℕ → ℕ)
    (B : ℕ) (hC : ∀ x, C x ≤ B) (lo hi : ℕ) :
    operations P C lo hi ≤ 2+(5+B)*calls P lo hi :=
  operations_le_calls_aux P C B hC (hi-lo) lo hi rfl

end Motzkin.Search
