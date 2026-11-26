import Conjectures.CircularThreeBlockIntervals
import Mathlib.Tactic.IntervalCases

/-! The six cross edges of the second matching and their cyclic lengths. -/

namespace CircularIndex.Insertion.ThreeBlock

/-- Row of the cross-edge table, indexed from zero. The other fields are the
offset from 2g+7 of the far endpoint and the cyclic length of the pair. -/
inductive Cross (g : ℕ) : ℕ → ℕ → ℕ → Prop where
  | oddZero (h : g%2=1) : Cross g 0 ((3*g-11)/2) ((5*g+1)/2)
  | zeroZero (h : g%4=0) : Cross g 0 ((3*g-12)/2) ((5*g+2)/2)
  | twoZero (h : g%4=2) : Cross g 0 ((3*g-14)/2) ((5*g+4)/2)
  | one : Cross g 1 (2*g-10) (2*g+6)
  | oddTwo (h : g%2=1) : Cross g 2 ((g-5)/2) ((5*g+3)/2)
  | zeroTwo (h : g%4=0) : Cross g 2 ((g-4)/2) ((5*g+4)/2)
  | twoTwo (h : g%4=2) : Cross g 2 ((g-2)/2) ((5*g+6)/2)
  | oddThree (h : g%2=1) : Cross g 3 2 (2*g+5)
  | evenThree (h : g%2=0) : Cross g 3 (2*g-7) (2*g+5)
  | oddFour (h : g%2=1) : Cross g 4 (2*g-8) (2*g+7)
  | zeroFour (h : g%4=0) : Cross g 4 2 (2*g+4)
  | twoFour (h : g%4=2) : Cross g 4 0 (2*g+2)
  | oddFive (h : g%2=1) : Cross g 5 0 (2*g+1)
  | evenFive (h : g%2=0) : Cross g 5 (2*g-8) (2*g+8)

theorem cross_exists {g j : ℕ} (hj : j<6) : ∃ a l, Cross g j a l := by
  rcases (show g%2=1 ∨ g%4=0 ∨ g%4=2 by omega) with he|he|he
  all_goals interval_cases j
  all_goals first
    | exact ⟨_,_,.one⟩
    | exact ⟨_,_,.oddZero he⟩ | exact ⟨_,_,.zeroZero he⟩ | exact ⟨_,_,.twoZero he⟩
    | exact ⟨_,_,.oddTwo he⟩ | exact ⟨_,_,.zeroTwo he⟩ | exact ⟨_,_,.twoTwo he⟩
    | exact ⟨_,_,.oddThree he⟩ | exact ⟨_,_,.evenThree (by omega)⟩
    | exact ⟨_,_,.oddFour he⟩ | exact ⟨_,_,.zeroFour he⟩ | exact ⟨_,_,.twoFour he⟩
    | exact ⟨_,_,.oddFive he⟩ | exact ⟨_,_,.evenFive (by omega)⟩

theorem cross_bounds {g j a l : ℕ} (hg : 15≤g) (h : Cross g j a l) :
    j<6 ∧ a<2*(g-3) ∧ 2*g<l ∧ l≤3*g-6 ∧ cyclicLength (6*g+1) (j+1) (2*g+7+a)=l := by
  unfold cyclicLength
  cases h <;> omega

theorem cross_hole {g j a l : ℕ} (hg : 15≤g) (h : Cross g j a l) : Hole (g-3) a := by
  unfold Hole
  cases h <;> omega

theorem cross_injective {g j k a b l m : ℕ} (hg : 15≤g)
    (h : Cross g j a l) (h' : Cross g k b m) (he : a=b ∨ l=m) : j=k := by
  cases h <;> cases h' <;> omega

end CircularIndex.Insertion.ThreeBlock
