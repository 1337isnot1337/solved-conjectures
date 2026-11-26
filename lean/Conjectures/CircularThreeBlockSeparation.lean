import Conjectures.CircularThreeBlockBase

/-! The displacement between consecutive original colour classes is 2g or
2g+1 according to parity. Two steps advance by 4g+1. These shifts carry the
two-interval supports off one another, including at the wraparound. -/

namespace CircularIndex.Insertion.ThreeBlock

private theorem shift_one {g c d : ℕ} (hc : c<2*vertexCount g)
    (h : d=c+1 ∨ d+2*vertexCount g=c+1) :
    c%2+d%2=1 ∧ (baseShift g c+(2*g+c%2)=baseShift g d ∨
       baseShift g c+(2*g+c%2)=baseShift g d+vertexCount g) := by
  unfold vertexCount at hc h ⊢
  constructor
  · omega
  · unfold baseShift
    split_ifs <;> omega

private theorem shift_two {g c d : ℕ} (hc : c<2*vertexCount g)
    (h : d=c+2 ∨ d+2*vertexCount g=c+2) :
    c%2=d%2 ∧ (baseShift g c+(4*g+1)=baseShift g d ∨
       baseShift g c+(4*g+1)=baseShift g d+vertexCount g) := by
  unfold vertexCount at hc h ⊢
  constructor
  · omega
  · unfold baseShift
    split_ifs <;> omega

theorem near_base_disjoint {g c d x y : ℕ} (hg : 15≤g) (hc : c<2*vertexCount g)
    (hn : NearBase g c d) (hx : Support g (c%2) x) (hy : Support g (d%2) y) :
    rotate (vertexCount g) x (baseShift g c) ≠ rotate (vertexCount g) y (baseShift g d) := by
  intro he
  have hoff := rotate_eq_offset he
  unfold Support at hx hy
  have cases : (d=c+1 ∨ d+2*vertexCount g=c+1) ∨ (d=c+2 ∨ d+2*vertexCount g=c+2) := by
    unfold NearBase at hn
    tauto
  rcases cases with h|h
  · obtain ⟨hp,hs⟩ := shift_one hc h
    unfold vertexCount at hs hoff
    omega
  · obtain ⟨hp,hs⟩ := shift_two hc h
    unfold vertexCount at hs hoff
    omega

end CircularIndex.Insertion.ThreeBlock
