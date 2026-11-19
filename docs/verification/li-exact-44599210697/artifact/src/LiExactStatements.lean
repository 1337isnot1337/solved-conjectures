import Conjectures.LiCounterexample
import Conjectures.LiNegativeCoefficient
import Conjectures.LiConnectedPartitions

open scoped BigOperators

noncomputable section

attribute [local instance] Classical.propDecidable

-- This is the proper-colouring sum, with one variable for every colour.
example {σ : Type*} [Fintype σ] [DecidableEq σ] :
    LiFull.fullChromPolyOn (σ := σ) Li.T =
      ∑ κ ∈ (Finset.univ : Finset (Fin 31 → σ)).filter
        (fun κ => ∀ u v, Li.T.Adj u v → κ u ≠ κ v),
        ∏ v : Fin 31, (MvPolynomial.X (κ v) : MvPolynomial σ ℚ) := by
  unfold LiFull.fullChromPolyOn
  exact Finset.sum_congr (Finset.filter_congr (fun _ _ => Iff.rfl))
    (fun _ _ => rfl)

example : Li.T.IsTree := Li.T_isTree

example : ∀ v : Fin 31, Li.T.degree v ≤ 4 := Li.degree_le_four

example : ∃! v : Fin 31, Li.T.degree v = 4 := Li.unique_degree_four

example : (Li.T.neighborFinset 0).filter (fun w => Li.T.degree w = 1) = {1} :=
  Li.leaf_neighbors_zero

example : ¬ Li.IsSpider Li.T := Li.not_spider

example : ¬ Li.IsCaterpillar Li.T := Li.not_caterpillar

-- The component list is complete and has no repetitions.
example (p : List Nat) (hp : LiFinal.IsPartitionOf 31 p) :
    ∃ (mask : Nat) (C : List ((LiFinal.cutGraph mask).ConnectedComponent)),
      C.Nodup ∧
      (∀ D : (LiFinal.cutGraph mask).ConnectedComponent, D ∈ C) ∧
      p = LiFinal.sortDesc (C.map (LiFinal.componentCard (LiFinal.cutGraph mask))) :=
  LiFinal.all_partition_types p hp

example (mask : Nat) (u v : Fin 31)
    (h : (LiFinal.cutGraph mask).Adj u v) : Li.T.Adj u v :=
  LiFinal.cutGraph_adj_T mask u v h

example : Fintype.card {p : List Nat // LiFinal.IsPartitionOf 31 p} = 6842 :=
  LiFinal.card_partitions_31

-- The counted objects are connected vertex partitions of type (3, 2^14).
example (P : Finset (Finset (Fin 31))) :
    Li.LiBridge.Partition325 P ↔
      ((∀ B ∈ P, B.Nonempty) ∧
        (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
        P.biUnion id = Finset.univ) ∧
      ((P.filter (fun B => B.card = 3)).card = 1 ∧
        (∀ B ∈ P, B.card = 3 ∨ B.card = 2)) ∧
      (∀ B ∈ P, B.Nonempty ∧ ∀ u ∈ B, ∀ v ∈ B,
        ∃ q : Li.T.Walk u v, ∀ x ∈ q.support, x ∈ B) := Iff.rfl

example :
    Fintype.card {P : Finset (Finset (Fin 31)) // Li.LiBridge.Partition325 P} = 8 :=
  Li.LiFinal325.b_triple_pairs


-- The coverage predicate is a partition into actual connected vertex blocks.
example (p : List Nat) :
    LiCounterexample.ConnectedPartitionOfType p ↔
      ∃ P : Finset (Finset (Fin 31)),
        ((∀ B ∈ P, B.Nonempty) ∧
          (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
          P.biUnion id = Finset.univ) ∧
        (∀ B ∈ P, B.Nonempty ∧ ∀ u ∈ B, ∀ v ∈ B,
          ∃ q : Li.T.Walk u v, ∀ x ∈ q.support, x ∈ B) ∧
        P.val.map Finset.card = (p : Multiset Nat) := Iff.rfl

example :
    Li.T.IsTree ∧
    (∀ v : Fin 31, Li.T.degree v ≤ 4) ∧
    (∃! v : Fin 31, Li.T.degree v = 4) ∧
    (∀ v : Fin 31, Li.T.degree v = 4 →
      ((Li.T.neighborFinset v).filter (fun w => Li.T.degree w = 1)).card = 1) ∧
    ¬ Li.IsSpider Li.T ∧
    ¬ Li.IsCaterpillar Li.T ∧
    Odd (Fintype.card (Fin 31)) ∧
    Nat.card {p : List Nat //
      LiFinal.IsPartitionOf 31 p ∧ LiCounterexample.ConnectedPartitionOfType p} = 6842 ∧
    (∀ p : List Nat, LiFinal.IsPartitionOf 31 p →
      LiCounterexample.ConnectedPartitionOfType p) ∧
    LiCounterexample.coefficient = 29 ∧
    Fintype.card {P : Finset (Finset (Fin 31)) // Li.LiBridge.Partition325 P} = 8 :=
  LiCounterexample.counterexample

example : ¬ ∃ v : Fin 31, Li.T.degree v = 4 ∧
    2 ≤ ((Li.T.neighborFinset v).filter (fun w => Li.T.degree w = 1)).card :=
  LiCounterexample.no_degree_four_two_leaf_neighbors

example {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
        LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 14 +
        Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 1) = 29 :=
  Li.full_li_coefficient_of_card hσ

example {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
        LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ)) 8 +
        Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ)) 5) = -6304 :=
  Li.full_negative_coefficient_of_card hσ

example {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) :
    ¬ (∀ d : Fin (Fintype.card σ) →₀ ℕ,
      0 ≤ ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
        ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
          LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff d) :=
  Li.not_elementary_positive_of_card hσ

example :
    LiFull.chromECoords.coeff
        (Finsupp.single (1 : Fin 3) 14 + Finsupp.single (2 : Fin 3) 1) = 29 ∧
    LiFull.chromECoords.coeff
        (Finsupp.single (1 : Fin 3) 11 + Finsupp.single (2 : Fin 3) 3) = 83 ∧
    LiFull.chromECoords.coeff
        (Finsupp.single (1 : Fin 3) 8 + Finsupp.single (2 : Fin 3) 5) = -6304 ∧
    LiFull.chromECoords.coeff
        (Finsupp.single (1 : Fin 3) 5 + Finsupp.single (2 : Fin 3) 7) = -6800 ∧
    LiFull.chromECoords.coeff
        (Finsupp.single (1 : Fin 3) 2 + Finsupp.single (2 : Fin 3) 9) = -8384 :=
  LiNegativeCoefficient.five_coefficients

-- The colour type is arbitrary, and both exponent vectors and values are literal.
example {σ : Type*} [Fintype σ] [DecidableEq σ]
    (hσ : 31 ≤ Fintype.card σ) (i : Fin 5) :
    ((MvPolynomial.esymmAlgEquiv σ ℚ (n := Fintype.card σ) rfl).symm
      ⟨LiFull.fullChromPolyOn (σ := σ) Li.T,
        LiFull.fullChromPolyOn_isSymmetric Li.T⟩).coeff
      (Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ))
        ((![14, 11, 8, 5, 2] : Fin 5 → ℕ) i) +
      Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ))
        ((![1, 3, 5, 7, 9] : Fin 5 → ℕ) i)) =
          (![29, 83, -6304, -6800, -8384] : Fin 5 → ℚ) i := by
  have hindex :
      Finsupp.embDomain (LiFull.iotaMN hσ)
        (Finsupp.embDomain LiFull.iota (LiInterpolation.exponents i)) =
      Finsupp.single (⟨1, by omega⟩ : Fin (Fintype.card σ))
        ((![14, 11, 8, 5, 2] : Fin 5 → ℕ) i) +
      Finsupp.single (⟨2, by omega⟩ : Fin (Fintype.card σ))
        ((![1, 3, 5, 7, 9] : Fin 5 → ℕ) i) := by
    simp only [LiInterpolation.exponents, Finsupp.embDomain_add,
      Finsupp.embDomain_single]
    rfl
  have h := Li.full_e2e3_coefficients_of_card (σ := σ) hσ i
  rw [hindex] at h
  exact h


