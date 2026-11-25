import Conjectures.BraunBrueggeMinimumFacets
import Conjectures.BraunBrueggeMinimumCompleteBipartite

/-! Facet counts for complete bipartite graphs, and the basic bound from
distinct orientations of an arbitrary matching. -/

namespace BraunBruegge

theorem card_complete_bipartite_facets {L R : Type*} [Fintype L] [Fintype R]
    [DecidableEq L] [DecidableEq R] [Nonempty R] (root : L) :
    Nat.card {F // IsFacet (completeBipartiteGraph L R) F} = 2 ^ Fintype.card L + 2 ^ Fintype.card R - 2 := by
  have : Nontrivial (L ⊕ R) := by
    obtain ⟨r⟩ := (inferInstance : Nonempty R)
    exact ⟨⟨.inl root, .inr r, Sum.inl_ne_inr⟩⟩
  rw [← Nat.card_congr (polarVerticesEquivFacets (complete_bipartite_connected root) (.inl root))]
  exact card_complete_bipartite_polar_vertices root

theorem pow_card_matching_le_facets {V M : Type*} [Fintype V] [Fintype M] [DecidableEq V] [Nontrivial V]
    {G : SimpleGraph V} (hG : G.Connected) (root : V) (m : M ⊕ M ↪ V)
    (hm : ∀ i : M, G.Adj (m (.inl i)) (m (.inr i))) :
    2 ^ Fintype.card M ≤ Nat.card {F // IsFacet G F} := by
  rw [← Nat.card_congr (polarVerticesEquivFacets hG root)]
  exact pow_card_matching_le_polar_vertices hG root m hm

end BraunBruegge
