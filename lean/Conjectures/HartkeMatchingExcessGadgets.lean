import Conjectures.HartkeMatchingExcessReturnEdges
import Conjectures.HartkeMatchingExcessSelections

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Actual finite simple graphs realizing the two matching-count/excess bounds
for every input. The conclusions count Mathlib's spanning perfect matchings
and genuine unordered edges; no abstract construction premise remains.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

theorem binary_graph_witness (t : ℕ) :
    ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
      perfectMatchingCount G = t + 1 ∧
        Nat.card G.edgeSet = n ^ 2 + binaryWeight t := by
  obtain ⟨J, hJ, hc, hs⟩ := exists_binary_returns t
  refine ⟨binaryLength t + 1, fullReturnGraph J, ?_, ?_⟩
  · change perfectMatchingCount (splitGraph (returnDigraph (fun _ _ => True) J)) = _
    rw [perfectMatchingCount_returnGraph _ J hJ, hs]
    omega
  · rw [fullReturnGraph_edge_card J hJ, hc]

theorem deleted_graph_witness (t u : ℕ) (hu : 2 ≤ u) :
    ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
      perfectMatchingCount G = t + 1 ∧
        n ^ 2 + binaryWeight (t / (2 ^ u - 1)) ≤ Nat.card G.edgeSet + 1 := by
  obtain ⟨R, v, J, hv, hJ, hc, hs⟩ := exists_deleted_returns t u hu
  refine ⟨R + 1, deletedReturnGraph v J, ?_, ?_⟩
  · change perfectMatchingCount (splitGraph (returnDigraph (withoutOneArc v) J)) = _
    rw [perfectMatchingCount_returnGraph _ J hJ, hs]
    omega
  · rw [deletedReturnGraph_edge_card_add_one v (by omega) J hJ]
    omega

/-- Excess is measured against one quarter of the actual even vertex count. -/
noncomputable def graphExcess (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)) : ℤ :=
  (Nat.card G.edgeSet : ℤ) - (n : ℤ) ^ 2

theorem binary_excess_witness (t : ℕ) :
    ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
      perfectMatchingCount G = t + 1 ∧ graphExcess n G = (binaryWeight t : ℤ) := by
  obtain ⟨n, G, hp, he⟩ := binary_graph_witness t
  refine ⟨n, G, hp, ?_⟩
  unfold graphExcess
  rw [he]
  push_cast
  ring

theorem deleted_excess_witness (t u : ℕ) (hu : 2 ≤ u) :
    ∃ (n : ℕ) (G : SimpleGraph (Fin n ⊕ Fin n)),
      perfectMatchingCount G = t + 1 ∧
        (binaryWeight (t / (2 ^ u - 1)) : ℤ) - 1 ≤ graphExcess n G := by
  obtain ⟨n, G, hp, he⟩ := deleted_graph_witness t u hu
  refine ⟨n, G, hp, ?_⟩
  have hei : (n : ℤ) ^ 2 + (binaryWeight (t / (2 ^ u - 1)) : ℤ) ≤
      (Nat.card G.edgeSet : ℤ) + 1 := by exact_mod_cast he
  unfold graphExcess
  omega

end HartkeMatchingExcess
