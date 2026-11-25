import Conjectures.BraunBrueggeBicyclicCycleGeometry
import Conjectures.BraunBrueggeBicyclicRank

/-! A simple closed walk gives an embedded cyclic graph. A connected graph of
cycle rank one with no bridges is therefore an actual cycle. -/

open scoped Sym2

namespace BraunBruegge

variable {V : Type*} {G : SimpleGraph V} {v : V}

private theorem cycle_getVert_injective {c : G.Walk v v} (hc : c.IsCycle)
    {i j : ℕ} (hi : i < c.length) (hj : j < c.length)
    (he : c.getVert i = c.getVert j) : i = j := by
  have hlen : c.support.dropLast.length = c.length := by
    simp [List.length_dropLast, c.length_support]
  have hi' : i < c.support.dropLast.length := hlen.symm ▸ hi
  have hj' : j < c.support.dropLast.length := hlen.symm ▸ hj
  apply (hc.nodup_dropLast_support.getElem_inj_iff (hi := hi') (hj := hj')).mp
  rw [List.getElem_dropLast, List.getElem_dropLast]
  simpa only [← c.getVert_eq_support_getElem hi.le, ← c.getVert_eq_support_getElem hj.le] using he

/-- The canonical vertex embedding follows the vertices of the closed walk. -/
def cycleWalkEmbedding {c : G.Walk v v} (hc : c.IsCycle) {n : ℕ} (hlen : c.length = n + 3) :
    Fin (n + 3) ↪ V where
  toFun i := c.getVert i.val
  inj' := fun i j he => Fin.ext (cycle_getVert_injective hc (hlen.symm ▸ i.isLt) (hlen.symm ▸ j.isLt) he)

theorem cycleWalkEmbedding_le {c : G.Walk v v} (hc : c.IsCycle) {n : ℕ} (hlen : c.length = n + 3) :
    (SimpleGraph.cycleGraph (n + 3)).map (cycleWalkEmbedding hc hlen) ≤ G := by
  have hstep (i : Fin (n + 3)) : G.Adj (cycleWalkEmbedding hc hlen i)
      (cycleWalkEmbedding hc hlen (i + 1)) := by
    have hiLength : i.val < c.length := hlen.symm ▸ i.isLt
    have h := c.adj_getVert_succ hiLength
    change G.Adj (c.getVert i.val) (c.getVert (i + 1).val)
    by_cases hi : i.val + 1 < n + 3
    · rwa [Fin.val_add_one_of_lt' hi]
    · have he : i.val + 1 = n + 3 := by omega
      have hLast : i = Fin.last (n + 2) := Fin.ext (by simp; omega)
      have hEnd : i.val + 1 = c.length := he.trans hlen.symm
      rw [hEnd, c.getVert_length] at h
      simpa only [hLast, Fin.val_add_one, ite_true, c.getVert_zero] using h
  intro x y hadj
  obtain ⟨a, b, hab, rfl, rfl⟩ :=
    (SimpleGraph.map_adj (cycleWalkEmbedding hc hlen) _ x y).mp hadj
  rcases cycle_adj_step.mp hab with rfl | rfl
  · exact hstep a
  · exact (hstep b).symm

/-- A finite connected bridgeless graph with as many edges as vertices is a cycle. -/
theorem bridgeless_unicyclic_is_cycle [Finite V] (hG : G.Connected)
    (hRank : Nat.card G.edgeSet = Nat.card V)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e) :
    ∃ n : ℕ, Nonempty (SimpleGraph.cycleGraph (n + 3) ≃g G) := by
  classical
  have hNotAcyclic : ¬G.IsAcyclic := fun ha => by
    have hTree : G.IsTree := ⟨hG, ha⟩
    have hTreeCard := (SimpleGraph.isTree_iff_connected_and_card.mp hTree).2
    change Nat.card G.edgeSet + 1 = Nat.card V at hTreeCard
    omega
  obtain ⟨v, c, hc⟩ := by simpa only [SimpleGraph.IsAcyclic, not_forall, not_not] using hNotAcyclic
  let n := c.length - 3
  have hlen : c.length = n + 3 := by have ht := hc.three_le_length; dsimp [n]; omega
  refine ⟨n, ⟨iso_of_equal_rank_of_no_bridges hG SimpleGraph.connected_cycleGraph_add_one
    (cycleWalkEmbedding hc hlen) (cycleWalkEmbedding_le hc hlen) ?_ hNoBridge⟩⟩
  rw [cycle_edge_card, Nat.card_fin, hRank, Nat.add_comm]

end BraunBruegge
