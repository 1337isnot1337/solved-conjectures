import Conjectures.CircularInsertionEdges

/-! No two entries of either circular schedule describe the same unordered edge. -/

namespace CircularIndex.Insertion

private theorem original_edges_inj {g blocks c d i j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hd : d<classCount g blocks) (hi : i<g) (hj : j<g)
    (hac : ¬added blocks c) (had : ¬added blocks d)
    (hl : cyclicLength (vertexCount g) (rawPair g blocks c i).1 (rawPair g blocks c i).2 =
          cyclicLength (vertexCount g) (rawPair g blocks d j).1 (rawPair g blocks d j).2)
    (he : SameEnds (rotatedPair g blocks c i).1 (rotatedPair g blocks c i).2
                   (rotatedPair g blocks d j).1 (rotatedPair g blocks d j).2) :
    c=d ∧ i=j := by
  have h₁ := chosenPair_spec hg (show kind blocks c<2 from Nat.mod_lt _ (by decide)) hi
  have h₂ := chosenPair_spec hg (show kind blocks d<2 from Nat.mod_lt _ (by decide)) hj
  simp only [rawPair,ite_eq_right hac,ite_eq_right had] at hl
  obtain ⟨hk,hij⟩ := basePair_length_injective hg h₁ h₂ hl
  subst j
  simp only [rotatedPair,rawPair,ite_eq_right hac,ite_eq_right had,←hk] at he
  obtain ⟨hab,hr,_,_⟩ := basePair_bounds hg h₁
  have hrc := reference_lt hg hb hc
  have hrd := reference_lt hg hb hd
  have ht := rotate_pair_inj hab hr (baseShift_lt hrc) (baseShift_lt hrd) he
  exact ⟨original_position_inj hac had (baseShift_inj hrc hrd hk ht),rfl⟩

theorem rotatedPair_inj {g blocks c d i j : Nat} (hg : 7≤g) (hb : blocks=1 ∨ blocks=2)
    (hc : c<classCount g blocks) (hd : d<classCount g blocks) (hi : i<g) (hj : j<g)
    (he : SameEnds (rotatedPair g blocks c i).1 (rotatedPair g blocks c i).2
                   (rotatedPair g blocks d j).1 (rotatedPair g blocks d j).2) :
    c=d ∧ i=j := by
  have hl := (rotatedPair_distance hg hb hc hi).symm.trans
    ((same_distance (n := vertexCount g) he).trans (rotatedPair_distance hg hb hd hj))
  by_cases hac : added blocks c <;> by_cases had : added blocks d
  · have hs₁ := baseShift_lt (reference_lt hg hb hc)
    have hs₂ := baseShift_lt (reference_lt hg hb hd)
    have hb₁ := (parallel_support hg (show kind blocks c<2 from Nat.mod_lt _ (by decide)) hi).2.2
    have hb₂ := (parallel_support hg (show kind blocks d<2 from Nat.mod_lt _ (by decide)) hj).2.2
    simp only [rotatedPair,rawPair,ite_eq_left hac,ite_eq_left had] at he
    exact added_start_inj hg hi hj hac had
      (unit_start (by unfold vertexCount; omega) hb₁ hb₂ hs₁ hs₂ he)
  · have hu := rawPair_unit (j := i) hg hac
    have hl' := rawPair_long hg hj had
    omega
  · have hu := rawPair_unit (j := j) hg had
    have hl' := rawPair_long hg hi hac
    omega
  · exact original_edges_inj hg hb hc hd hi hj hac had hl he

end CircularIndex.Insertion
