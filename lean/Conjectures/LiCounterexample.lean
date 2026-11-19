import Conjectures.LiFullCoeffTrunc
import Conjectures.LiPartitionsFinal
import Conjectures.LiPartitionsCount
import Conjectures.LiTriplesFinal

/-!
# Li's counterexample as an actual connected vertex partition

The coefficient, tree, and certificate theorems are the contribution of
`aadrianvv` in pull request #35. This module assembles their conclusions and
transports the cut-component certificates to partitions into connected vertex
blocks. In particular, the coverage theorem uses the same block-connectivity
predicate as the exact count of the eight triple-plus-pair partitions.

The coefficient is taken in the elementary symmetric basis of the proper
colouring polynomial, not defined by the computed value. The final statements
have no mathematical premises.
-/

open SimpleGraph

namespace LiCounterexample

/-- The support of a connected component determines that component. -/
theorem suppFinset_injective (H : SimpleGraph (Fin 31)) :
    Function.Injective (LiFinal.suppFinset H) := by
  intro C D hCD
  apply SimpleGraph.ConnectedComponent.supp_injective
  ext v
  rw [← LiFinal.suppFinset_mem, ← LiFinal.suppFinset_mem, hCD]

/-- A component of a spanning subgraph of `T` is a connected vertex block in `T`.
Every walk used by the conclusion stays inside the component support. -/
theorem suppFinset_connIn {H : SimpleGraph (Fin 31)} (hHT : H ≤ Li.T)
    (C : H.ConnectedComponent) : Li.LiBridge.ConnIn (LiFinal.suppFinset H C) := by
  classical
  constructor
  · obtain ⟨v, hv⟩ := C.nonempty_supp
    exact ⟨v, (LiFinal.suppFinset_mem C v).mpr hv⟩
  · intro u hu v hv
    have huC := (LiFinal.suppFinset_mem C u).mp hu
    have hvC := (LiFinal.suppFinset_mem C v).mp hv
    obtain ⟨p⟩ := C.reachable_of_mem_supp huC hvC
    refine ⟨p.mapLe hHT, ?_⟩
    intro x hx
    have hxP : x ∈ p.support := by
      simpa only [SimpleGraph.Walk.support_mapLe_eq_support] using hx
    apply (LiFinal.suppFinset_mem C x).mpr
    rw [SimpleGraph.ConnectedComponent.mem_supp_iff] at huC ⊢
    have hux : H.connectedComponentMk u = H.connectedComponentMk x :=
      SimpleGraph.ConnectedComponent.sound (p.takeUntil x hxP).reachable
    exact hux.symm.trans huC

