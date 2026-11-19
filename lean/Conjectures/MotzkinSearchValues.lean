import Conjectures.MotzkinBinarySearch

/-! A finite overapproximation of the integer values in the binary-search
control flow, including all recursive brackets and midpoint computations. -/
namespace Motzkin.Search

def localValues (lo hi : ℕ) : Finset ℕ := {lo,hi,hi-lo,lo+hi,(lo+hi)/2}

def allValues (P : ℕ → Bool) (lo hi : ℕ) : Finset ℕ :=
  if h : hi-lo ≤ 1 then localValues lo hi else
  let mid := (lo+hi)/2
  localValues lo hi ∪ (if P mid then allValues P mid hi else allValues P lo mid)
termination_by hi-lo
decreasing_by all_goals omega

theorem localValues_le (lo hi N : ℕ) (hlo : lo ≤ N) (hhi : hi ≤ N)
    {v : ℕ} (hv : v ∈ localValues lo hi) : v ≤ 2*N := by
  have hd := Nat.div_le_self (lo+hi) 2
  simp only [localValues,Finset.mem_insert,Finset.mem_singleton] at hv
  rcases hv with rfl | rfl | rfl | rfl | rfl <;> omega

private theorem allValues_le_aux (P : ℕ → Bool) (N w : ℕ) :
    ∀ lo hi v : ℕ, hi-lo=w → lo ≤ N → hi ≤ N → v ∈ allValues P lo hi → v ≤ 2*N := by
  induction w using Nat.strong_induction_on with
  | h w ih =>
    intro lo hi v hw hlo hhi hv
    by_cases hs : hi-lo ≤ 1
    · rw [allValues,dite_eq_left hs] at hv
      exact localValues_le lo hi N hlo hhi hv
    have hm := midpoint_bounds lo hi (by omega)
    rw [allValues,dite_eq_right hs] at hv
    dsimp only at hv
    rcases Finset.mem_union.mp hv with hv | hv
    · exact localValues_le lo hi N hlo hhi hv
    · by_cases hp : P ((lo+hi)/2)=true
      · rw [ite_eq_left hp] at hv
        exact ih (hi-(lo+hi)/2) (by omega) ((lo+hi)/2) hi v rfl
          (hm.2.le.trans hhi) hhi hv
      · rw [ite_eq_right hp] at hv
        exact ih ((lo+hi)/2-lo) (by omega) lo ((lo+hi)/2) v rfl
          hlo (hm.2.le.trans hhi) hv

theorem allValues_le (P : ℕ → Bool) (lo hi N : ℕ) (hlo : lo ≤ N) (hhi : hi ≤ N)
    {v : ℕ} (hv : v ∈ allValues P lo hi) : v ≤ 2*N :=
  allValues_le_aux P N (hi-lo) lo hi v rfl hlo hhi hv

end Motzkin.Search
