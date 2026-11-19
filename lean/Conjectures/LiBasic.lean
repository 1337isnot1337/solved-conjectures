import Mathlib.Combinatorics.SimpleGraph.Acyclic
import Mathlib.Combinatorics.SimpleGraph.Bipartite
import Mathlib.Combinatorics.SimpleGraph.DegreeSum
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.Fin.Basic

/-!
# Li's coefficient-sign counterexample: the explicit tree

This file defines the explicit 31-vertex tree from
`results/li-coefficient-sign/PROOF.md` and proves its structural properties:
it is a tree of maximum degree four, it is neither a spider nor a caterpillar,
its unique degree-four vertex has exactly one leaf neighbour, and its
bipartition has class sizes 15 and 16.

Vertices are `0, ..., 30`.  Consecutive vertices on each of the paths
`(0,1)`, `(0,2,3)`, `(0,4,...,14)`, `(8,15)`, `(0,16,...,30)` are adjacent.
-/

open SimpleGraph

namespace Li

/-- The five paths of the counterexample, as an oriented edge list. -/
def pathEdges : List (Fin 31 × Fin 31) :=
  [(0,1)] ++
  [(0,2),(2,3)] ++
  [(0,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(11,12),(12,13),(13,14)] ++
  [(8,15)] ++
  [(0,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),
   (24,25),(25,26),(26,27),(27,28),(28,29),(29,30)]

/-- The counterexample tree. -/
def T : SimpleGraph (Fin 31) where
  Adj u v := u ≠ v ∧ ((u, v) ∈ pathEdges ∨ (v, u) ∈ pathEdges)
  symm := ⟨fun {_u _v} h => ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun u h => h.1 rfl⟩

instance : DecidableRel T.Adj := by
  intro u v
  exact inferInstanceAs (Decidable (u ≠ v ∧ ((u, v) ∈ pathEdges ∨ (v, u) ∈ pathEdges)))

instance (v : Fin 31) : Fintype (T.neighborSet v) := T.neighborSetFintype v

/-- Distance from vertex `0`, tabulated explicitly. -/
def rankList : List ℕ :=
  [0,1,1,2,1,2,3,4,5,6,7,8,9,10,11,6,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

/-- The distance from vertex `0` in `T`. -/
def rankOf (v : Fin 31) : ℕ := rankList.getD v.val 0

/-- Parent of each vertex in the rooted tree at `0`. -/
def parList : List ℕ :=
  [0,0,0,2,0,4,5,6,7,8,9,10,11,12,13,8,0,16,17,18,19,20,21,22,23,24,25,26,27,28,29]

/-- The parent of a vertex, with `parOf 0 = 0`. -/
def parOf (v : Fin 31) : Fin 31 := ⟨parList.getD v.val 0, by
  have : parList.getD v.val 0 < 31 := by
    revert v
    decide
  omega⟩

theorem edgeFinset_card : T.edgeFinset.card = 30 := by decide

theorem card_edgeSet : Nat.card T.edgeSet = 30 := by
  rw [Nat.card_eq_fintype_card, ← SimpleGraph.edgeFinset_card, edgeFinset_card]

/-- Every edge of `T` changes the rank by exactly one. -/
theorem rank_change : ∀ u v : Fin 31, T.Adj u v →
    rankOf u + 1 = rankOf v ∨ rankOf v + 1 = rankOf u := by decide

/-- Each vertex has at most one neighbour of smaller rank. -/
theorem unique_lower_neighbor : ∀ v : Fin 31, ¬ ∃ u w : Fin 31, u ≠ w ∧ T.Adj u v ∧ T.Adj w v ∧
    rankOf u + 1 = rankOf v ∧ rankOf w + 1 = rankOf v := by decide

theorem par_adj_all : ∀ v : Fin 31, v ≠ 0 → T.Adj v (parOf v) := by decide

theorem par_rank_all : ∀ v : Fin 31, v ≠ 0 → rankOf (parOf v) < rankOf v := by decide

/-- Every vertex is reachable from the root `0`. -/
theorem reachable_zero (v : Fin 31) : T.Reachable v 0 := by
  have aux : ∀ n, ∀ v : Fin 31, rankOf v = n → T.Reachable v 0 := by
    intro n
    induction n using Nat.strong_induction_on with
    | _ n ih =>
      intro v hv
      by_cases h0 : v = 0
      · subst h0
        exact SimpleGraph.Reachable.rfl
      · have hlt : rankOf (parOf v) < rankOf v := par_rank_all v h0
        have hwalk : T.Reachable v (parOf v) :=
          ⟨SimpleGraph.Walk.cons (par_adj_all v h0) SimpleGraph.Walk.nil⟩
        exact hwalk.trans (ih (rankOf (parOf v)) (by omega) (parOf v) rfl)
  exact aux (rankOf v) v rfl

theorem T_connected : T.Connected :=
  ⟨fun u v => (reachable_zero u).trans (reachable_zero v).symm⟩

/-- The counterexample graph is a tree. -/
theorem T_isTree : T.IsTree := by
  rw [SimpleGraph.isTree_iff_connected_and_card]
  refine ⟨T_connected, ?_⟩
  rw [card_edgeSet]
  simp [Nat.card_eq_fintype_card]

/-- Vertices at odd distance from `0` (the `A` side of the bipartition). -/
def sideA : Finset (Fin 31) := Finset.univ.filter (fun v => rankOf v % 2 = 1)

/-- Vertices at even distance from `0` (the `B` side of the bipartition). -/
def sideB : Finset (Fin 31) := Finset.univ.filter (fun v => rankOf v % 2 = 0)

theorem card_sideA : sideA.card = 16 := by decide
theorem card_sideB : sideB.card = 15 := by decide

theorem mem_sideA_iff (v : Fin 31) : v ∈ sideA ↔ rankOf v % 2 = 1 := by
  simp [sideA]

theorem mem_sideB_iff (v : Fin 31) : v ∈ sideB ↔ rankOf v % 2 = 0 := by
  simp [sideB]

theorem cross_adj : ∀ u v : Fin 31, T.Adj u v → (u ∈ sideA ↔ v ∈ sideB) := by decide

/-- The parity colouring of the tree with two colours. -/
def parityColor (v : Fin 31) : Fin 2 := ⟨rankOf v % 2, by
  have := Nat.mod_lt (rankOf v) (by omega : 0 < 2)
  omega⟩

theorem parityColor_proper : ∀ u v : Fin 31, T.Adj u v → parityColor u ≠ parityColor v := by
  intro u v h heq
  have hr := rank_change u v h
  have hval := congrArg Fin.val heq
  simp only [parityColor] at hval
  rcases hr with h' | h' <;> omega

theorem parityColor_eq_one (v : Fin 31) : parityColor v = 1 ↔ v ∈ sideA := by
  rw [mem_sideA_iff]
  constructor
  · intro h
    have := congrArg Fin.val h
    simpa [parityColor] using this
  · intro h
    apply Fin.ext
    simp [parityColor, h]

theorem parityColor_eq_zero (v : Fin 31) : parityColor v = 0 ↔ v ∈ sideB := by
  constructor
  · intro h
    rw [mem_sideB_iff]
    have := congrArg Fin.val h
    simpa [parityColor] using this
  · intro h
    rw [mem_sideB_iff] at h
    apply Fin.ext
    simp [parityColor, h]

/-- The unique degree-four vertex is `0`. -/
theorem degree_eq_four_iff (v : Fin 31) : T.degree v = 4 ↔ v = 0 := by
  revert v
  decide

/-- Exactly one vertex has degree four. -/
theorem unique_degree_four : ∃! v : Fin 31, T.degree v = 4 := by
  refine ⟨0, ?_, ?_⟩
  · decide
  · intro v hv
    exact (degree_eq_four_iff v).mp hv

theorem degree_le_four : ∀ v : Fin 31, T.degree v ≤ 4 := by decide

/-- The leaf neighbours of vertex `0` are exactly `{1}`. -/
theorem leaf_neighbors_zero :
    (T.neighborFinset 0).filter (fun w => T.degree w = 1) = {1} := by decide

/-- A spider is a tree with exactly one vertex of degree at least three. -/
def IsSpider (G : SimpleGraph (Fin 31)) [DecidableRel G.Adj] [∀ v, Fintype (G.neighborSet v)] : Prop :=
  G.IsTree ∧ ∃! v : Fin 31, 2 < G.degree v

theorem not_spider : ¬ IsSpider T := by
  rintro ⟨-, huniq⟩
  obtain ⟨v, _, hv⟩ := huniq
  have h0 : 2 < T.degree 0 := by decide
  have h8 : 2 < T.degree 8 := by decide
  have h0v : 0 = v := hv 0 h0
  have h8v : 8 = v := hv 8 h8
  omega

/-- The set of non-leaf vertices. -/
def nonLeafs : Finset (Fin 31) := Finset.univ.filter (fun v => T.degree v ≠ 1)

/-- A caterpillar is a tree whose non-leaf vertices induce a subgraph of maximum
degree at most two; for a tree this is exactly the usual condition that deleting
all leaves leaves a path. -/
def IsCaterpillar (G : SimpleGraph (Fin 31)) [DecidableRel G.Adj]
    [∀ v, Fintype (G.neighborSet v)] : Prop :=
  G.IsTree ∧ ∀ v : Fin 31, G.degree v ≠ 1 →
    (Finset.univ.filter (fun w => G.degree w ≠ 1 ∧ G.Adj v w)).card ≤ 2

theorem not_caterpillar : ¬ IsCaterpillar T := by
  rintro ⟨-, h⟩
  have h0 : T.degree 0 ≠ 1 := by decide
  have hthree : (Finset.univ.filter (fun w : Fin 31 => T.degree w ≠ 1 ∧ T.Adj 0 w)).card = 3 := by
    decide
  have := h 0 h0
  omega

/-- The number of edges is one less than the number of vertices. -/
theorem edge_count : T.edgeFinset.card + 1 = Fintype.card (Fin 31) := by
  rw [edgeFinset_card]
  decide

end Li
