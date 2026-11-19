import Conjectures.LiTriplesBridge

/-!
# Edge cuts and connected vertex partitions of Li's tree

The graph and the predicates for genuine connected vertex partitions are from
aadrianvv's pull request #35. This module proves the bijection with edge-cut
subsets and counts all connected vertex partitions, including multiplicities
of their block-size types. No enumeration of the billion edge subsets is used.
-/

open SimpleGraph

namespace LiConnectedPartitions

/-- In a forest, connectivity in a spanning subgraph recovers every retained
ambient edge. This is the injectivity step in the edge-cut correspondence. -/
theorem adj_of_reachable_subgraph {V : Type*} {G H : SimpleGraph V}
    (hG : G.IsAcyclic) (hHG : H ≤ G) {u v : V}
    (huv : G.Adj u v) (hr : H.Reachable u v) : H.Adj u v := by
  obtain ⟨p⟩ := hr
  have hb := (SimpleGraph.isAcyclic_iff_forall_adj_isBridge.mp hG) huv
  have he := (SimpleGraph.isBridge_iff_forall_walk_mem_edges.mp hb) (p.mapLe hHG)
  rw [SimpleGraph.Walk.edges_mapLe_eq_edges] at he
  exact p.adj_of_mem_edges he

noncomputable section

/-- All vertices in the component of `v`, as a finite block. -/
def componentBlock (H : SimpleGraph (Fin 31)) (v : Fin 31) : Finset (Fin 31) := by
  classical
  exact (H.connectedComponentMk v).supp.toFinset

@[simp]
theorem mem_componentBlock (H : SimpleGraph (Fin 31)) (u v : Fin 31) :
    u ∈ componentBlock H v ↔ H.Reachable u v := by
  classical
  simp [componentBlock, SimpleGraph.ConnectedComponent.mem_supp_iff,
    SimpleGraph.ConnectedComponent.eq]

theorem componentBlock_eq_of_reachable {H : SimpleGraph (Fin 31)} {u v : Fin 31}
    (h : H.Reachable u v) : componentBlock H u = componentBlock H v := by
  ext w
  simp only [mem_componentBlock]
  exact ⟨fun hw => hw.trans h, fun hw => hw.trans h.symm⟩

/-- The distinct component supports of a spanning graph. -/
def blocks (H : SimpleGraph (Fin 31)) : Finset (Finset (Fin 31)) :=
  Finset.univ.image (componentBlock H)

/-- Two vertices belong to one block of a proposed partition. -/
def SameBlock (P : Finset (Finset (Fin 31))) (u v : Fin 31) : Prop :=
  ∃ B ∈ P, u ∈ B ∧ v ∈ B

theorem sameBlock_blocks_iff (H : SimpleGraph (Fin 31)) (u v : Fin 31) :
    SameBlock (blocks H) u v ↔ H.Reachable u v := by
  constructor
  · rintro ⟨B, hB, hu, hv⟩
    obtain ⟨w, _, rfl⟩ := Finset.mem_image.mp hB
    exact ((mem_componentBlock H u w).mp hu).trans
      ((mem_componentBlock H v w).mp hv).symm
  · intro huv
    refine ⟨componentBlock H u, Finset.mem_image.mpr ⟨u, Finset.mem_univ u, rfl⟩,
      (mem_componentBlock H u u).mpr (SimpleGraph.Reachable.refl u), ?_⟩
    exact (mem_componentBlock H v u).mpr huv.symm

theorem blocks_partition (H : SimpleGraph (Fin 31)) :
    Li.LiBridge.IsPartition (blocks H) := by
  constructor
  · intro B hB
    obtain ⟨v, _, rfl⟩ := Finset.mem_image.mp hB
    exact ⟨v, (mem_componentBlock H v v).mpr (SimpleGraph.Reachable.refl v)⟩
  constructor
  · intro B hB C hC hBC
    obtain ⟨u, _, rfl⟩ := Finset.mem_image.mp hB
    obtain ⟨v, _, rfl⟩ := Finset.mem_image.mp hC
    apply Finset.disjoint_left.mpr
    intro w hwu hwv
    apply hBC
    apply componentBlock_eq_of_reachable
    exact ((mem_componentBlock H w u).mp hwu).symm.trans
      ((mem_componentBlock H w v).mp hwv)
  · apply Finset.eq_univ_of_forall
    intro v
    rw [Finset.mem_biUnion]
    refine ⟨componentBlock H v, ?_, ?_⟩
    · exact Finset.mem_image.mpr ⟨v, Finset.mem_univ v, rfl⟩
    · exact (mem_componentBlock H v v).mpr (SimpleGraph.Reachable.refl v)

