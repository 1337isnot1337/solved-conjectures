import Conjectures.CircularInsertionBasePairs

/-! Distinct positions of one base class have disjoint endpoints, and base
edges in both classes can be recovered uniquely from their cyclic lengths. -/

namespace CircularIndex.Insertion

set_option maxHeartbeats 4000000 in
set_option maxRecDepth 8000 in
theorem basePair_matching {g ε i j a b c d : Nat} (hg : 7 ≤ g)
    (h : BasePair g ε i a b) (k : BasePair g ε j c d)
    (hv : a=c ∨ a=d ∨ b=c ∨ b=d) : i=j := by
  cases h <;> cases k <;> omega

set_option maxHeartbeats 5000000 in
set_option maxRecDepth 8000 in
theorem basePair_length_injective {g ε η i j a b c d : Nat} (hg : 7 ≤ g)
    (h : BasePair g ε i a b) (k : BasePair g η j c d)
    (he : cyclicLength (6*g+1) a b = cyclicLength (6*g+1) c d) : ε=η ∧ i=j := by
  unfold cyclicLength at he
  cases h <;> cases k <;> omega

end CircularIndex.Insertion
