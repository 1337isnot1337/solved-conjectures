import Conjectures.MotzkinBinarySearch

/-! The exact finite set of integer queries made by binary search. Every
query lies strictly inside the original bracket. -/
namespace Motzkin.Search

def queries (P : ℕ → Bool) (lo hi : ℕ) : Finset ℕ :=
  if h : hi-lo ≤ 1 then ∅ else
  let mid := (lo+hi)/2
  insert mid (if P mid then queries P mid hi else queries P lo mid)
termination_by hi-lo
decreasing_by all_goals omega

private theorem mem_queries_bounds_aux (P : ℕ → Bool) (w : ℕ) :
    ∀ lo hi q : ℕ, hi-lo=w → q ∈ queries P lo hi → lo < q ∧ q < hi := by
  induction w using Nat.strong_induction_on with
  | h w ih =>
    intro lo hi q hw hq
    by_cases hs : hi-lo ≤ 1
    · have hqueries : queries P lo hi=∅ := by
        rw [queries,dite_eq_left hs]
      simp only [hqueries,Finset.notMem_empty] at hq
    have hm := midpoint_bounds lo hi (by omega)
    rw [queries,dite_eq_right hs] at hq
    dsimp only at hq
    rw [Finset.mem_insert] at hq
    rcases hq with rfl | hq
    · exact hm
    · by_cases hp : P ((lo+hi)/2)=true
      · rw [ite_eq_left hp] at hq
        obtain ⟨hl,hu⟩ := ih (hi-(lo+hi)/2) (by omega) ((lo+hi)/2) hi q rfl hq
        exact ⟨hm.1.trans hl,hu⟩
      · rw [ite_eq_right hp] at hq
        obtain ⟨hl,hu⟩ := ih ((lo+hi)/2-lo) (by omega) lo ((lo+hi)/2) q rfl hq
        exact ⟨hl,hu.trans hm.2⟩

theorem mem_queries_bounds (P : ℕ → Bool) (lo hi q : ℕ) (hq : q ∈ queries P lo hi) :
    lo < q ∧ q < hi := mem_queries_bounds_aux P (hi-lo) lo hi q rfl hq

end Motzkin.Search
