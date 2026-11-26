import Conjectures.BraunBrueggeBicyclicBridgeCounts
import Mathlib.Combinatorics.SimpleGraph.Acyclic

/-! A tree contributes one independent sign for every edge. The normalized
polar convention assigns cardinal one to a tree with only one vertex. -/

open scoped Sym2

namespace BraunBruegge

universe u

variable {V : Type u}

theorem singleton_polar_vertex_card [Fintype V] [Subsingleton V] (G : SimpleGraph V) (r : V) :
    Nat.card ((polar G r).extremePoints ℝ) = 1 := by
  have hzero : (0 : V → ℝ) ∈ (polar G r).extremePoints ℝ := by
    let _ : Nonempty V := ⟨r⟩
    apply mem_extreme_polar_iff.mpr
    exact ⟨⟨rfl, fun {a b} e => (e.ne (Subsingleton.elim a b)).elim⟩,
      ⟨SimpleGraph.Preconnected.of_subsingleton⟩⟩
  let z : (polar G r).extremePoints ℝ := ⟨0, hzero⟩
  let e : (polar G r).extremePoints ℝ ≃ Unit :=
    ⟨fun _ => (), fun _ => z, fun f => by
      apply Subtype.ext
      funext x
      have hxr : x = r := Subsingleton.elim _ _
      rw [hxr]
      exact f.property.1.1.symm, fun _ => rfl⟩
  rw [Nat.card_congr e]
  simp

private theorem vertex_card_add_one_of_tree [Finite V] {G : SimpleGraph V} (hG : G.IsTree) :
    Nat.card V = Nat.card G.edgeSet + 1 :=
  (SimpleGraph.isTree_iff_connected_and_card.mp hG).2.symm

/-- A tree has exactly one independent binary choice per edge in its normalized polar. -/
theorem tree_polar_vertex_card [Fintype V] {G : SimpleGraph V} (hG : G.IsTree) (r : V) :
    Nat.card ((polar G r).extremePoints ℝ) = 2 ^ Nat.card G.edgeSet := by
  classical
  suffices h : ∀ n : ℕ, ∀ (W : Type u) [Fintype W] (H : SimpleGraph W) (w : W),
      Nat.card W = n → H.IsTree →
        Nat.card ((polar H w).extremePoints ℝ) = 2 ^ Nat.card H.edgeSet from h _ V G r rfl hG
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro W _ H w hCard hTree
    rcases subsingleton_or_nontrivial W with hSub | hNontrivial
    · have hOne : Nat.card W = 1 := by
        let _ : Unique W := ⟨⟨w⟩, fun _ => Subsingleton.elim _ _⟩
        simp
      have hZero : Nat.card H.edgeSet = 0 := by
        have := vertex_card_add_one_of_tree hTree
        omega
      rw [singleton_polar_vertex_card, hZero, pow_zero]
    · obtain ⟨b, he⟩ := hTree.connected.preconnected.exists_adj_of_nontrivial w
      have hb := SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hTree.isAcyclic he
      let L := bridgeLeft H w b
      let R := bridgeRight H w b
      have hL : L.toSimpleGraph.IsTree := (hTree.isAcyclic.anti
        (SimpleGraph.deleteEdges_le _)).isTree_connectedComponent L
      have hR : R.toSimpleGraph.IsTree := (hTree.isAcyclic.anti
        (SimpleGraph.deleteEdges_le _)).isTree_connectedComponent R
      obtain ⟨hV, hE⟩ := bridgeDeletion_cardinalities hTree.connected he hb
      change Nat.card W = Nat.card L + Nat.card R at hV
      change Nat.card H.edgeSet = Nat.card L.toSimpleGraph.edgeSet + Nat.card R.toSimpleGraph.edgeSet + 1 at hE
      let _ : Nonempty L := ⟨bridgeLeftRoot H w b⟩
      let _ : Nonempty R := ⟨bridgeRightRoot H w b⟩
      have hLpos := Nat.card_pos (α := L)
      have hRpos := Nat.card_pos (α := R)
      have hLn : Nat.card L < n := by omega
      have hRn : Nat.card R < n := by omega
      rw [bridgeDeletion_polar_vertex_card hTree.connected he hb,
        ih (Nat.card L) hLn L L.toSimpleGraph (bridgeLeftRoot H w b) rfl hL,
        ih (Nat.card R) hRn R R.toSimpleGraph (bridgeRightRoot H w b) rfl hR,
        hE, pow_add, pow_add, pow_one]
      ac_rfl

end BraunBruegge
