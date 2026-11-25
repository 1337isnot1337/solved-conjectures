module
public import Conjectures.WachsCompleteGraphBlockEquiv

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

def LocalWeight.blockWeight {r n : ℕ} {B : Finset (Fin n)}
    (P : LocalWeight r n B) (C : Finset (Fin n)) (i : Fin r) : ℕ :=
  ∑ b ∈ P.partition.parts, if b ⊆ C then (P.weights b i).val else 0

def LocalWeight.Refines {r n : ℕ} {B : Finset (Fin n)}
    (P R : LocalWeight r n B) : Prop :=
  P.partition ≤ R.partition ∧
  ∀ C ∈ R.partition.parts, ∀ i, P.blockWeight C i ≤ (R.weights C i).val

theorem restrictWeighted_blockWeight {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : P.partition ≤ Q.partition) {B C : Finset (Fin n)}
    (hB : B ∈ Q.partition.parts) (hC : C ⊆ B) (i : Fin r) :
    (P.restrictWeighted h hB).blockWeight C i = P.blockWeight C i := by
  classical
  have he : (P.restrictWeighted h hB).partition.parts = P.partition.parts.filter (· ⊆ B) := by
    ext b
    rw [Finset.mem_filter]
    exact mem_restricted_parts h hB
  unfold LocalWeight.blockWeight blockWeight
  rw [he,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro b _
  by_cases hb : b ⊆ C
  · have hs := hb.trans hC
    simp [hb,hs,restrictWeighted]
  · simp [hb]

theorem refines_iff_componentwise {r n : ℕ} {P R Q : WeightedCompletePartition r n}
    (hp : P.partition ≤ Q.partition) (hr : R.partition ≤ Q.partition) :
    P ≤ R ↔ ∀ B : Q.partition.parts,
      (P.restrictWeighted hp B.property).Refines (R.restrictWeighted hr B.property) := by
  constructor
  · intro h B
    refine ⟨Finpartition.restrict_mono (Finset.subset_univ B.val) h.1,?_⟩
    intro C hC i
    obtain ⟨hCr,hCB⟩ := (mem_restricted_parts hr B.property).mp hC
    rw [restrictWeighted_blockWeight hp B.property hCB]
    change P.blockWeight C i ≤ (if C ⊆ B.val then R.weights C i else 0).val
    rw [ite_eq_left hCB]
    exact h.2 C hCr i
  · intro h
    constructor
    · intro b hb
      obtain ⟨B,hB,hbB⟩ := hp hb
      have hc := (h ⟨B,hB⟩).1 ((mem_restricted_parts hp hB).mpr ⟨hb,hbB⟩)
      obtain ⟨C,hC,hbC⟩ := hc
      exact ⟨C,((mem_restricted_parts hr hB).mp hC).1,hbC⟩
    · intro C hC i
      obtain ⟨B,hB,hCB⟩ := hr hC
      have ht := (h ⟨B,hB⟩).2 C ((mem_restricted_parts hr hB).mpr ⟨hC,hCB⟩) i
      rw [restrictWeighted_blockWeight hp hB hCB] at ht
      change P.blockWeight C i ≤ (if C ⊆ B then R.weights C i else 0).val at ht
      rwa [ite_eq_left hCB] at ht

end WeightedCompletePartition
end WachsCompleteGraph