theorem componentBlock_connected {H : SimpleGraph (Fin 31)} (hHT : H ≤ Li.T)
    (v : Fin 31) : Li.LiBridge.ConnIn (componentBlock H v) := by
  constructor
  · exact ⟨v, (mem_componentBlock H v v).mpr (SimpleGraph.Reachable.refl v)⟩
  · intro x hx y hy
    have hxv := (mem_componentBlock H x v).mp hx
    have hyv := (mem_componentBlock H y v).mp hy
    obtain ⟨p⟩ := hxv.trans hyv.symm
    refine ⟨p.mapLe hHT, ?_⟩
    intro z hz
    have hzp : z ∈ p.support := by
      simpa only [SimpleGraph.Walk.support_mapLe_eq_support] using hz
    exact (mem_componentBlock H z v).mpr
      ((p.takeUntil z hzp).reachable.symm.trans hxv)

/-- The actual connected vertex partitions, with no restriction on block sizes. -/
abbrev ConnectedPartition :=
  {P : Finset (Finset (Fin 31)) //
    Li.LiBridge.IsPartition P ∧ ∀ B ∈ P, Li.LiBridge.ConnIn B}

/-- Spanning subgraphs, represented on the same vertex type as the tree. -/
abbrev SpanningSubgraph := {H : SimpleGraph (Fin 31) // H ≤ Li.T}

def toConnectedPartition (H : SpanningSubgraph) : ConnectedPartition :=
  ⟨blocks H.val, blocks_partition H.val, by
    intro B hB
    obtain ⟨v, _, rfl⟩ := Finset.mem_image.mp hB
    exact componentBlock_connected H.property v⟩

theorem partition_block_eq {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) {B C : Finset (Fin 31)}
    (hB : B ∈ P) (hC : C ∈ P) {v : Fin 31} (hvB : v ∈ B) (hvC : v ∈ C) :
    B = C := by
  by_contra hBC
  exact Finset.disjoint_left.mp (hP.2.1 B hB C hC hBC) hvB hvC

theorem partition_covers {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) (v : Fin 31) : ∃ B ∈ P, v ∈ B := by
  have hv : v ∈ P.biUnion id := by rw [hP.2.2]; exact Finset.mem_univ v
  exact Finset.mem_biUnion.mp hv

/-- Retain precisely the tree edges internal to one block. -/
def withinGraph (P : Finset (Finset (Fin 31))) : SimpleGraph (Fin 31) where
  Adj u v := Li.T.Adj u v ∧ SameBlock P u v
  symm := ⟨by
    rintro u v ⟨huv, B, hB, hu, hv⟩
    exact ⟨huv.symm, B, hB, hv, hu⟩⟩
  loopless := ⟨fun _ h => h.1.ne rfl⟩

theorem withinGraph_le (P : Finset (Finset (Fin 31))) : withinGraph P ≤ Li.T :=
  fun _ _ h => h.1

theorem withinGraph_walk_mem {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) {u v : Fin 31} (p : (withinGraph P).Walk u v) :
    ∀ B ∈ P, u ∈ B → v ∈ B := by
  induction p with
  | nil => intro B _ hu; exact hu
  | @cons u w v huw p ih =>
    intro B hB huB
    obtain ⟨C, hC, huC, hwC⟩ := huw.2
    have hBC := partition_block_eq hP hB hC huB huC
    exact ih B hB (hBC.symm ▸ hwC)

theorem withinGraph_reachable_iff {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) (hConn : ∀ B ∈ P, Li.LiBridge.ConnIn B)
    (u v : Fin 31) : (withinGraph P).Reachable u v ↔ SameBlock P u v := by
  constructor
  · rintro ⟨p⟩
    obtain ⟨B, hB, huB⟩ := partition_covers hP u
    exact ⟨B, hB, huB, withinGraph_walk_mem hP p B hB huB⟩
  · rintro ⟨B, hB, huB, hvB⟩
    obtain ⟨p, hp⟩ := (hConn B hB).2 u huB v hvB
    refine ⟨p.transfer (withinGraph P) ?_⟩
    intro e
    refine Sym2.ind (fun x y hxy => ?_) e
    exact ⟨p.adj_of_mem_edges hxy, B, hB,
      hp x (p.fst_mem_support_of_mem_edges hxy),
      hp y (p.snd_mem_support_of_mem_edges hxy)⟩

theorem componentBlock_withinGraph {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) (hConn : ∀ B ∈ P, Li.LiBridge.ConnIn B)
    {B : Finset (Fin 31)} (hB : B ∈ P) {v : Fin 31} (hv : v ∈ B) :
    componentBlock (withinGraph P) v = B := by
  ext w
  rw [mem_componentBlock, withinGraph_reachable_iff hP hConn]
  constructor
  · rintro ⟨C, hC, hw, hvC⟩
    have hCB := partition_block_eq hP hC hB hvC hv
    exact hCB ▸ hw
  · intro hw
    exact ⟨B, hB, hw, hv⟩

theorem blocks_withinGraph {P : Finset (Finset (Fin 31))}
    (hP : Li.LiBridge.IsPartition P) (hConn : ∀ B ∈ P, Li.LiBridge.ConnIn B) :
    blocks (withinGraph P) = P := by
  ext B
  constructor
  · intro hB
    obtain ⟨v, _, rfl⟩ := Finset.mem_image.mp hB
    obtain ⟨C, hC, hv⟩ := partition_covers hP v
    rw [componentBlock_withinGraph hP hConn hC hv]
    exact hC
  · intro hB
    obtain ⟨v, hv⟩ := hP.1 B hB
    exact Finset.mem_image.mpr ⟨v, Finset.mem_univ v,
      componentBlock_withinGraph hP hConn hB hv⟩

theorem withinGraph_blocks {H : SimpleGraph (Fin 31)} (hHT : H ≤ Li.T) :
    withinGraph (blocks H) = H := by
  ext u v
  change (Li.T.Adj u v ∧ SameBlock (blocks H) u v) ↔ H.Adj u v
  constructor
  · rintro ⟨huv, hB⟩
    exact adj_of_reachable_subgraph Li.T_isTree.isAcyclic hHT huv
      ((sameBlock_blocks_iff H u v).mp hB)
  · intro huv
    exact ⟨hHT huv, (sameBlock_blocks_iff H u v).mpr huv.reachable⟩

/-- A spanning subgraph of a tree is uniquely determined by its connected blocks. -/
def subgraphPartitionEquiv : SpanningSubgraph ≃ ConnectedPartition where
  toFun := toConnectedPartition
  invFun P := ⟨withinGraph P.val, withinGraph_le P.val⟩
  left_inv H := Subtype.ext (withinGraph_blocks H.property)
  right_inv P := Subtype.ext (blocks_withinGraph P.property.1 P.property.2)

/-- An arbitrary subset of the 30 tree edges. -/
abbrev EdgeChoice := ↥(Li.T.edgeFinset.powerset)

def graphOfEdges (E : EdgeChoice) : SpanningSubgraph :=
  ⟨SimpleGraph.fromEdgeSet (E.val : Set (Sym2 (Fin 31))), by
    intro u v huv
    have he : s(u, v) ∈ E.val := huv.1
    exact SimpleGraph.mem_edgeFinset.mp ((Finset.mem_powerset.mp E.property) he)⟩

def edgesOfGraph (H : SpanningSubgraph) : EdgeChoice := by
  classical
  exact ⟨H.val.edgeFinset, Finset.mem_powerset.mpr (by
    intro e
    refine Sym2.ind (fun u v he => ?_) e
    exact SimpleGraph.mem_edgeFinset.mpr (H.property (SimpleGraph.mem_edgeFinset.mp he)))⟩

theorem edgesOfGraph_graphOfEdges (E : EdgeChoice) : edgesOfGraph (graphOfEdges E) = E := by
  apply Subtype.ext
  ext e
  simp only [edgesOfGraph, SimpleGraph.mem_edgeFinset]
  change e ∈ (SimpleGraph.fromEdgeSet (E.val : Set (Sym2 (Fin 31)))).edgeSet ↔ e ∈ E.val
  refine Sym2.ind (fun u v => ?_) e
  simp only [SimpleGraph.mem_edgeSet, SimpleGraph.fromEdgeSet_adj, Finset.mem_coe]
  constructor
  · exact And.left
  · intro he
    have huv : Li.T.Adj u v :=
      SimpleGraph.mem_edgeFinset.mp ((Finset.mem_powerset.mp E.property) he)
    exact ⟨he, huv.ne⟩

theorem graphOfEdges_edgesOfGraph (H : SpanningSubgraph) : graphOfEdges (edgesOfGraph H) = H := by
  classical
  apply Subtype.ext
  change SimpleGraph.fromEdgeSet (H.val.edgeFinset : Set (Sym2 (Fin 31))) = H.val
  rw [SimpleGraph.coe_edgeFinset, SimpleGraph.fromEdgeSet_edgeSet]

def edgeSubgraphEquiv : EdgeChoice ≃ SpanningSubgraph where
  toFun := graphOfEdges
  invFun := edgesOfGraph
  left_inv := edgesOfGraph_graphOfEdges
  right_inv := graphOfEdges_edgesOfGraph

/-- Exchange the cut edges with the retained edges. -/
def complementEdges (E : EdgeChoice) : EdgeChoice :=
  ⟨Li.T.edgeFinset \ E.val, Finset.mem_powerset.mpr Finset.sdiff_subset⟩

theorem complementEdges_involutive : Function.Involutive complementEdges := by
  intro E
  apply Subtype.ext
  change Li.T.edgeFinset \ (Li.T.edgeFinset \ E.val) = E.val
  rw [Finset.sdiff_sdiff_self_left,
    Finset.inter_eq_right.mpr (Finset.mem_powerset.mp E.property)]

def complementEquiv : EdgeChoice ≃ EdgeChoice where
  toFun := complementEdges
  invFun := complementEdges
  left_inv := complementEdges_involutive
  right_inv := complementEdges_involutive

/-- The exact edge-cut/connected-vertex-partition correspondence for Li's tree. -/
def cutPartitionEquiv : EdgeChoice ≃ ConnectedPartition :=
  complementEquiv.trans (edgeSubgraphEquiv.trans subgraphPartitionEquiv)

theorem cutPartitionEquiv_blocks (E : EdgeChoice) :
    (cutPartitionEquiv E).val =
      blocks (SimpleGraph.fromEdgeSet ((Li.T.edgeFinset \ E.val : Finset (Sym2 (Fin 31))) :
        Set (Sym2 (Fin 31)))) := rfl

/-- The total multiplicity across all connected-partition types is `2^30`. -/
theorem connected_partitions_card :
    Nat.card {P : Finset (Finset (Fin 31)) //
      Li.LiBridge.IsPartition P ∧ ∀ B ∈ P, Li.LiBridge.ConnIn B} = 1073741824 := by
  calc
    Nat.card ConnectedPartition = Nat.card EdgeChoice := Nat.card_congr cutPartitionEquiv.symm
    _ = Li.T.edgeFinset.powerset.card := by
      rw [Nat.card_eq_fintype_card]
      exact Fintype.card_coe _
    _ = 1073741824 := by
      have hc : Li.T.edgeFinset.card = 30 := by
        calc
          Li.T.edgeFinset.card = Fintype.card Li.T.edgeSet :=
            SimpleGraph.edgeFinset_card (G := Li.T)
          _ = Nat.card Li.T.edgeSet := Nat.card_eq_fintype_card.symm
          _ = 30 := Li.card_edgeSet
      norm_num [Finset.card_powerset, hc]

end

end LiConnectedPartitions
