module
public import Conjectures.WachsCompleteGraphCanonicalBlock

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

def canonicalBlockTop (B : Q.partition.parts) : WeightedCompletePartition r B.val.card :=
  topWithWeights (Finset.card_pos.mpr (Q.partition.nonempty_of_mem_parts B.property))
    (fun i => (Q.weights B.val i).val) (Q.valid B.val B.property)

theorem liftToBlockEquiv_top (B : Q.partition.parts) :
    (liftToBlockEquiv r B.val) (canonicalBlockTop Q B) = componentTop Q B := by
  classical
  let T := canonicalBlockTop Q B
  let e := blockVertexLabels B.val
  let h := blockVertexLabels_range B.val
  have hb : 0 < B.val.card := Finset.card_pos.mpr (Q.partition.nonempty_of_mem_parts B.property)
  have hu : (Finset.univ : Finset (Fin B.val.card)) ∈ T.partition.parts := by
    change Finset.univ ∈ (⊤ : CompletePartition B.val.card).parts
    rw [top_partition_parts hb]
    exact Finset.mem_singleton_self _
  have hp : (transportLocal h (liftLocal e T)).partition = (componentTop Q B).partition := by
    apply Finpartition.ext
    rw [transportLocal_parts,componentTop_parts]
    change T.partition.parts.map (labelEmbedding e) = {B.val}
    change (⊤ : CompletePartition B.val.card).parts.map (labelEmbedding e) = {B.val}
    rw [top_partition_parts hb,Finset.map_singleton]
    exact congrArg (fun b : Finset (Fin n) => ({b} : Finset (Finset (Fin n)))) h
  change transportLocal h (liftLocal e T) = componentTop Q B
  apply LocalWeight.ext hp
  funext b i
  by_cases he : b = B.val
  · subst b
    apply Fin.ext
    rw [transportLocal_weights]
    have hw := liftLocal_apply e T hu i
    change _ = (if B.val ⊆ B.val then Q.weights B.val i else 0).val
    rw [ite_eq_left le_rfl]
    calc
      _ = ((liftLocal e T).weights ((Finset.univ : Finset (Fin B.val.card)).map e) i).val :=
        congrArg (fun b : Finset (Fin n) => ((liftLocal e T).weights b i).val) h.symm
      _ = (T.weights Finset.univ i).val := hw
      _ = (Q.weights B.val i).val := topWithWeights_univ ..
  · have hn : b ∉ (componentTop Q B).partition.parts := by
      rwa [componentTop_parts,Finset.mem_singleton]
    have hn' : b ∉ (transportLocal h (liftLocal e T)).partition.parts := by
      rwa [hp]
    rw [LocalWeight.offBlocks _ b hn',LocalWeight.offBlocks _ b hn]

noncomputable def canonicalComponentEquiv (B : Q.partition.parts) :
    {P : WeightedCompletePartition r B.val.card // P ≤ canonicalBlockTop Q B} ≃ BelowComponent Q B :=
  (liftToBlockEquiv r B.val).subtypeEquiv
    (p:=fun P => P ≤ canonicalBlockTop Q B)
    (q:=fun R => R.Refines (componentTop Q B))
    (fun P => by
      have h := (liftToBlockEquiv_refines_iff B.val P (canonicalBlockTop Q B)).symm
      rwa [liftToBlockEquiv_top] at h)

noncomputable def componentAsLower (B : Q.partition.parts) : BelowComponent Q B ≃
    {x : BelowComponent Q B // x ≤ belowComponents Q ⟨Q,le_rfl⟩ B} where
  toFun x := ⟨x,(coordinateCut_le_iff Q B _ _).mpr x.property⟩
  invFun x := x.val
  left_inv _ := rfl
  right_inv _ := rfl

noncomputable def canonicalCutLowerEquiv (B : Q.partition.parts) :
    {P : WeightedCompletePartition r B.val.card // P ≤ canonicalBlockTop Q B} ≃
    {P : WeightedCompletePartition r n // P ≤ topCut Q B} :=
  (canonicalComponentEquiv Q B).trans ((componentAsLower Q B).trans
    (cutLowerEquiv Q B (belowComponents Q ⟨Q,le_rfl⟩ B)))

theorem canonicalCutLowerEquiv_le_iff (B : Q.partition.parts)
    (P R : {P : WeightedCompletePartition r B.val.card // P ≤ canonicalBlockTop Q B}) :
    P.val ≤ R.val ↔ (canonicalCutLowerEquiv Q B P).val ≤ (canonicalCutLowerEquiv Q B R).val := by
  change P.val ≤ R.val ↔
    (coordinateCut Q B (canonicalComponentEquiv Q B P)).val ≤
      (coordinateCut Q B (canonicalComponentEquiv Q B R)).val
  rw [coordinateCut_le_iff]
  exact (liftToBlockEquiv_refines_iff B.val P.val R.val).symm

theorem canonicalCutLowerEquiv_top (B : Q.partition.parts) :
    (canonicalCutLowerEquiv Q B ⟨canonicalBlockTop Q B,le_rfl⟩).val = topCut Q B := by
  change (coordinateCut Q B (canonicalComponentEquiv Q B ⟨canonicalBlockTop Q B,le_rfl⟩)).val = _
  unfold topCut
  apply congrArg (fun x => (coordinateCut Q B x).val)
  apply Subtype.ext
  exact liftToBlockEquiv_top Q B

/-- The actual Möbius value of the isolated block is the one-block
value for its cardinality, independent of the ambient labels and size. -/
theorem topCut_moebius_eq_canonical (B : Q.partition.parts) :
    (topCut Q B).moebius = (canonicalBlockTop Q B).moebius := by
  rw [← canonicalCutLowerEquiv_top Q B]
  exact (moebius_eq_of_lowerEquiv (canonicalCutLowerEquiv Q B)
    (canonicalCutLowerEquiv_le_iff Q B) ⟨canonicalBlockTop Q B,le_rfl⟩).symm

end WeightedCompletePartition
end WachsCompleteGraph