-- Acyclicity forces an ambient edge between connected vertices to be retained.
example {V : Type*} {G H : SimpleGraph V}
    (hG : G.IsAcyclic) (hHG : H ≤ G) {u v : V}
    (huv : G.Adj u v) (hr : H.Reachable u v) : H.Adj u v :=
  LiConnectedPartitions.adj_of_reachable_subgraph hG hHG huv hr

-- The codomain consists of literal nonempty, disjoint, covering vertex blocks
-- joined by walks that stay inside each block, with no block-size restriction.
example :
    ↥(Li.T.edgeFinset.powerset) ≃
      {P : Finset (Finset (Fin 31)) //
        ((∀ B ∈ P, B.Nonempty) ∧
          (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
          P.biUnion id = Finset.univ) ∧
        (∀ B ∈ P, B.Nonempty ∧ ∀ u ∈ B, ∀ v ∈ B,
          ∃ q : Li.T.Walk u v, ∀ x ∈ q.support, x ∈ B)} :=
  LiConnectedPartitions.cutPartitionEquiv

-- The input contains deleted edges, so the partition comes from its complement.
example (E : ↥(Li.T.edgeFinset.powerset)) :
    (LiConnectedPartitions.cutPartitionEquiv E).val =
      LiConnectedPartitions.blocks (SimpleGraph.fromEdgeSet
        ((Li.T.edgeFinset \ E.val : Finset (Sym2 (Fin 31))) : Set (Sym2 (Fin 31)))) :=
  LiConnectedPartitions.cutPartitionEquiv_blocks E

-- Membership in a common output block is exactly retained-edge reachability.
example (E : ↥(Li.T.edgeFinset.powerset)) (u v : Fin 31) :
    (∃ B ∈ (LiConnectedPartitions.cutPartitionEquiv E).val, u ∈ B ∧ v ∈ B) ↔
      (SimpleGraph.fromEdgeSet
        ((Li.T.edgeFinset \ E.val : Finset (Sym2 (Fin 31))) :
          Set (Sym2 (Fin 31)))).Reachable u v := by
  rw [LiConnectedPartitions.cutPartitionEquiv_blocks]
  exact LiConnectedPartitions.sameBlock_blocks_iff _ u v

-- The counted objects are all connected vertex partitions, not just cut choices
-- or their block-size types.
example :
    Nat.card {P : Finset (Finset (Fin 31)) //
      ((∀ B ∈ P, B.Nonempty) ∧
        (∀ B ∈ P, ∀ C ∈ P, B ≠ C → Disjoint B C) ∧
        P.biUnion id = Finset.univ) ∧
      (∀ B ∈ P, B.Nonempty ∧ ∀ u ∈ B, ∀ v ∈ B,
        ∃ q : Li.T.Walk u v, ∀ x ∈ q.support, x ∈ B)} = 1073741824 :=
  LiConnectedPartitions.connected_partitions_card

end
