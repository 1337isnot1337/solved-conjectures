import Conjectures.CircularThreeBlockEdges

/-! Any three consecutive scheduled classes are pairwise vertex-disjoint.
Each individual class is a matching. -/

namespace CircularIndex.Insertion.ThreeBlock

theorem same_class_matching {g c i j : Nat} {K : Packing g} (hg : 15≤g)
    (hc : c<colours g) (hi : i<g) (hj : j<g)
    (hm : Meeting (rotatedPair g K c i) (rotatedPair g K c j)) : i=j := by
  obtain ⟨h₁,h₂,_,_⟩ := rawPair_spec (K := K) (c := c) hg hi
  obtain ⟨h₃,h₄,_,_⟩ := rawPair_spec (K := K) (c := c) hg hj
  have ht := baseShift_lt (reference_lt hg hc)
  have hraw : Meeting (rawPair g K c i) (rawPair g K c j) := by
    rcases hm with h|h|h|h
    · exact Or.inl (rotate_left_inj (h₁.trans h₂) (h₃.trans h₄) ht h)
    · exact Or.inr (Or.inl (rotate_left_inj (h₁.trans h₂) h₄ ht h))
    · exact Or.inr (Or.inr (Or.inl (rotate_left_inj h₂ (h₃.trans h₄) ht h)))
    · exact Or.inr (Or.inr (Or.inr (rotate_left_inj h₂ h₄ ht h)))
  have hε : kind c<2 := Nat.mod_lt _ (by decide)
  by_cases ha : unitBlock c
  · exact parallel_matching hg hε (by simpa only [Meeting,rawPair,ite_eq_left ha] using hraw)
  by_cases ht : lastBlock c
  · exact tile_matching hg hε (chosenTile_spec (K := K) hg hi) (chosenTile_spec (K := K) hg hj)
      (by simpa only [Meeting,rawPair,ite_eq_right ha,ite_eq_left ht] using hraw)
  · exact pair_matching hg (chosenPair_spec hg hε hi) (chosenPair_spec hg hε hj)
      (by simpa only [Meeting,rawPair,ite_eq_right ha,ite_eq_right ht] using hraw)

theorem scheduled_window {g c d i j : Nat} {K : Packing g} (hg : 15≤g)
    (hc : c<colours g) (hd : d<colours g) (hi : i<g) (hj : j<g)
    (hn : Near (colours g) c d) :
    ¬ Meeting (rotatedPair g K c i) (rotatedPair g K d j) := by
  obtain ⟨_,_,h₁,h₂⟩ := rawPair_spec (K := K) (c := c) hg hi
  obtain ⟨_,_,h₃,h₄⟩ := rawPair_spec (K := K) (c := d) hg hj
  have sep {x y : Nat} (hx : Support g (kind c) x) (hy : Support g (kind d) y) :
      rotate (vertexCount g) x (baseShift g (reference c)) ≠
      rotate (vertexCount g) y (baseShift g (reference d)) := by
    rcases near_reference hg hc hd hn with h|h
    · exact near_base_disjoint hg (reference_lt hg hc) h hx hy
    · exact (near_base_disjoint hg (reference_lt hg hd) h hy hx).symm
  intro hm
  rcases hm with h|h|h|h
  · exact sep h₁ h₃ h
  · exact sep h₁ h₄ h
  · exact sep h₂ h₃ h
  · exact sep h₂ h₄ h

end CircularIndex.Insertion.ThreeBlock
