import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Data.Set.Card

/-! The cycle rank of an embedded connected graph cannot exceed that of
its connected ambient graph. At equality, every remaining edge is a bridge. -/

open scoped Sym2

namespace BraunBruegge

variable {V W : Type*}

private theorem acyclic_map_embedding [Nonempty W] {H : SimpleGraph W} (hH : H.IsAcyclic)
    (f : W ↪ V) : (H.map f).IsAcyclic := by
  apply SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mpr
  intro x y hxy
  obtain ⟨a, b, hab, rfl, rfl⟩ := (SimpleGraph.map_adj f H x y).mp hxy
  have hInv := Function.leftInverse_invFun f.injective
  let inv : (H.map f).deleteEdges {s(f a, f b)} →g H.deleteEdges {s(a, b)} :=
    ⟨Function.invFun f, fun {p q} hpq => by
      obtain ⟨hadj, hne⟩ := SimpleGraph.deleteEdges_adj.mp hpq
      obtain ⟨u, v, huv, rfl, rfl⟩ := (SimpleGraph.map_adj f H p q).mp hadj
      rw [hInv u, hInv v]
      apply SimpleGraph.deleteEdges_adj.mpr
      refine ⟨huv, ?_⟩
      intro h
      apply hne
      simpa only [Set.mem_singleton_iff, Sym2.map_mk] using
        congrArg (Sym2.map (f : W → V)) (Set.mem_singleton_iff.mp h)⟩
  rw [SimpleGraph.isBridge_iff]
  intro hReach
  apply SimpleGraph.isBridge_iff.mp
    (SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hH hab)
  have hm := hReach.map inv
  change (H.deleteEdges {s(a, b)}).Reachable (Function.invFun f (f a))
    (Function.invFun f (f b)) at hm
  simpa only [hInv a, hInv b] using hm

private theorem tree_intersection_edges {H T : SimpleGraph W} {S : SimpleGraph V}
    (hT : T.Connected) (hS : S.IsAcyclic) (f : W ↪ V) (hTH : T ≤ H) (hTS : T.map f ≤ S) :
    S.edgeSet ∩ (H.map f).edgeSet = (T.map f).edgeSet := by
  apply Set.Subset.antisymm
  · intro e he
    obtain ⟨e', he', rfl⟩ := (SimpleGraph.edgeSet_map f H) ▸ he.2
    induction e' using Sym2.inductionOn with
    | hf a b =>
      change s(f a, f b) ∈ (T.map f).edgeSet
      by_contra hn
      have hle : T.map f ≤ S.deleteEdges {s(f a, f b)} := by
        intro x y hxy
        refine SimpleGraph.deleteEdges_adj.mpr ⟨hTS hxy, ?_⟩
        intro h
        exact hn ((Set.mem_singleton_iff.mp h) ▸ ((SimpleGraph.mem_edgeSet _).mpr hxy))
      have hr := ((hT.preconnected a b).map (SimpleGraph.Embedding.map f T).toHom).mono hle
      exact SimpleGraph.isBridge_iff.mp (SimpleGraph.isAcyclic_iff_forall_isBridge.mp hS he.1) hr
  · intro e he
    exact ⟨SimpleGraph.edgeSet_mono hTS he,
      SimpleGraph.edgeSet_mono (SimpleGraph.map_monotone f hTH) he⟩

/-- A connected subgraph has at most the cycle rank of its connected ambient graph. -/
theorem embedded_connected_rank_le [Finite V] [Finite W] {G : SimpleGraph V} {H : SimpleGraph W}
    (hG : G.Connected) (hH : H.Connected) (f : W ↪ V) (hle : H.map f ≤ G) :
    Nat.card H.edgeSet + Nat.card V ≤ Nat.card G.edgeSet + Nat.card W := by
  obtain ⟨T, hTH, hT⟩ := hH.exists_isTree_le
  let _ := hH.nonempty
  obtain ⟨S, hTS, hSG, hS⟩ := hG.exists_isTree_le_of_le_of_isAcyclic
    ((SimpleGraph.map_monotone f hTH).trans hle) (acyclic_map_embedding hT.isAcyclic f)
  have hUnion : (S.edgeSet ∪ (H.map f).edgeSet).ncard ≤ G.edgeSet.ncard :=
    Set.ncard_le_ncard (Set.union_subset (SimpleGraph.edgeSet_mono hSG) (SimpleGraph.edgeSet_mono hle))
  have hMapped (A : SimpleGraph W) : (A.map f).edgeSet.ncard = A.edgeSet.ncard := by
    rw [SimpleGraph.edgeSet_map, Set.ncard_image_of_injective _ f.sym2Map.injective]
  have hCount := Set.ncard_union_add_ncard_inter S.edgeSet (H.map f).edgeSet
  rw [tree_intersection_edges hT.connected hS.isAcyclic f hTH hTS,
    hMapped T, hMapped H] at hCount
  have hCardS := (SimpleGraph.isTree_iff_connected_and_card.mp hS).2
  have hCardT := (SimpleGraph.isTree_iff_connected_and_card.mp hT).2
  change Nat.card S.edgeSet + 1 = Nat.card V at hCardS
  change Nat.card T.edgeSet + 1 = Nat.card W at hCardT
  change (S.edgeSet ∪ (H.map f).edgeSet).ncard + Nat.card T.edgeSet =
    Nat.card S.edgeSet + Nat.card H.edgeSet at hCount
  change (S.edgeSet ∪ (H.map f).edgeSet).ncard ≤ Nat.card G.edgeSet at hUnion
  omega

