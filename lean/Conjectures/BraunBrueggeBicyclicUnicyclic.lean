import Conjectures.BraunBrueggeBicyclicCycleEmbedding
import Conjectures.BraunBrueggeBicyclicCycleProducts
import Conjectures.BraunBrueggeBicyclicTree

/-! In a connected unicyclic graph, the single cycle gives the cycle facet
count and each remaining edge contributes a factor of two. -/

open scoped Sym2

namespace BraunBruegge

universe u

variable {V : Type u}

private theorem cycle_polar_eq_number (m : ℕ) (hm : 3 ≤ m) (r : Fin m) :
    Nat.card ((polar (SimpleGraph.cycleGraph m) r).extremePoints ℝ) = cycleFacetNumber m := by
  obtain ⟨k, rfl⟩ : ∃ k, m = k + 3 := ⟨m - 3, by omega⟩
  rw [Nat.card_congr (polarVerticesEquivFacets SimpleGraph.connected_cycleGraph_add_one r)]
  exact cycle_facets_eq_number _ hm

private theorem bridge_factor_combine (a b c : ℕ) :
    2 * (2 ^ a * c) * 2 ^ b = 2 ^ (a + b + 1) * c := by
  rw [pow_add, pow_add, pow_one]
  ac_rfl

/-- The exact number of normalized polar vertices for a connected graph
whose number of edges equals its number of vertices. -/
theorem unicyclic_polar_vertex_card [Fintype V] {G : SimpleGraph V} (hG : G.Connected)
    (hRank : Nat.card G.edgeSet = Nat.card V) (r : V) :
    ∃ m b : ℕ, 3 ≤ m ∧ Nat.card V = m + b ∧
      Nat.card ((polar G r).extremePoints ℝ) = 2 ^ b * cycleFacetNumber m := by
  classical
  suffices h : ∀ n : ℕ, ∀ (W : Type u) [Fintype W] (H : SimpleGraph W) (w : W),
      Nat.card W = n → H.Connected → Nat.card H.edgeSet = Nat.card W →
      ∃ m b : ℕ, 3 ≤ m ∧ Nat.card W = m + b ∧
        Nat.card ((polar H w).extremePoints ℝ) = 2 ^ b * cycleFacetNumber m from h _ V G r rfl hG hRank
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro W _ H w hCard hConn hRank
    by_cases hNoBridge : ∀ e ∈ H.edgeSet, ¬H.IsBridge e
    · obtain ⟨k, ⟨iso⟩⟩ := bridgeless_unicyclic_is_cycle hConn hRank hNoBridge
      refine ⟨k + 3, 0, by omega, by simpa using (Nat.card_congr iso.symm.toEquiv), ?_⟩
      rw [pow_zero, one_mul, Nat.card_congr (polarVerticesRelabel iso.symm w)]
      exact cycle_polar_eq_number _ (by omega) _
    · obtain ⟨e, he, hb⟩ := by simpa only [not_forall, not_not] using hNoBridge
      induction e using Sym2.inductionOn with
      | hf a b =>
        let L := bridgeLeft H a b
        let R := bridgeRight H a b
        let lr := bridgeLeftRoot H a b
        let rr := bridgeRightRoot H a b
        have hAdj : H.Adj a b := he
        obtain ⟨hV, hE⟩ := bridgeDeletion_cardinalities hConn hAdj hb
        change Nat.card W = Nat.card L + Nat.card R at hV
        change Nat.card H.edgeSet = Nat.card L.toSimpleGraph.edgeSet + Nat.card R.toSimpleGraph.edgeSet + 1 at hE
        have hLC := L.connected_toSimpleGraph
        have hRC := R.connected_toSimpleGraph
        have hLle := hLC.card_vert_le_card_edgeSet_add_one
        have hRle := hRC.card_vert_le_card_edgeSet_add_one
        let _ : Nonempty L := ⟨lr⟩
        let _ : Nonempty R := ⟨rr⟩
        have hLpos := Nat.card_pos (α := L)
        have hRpos := Nat.card_pos (α := R)
        have hLn : Nat.card L < n := by omega
        have hRn : Nat.card R < n := by omega
        have hFac := bridgeDeletion_polar_vertex_card hConn hAdj hb
        rw [Nat.card_congr (polarVerticesChangeRoot H w a)]
        change Nat.card ((polar H a).extremePoints ℝ) = _ at hFac
        by_cases hLeft : Nat.card L.toSimpleGraph.edgeSet = Nat.card L
        · have hRT : R.toSimpleGraph.IsTree :=
            SimpleGraph.isTree_iff_connected_and_card.mpr ⟨hRC, by omega⟩
          obtain ⟨m, d, hm, hd, hp⟩ := ih (Nat.card L) hLn L L.toSimpleGraph lr rfl hLC hLeft
          refine ⟨m, d + Nat.card R.toSimpleGraph.edgeSet + 1, hm, by omega, ?_⟩
          rw [hFac, hp, tree_polar_vertex_card hRT rr, bridge_factor_combine]
        · have hLT : L.toSimpleGraph.IsTree :=
            SimpleGraph.isTree_iff_connected_and_card.mpr ⟨hLC, by omega⟩
          have hRight : Nat.card R.toSimpleGraph.edgeSet = Nat.card R := by omega
          obtain ⟨m, d, hm, hd, hp⟩ := ih (Nat.card R) hRn R R.toSimpleGraph rr rfl hRC hRight
          refine ⟨m, d + Nat.card L.toSimpleGraph.edgeSet + 1, hm, by omega, ?_⟩
          rw [hFac, hp, tree_polar_vertex_card hLT lr, mul_right_comm, bridge_factor_combine]

end BraunBruegge
