module

public import Conjectures.WachsCompleteGraphMoebiusLaw

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

/-- Weight refinement can only be strict if some blocks actually merge. -/
theorem same_partitions_of_equal_card {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : P.partition≤Q.partition)
    (hc : P.partition.parts.card=Q.partition.parts.card) :
    P.partition=Q.partition := by
  classical
  let f (b : P.partition.parts) : Q.partition.parts :=
    ⟨Classical.choose (h b.property),(Classical.choose_spec (h b.property)).1⟩
  have hf (b : P.partition.parts) : (b.val : Finset (Fin n))⊆(f b).val :=
    (Classical.choose_spec (h b.property)).2
  have hsur : Function.Surjective f := by
    intro C
    obtain ⟨B,hB,hBC⟩ := Finpartition.exists_le_of_le h C.property
    exact ⟨⟨B,hB⟩,Subtype.ext (parent_block_unique hB (f ⟨B,hB⟩).property C.property
      (hf ⟨B,hB⟩) hBC)⟩
  have hcard : Fintype.card (↥P.partition.parts)=Fintype.card (↥Q.partition.parts) := by simpa
  have hinj := ((Fintype.bijective_iff_surjective_and_card f).2 ⟨hsur,hcard⟩).1
  apply le_antisymm h
  intro C hC
  obtain ⟨B,hB⟩ := hsur ⟨C,hC⟩
  refine ⟨B.val,B.property,?_⟩
  intro a ha
  have aU : a∈(Finset.univ : Finset (Fin n)) := Finset.mem_univ _
  obtain ⟨b,hb,hab⟩ := P.partition.exists_mem aU
  let b' : P.partition.parts := ⟨b,hb⟩
  have hm : a∈(f b').val := hf b' hab
  have he : (f b').val=C := Q.partition.eq_of_mem_parts (f b').property hC hm ha
  have hx : b'=B := hinj ((Subtype.ext he).trans hB.symm)
  exact hx ▸ hab

theorem rank_strict_mono {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : P<Q) : P.rank<Q.rank := by
  have hPQ : Refines P Q := h.le
  have hcard := Finpartition.card_mono hPQ.1
  have hn : P.partition.parts.card≤n := by simpa using P.partition.card_parts_le_card
  have hlt : Q.partition.parts.card<P.partition.parts.card := by
    apply lt_of_le_of_ne hcard
    intro he
    have hp := same_partitions_of_equal_card hPQ.1 he.symm
    exact h.ne (equal_weights_of_refines_same_blocks hPQ hp)
  unfold rank
  omega

end WeightedCompletePartition
end WachsCompleteGraph
