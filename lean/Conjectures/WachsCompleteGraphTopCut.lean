module
public import Conjectures.WachsCompleteGraphCoordinateCut

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

noncomputable def topCut (B : Q.partition.parts) : WeightedCompletePartition r n :=
  (coordinateCut Q B (belowComponents Q ⟨Q,le_rfl⟩ B)).val

theorem bottomTuple_parts (B : Q.partition.parts) (b : Finset (Fin n)) :
    b ∈ (bottomTuple Q B).val.partition.parts ↔ ∃ a ∈ B.val, {a} = b := by
  change b ∈ ((⊥ : WeightedCompletePartition r n).partition.restrict (Finset.subset_univ B.val)).parts ↔ _
  rw [mem_restricted_parts (bot_le : (⊥ : WeightedCompletePartition r n) ≤ Q).1 B.property]
  change (b ∈ (⊥ : CompletePartition n).parts ∧ b ⊆ B.val) ↔ _
  rw [Finpartition.mem_bot_iff]
  constructor
  · rintro ⟨⟨a,_,rfl⟩,h⟩
    exact ⟨a,Finset.singleton_subset_iff.mp h,rfl⟩
  · rintro ⟨a,ha,rfl⟩
    exact ⟨⟨a,Finset.mem_univ _,rfl⟩,Finset.singleton_subset_iff.mpr ha⟩

theorem bottomTuple_weights (B : Q.partition.parts) (b : Finset (Fin n)) (i : Fin r) :
    (bottomTuple Q B).val.weights b i = 0 := by
  change (if b ⊆ B.val then (⊥ : WeightedCompletePartition r n).weights b i else 0) = 0
  split_ifs <;> rfl

theorem topCut_parts (B : Q.partition.parts) (b : Finset (Fin n)) :
    b ∈ (topCut Q B).partition.parts ↔ b = B.val ∨ ∃ a ∉ B.val, {a} = b := by
  classical
  let f := Function.update (bottomTuple Q) B (belowComponents Q ⟨Q,le_rfl⟩ B)
  change b ∈ (gluedPartition Q (fun C => (f C).val)).parts ↔ _
  rw [mem_gluedPartition]
  constructor
  · rintro ⟨C,hC⟩
    by_cases h : C = B
    · subst C
      rw [show f B = belowComponents Q ⟨Q,le_rfl⟩ B by simp [f]] at hC
      change b ∈ (componentTop Q B).partition.parts at hC
      rw [componentTop_parts,Finset.mem_singleton] at hC
      exact Or.inl hC
    · rw [show f C = bottomTuple Q C by simp [f,Function.update_of_ne h],bottomTuple_parts] at hC
      obtain ⟨a,ha,rfl⟩ := hC
      right
      refine ⟨a,fun hB => ?_,rfl⟩
      have hn : C.val ≠ B.val := fun e => h (Subtype.ext e)
      exact Finset.disjoint_left.mp (Q.partition.disjoint C.property B.property hn) ha hB
  · rintro (rfl | ⟨a,ha,rfl⟩)
    · refine ⟨B,?_⟩
      rw [show f B = belowComponents Q ⟨Q,le_rfl⟩ B by simp [f]]
      change B.val ∈ (componentTop Q B).partition.parts
      rw [componentTop_parts]
      exact Finset.mem_singleton_self _
    · have hm : a ∈ (Finset.univ : Finset (Fin n)) := Finset.mem_univ _
      obtain ⟨C,hC,haC⟩ := Q.partition.exists_mem hm
      let D : Q.partition.parts := ⟨C,hC⟩
      have hn : D ≠ B := fun e => ha (show a ∈ B.val from e ▸ haC)
      refine ⟨D,?_⟩
      rw [show f D = bottomTuple Q D by simp [f,Function.update_of_ne hn],bottomTuple_parts]
      exact ⟨a,haC,rfl⟩

/-- The isolated top remembers its own block weight and no other weight. -/
theorem topCut_weights (B : Q.partition.parts) (b : Finset (Fin n)) (i : Fin r) :
    (topCut Q B).weights b i = if b = B.val then Q.weights B.val i else 0 := by
  classical
  let f := Function.update (bottomTuple Q) B (belowComponents Q ⟨Q,le_rfl⟩ B)
  by_cases hb : b = B.val
  · subst b
    have hfB : f B = belowComponents Q ⟨Q,le_rfl⟩ B := by simp [f]
    have hB : B.val ∈ ((f B).val).partition.parts := by
      rw [hfB]
      change B.val ∈ (componentTop Q B).partition.parts
      rw [componentTop_parts]
      exact Finset.mem_singleton_self _
    change glueWeights Q (fun C => (f C).val) B.val i = _
    rw [glueWeights_eq Q (fun C => (f C).val) hB i,hfB,ite_eq_left rfl]
    change (if B.val ⊆ B.val then Q.weights B.val i else 0) = _
    rw [ite_eq_left le_rfl]
  · rw [ite_eq_right hb]
    by_cases hg : b ∈ (topCut Q B).partition.parts
    · change b ∈ (gluedPartition Q (fun C => (f C).val)).parts at hg
      obtain ⟨C,hC⟩ := (mem_gluedPartition Q (fun D => (f D).val) b).mp hg
      have hne : C ≠ B := by
        rintro rfl
        rw [show f C = belowComponents Q ⟨Q,le_rfl⟩ C by simp [f]] at hC
        change b ∈ (componentTop Q C).partition.parts at hC
        rw [componentTop_parts,Finset.mem_singleton] at hC
        exact hb hC
      change glueWeights Q (fun D => (f D).val) b i = _
      rw [glueWeights_eq Q (fun D => (f D).val) hC i]
      rw [show f C = bottomTuple Q C by simp [f,Function.update_of_ne hne]]
      exact bottomTuple_weights Q C b i
    · exact (topCut Q B).offBlocks b hg i

/-- Changing the ambient partition or any other block's weights does not
change this weighted one-block cut. -/
theorem topCut_congr {R : WeightedCompletePartition r n}
    (B : Q.partition.parts) (C : R.partition.parts) (hBC : B.val = C.val)
    (hw : ∀ i, Q.weights B.val i = R.weights C.val i) :
    topCut Q B = topCut R C := by
  have hp : (topCut Q B).partition = (topCut R C).partition := by
    ext b
    rw [topCut_parts,topCut_parts,hBC]
  apply WeightedCompletePartition.ext hp
  funext b i
  rw [topCut_weights,topCut_weights,hw,hBC]

end WeightedCompletePartition
end WachsCompleteGraph
