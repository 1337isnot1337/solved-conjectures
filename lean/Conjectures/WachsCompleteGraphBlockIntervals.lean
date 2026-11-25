module
public import Conjectures.WachsCompleteGraphBlockOrder

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

variable {r n : ℕ} (Q : WeightedCompletePartition r n)

def componentTop (B : Q.partition.parts) : LocalWeight r n B.val :=
  Q.restrictWeighted le_rfl B.property

abbrev BelowComponent (B : Q.partition.parts) :=
  {P : LocalWeight r n B.val // P.Refines (componentTop Q B)}

theorem componentTop_parts (B : Q.partition.parts) :
    (componentTop Q B).partition.parts = {B.val} := by
  ext b
  rw [Finset.mem_singleton]
  change b ∈ (Q.partition.restrict (Finset.subset_univ B.val)).parts ↔ b = B.val
  rw [mem_restricted_parts le_rfl B.property]
  exact ⟨fun h => Q.no_distinct_subblocks h.1 B.property h.2,fun h => h.symm ▸ ⟨B.property,le_rfl⟩⟩

/-- The actual lower interval of a weighted partition is a dependent
Cartesian product of its individual weighted block intervals. -/
noncomputable def belowComponents :
    {P : WeightedCompletePartition r n // P ≤ Q} ≃ (∀ B : Q.partition.parts, BelowComponent Q B) where
  toFun P B :=
    ⟨P.val.restrictWeighted P.property.1 B.property,
      (refines_iff_componentwise P.property.1 (le_refl Q.partition)).mp P.property B⟩
  invFun f := by
    let g : Components Q := fun B => (f B).val
    refine ⟨glueWeighted Q g,?_⟩
    apply (refines_iff_componentwise (gluedPartition_refines Q g) (le_refl Q.partition)).mpr
    intro B
    rw [restrict_glueWeighted Q g B]
    exact (f B).property
  left_inv P := Subtype.ext (glue_restrictWeighted Q P.val P.property.1)
  right_inv f := by
    funext B
    apply Subtype.ext
    exact restrict_glueWeighted Q (fun C => (f C).val) B

theorem belowComponents_le_iff {P R : {P : WeightedCompletePartition r n // P ≤ Q}} :
    P.val ≤ R.val ↔ ∀ B, ((belowComponents Q P B).val).Refines ((belowComponents Q R B).val) :=
  refines_iff_componentwise P.property.1 R.property.1

end WeightedCompletePartition
end WachsCompleteGraph
