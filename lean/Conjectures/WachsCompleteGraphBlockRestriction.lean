module
public import Conjectures.WachsCompleteGraphWeightedOrder

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

/-- A component restricted to a block keeps the ambient vertex labels. -/
@[ext] structure LocalWeight (r n : ℕ) (B : Finset (Fin n)) where
  partition : Finpartition B
  weights : Finset (Fin n) → Fin r → Fin (n+1)
  valid : ∀ b∈partition.parts, (∑ i : Fin r, (weights b i).val)=b.card-1
  offBlocks : ∀ b∉partition.parts, ∀ i, weights b i=0
  deriving DecidableEq

theorem mem_restricted_parts {n : ℕ} {P Q : CompletePartition n}
    (h : P ≤ Q) {B b : Finset (Fin n)} (hB : B ∈ Q.parts) :
    b ∈ (P.restrict (Finset.subset_univ B)).parts ↔ b ∈ P.parts ∧ b ⊆ B := by
  classical
  rw [Finpartition.parts_restrict, Finset.mem_erase, Finset.mem_image]
  constructor
  · rintro ⟨hne, c, hc, rfl⟩
    obtain ⟨D,hD,hcD⟩ := h hc
    have hDB : D = B := Q.disjoint.elim hD hB (fun hd =>
      hne (disjoint_iff.mp (hd.mono_left hcD)))
    subst D
    simpa only [inf_eq_left.mpr hcD] using And.intro hc hcD
  · rintro ⟨hb,hbB⟩
    exact ⟨P.ne_bot hb,b,hb,inf_eq_left.mpr hbB⟩

/-- Restricting a weighted lower partition retains exactly the weights
of the blocks in this component and no weights on any other subset. -/
def restrictWeighted {r n : ℕ} {P Q : WeightedCompletePartition r n}
    (h : P.partition ≤ Q.partition) {B : Finset (Fin n)} (hB : B ∈ Q.partition.parts) :
    LocalWeight r n B where
  partition := P.partition.restrict (Finset.subset_univ B)
  weights b i := if b ⊆ B then P.weights b i else 0
  valid b hb := by
    have hmem := (mem_restricted_parts h hB).mp hb
    simpa [hmem.2] using P.valid b hmem.1
  offBlocks b hb i := by
    by_cases hs : b ⊆ B
    · have hn : b ∉ P.partition.parts := fun h' =>
        hb ((mem_restricted_parts h hB).mpr ⟨h',hs⟩)
      simp [hs,P.offBlocks b hn]
    · simp [hs]

end WeightedCompletePartition
end WachsCompleteGraph
