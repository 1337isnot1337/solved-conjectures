module
public import Conjectures.WachsCompleteGraphBlockGluing

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

theorem gluedPartition_refines (f : Components Q) : gluedPartition Q f ≤ Q.partition := by
  intro b hb
  obtain ⟨B,hB⟩ := (mem_gluedPartition Q f b).mp hb
  exact ⟨B.val,B.property,(f B).partition.le hB⟩

theorem restrict_glueWeighted (f : Components Q) (B : Q.partition.parts) :
    (glueWeighted Q f).restrictWeighted (gluedPartition_refines Q f) B.property = f B := by
  classical
  have hp : ((glueWeighted Q f).restrictWeighted (gluedPartition_refines Q f) B.property).partition =
      (f B).partition := by
    ext b
    rw [show ((glueWeighted Q f).restrictWeighted (gluedPartition_refines Q f) B.property).partition =
        (gluedPartition Q f).restrict (Finset.subset_univ B.val) from rfl]
    rw [mem_restricted_parts (gluedPartition_refines Q f) B.property,mem_gluedPartition]
    constructor
    · rintro ⟨⟨C,hC⟩,hb⟩
      have he : C = B := Subtype.ext (Q.partition.disjoint.elim C.property B.property
        (fun h => (f C).partition.ne_bot hC
          (disjoint_self.mp (h.mono ((f C).partition.le hC) hb))))
      subst C
      exact hC
    · intro hb
      exact ⟨⟨B,hb⟩,(f B).partition.le hb⟩
  apply LocalWeight.ext hp
  funext b i
  by_cases hb : b ∈ (f B).partition.parts
  · change (if b ⊆ B.val then glueWeights Q f b i else 0) = _
    rw [ite_eq_left ((f B).partition.le hb),glueWeights_eq Q f hb]
  · have hn : b ∉ ((glueWeighted Q f).restrictWeighted (gluedPartition_refines Q f) B.property).partition.parts := by
      rw [hp]; exact hb
    rw [LocalWeight.offBlocks _ b hn,(f B).offBlocks b hb]

theorem glue_restrictWeighted (P : WeightedCompletePartition r n) (h : P.partition ≤ Q.partition) :
    glueWeighted Q (fun B => P.restrictWeighted h B.property) = P := by
  classical
  let f : Components Q := fun B => P.restrictWeighted h B.property
  have hp : (glueWeighted Q f).partition = P.partition := by
    ext b
    change b ∈ (gluedPartition Q f).parts ↔ b ∈ P.partition.parts
    rw [mem_gluedPartition]
    constructor
    · rintro ⟨B,hb⟩
      exact ((mem_restricted_parts h B.property).mp hb).1
    · intro hb
      obtain ⟨B,hB,hbB⟩ := h hb
      exact ⟨⟨B,hB⟩,(mem_restricted_parts h hB).mpr ⟨hb,hbB⟩⟩
  apply WeightedCompletePartition.ext hp
  funext b i
  by_cases hb : b ∈ P.partition.parts
  · obtain ⟨B,hB,hbB⟩ := h hb
    have hmem : b ∈ (f ⟨B,hB⟩).partition.parts := (mem_restricted_parts h hB).mpr ⟨hb,hbB⟩
    change glueWeights Q f b i = P.weights b i
    rw [glueWeights_eq Q f hmem]
    change (if b ⊆ B then P.weights b i else 0) = P.weights b i
    rw [ite_eq_left hbB]
  · have hn : b ∉ (glueWeighted Q f).partition.parts := by rw [hp]; exact hb
    rw [(glueWeighted Q f).offBlocks b hn,P.offBlocks b hb]

/-- All unweighted refinements of the fixed partition are exactly the
independent tuples of labeled weighted refinements of each block. -/
noncomputable def refinementComponents :
    {P : WeightedCompletePartition r n // P.partition ≤ Q.partition} ≃ Components Q where
  toFun P B := P.val.restrictWeighted P.property B.property
  invFun f := ⟨glueWeighted Q f,gluedPartition_refines Q f⟩
  left_inv P := Subtype.ext (glue_restrictWeighted Q P.val P.property)
  right_inv f := funext (restrict_glueWeighted Q f)

end WeightedCompletePartition
end WachsCompleteGraph
