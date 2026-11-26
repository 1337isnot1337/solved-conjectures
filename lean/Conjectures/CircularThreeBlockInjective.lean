import Conjectures.CircularThreeBlockWindows

/-! Injectivity of the assignment of unordered edges to colour and slot. -/

namespace CircularIndex.Insertion.ThreeBlock

private theorem original_edges_inj {g c d i j : Nat} {K : Packing g} (hg : 15≤g)
    (hc : c<colours g) (hd : d<colours g) (hi : i<g) (hj : j<g)
    (hac : ¬unitBlock c) (had : ¬unitBlock d) (htc : ¬lastBlock c) (htd : ¬lastBlock d)
    (hl : cyclicLength (vertexCount g) (rawPair g K c i).1 (rawPair g K c i).2 =
          cyclicLength (vertexCount g) (rawPair g K d j).1 (rawPair g K d j).2)
    (he : SameEnds (rotatedPair g K c i).1 (rotatedPair g K c i).2
                   (rotatedPair g K d j).1 (rotatedPair g K d j).2) :
    c=d ∧ i=j := by
  have h₁ := chosenPair_spec hg (show kind c<2 from Nat.mod_lt _ (by decide)) hi
  have h₂ := chosenPair_spec hg (show kind d<2 from Nat.mod_lt _ (by decide)) hj
  simp only [rawPair,ite_eq_right hac,ite_eq_right had,ite_eq_right htc,ite_eq_right htd] at hl
  obtain ⟨hk,hij⟩ := pair_length_injective hg h₁ h₂ hl
  subst j
  simp only [rotatedPair,rawPair,ite_eq_right hac,ite_eq_right had,ite_eq_right htc,ite_eq_right htd,←hk] at he
  obtain ⟨hab,hr,_,_⟩ := pair_bounds hg h₁
  have hrc := reference_lt hg hc
  have hrd := reference_lt hg hd
  have ht := rotate_pair_inj hab hr (baseShift_lt hrc) (baseShift_lt hrd) he
  exact ⟨original_position_inj hac had htc htd (baseShift_inj hrc hrd hk ht),rfl⟩

private theorem last_edges_inj {g c d i j : ℕ} {K : Packing g} (hg : 15≤g)
    (hc : c<colours g) (hd : d<colours g) (hi : i<g) (hj : j<g)
    (htc : lastBlock c) (htd : lastBlock d)
    (he : SameEnds (rotatedPair g K c i).1 (rotatedPair g K c i).2
                   (rotatedPair g K d j).1 (rotatedPair g K d j).2) : c=d ∧ i=j := by
  have hm : Meeting (rotatedPair g K c i) (rotatedPair g K d j) := by
    rcases he with h|h
    · exact Or.inl h.1
    · exact Or.inr (Or.inl h.1)
  by_cases eq : c=d
  · subst d
    exact ⟨rfl,same_class_matching hg hc hi hj hm⟩
  unfold lastBlock at htc htd
  by_cases lt : c<d
  · exact False.elim ((scheduled_window hg hc hd hi hj (by unfold Near; omega)) hm)
  · have hm' : Meeting (rotatedPair g K d j) (rotatedPair g K c i) := by
      rcases he with h|h
      · exact Or.inl h.1.symm
      · exact Or.inr (Or.inl h.2.symm)
    exact False.elim ((scheduled_window hg hd hc hj hi (by unfold Near; omega)) hm')

theorem rotatedPair_inj {g c d i j : ℕ} {K : Packing g} (hg : 15≤g)
    (hc : c<colours g) (hd : d<colours g) (hi : i<g) (hj : j<g)
    (he : SameEnds (rotatedPair g K c i).1 (rotatedPair g K c i).2
                   (rotatedPair g K d j).1 (rotatedPair g K d j).2) : c=d ∧ i=j := by
  have hl := (rotatedPair_distance (K := K) hg hc hi).symm.trans
    ((same_distance (n := vertexCount g) he).trans (rotatedPair_distance hg hd hj))
  by_cases hac : unitBlock c <;> by_cases had : unitBlock d
  · have hs₁ := baseShift_lt (reference_lt hg hc)
    have hs₂ := baseShift_lt (reference_lt hg hd)
    have hb₁ := (parallel_support hg (show kind c<2 from Nat.mod_lt _ (by decide)) hi).2.2
    have hb₂ := (parallel_support hg (show kind d<2 from Nat.mod_lt _ (by decide)) hj).2.2
    simp only [rotatedPair,rawPair,ite_eq_left hac,ite_eq_left had] at he
    exact added_start_inj hg hi hj hac had
      (unit_start (by unfold vertexCount; omega) hb₁ hb₂ hs₁ hs₂ he)
  · have hu := unit_length (K := K) (j := i) hg hac
    by_cases ht : lastBlock d
    · have hv := last_length (K := K) hg hj ht; omega
    · have hv := original_length (K := K) hg hj had ht; omega
  · have hu := unit_length (K := K) (j := j) hg had
    by_cases ht : lastBlock c
    · have hv := last_length (K := K) hg hi ht; omega
    · have hv := original_length (K := K) hg hi hac ht; omega
  · by_cases htc : lastBlock c <;> by_cases htd : lastBlock d
    · exact last_edges_inj hg hc hd hi hj htc htd he
    · have hu := last_length (K := K) hg hi htc
      have hv := original_length (K := K) hg hj had htd
      omega
    · have hu := last_length (K := K) hg hj htd
      have hv := original_length (K := K) hg hi hac htc
      omega
    · exact original_edges_inj hg hc hd hi hj hac had htc htd hl he

end CircularIndex.Insertion.ThreeBlock
