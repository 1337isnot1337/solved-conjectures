import Conjectures.BraunBrueggeBicyclicBridgeReduction
import Conjectures.BraunBrueggeBicyclicCoreTheta
import Conjectures.BraunBrueggeBicyclicCoreWedge

/-! The balanced odd-cycle construction gives the exact largest facet count
of a connected bicyclic graph, with the diamond as the order-four case. -/

namespace BraunBruegge

variable {V : Type*}

private theorem bicyclic_nontrivial [Fintype V] {G : SimpleGraph V}
    (hRank : Nat.card G.edgeSet = Nat.card V + 1) : Nontrivial V := by
  have hfour := bicyclic_vertex_card_ge_four hRank
  rw [Nat.card_eq_fintype_card] at hfour
  exact Fintype.one_lt_card_iff_nontrivial.mp (by omega)

/-- The facet bound for bridgeless bicyclic graphs follows by adding one ear
to a simple cycle and checking the resulting closed or open core. -/
theorem bridgeless_bicyclic_facet_bound [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : G.Connected) (hRank : Nat.card G.edgeSet = Nat.card V + 1)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e) :
    Nat.card {F // IsFacet G F} ≤ wedgeBenchmark (Nat.card G.edgeSet) := by
  classical
  let _ := bicyclic_nontrivial hRank
  have hNotAcyclic : ¬G.IsAcyclic := fun ha => by
    have hTree : G.IsTree := ⟨hG, ha⟩
    have hTreeCard := (SimpleGraph.isTree_iff_connected_and_card.mp hTree).2
    change Nat.card G.edgeSet + 1 = Nat.card V at hTreeCard
    omega
  obtain ⟨v, c, hc⟩ := by simpa only [SimpleGraph.IsAcyclic, not_forall, not_not] using hNotAcyclic
  let k := c.length - 3
  have hlen : c.length = k + 3 := by
    have := hc.three_le_length
    dsimp [k]
    omega
  let f := cycleWalkEmbedding hc hlen
  have hF := cycleWalkEmbedding_le hc hlen
  have hProper : (SimpleGraph.cycleGraph (k + 3)).map f ≠ G := by
    intro hEq
    have hV := Nat.card_le_card_of_injective f f.injective
    rw [Nat.card_fin] at hV
    have hE : ((SimpleGraph.cycleGraph (k + 3)).map f).edgeSet.ncard = k + 3 := by
      rw [SimpleGraph.edgeSet_map, Set.ncard_image_of_injective _ f.sym2Map.injective]
      exact cycle_edge_card k
    rw [hEq] at hE
    change Nat.card G.edgeSet = k + 3 at hE
    omega
  obtain ⟨ear⟩ := exists_graph_ear f hG hF hProper hNoBridge
  by_cases hClosed : ear.start = ear.finish
  · obtain ⟨m, he, hf⟩ := closed_ear_bicyclic_facet_card hG hRank hNoBridge f hF ear hClosed
    rw [he, hf]
    simpa using cycleProducts_le_wedgeBenchmark (k + 3) (m + 3) 0 (by omega) (by omega)
  · exact open_ear_bicyclic_facet_bound hG hRank hNoBridge f hF ear hClosed

/-- Every finite connected bicyclic graph obeys the balanced odd-cycle facet bound. -/
theorem bicyclic_facet_bound [Fintype V] [DecidableEq V] {G : SimpleGraph V}
    (hG : G.Connected) (hRank : Nat.card G.edgeSet = Nat.card V + 1) :
    Nat.card {F // IsFacet G F} ≤ wedgeBenchmark (Nat.card G.edgeSet) := by
  classical
  let _ := bicyclic_nontrivial hRank
  obtain ⟨r⟩ := hG.nonempty
  rw [← Nat.card_congr (polarVerticesEquivFacets hG r)]
  apply bicyclic_polar_bound_of_bridgeless _ hG hRank r
  intro W _ H w hW hb hNoBridge
  let _ := bicyclic_nontrivial hb
  rw [Nat.card_congr (polarVerticesEquivFacets hW w)]
  exact bridgeless_bicyclic_facet_bound hW hb hNoBridge

/-- Braun–Bruegge's sharp bicyclic facet maximum on every order at least four.
The bound is for literal facets of the symmetric edge polytope. -/
theorem braun_bruegge_bicyclic_facet_maximum (n : ℕ) (hn : 4 ≤ n) :
    (∀ G : SimpleGraph (Fin n), G.Connected → Nat.card G.edgeSet = n + 1 →
      Nat.card {F // IsFacet G F} ≤ wedgeBenchmark (n + 1)) ∧
    (∃ G : SimpleGraph (Fin n), G.Connected ∧ Nat.card G.edgeSet = n + 1 ∧
      Nat.card {F // IsFacet G F} = wedgeBenchmark (n + 1)) := by
  constructor
  · intro G hG hEdges
    have hRank : Nat.card G.edgeSet = Nat.card (Fin n) + 1 := by simpa using hEdges
    rw [← hEdges]
    exact bicyclic_facet_bound hG hRank
  · obtain ⟨G, hG, hEdges, hFacets⟩ := wedgeBenchmark_attained_all (n + 1) (by omega)
    let e := SimpleGraph.Iso.map (finCongr (show n + 1 - 1 = n by omega)) G
    have hRank : Nat.card G.edgeSet = Nat.card (Fin (n + 1 - 1)) + 1 := by
      simpa only [Nat.card_fin, show n + 1 - 1 = n by omega] using hEdges
    let _ := bicyclic_nontrivial hRank
    let _ : Nontrivial (Fin n) := Fintype.one_lt_card_iff_nontrivial.mp (by simp; omega)
    obtain ⟨r⟩ := hG.nonempty
    exact ⟨_, e.connected_iff.mp hG, (Nat.card_congr e.mapEdgeSet).symm.trans hEdges,
      (facet_card_relabel e hG r).symm.trans hFacets⟩

end BraunBruegge