/-- A connected subgraph of equal cycle rank contains every non-bridge edge. -/
theorem extra_edge_isBridge_of_equal_rank [Finite V] [Finite W] {G : SimpleGraph V}
    {H : SimpleGraph W} (hG : G.Connected) (hH : H.Connected) (f : W ↪ V)
    (hle : H.map f ≤ G)
    (hRank : Nat.card H.edgeSet + Nat.card V = Nat.card G.edgeSet + Nat.card W)
    {e : Sym2 V} (he : e ∈ G.edgeSet) (hExtra : e ∉ (H.map f).edgeSet) :
    G.IsBridge e := by
  by_contra hb
  have hConnected := hG.preconnected.connected_deleteEdges_of_not_isBridge hb
  have hle' : H.map f ≤ G.deleteEdges {e} := by
    intro x y hxy
    refine SimpleGraph.deleteEdges_adj.mpr ⟨hle hxy, ?_⟩
    intro h
    exact hExtra ((Set.mem_singleton_iff.mp h) ▸ ((SimpleGraph.mem_edgeSet _).mpr hxy))
  have hSmaller : (G.deleteEdges {e}).edgeSet.ncard < G.edgeSet.ncard := by
    rw [SimpleGraph.edgeSet_deleteEdges]
    exact Set.ncard_lt_ncard (lt_of_le_not_ge Set.sdiff_subset
      (fun h => (h he).2 (Set.mem_singleton e))) (Set.toFinite _)
  change Nat.card (G.deleteEdges {e}).edgeSet < Nat.card G.edgeSet at hSmaller
  have hBound := embedded_connected_rank_le hConnected hH f hle'
  omega

/-- In a bridgeless connected graph, an embedded connected subgraph of equal
cycle rank is the entire graph. -/
noncomputable def iso_of_equal_rank_of_no_bridges [Finite V] [Finite W]
    {G : SimpleGraph V} {H : SimpleGraph W} (hG : G.Connected) (hH : H.Connected) (f : W ↪ V)
    (hle : H.map f ≤ G)
    (hRank : Nat.card H.edgeSet + Nat.card V = Nat.card G.edgeSet + Nat.card W)
    (hNoBridge : ∀ e ∈ G.edgeSet, ¬G.IsBridge e) : H ≃g G := by
  classical
  have hEq : H.map f = G := by
    apply SimpleGraph.edgeSet_injective
    refine Set.Subset.antisymm (SimpleGraph.edgeSet_mono hle) ?_
    intro e he
    by_contra hExtra
    exact hNoBridge e he (extra_edge_isBridge_of_equal_rank hG hH f hle hRank he hExtra)
  have hf : Function.Surjective f := by
    intro v
    rcases subsingleton_or_nontrivial V with hSub | hNontrivial
    · obtain ⟨w⟩ := hH.nonempty
      exact ⟨w, Subsingleton.elim _ _⟩
    · obtain ⟨p, hp⟩ := hG.preconnected.exists_adj_of_nontrivial v
      obtain ⟨a, _, _, ha, _⟩ := (SimpleGraph.map_adj f H v p).mp (hEq.symm ▸ hp)
      exact ⟨a, ha⟩
  let e := Equiv.ofBijective f ⟨f.injective, hf⟩
  exact hEq ▸ SimpleGraph.Iso.map e H

end BraunBruegge
