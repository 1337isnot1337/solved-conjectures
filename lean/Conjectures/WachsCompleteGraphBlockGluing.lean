module
public import Conjectures.WachsCompleteGraphBlockRestriction

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

abbrev Components := ∀ B : Q.partition.parts, LocalWeight r n B.val

def gluedPartition (f : Components Q) : CompletePartition n :=
  Q.partition.bind (fun b hb => (f ⟨b,hb⟩).partition)

theorem mem_gluedPartition (f : Components Q) (b : Finset (Fin n)) :
    b ∈ (gluedPartition Q f).parts ↔ ∃ B : Q.partition.parts, b ∈ (f B).partition.parts := by
  change b ∈ (Q.partition.bind _).parts ↔ _
  rw [Finpartition.mem_bind]
  constructor
  · rintro ⟨B,hB,hb⟩
    exact ⟨⟨B,hB⟩,hb⟩
  · rintro ⟨B,hb⟩
    exact ⟨B.val,B.property,hb⟩

theorem component_unique (f : Components Q) {B C : Q.partition.parts}
    {b : Finset (Fin n)} (hbB : b ∈ (f B).partition.parts) (hbC : b ∈ (f C).partition.parts) :
    B = C := by
  apply Subtype.ext
  exact Q.partition.disjoint.elim B.property C.property (fun h =>
    (f B).partition.ne_bot hbB (disjoint_self.mp
      (h.mono ((f B).partition.le hbB) ((f C).partition.le hbC))))

open Classical in
noncomputable def glueWeights (f : Components Q) (b : Finset (Fin n)) (i : Fin r) : Fin (n+1) :=
  if h : b ∈ (gluedPartition Q f).parts then
    (f ((mem_gluedPartition Q f b).mp h).choose).weights b i
  else 0

theorem glueWeights_eq (f : Components Q) {B : Q.partition.parts}
    {b : Finset (Fin n)} (hb : b ∈ (f B).partition.parts) (i : Fin r) :
    glueWeights Q f b i = (f B).weights b i := by
  classical
  have h := (mem_gluedPartition Q f b).mpr ⟨B,hb⟩
  unfold glueWeights
  rw [dite_eq_left h]
  have he : ((mem_gluedPartition Q f b).mp h).choose = B :=
    component_unique Q f ((mem_gluedPartition Q f b).mp h).choose_spec hb
  rw [he]

noncomputable def glueWeighted (f : Components Q) : WeightedCompletePartition r n where
  partition := gluedPartition Q f
  weights := glueWeights Q f
  valid b hb := by
    obtain ⟨B,hB⟩ := (mem_gluedPartition Q f b).mp hb
    simpa only [glueWeights_eq Q f hB] using (f B).valid b hB
  offBlocks b hb i := by
    classical
    exact dite_eq_right hb

end WeightedCompletePartition
end WachsCompleteGraph
