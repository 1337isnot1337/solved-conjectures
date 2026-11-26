import Conjectures.BraunBrueggeBicyclicBridgePolar

/-! Cardinalities of vertices, edges and normalized polar vertices across
a bridge. These identities apply even when a side is a single vertex. -/

open Set
open scoped Sym2

namespace BraunBruegge

variable {V W : Type*}

private theorem stepMaps_disjoint_left_right (e : Sym2 V) (f : Sym2 W) :
    e.map (Sum.inl : V → V ⊕ W) ≠ f.map Sum.inr := by
  obtain ⟨x, y⟩ := e
  obtain ⟨a, b⟩ := f
  simp

private theorem stepMaps_disjoint_left_bridge (e : Sym2 V) (u : V) (v : W) :
    e.map (Sum.inl : V → V ⊕ W) ≠ s(.inl u, .inr v) := by
  obtain ⟨x, y⟩ := e
  simp

private theorem stepMaps_disjoint_right_bridge (e : Sym2 W) (u : V) (v : W) :
    e.map (Sum.inr : W → V ⊕ W) ≠ s(.inl u, .inr v) := by
  obtain ⟨x, y⟩ := e
  simp

noncomputable def bridgeJoinEdgesEquiv (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) :
    (G.edgeSet ⊕ H.edgeSet) ⊕ Unit ≃ (bridgeJoin G H u v).edgeSet := by
  let J := bridgeJoin G H u v
  let l : G →g J := ⟨Sum.inl, fun e => e⟩
  let r : H →g J := ⟨Sum.inr, fun e => e⟩
  let e : J.edgeSet := ⟨s(.inl u, .inr v), show J.Adj (.inl u) (.inr v) from ⟨rfl, rfl, trivial⟩⟩
  let f : (G.edgeSet ⊕ H.edgeSet) ⊕ Unit → J.edgeSet :=
    Sum.elim (Sum.elim l.mapEdgeSet r.mapEdgeSet) (fun _ => e)
  apply Equiv.ofBijective f
  constructor
  · rintro ((a | a) | ⟨⟩) ((b | b) | ⟨⟩) h
    · have h' : a.val.map Sum.inl = b.val.map (Sum.inl : V → V ⊕ W) := congrArg Subtype.val h
      exact congrArg (fun x => Sum.inl (Sum.inl x)) (Subtype.ext (Sym2.map.injective Sum.inl_injective h'))
    · exact (stepMaps_disjoint_left_right a.val b.val (congrArg Subtype.val h)).elim
    · exact (stepMaps_disjoint_left_bridge a.val u v (congrArg Subtype.val h)).elim
    · exact (stepMaps_disjoint_left_right b.val a.val (congrArg Subtype.val h.symm)).elim
    · have h' : a.val.map Sum.inr = b.val.map (Sum.inr : W → V ⊕ W) := congrArg Subtype.val h
      exact congrArg (fun x => Sum.inl (Sum.inr x)) (Subtype.ext (Sym2.map.injective Sum.inr_injective h'))
    · exact (stepMaps_disjoint_right_bridge a.val u v (congrArg Subtype.val h)).elim
    · exact (stepMaps_disjoint_left_bridge b.val u v (congrArg Subtype.val h.symm)).elim
    · exact (stepMaps_disjoint_right_bridge b.val u v (congrArg Subtype.val h.symm)).elim
    · rfl
  · rintro ⟨pair, hp⟩
    induction pair using Sym2.inductionOn with
    | hf x y =>
      have hx : J.Adj x y := hp
      rcases x with x | x <;> rcases y with y | y
      · exact ⟨.inl (.inl ⟨s(x, y), hx⟩), rfl⟩
      · obtain ⟨rfl, rfl, _⟩ := hx
        exact ⟨.inr (), rfl⟩
      · obtain ⟨rfl, rfl, _⟩ := hx
        exact ⟨.inr (), Subtype.ext Sym2.eq_swap⟩
      · exact ⟨.inl (.inr ⟨s(x, y), hx⟩), rfl⟩

theorem bridgeJoin_edge_card [Fintype V] [Fintype W] (G : SimpleGraph V) (H : SimpleGraph W) (u : V) (v : W) :
    Nat.card (bridgeJoin G H u v).edgeSet = Nat.card G.edgeSet + Nat.card H.edgeSet + 1 := by
  rw [← Nat.card_congr (bridgeJoinEdgesEquiv G H u v), Nat.card_sum, Nat.card_sum]
  simp

theorem bridgeDeletion_cardinalities [Fintype V] {G : SimpleGraph V} {u v : V} (hG : G.Connected) (he : G.Adj u v)
    (hb : G.IsBridge s(u, v)) :
    Nat.card V = Nat.card (bridgeLeft G u v) + Nat.card (bridgeRight G u v) ∧
      Nat.card G.edgeSet = Nat.card (bridgeLeft G u v).toSimpleGraph.edgeSet +
        Nat.card (bridgeRight G u v).toSimpleGraph.edgeSet + 1 := by
  classical
  let e := bridgePartitionGraphIso hG he hb
  constructor
  · rw [← Nat.card_congr e.toEquiv, Nat.card_sum]
  · rw [← Nat.card_congr e.mapEdgeSet]
    exact bridgeJoin_edge_card _ _ _ _

private def normalizeAt (v : V) (f : V → ℝ) : V → ℝ := fun x => f x - f v

private theorem normalizeAt_diff (v : V) (f : V → ℝ) (a b : V) :
    normalizeAt v f a - normalizeAt v f b = f a - f b := by
  unfold normalizeAt
  ring

private theorem normalizeAt_mem_extreme [Fintype V] {G : SimpleGraph V} {u : V} (v : V) {f : V → ℝ}
    (h : f ∈ (polar G u).extremePoints ℝ) : normalizeAt v f ∈ (polar G v).extremePoints ℝ := by
  obtain ⟨hp, hc⟩ := mem_extreme_polar_iff.mp h
  apply mem_extreme_polar_iff.mpr
  refine ⟨⟨by simp [normalizeAt], ?_⟩, ?_⟩
  · intro a b he
    rw [normalizeAt_diff]
    exact hp.2 he
  · have ht : tightGraph G (normalizeAt v f) = tightGraph G f := by
      ext a b
      change (G.Adj a b ∧ |normalizeAt v f a - normalizeAt v f b| = 1) ↔ G.Adj a b ∧ |f a - f b| = 1
      rw [normalizeAt_diff]
    rwa [ht]

noncomputable def polarVerticesChangeRoot [Fintype V] (G : SimpleGraph V) (u v : V) :
    (polar G u).extremePoints ℝ ≃ (polar G v).extremePoints ℝ where
  toFun f := ⟨normalizeAt v f.val, normalizeAt_mem_extreme v f.property⟩
  invFun f := ⟨normalizeAt u f.val, normalizeAt_mem_extreme u f.property⟩
  left_inv f := by
    apply Subtype.ext
    funext x
    change (f.val x - f.val v) - (f.val u - f.val v) = f.val x
    rw [f.property.1.1]
    ring
  right_inv f := by
    apply Subtype.ext
    funext x
    change (f.val x - f.val u) - (f.val v - f.val u) = f.val x
    rw [f.property.1.1]
    ring

end BraunBruegge
