import Conjectures.BraunBrueggeBicyclicWedgeBenchmark
import Conjectures.BraunBrueggeBicyclicWedgeSize
import Conjectures.BraunBrueggeMinimum
import Mathlib.Logic.Equiv.Option

/-! Literal connected simple graphs attain the balanced odd-cycle wedge
benchmark for every total edge count at least six. -/

namespace BraunBruegge

private abbrev CycleRemainder (k : ℕ) := {u : Fin (k + 3) // u ≠ 0}

private instance (k : ℕ) : Nonempty (CycleRemainder k) := by
  refine ⟨⟨1, fun h => ?_⟩⟩
  have he := congrArg Fin.val h
  simp at he

private def rootedCycle (k : ℕ) : SimpleGraph (Option (CycleRemainder k)) :=
  (SimpleGraph.cycleGraph (k + 3)).comap (Equiv.optionSubtypeNe (0 : Fin (k + 3)))

private def rootedCycleIso (k : ℕ) : rootedCycle k ≃g SimpleGraph.cycleGraph (k + 3) :=
  SimpleGraph.Iso.comap (Equiv.optionSubtypeNe _) _

private theorem rootedCycle_connected (k : ℕ) : (rootedCycle k).Connected :=
  (rootedCycleIso k).connected_iff.mpr SimpleGraph.connected_cycleGraph_add_one

private theorem rootedCycle_vertex_card (k : ℕ) : Fintype.card (Option (CycleRemainder k)) = k + 3 := by
  rw [(rootedCycleIso k).card_eq, Fintype.card_fin]

private theorem rootedCycle_edge_card (k : ℕ) : Nat.card (rootedCycle k).edgeSet = k + 3 := by
  rw [Nat.card_congr (rootedCycleIso k).mapEdgeSet, cycle_edge_card]

private theorem rootedCycle_facet_card (k : ℕ) (hk : Odd (k + 3)) :
    Nat.card {F // IsFacet (rootedCycle k) F} = oddCycleFacetNumber (k + 3) := by
  have : Nontrivial (Fin (k + 3)) := Fintype.one_lt_card_iff_nontrivial.mp (by simp)
  rw [facet_card_relabel (rootedCycleIso k) (rootedCycle_connected k) none, cycle_facet_card_odd_as_number k hk]

private abbrev bridgeGraph : SimpleGraph (Option Unit) := ⊤

private def bridgeEquiv : Option Unit ≃ Fin 1 ⊕ Fin 1 where
  toFun := fun v => v.elim (.inl 0) (fun _ => .inr 0)
  invFun := Sum.elim (fun _ => none) (fun _ => some ())
  left_inv v := by rcases v with _ | ⟨⟩ <;> rfl
  right_inv v := by
    rcases v with v | v
    · exact congrArg Sum.inl (Subsingleton.elim _ _)
    · exact congrArg Sum.inr (Subsingleton.elim _ _)

private def bridgeIso : bridgeGraph ≃g completeBipartiteGraph (Fin 1) (Fin 1) where
  toEquiv := bridgeEquiv
  map_rel_iff' := by
    rintro (_ | ⟨⟩) (_ | ⟨⟩) <;> simp [bridgeEquiv, bridgeGraph, completeBipartiteGraph]

private theorem bridge_connected : bridgeGraph.Connected := SimpleGraph.connected_top

private theorem bridge_edge_card : Nat.card bridgeGraph.edgeSet = 1 := by
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card, SimpleGraph.card_edgeFinset_top_eq_card_choose_two]
  simp

private theorem bridge_facet_card : Nat.card {F // IsFacet bridgeGraph F} = 2 := by
  let : Nontrivial (Fin 1 ⊕ Fin 1) := ⟨⟨.inl 0, .inr 0, Sum.inl_ne_inr⟩⟩
  rw [facet_card_relabel bridgeIso bridge_connected none, card_complete_bipartite_facets (R := Fin 1) (0 : Fin 1)]
  simp

theorem transport_attainment {V : Type*} [Fintype V] [DecidableEq V] [Nontrivial V]
    (G : SimpleGraph V) (hG : G.Connected) (n m value : ℕ) (hv : Fintype.card V = n)
    (he : Nat.card G.edgeSet = m) (hf : Nat.card {F // IsFacet G F} = value) :
    ∃ H : SimpleGraph (Fin n), H.Connected ∧ Nat.card H.edgeSet = m ∧ Nat.card {F // IsFacet H F} = value := by
  let e := Fintype.equivFinOfCardEq hv
  let i := SimpleGraph.Iso.map e G
  have hcard := Fintype.one_lt_card (α := V)
  let : Nontrivial (Fin n) := Fintype.one_lt_card_iff_nontrivial.mp (by rw [Fintype.card_fin, ← hv]; exact hcard)
  exact ⟨_, i.connected_iff.mp hG, (Nat.card_congr i.mapEdgeSet).symm.trans he,
    (facet_card_relabel i hG (Classical.choice hG.nonempty)).symm.trans hf⟩

theorem wedgeBenchmark_attained (l : ℕ) (hl : 6 ≤ l) :
    ∃ G : SimpleGraph (Fin (l - 1)), G.Connected ∧ Nat.card G.edgeSet = l ∧
      Nat.card {F // IsFacet G F} = wedgeBenchmark l := by
  obtain ⟨hx, hy, hxo, hyo, hxy, _, _⟩ := wedge_lengths l hl
  let i := wedgeLeftLength l - 3
  let j := wedgeRightLength l - 3
  have hi : i + 3 = wedgeLeftLength l := by dsimp [i]; omega
  have hj : j + 3 = wedgeRightLength l := by dsimp [j]; omega
  let G := wedge (rootedCycle i) (rootedCycle j)
  have conn : G.Connected := wedge_connected_iff.mpr ⟨rootedCycle_connected i, rootedCycle_connected j⟩
  have hV : Fintype.card (Option (CycleRemainder i ⊕ CycleRemainder j)) + 1 = wedgeEffectiveLength l := by
    rw [wedge_vertex_card_add_one, rootedCycle_vertex_card, rootedCycle_vertex_card, hi, hj, hxy]
  have hE : Nat.card G.edgeSet = wedgeEffectiveLength l := by
    change Nat.card (wedge (rootedCycle i) (rootedCycle j)).edgeSet = _
    rw [wedge_edge_card, rootedCycle_edge_card, rootedCycle_edge_card, hi, hj, hxy]
  have hF : Nat.card {F // IsFacet G F} = oddCycleFacetNumber (wedgeLeftLength l) * oddCycleFacetNumber (wedgeRightLength l) := by
    change Nat.card {F // IsFacet (wedge (rootedCycle i) (rootedCycle j)) F} = _
    rw [wedge_facet_card (rootedCycle_connected i) (rootedCycle_connected j),
      rootedCycle_facet_card i (hi.symm ▸ hxo), rootedCycle_facet_card j (hj.symm ▸ hyo), hi, hj]
  by_cases h0 : l % 2 = 0
  · have heff : wedgeEffectiveLength l = l := by simp [wedgeEffectiveLength, h0]
    apply transport_attainment G conn
    · omega
    · exact hE.trans heff
    · rw [hF, wedgeBenchmark, heff, Nat.sub_self, pow_zero, one_mul]
  · have h1 : l % 2 = 1 := by omega
    have heff : wedgeEffectiveLength l = l - 1 := by simp [wedgeEffectiveLength, h1]
    let H := wedge G bridgeGraph
    have hconn : H.Connected := wedge_connected_iff.mpr ⟨conn, bridge_connected⟩
    apply transport_attainment H hconn
    · have h := wedge_vertex_card_add_one (V := CycleRemainder i ⊕ CycleRemainder j) (W := Unit)
      have hcard : Fintype.card (Option Unit) = 2 := by simp
      rw [hcard] at h
      omega
    · change Nat.card (wedge G bridgeGraph).edgeSet = _
      rw [wedge_edge_card, hE, bridge_edge_card, heff]
      omega
    · change Nat.card {F // IsFacet (wedge G bridgeGraph) F} = _
      rw [wedge_facet_card conn bridge_connected, hF, bridge_facet_card, wedgeBenchmark, heff,
        show l - (l - 1) = 1 by omega, pow_one]
      ring

end BraunBruegge
