import Conjectures.CircularInsertionEdges

/-! Meeting edges have different colours separated by at least three positions. -/

namespace CircularIndex.Insertion

def Meeting (z w : Nat × Nat) : Prop :=
  z.1=w.1 ∨ z.1=w.2 ∨ z.2=w.1 ∨ z.2=w.2

theorem same_class_matching {g blocks c i j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hi : i<g) (hj : j<g)
    (hm : Meeting (rotatedPair g blocks c i) (rotatedPair g blocks c j)) : i=j := by
  obtain ⟨h₁,h₂,_,_⟩ := rawPair_spec (blocks := blocks) (c := c) hg hi
  obtain ⟨h₃,h₄,_,_⟩ := rawPair_spec (blocks := blocks) (c := c) hg hj
  have ht := baseShift_lt (reference_lt hg hb hc)
  have hraw : Meeting (rawPair g blocks c i) (rawPair g blocks c j) := by
    rcases hm with h|h|h|h
    · exact Or.inl (rotate_left_inj (h₁.trans h₂) (h₃.trans h₄) ht h)
    · exact Or.inr (Or.inl (rotate_left_inj (h₁.trans h₂) h₄ ht h))
    · exact Or.inr (Or.inr (Or.inl (rotate_left_inj h₂ (h₃.trans h₄) ht h)))
    · exact Or.inr (Or.inr (Or.inr (rotate_left_inj h₂ h₄ ht h)))
  have hε : kind blocks c<2 := Nat.mod_lt _ (by decide)
  by_cases ha : added blocks c
  · exact parallel_matching hε (by simpa only [Meeting,rawPair,ite_eq_left ha] using hraw)
  · exact basePair_matching hg (chosenPair_spec hg hε hi) (chosenPair_spec hg hε hj)
      (by simpa only [Meeting,rawPair,ite_eq_right ha] using hraw)

theorem scheduled_window {g blocks c d i j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hd : d<classCount g blocks) (hi : i<g) (hj : j<g)
    (hn : Near (classCount g blocks) c d) :
    ¬ Meeting (rotatedPair g blocks c i) (rotatedPair g blocks d j) := by
  obtain ⟨_,_,h₁,h₂⟩ := rawPair_spec (blocks := blocks) (c := c) hg hi
  obtain ⟨_,_,h₃,h₄⟩ := rawPair_spec (blocks := blocks) (c := d) hg hj
  have sep {x y : Nat} (hx : Support g (kind blocks c) x) (hy : Support g (kind blocks d) y) :
      rotate (vertexCount g) x (baseShift g (reference blocks c)) ≠
      rotate (vertexCount g) y (baseShift g (reference blocks d)) := by
    rcases near_reference hg hb hc hd hn with h|h
    · exact near_base_disjoint hg (reference_lt hg hb hc) h hx hy
    · exact (near_base_disjoint hg (reference_lt hg hb hd) h hy hx).symm
  intro hm
  rcases hm with h|h|h|h
  · exact sep h₁ h₃ h
  · exact sep h₁ h₄ h
  · exact sep h₂ h₃ h
  · exact sep h₂ h₄ h

end CircularIndex.Insertion
