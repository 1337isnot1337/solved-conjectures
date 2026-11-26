import Conjectures.CircularThreeBlockBase

/-! The enumerated formulas determine each indexed base edge uniquely. -/

namespace CircularIndex.Insertion.ThreeBlock

private theorem internal_unique {N t s a b c d : ℕ} (hN : 12≤N)
    (h : Internal N t a b) (k : Internal N s c d) (he : t=s) : a=c ∧ b=d := by
  cases h <;> cases k <;> omega

private theorem cross_unique {g i j x y l m : ℕ} (h : Cross g i x l) (k : Cross g j y m)
    (he : i=j) : x=y ∧ l=m := by
  cases h <;> cases k <;> omega

theorem pair_unique {g ε η i j a b c d : ℕ} (hg : 15≤g)
    (h : Pair g ε i a b) (k : Pair g η j c d) (he : ε=η) (hi : i=j) : a=c ∧ b=d := by
  cases h <;> cases k
  all_goals try omega
  case secondCross.secondCross =>
    obtain ⟨_,_⟩ := cross_unique (g := g) (by assumption) (by assumption) hi
    omega
  case secondCross.secondNest =>
    obtain ⟨_,_,_,_,_⟩ := cross_bounds (j := i) hg (by assumption)
    omega
  case secondNest.secondCross =>
    obtain ⟨_,_,_,_,_⟩ := cross_bounds (j := j) hg (by assumption)
    omega
  case secondNest.secondNest =>
    obtain ⟨_,_⟩ := internal_unique (N := g-3) (by omega) (t := halfGap g i)
      (s := halfGap g j) (by assumption) (by assumption) (congrArg (halfGap g) hi)
    omega

end CircularIndex.Insertion.ThreeBlock
