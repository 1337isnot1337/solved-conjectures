import Conjectures.CircularInsertionBasePairs

/-! The formulas determine each labelled base edge uniquely. -/

namespace CircularIndex.Insertion

set_option maxHeartbeats 4000000 in
theorem basePair_unique {g ε η i j a b c d : Nat} (hg : 7≤g)
    (h : BasePair g ε i a b) (k : BasePair g η j c d) (he : ε=η) (hi : i=j) :
    a=c ∧ b=d := by
  cases h <;> cases k <;> omega

end CircularIndex.Insertion