/-- The component supports of a complete component list form a vertex partition. -/
theorem component_supports_partition (H : SimpleGraph (Fin 31))
    (C : List H.ConnectedComponent) (hC : ∀ D : H.ConnectedComponent, D ∈ C) :
    Li.LiBridge.IsPartition ((C.map (LiFinal.suppFinset H)).toFinset) := by
  classical
  constructor
  · intro B hB
    obtain ⟨D, _, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hB)
    obtain ⟨v, hv⟩ := D.nonempty_supp
    exact ⟨v, (LiFinal.suppFinset_mem D v).mpr hv⟩
  constructor
  · intro B hB D hD hBD
    obtain ⟨B', _, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hB)
    obtain ⟨D', _, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hD)
    apply Finset.disjoint_left.mpr
    intro v hvB hvD
    have heq : B' = D' := SimpleGraph.ConnectedComponent.eq_of_common_vertex
      ((LiFinal.suppFinset_mem B' v).mp hvB)
      ((LiFinal.suppFinset_mem D' v).mp hvD)
    exact hBD (congrArg (LiFinal.suppFinset H) heq)
  · apply Finset.eq_univ_of_forall
    intro v
    refine Finset.mem_biUnion.mpr ⟨LiFinal.suppFinset H (H.connectedComponentMk v), ?_, ?_⟩
    · apply List.mem_toFinset.mpr
      exact List.mem_map.mpr ⟨H.connectedComponentMk v, hC _, rfl⟩
    · exact (LiFinal.suppFinset_mem (H.connectedComponentMk v) v).mpr rfl

/-- A connected partition into genuine vertex blocks, with the specified size
multiset. The blocks are nonempty, pairwise disjoint, and cover all 31 vertices. -/
def ConnectedPartitionOfType (p : List Nat) : Prop :=
  ∃ P : Finset (Finset (Fin 31)),
    Li.LiBridge.IsPartition P ∧
    (∀ B ∈ P, Li.LiBridge.ConnIn B) ∧
    P.val.map Finset.card = (p : Multiset Nat)

/-- The cut-component notion of partition type gives an actual connected
partition into vertex blocks. -/
theorem connectedPartitionType_blocks {p : List Nat}
    (hp : LiFinal.ConnectedPartitionType p) : ConnectedPartitionOfType p := by
  classical
  obtain ⟨mask, C, hnodup, hcomplete, htype⟩ := hp
  let H := LiFinal.cutGraph mask
  have hHT : H ≤ Li.T := fun u v huv => LiFinal.cutGraph_adj_T mask u v huv
  let blocks := C.map (LiFinal.suppFinset H)
  have hblocks : blocks.Nodup := List.Nodup.map (suppFinset_injective H) hnodup
  refine ⟨blocks.toFinset, component_supports_partition H C hcomplete, ?_, ?_⟩
  · intro B hB
    obtain ⟨D, _, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hB)
    exact suppFinset_connIn hHT D
  · rw [List.toFinset_val, List.dedup_eq_self.mpr hblocks, Multiset.map_coe]
    change ((C.map (LiFinal.suppFinset H)).map Finset.card : Multiset Nat) = ↑p
    rw [List.map_map]
    have hm : (fun D : H.ConnectedComponent => (LiFinal.suppFinset H D).card)
        = LiFinal.componentCard H := rfl
    rw [hm, htype]
    exact Multiset.coe_eq_coe.mpr (LiFinal.sortDesc_perm _).symm

/-- Every integer partition of 31 occurs as an actual connected vertex partition. -/
theorem all_partition_types (p : List Nat) (hp : LiFinal.IsPartitionOf 31 p) :
    ConnectedPartitionOfType p :=
  connectedPartitionType_blocks (LiFinal.all_partition_types p hp)

/-- There are exactly 6,842 realized canonical connected vertex-partition types. -/
theorem card_connected_partition_types :
    Nat.card {p : List Nat //
      LiFinal.IsPartitionOf 31 p ∧ ConnectedPartitionOfType p} = 6842 := by
  let e : {p : List Nat // LiFinal.IsPartitionOf 31 p ∧ ConnectedPartitionOfType p} ≃
      {p : List Nat // LiFinal.IsPartitionOf 31 p} :=
    { toFun := fun p => ⟨p.val, p.property.1⟩
      invFun := fun p => ⟨p.val, p.property, all_partition_types p.val p.property⟩
      left_inv := fun p => Subtype.ext rfl
      right_inv := fun p => Subtype.ext rfl }
  calc
    Nat.card {p : List Nat // LiFinal.IsPartitionOf 31 p ∧ ConnectedPartitionOfType p} =
        Nat.card {p : List Nat // LiFinal.IsPartitionOf 31 p} := Nat.card_congr e
    _ = Fintype.card {p : List Nat // LiFinal.IsPartitionOf 31 p} := Nat.card_eq_fintype_card
    _ = 6842 := LiFinal.card_partitions_31

/-- Every degree-four vertex has exactly the single leaf neighbour `1`. -/
theorem degree_four_leaf_neighbors (v : Fin 31) (hv : Li.T.degree v = 4) :
    (Li.T.neighborFinset v).filter (fun w => Li.T.degree w = 1) = {1} := by
  have hv0 := (Li.degree_eq_four_iff v).mp hv
  subst v
  exact Li.leaf_neighbors_zero

/-- No degree-four vertex of `T` has two leaf neighbours. -/
theorem no_degree_four_two_leaf_neighbors :
    ¬ ∃ v : Fin 31, Li.T.degree v = 4 ∧
      2 ≤ ((Li.T.neighborFinset v).filter (fun w => Li.T.degree w = 1)).card := by
  rintro ⟨v, hv, hleaves⟩
  have hv0 := (Li.degree_eq_four_iff v).mp hv
  subst v
  rw [Li.leaf_neighbors_zero, Finset.card_singleton] at hleaves
  omega

/-- The actual elementary coefficient in the 31-colour chromatic polynomial. -/
noncomputable def coefficient : ℚ :=
  LiFull.fullECoords.coeff
    (Finsupp.single (1 : Fin 31) 14 + Finsupp.single (2 : Fin 31) 1)

theorem coefficient_eq : coefficient = 29 := LiFull.fullECoords_coeff_29

/-- The coefficient violates Li's predicted strict negativity. -/
theorem coefficient_positive : 0 < coefficient := by
  rw [coefficient_eq]
  norm_num

/-- The thirty literal tree edges have exactly `2^30` possible cut subsets. -/
theorem edge_cut_choices_card :
    (Li.T.edgeFinset.powerset).card = 1073741824 := by
  norm_num [Finset.card_powerset, Li.edgeFinset_card]

attribute [local instance] Classical.propDecidable

/-- One statement of the counterexample, including the actual connected-block
coverage and the exact count of triple-plus-pair partitions. -/
theorem counterexample :
    Li.T.IsTree ∧
    (∀ v : Fin 31, Li.T.degree v ≤ 4) ∧
    (∃! v : Fin 31, Li.T.degree v = 4) ∧
    (∀ v : Fin 31, Li.T.degree v = 4 →
      ((Li.T.neighborFinset v).filter (fun w => Li.T.degree w = 1)).card = 1) ∧
    ¬ Li.IsSpider Li.T ∧
    ¬ Li.IsCaterpillar Li.T ∧
    Odd (Fintype.card (Fin 31)) ∧
    Nat.card {p : List Nat //
      LiFinal.IsPartitionOf 31 p ∧ ConnectedPartitionOfType p} = 6842 ∧
    (∀ p : List Nat, LiFinal.IsPartitionOf 31 p → ConnectedPartitionOfType p) ∧
    coefficient = 29 ∧
    Fintype.card {P : Finset (Finset (Fin 31)) // Li.LiBridge.Partition325 P} = 8 := by
  classical
  refine ⟨Li.T_isTree, Li.degree_le_four, Li.unique_degree_four, ?_, Li.not_spider,
    Li.not_caterpillar, by decide, card_connected_partition_types, all_partition_types,
    coefficient_eq, Li.LiFinal325.b_triple_pairs⟩
  intro v hv
  rw [degree_four_leaf_neighbors v hv, Finset.card_singleton]

end LiCounterexample
