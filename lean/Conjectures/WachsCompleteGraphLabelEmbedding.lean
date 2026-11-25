module
public import Conjectures.WachsCompleteGraphBlockOrder
public import Mathlib.Data.Finset.Preimage

@[expose] public section
namespace WachsCompleteGraph

variable {α β : Type*} [DecidableEq α] [DecidableEq β]
def labelEmbedding (e : α ↪ β) : Finset α ↪ Finset β := ⟨Finset.map e, Finset.map_injective e⟩

/-- Relabel every block along an injective vertex map. The support is
relabeled as well, so no vertices are lost or introduced. -/
def mapLabelPartition (e : α ↪ β) {S : Finset α} (P : Finpartition S) :
    Finpartition (S.map e) where
  parts := P.parts.map (labelEmbedding e)
  supIndep := by
    rw [Finset.supIndep_iff_pairwiseDisjoint]
    intro x hx y hy hxy
    obtain ⟨b,hb,rfl⟩ := Finset.mem_map.mp hx
    obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hy
    exact (Finset.disjoint_map e).mpr (P.disjoint hb hc (fun h => hxy (congrArg _ h)))
  sup_parts := by
    rw [Finset.sup_map]
    calc
      _ = (P.parts.sup id).map e :=
        (Finset.apply_sup_eq_sup_comp (Finset.map e)
          (fun x y => Finset.map_union (f:=e) x y) (Finset.map_empty _)).symm
      _ = S.map e := congrArg (Finset.map e) P.sup_parts
  bot_notMem := by
    intro h
    obtain ⟨b,hb,hbe⟩ := Finset.mem_map.mp h
    exact P.ne_bot hb ((Finset.map_eq_empty).mp hbe)

theorem mapLabelPartition_mem {e : α ↪ β} {S : Finset α} {P : Finpartition S} {b : Finset α} :
    b.map e ∈ (mapLabelPartition e P).parts ↔ b ∈ P.parts := by
  change (labelEmbedding e) b ∈ P.parts.map (labelEmbedding e) ↔ _
  exact Finset.mem_map' (labelEmbedding e)

theorem mapLabelPartition_le_iff (e : α ↪ β) {S : Finset α} {P R : Finpartition S} :
    mapLabelPartition e P ≤ mapLabelPartition e R ↔ P ≤ R := by
  constructor
  · intro h b hb
    obtain ⟨c,hc,hbc⟩ := h (mapLabelPartition_mem.mpr hb)
    obtain ⟨d,hd,rfl⟩ := Finset.mem_map.mp hc
    exact ⟨d,hd,Finset.map_subset_map.mp hbc⟩
  · intro h b hb
    obtain ⟨c,hc,rfl⟩ := Finset.mem_map.mp hb
    obtain ⟨d,hd,hcd⟩ := h hc
    exact ⟨d.map e,mapLabelPartition_mem.mpr hd,Finset.map_subset_map.mpr hcd⟩

end WachsCompleteGraph
