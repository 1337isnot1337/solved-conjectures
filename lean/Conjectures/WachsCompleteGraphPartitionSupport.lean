module
public import Conjectures.WachsCompleteGraphPartitionSum
public import Conjectures.WachsCompleteGraphCanonicalBlock

@[expose] public section
namespace WachsCompleteGraph

variable {α β R : Type*} [DecidableEq α] [DecidableEq β] [CommSemiring R]

theorem partitionWeightSum_map (w : ℕ → R) (e : α ↪ β) (S : Finset α) (k : ℕ) :
    partitionWeightSum w (S.map e) k = partitionWeightSum w S k := by
  classical
  symm
  simp only [partitionWeightSum,Finset.sum_filter]
  apply Fintype.sum_equiv (mapLabelPartitionEquiv e S).toEquiv
  intro P
  change (if P.parts.card = k then ∏ b ∈ P.parts, w b.card else 0) =
    if (P.parts.map (labelEmbedding e)).card = k then
      ∏ b ∈ P.parts.map (labelEmbedding e), w b.card else 0
  simp only [Finset.card_map,Finset.prod_map]
  congr 1
  apply Finset.prod_congr rfl
  intro b _
  have h : (labelEmbedding e b).card = b.card := Finset.card_map e
  exact congrArg w h.symm

noncomputable def canonicalPartitionWeightSum (w : ℕ → R) (n k : ℕ) : R :=
  partitionWeightSum w (Finset.univ : Finset (Fin n)) k

noncomputable def finsetVertexLabels (S : Finset α) : Fin S.card ↪ α :=
  ((S.equivFinOfCardEq rfl).symm.toEmbedding).trans ⟨Subtype.val,Subtype.val_injective⟩

omit [DecidableEq α] in
theorem finsetVertexLabels_range (S : Finset α) :
    (Finset.univ : Finset (Fin S.card)).map (finsetVertexLabels S) = S := by
  classical
  ext a
  rw [Finset.mem_map]
  constructor
  · rintro ⟨j,_,rfl⟩
    exact ((S.equivFinOfCardEq rfl).symm j).property
  · intro h
    refine ⟨(S.equivFinOfCardEq rfl) ⟨a,h⟩,Finset.mem_univ _,?_⟩
    change (((S.equivFinOfCardEq rfl).symm ((S.equivFinOfCardEq rfl) ⟨a,h⟩)) : α) = a
    rw [Equiv.symm_apply_apply]

theorem partitionWeightSum_of_card (w : ℕ → R) (S : Finset α) (k : ℕ) :
    partitionWeightSum w S k = canonicalPartitionWeightSum w S.card k := by
  unfold canonicalPartitionWeightSum
  rw [← partitionWeightSum_map w (finsetVertexLabels S),finsetVertexLabels_range]

end WachsCompleteGraph
