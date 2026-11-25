module
public import Conjectures.WachsCompleteGraphWeightEquiv
public import Conjectures.WachsCompleteGraphFibreProduct
public import Conjectures.WachsCompleteGraphIntervalMoebius

@[expose] public section
namespace WachsCompleteGraph
namespace WeightedCompletePartition

noncomputable def blockVertexLabels {n : ℕ} (B : Finset (Fin n)) : Fin B.card ↪ Fin n :=
  ((B.equivFinOfCardEq rfl).symm.toEmbedding).trans ⟨Subtype.val,Subtype.val_injective⟩

theorem blockVertexLabels_range {n : ℕ} (B : Finset (Fin n)) :
    (Finset.univ : Finset (Fin B.card)).map (blockVertexLabels B) = B := by
  classical
  ext b
  rw [Finset.mem_map]
  constructor
  · rintro ⟨j,_,rfl⟩
    exact ((B.equivFinOfCardEq rfl).symm j).property
  · intro hb
    refine ⟨(B.equivFinOfCardEq rfl) ⟨b,hb⟩,Finset.mem_univ _,?_⟩
    change (((B.equivFinOfCardEq rfl).symm ((B.equivFinOfCardEq rfl) ⟨b,hb⟩)) : Fin n) = b
    rw [Equiv.symm_apply_apply]

def transportLocal {r n : ℕ} {S B : Finset (Fin n)} (h : S = B) (L : LocalWeight r n S) :
    LocalWeight r n B := h ▸ L

theorem transportLocal_parts {r n : ℕ} {S B : Finset (Fin n)} (h : S = B) (L : LocalWeight r n S) :
    (transportLocal h L).partition.parts = L.partition.parts := by cases h; rfl

theorem transportLocal_weights {r n : ℕ} {S B : Finset (Fin n)} (h : S = B) (L : LocalWeight r n S)
    (b : Finset (Fin n)) (i : Fin r) : (transportLocal h L).weights b i = L.weights b i := by cases h; rfl

theorem transportLocal_refines_iff {r n : ℕ} {S B : Finset (Fin n)} (h : S = B)
    (L R : LocalWeight r n S) :
    (transportLocal h L).Refines (transportLocal h R) ↔ L.Refines R := by cases h; rfl

def transportLocalEquiv {r n : ℕ} {S B : Finset (Fin n)} (h : S = B) :
    LocalWeight r n S ≃ LocalWeight r n B where
  toFun := transportLocal h
  invFun := transportLocal h.symm
  left_inv := by cases h; intro L; rfl
  right_inv := by cases h; intro L; rfl

noncomputable def liftToBlockEquiv (r : ℕ) {n : ℕ} (B : Finset (Fin n)) :
    WeightedCompletePartition r B.card ≃ LocalWeight r n B :=
  (liftLocalEquiv (blockVertexLabels B) r).trans (transportLocalEquiv (blockVertexLabels_range B))

theorem liftToBlockEquiv_refines_iff {r n : ℕ} (B : Finset (Fin n))
    (P R : WeightedCompletePartition r B.card) :
    ((liftToBlockEquiv r B) P).Refines ((liftToBlockEquiv r B) R) ↔ P ≤ R :=
  (transportLocal_refines_iff (blockVertexLabels_range B) _ _).trans
    (liftLocal_refines_iff (blockVertexLabels B) P R)

end WeightedCompletePartition
end WachsCompleteGraph
