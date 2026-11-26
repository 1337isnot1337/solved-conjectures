import Conjectures.BraunBrueggeBicyclicUnicyclic

/-! To bound all connected bicyclic graphs it suffices to bound the
bridgeless cores. A bridge either separates the cycles or cuts off a tree. -/

open scoped Sym2

namespace BraunBruegge

universe u

variable {V : Type u}

theorem bicyclic_vertex_card_ge_four [Fintype V] {G : SimpleGraph V}
    (hRank : Nat.card G.edgeSet = Nat.card V + 1) : 4 ≤ Nat.card V := by
  classical
  have hle := SimpleGraph.card_edgeFinset_le_card_choose_two (G := G)
  rw [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card, ← Nat.card_eq_fintype_card, hRank] at hle
  by_contra! hn
  interval_cases Nat.card V <;> norm_num [Nat.choose] at hle

private theorem bicyclic_bridge_tree_factor (a b : ℕ) :
    2 * a * 2 ^ b = 2 ^ (b + 1) * a := by
  rw [pow_succ]
  ac_rfl

private theorem bicyclic_bridge_two_cycles_factor (a b x y : ℕ) :
    2 * (2 ^ a * x) * (2 ^ b * y) = 2 ^ (a + b + 1) * (x * y) := by
  rw [pow_add, pow_add, pow_one]
  ac_rfl

/-- The sharp bicyclic bound follows from the bound for bridgeless bicyclic graphs. -/
theorem bicyclic_polar_bound_of_bridgeless [Fintype V] {G : SimpleGraph V}
    (core : ∀ (W : Type u) [Fintype W] (H : SimpleGraph W) (w : W),
      H.Connected → Nat.card H.edgeSet = Nat.card W + 1 →
      (∀ e ∈ H.edgeSet, ¬H.IsBridge e) →
      Nat.card ((polar H w).extremePoints ℝ) ≤ wedgeBenchmark (Nat.card H.edgeSet))
    (hG : G.Connected) (hRank : Nat.card G.edgeSet = Nat.card V + 1) (r : V) :
    Nat.card ((polar G r).extremePoints ℝ) ≤ wedgeBenchmark (Nat.card G.edgeSet) := by
  classical
  suffices h : ∀ n : ℕ, ∀ (W : Type u) [Fintype W] (H : SimpleGraph W) (w : W),
      Nat.card W = n → H.Connected → Nat.card H.edgeSet = Nat.card W + 1 →
      Nat.card ((polar H w).extremePoints ℝ) ≤ wedgeBenchmark (Nat.card H.edgeSet) from
    h _ V G r rfl hG hRank
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro W _ H w hCard hConn hRank
    by_cases hNoBridge : ∀ e ∈ H.edgeSet, ¬H.IsBridge e
    · exact core W H w hConn hRank hNoBridge
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
        rw [Nat.card_congr (polarVerticesChangeRoot H w a), bridgeDeletion_polar_vertex_card hConn hAdj hb]
        by_cases hLeft : Nat.card L.toSimpleGraph.edgeSet + 1 = Nat.card L
        · have hLT : L.toSimpleGraph.IsTree := SimpleGraph.isTree_iff_connected_and_card.mpr ⟨hLC, hLeft⟩
          have hRight : Nat.card R.toSimpleGraph.edgeSet = Nat.card R + 1 := by omega
          have hRfive : 5 ≤ Nat.card R.toSimpleGraph.edgeSet := by
            have := bicyclic_vertex_card_ge_four hRight
            omega
          have hR := ih (Nat.card R) hRn R R.toSimpleGraph rr rfl hRC hRight
          rw [tree_polar_vertex_card hLT lr, mul_right_comm, bicyclic_bridge_tree_factor]
          refine (Nat.mul_le_mul_left _ hR).trans ?_
          rw [show Nat.card H.edgeSet = Nat.card R.toSimpleGraph.edgeSet + (Nat.card L.toSimpleGraph.edgeSet + 1) by omega]
          exact wedgeBenchmark_bridge_le _ _ hRfive
        · by_cases hRight : Nat.card R.toSimpleGraph.edgeSet + 1 = Nat.card R
          · have hRT : R.toSimpleGraph.IsTree := SimpleGraph.isTree_iff_connected_and_card.mpr ⟨hRC, hRight⟩
            have hLeft' : Nat.card L.toSimpleGraph.edgeSet = Nat.card L + 1 := by omega
            have hLfive : 5 ≤ Nat.card L.toSimpleGraph.edgeSet := by
              have := bicyclic_vertex_card_ge_four hLeft'
              omega
            have hL := ih (Nat.card L) hLn L L.toSimpleGraph lr rfl hLC hLeft'
            rw [tree_polar_vertex_card hRT rr, bicyclic_bridge_tree_factor]
            refine (Nat.mul_le_mul_left _ hL).trans ?_
            rw [hE, Nat.add_assoc]
            exact wedgeBenchmark_bridge_le _ _ hLfive
          · have hLeft' : Nat.card L.toSimpleGraph.edgeSet = Nat.card L := by omega
            have hRight' : Nat.card R.toSimpleGraph.edgeSet = Nat.card R := by omega
            obtain ⟨x, p, hx, hp, hLp⟩ := unicyclic_polar_vertex_card hLC hLeft' lr
            obtain ⟨y, q, hy, hq, hRp⟩ := unicyclic_polar_vertex_card hRC hRight' rr
            rw [hLp, hRp, bicyclic_bridge_two_cycles_factor]
            rw [show Nat.card H.edgeSet = x + y + (p + q + 1) by omega]
            simpa only [mul_assoc] using cycleProducts_le_wedgeBenchmark x y (p + q + 1) hx hy

end BraunBruegge
