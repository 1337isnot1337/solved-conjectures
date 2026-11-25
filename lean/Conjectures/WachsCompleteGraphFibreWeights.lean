module
public import Conjectures.WachsCompleteGraphWeightCompletions
public import Mathlib.SetTheory.Cardinal.Finite

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

abbrev OrdinaryFibre (r : ℕ) {n : ℕ} (π : CompletePartition n) :=
  {Q : WeightedCompletePartition r n // Q.partition=π}

abbrev BlockCompositions (r : ℕ) {n : ℕ} (π : CompletePartition n) :=
  ∀ b : π.parts, WeightCompositions r (b.val.card-1)

def fromBlockCompositions {r n : ℕ} (π : CompletePartition n) (f : BlockCompositions r π) :
    WeightedCompletePartition r n where
  partition := π
  weights b i := if hb : b∈π.parts then ⟨(f ⟨b,hb⟩).val i,by
    have h := Finset.single_le_sum (f:=(f ⟨b,hb⟩).val) (fun _ _ => Nat.zero_le _) (Finset.mem_univ i)
    rw [(f ⟨b,hb⟩).property] at h
    change (f ⟨b,hb⟩).val i ≤ b.card - 1 at h
    have hh : b.card≤n := by simpa using Finset.card_le_univ b
    omega⟩ else 0
  valid := fun b hb => by simpa [dite_eq_left hb] using (f ⟨b,hb⟩).property
  offBlocks := fun b hb i => dite_eq_right hb

theorem fromBlockCompositions_apply {r n : ℕ} {π : CompletePartition n}
    (f : BlockCompositions r π) (b : π.parts) (i : Fin r) :
    ((fromBlockCompositions π f).weights b.val i).val=(f b).val i := by
  simp [fromBlockCompositions]

/-- Allocations over the literal ordinary partition are independent, one
weak composition for each actual block. -/
def ordinaryFibre_equiv {r n : ℕ} (π : CompletePartition n) :
    OrdinaryFibre r π ≃ BlockCompositions r π where
  toFun Q b := ⟨fun i => (Q.val.weights b.val i).val,
    Q.val.valid b.val (Q.property.symm ▸ b.property)⟩
  invFun f := ⟨fromBlockCompositions π f,rfl⟩
  left_inv Q := by
    apply Subtype.ext
    apply WeightedCompletePartition.ext Q.property.symm
    funext b i
    by_cases hb : b∈π.parts
    · apply Fin.ext
      simp [fromBlockCompositions,hb]
    · have hq : b∉Q.val.partition.parts := Q.property.symm ▸ hb
      rw [Q.val.offBlocks b hq]
      simp [fromBlockCompositions,hb]
  right_inv f := by
    funext b
    apply Subtype.ext
    funext i
    exact fromBlockCompositions_apply f b i

theorem ordinaryFibre_card {r n : ℕ} (π : CompletePartition n) :
    Nat.card (OrdinaryFibre r π)=∏ b : π.parts,
      (r+(b.val.card-1)-1).choose (b.val.card-1) := by
  rw [Nat.card_congr (ordinaryFibre_equiv π),Nat.card_pi]
  exact Finset.prod_congr rfl (fun b _ => weight_compositions_card r _)

end WeightedCompletePartition
end WachsCompleteGraph
