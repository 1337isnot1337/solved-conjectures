module
public import Conjectures.WachsCompleteGraphLabelEmbedding

@[expose] public section
namespace WachsCompleteGraph

variable {α β : Type*} [DecidableEq α] [DecidableEq β]

omit [DecidableEq α] [DecidableEq β] in
theorem labelEmbedding_preimage (e : α ↪ β) {S : Finset α} {C : Finset β} (hC : C ⊆ S.map e) :
    labelEmbedding e (C.preimage e e.injective.injOn) = C := by
  obtain ⟨U,_,rfl⟩ := Finset.subset_map_iff.mp hC
  change ((U.map e).preimage e e.injective.injOn).map e = U.map e
  rw [Finset.preimage_map]

theorem mapLabelPartition_surjective (e : α ↪ β) (S : Finset α) :
    Function.Surjective (mapLabelPartition e (S:=S)) := by
  classical
  intro P
  let u (b : Finset β) := b.preimage e e.injective.injOn
  let blocks := P.parts.image u
  have hu (b : Finset β) (hb : b ∈ P.parts) : labelEmbedding e (u b) = b :=
    labelEmbedding_preimage e (P.le hb)
  have he : blocks.map (labelEmbedding e) = P.parts := by
    ext b
    constructor
    · intro hb
      obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hb
      obtain ⟨d,hd,rfl⟩ := Finset.mem_image.mp hc
      rwa [hu d hd]
    · intro hb
      exact Finset.mem_map.mpr ⟨u b,Finset.mem_image.mpr ⟨b,hb,rfl⟩,hu b hb⟩
  let T : Finpartition S :=
    { parts := blocks
      supIndep := by
        rw [Finset.supIndep_iff_pairwiseDisjoint]
        intro b hb c hc hbc
        have h (x : Finset α) (hx : x ∈ blocks) : labelEmbedding e x ∈ P.parts := by
          rw [← he]
          exact Finset.mem_map.mpr ⟨x,hx,rfl⟩
        exact (Finset.disjoint_map e).mp
          (P.disjoint (h b hb) (h c hc) (fun hh => hbc ((labelEmbedding e).injective hh)))
      sup_parts := by
        apply Finset.map_injective e
        rw [Finset.apply_sup_eq_sup_comp (Finset.map e)
          (fun x y => Finset.map_union (f:=e) x y) (Finset.map_empty _)]
        change blocks.sup (id ∘ labelEmbedding e) = S.map e
        rw [← Finset.sup_map,he,P.sup_parts]
      bot_notMem := by
        intro hb
        have hh : labelEmbedding e ⊥ ∈ blocks.map (labelEmbedding e) :=
          Finset.mem_map.mpr ⟨⊥,hb,rfl⟩
        rw [he] at hh
        simp [labelEmbedding] at hh }
  refine ⟨T,?_⟩
  apply Finpartition.ext
  exact he

/-- Finite support relabeling is an order equivalence, including when
the relabeling of the ambient type is not surjective. -/
noncomputable def mapLabelPartitionEquiv (e : α ↪ β) (S : Finset α) :
    Finpartition S ≃o Finpartition (S.map e) where
  toEquiv := Equiv.ofBijective (mapLabelPartition e)
    ⟨fun _ _ h => le_antisymm ((mapLabelPartition_le_iff e).mp h.le)
      ((mapLabelPartition_le_iff e).mp h.ge),mapLabelPartition_surjective e S⟩
  map_rel_iff' := mapLabelPartition_le_iff e

end WachsCompleteGraph
