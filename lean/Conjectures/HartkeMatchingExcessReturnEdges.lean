import Conjectures.HartkeMatchingExcessEdges
import Conjectures.HartkeMatchingExcessWeights

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Exact cardinalities of the unordered edges in the return-arc construction,
including the deleted increasing arc. These connect the combinatorial
weights to the actual excess of the finite simple graph.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

variable {R : ℕ}

def fullReturnGraph (J : Finset (Fin (R + 1))) :
    SimpleGraph (Fin (R + 1) ⊕ Fin (R + 1)) :=
  splitGraph (returnDigraph (fun _ _ => True) J)

def deletedReturnGraph (u : Fin (R + 1)) (J : Finset (Fin (R + 1))) :
    SimpleGraph (Fin (R + 1) ⊕ Fin (R + 1)) :=
  splitGraph (returnDigraph (withoutOneArc u) J)

theorem fullReturnGraph_empty : fullReturnGraph (∅ : Finset (Fin (R + 1))) = baseGraph R := by
  ext x y
  cases x <;> cases y <;>
    simp [fullReturnGraph, baseGraph, splitGraph, returnDigraph, le_iff_eq_or_lt]

theorem fullReturnGraph_insert (j : Fin (R + 1)) (J : Finset (Fin (R + 1))) :
    fullReturnGraph (insert j J) =
      fullReturnGraph J ⊔ SimpleGraph.edge (Sum.inl j) (Sum.inr 0) := by
  ext x y
  cases x <;> cases y <;>
    simp only [fullReturnGraph, splitGraph, SimpleGraph.sup_adj, SimpleGraph.edge_adj,
      returnDigraph, mem_insert, and_true, Sum.inl.injEq, Sum.inr.injEq,
      Sum.inl_ne_inr, Sum.inr_ne_inl, and_false, false_and, or_false, false_or,
      ]
  all_goals tauto

theorem fullReturnGraph_not_return {j : Fin (R + 1)} {J : Finset (Fin (R + 1))}
    (hj0 : j ≠ 0) (hj : j ∉ J) :
    ¬(fullReturnGraph J).Adj (Sum.inl j) (Sum.inr 0) := by
  simp [fullReturnGraph, splitGraph, returnDigraph, hj0, hj]

theorem edgeSet_card_sup_edge {V : Type*} [Fintype V] (G : SimpleGraph V)
    (x y : V) (hn : ¬G.Adj x y) (hxy : x ≠ y) :
    Nat.card (G ⊔ SimpleGraph.edge x y).edgeSet = Nat.card G.edgeSet + 1 := by
  classical
  simpa only [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card] using
    G.card_edgeFinset_sup_edge hn hxy

theorem fullReturnGraph_edge_card (J : Finset (Fin (R + 1))) (hJ : 0 ∉ J) :
    Nat.card (fullReturnGraph J).edgeSet = (R + 1) ^ 2 + J.card := by
  classical
  induction J using Finset.induction_on with
  | empty =>
    rw [fullReturnGraph_empty, baseGraph_edge_card]
    simp only [card_empty, add_zero]
  | @insert j J hj ih =>
    have hj0 : j ≠ 0 := by intro h; apply hJ; simp [h]
    have hJ0 : 0 ∉ J := fun h => hJ (mem_insert_of_mem h)
    rw [fullReturnGraph_insert,
      edgeSet_card_sup_edge _ _ _ (fullReturnGraph_not_return hj0 hj) (by simp),
      ih hJ0, card_insert_of_notMem hj]
    omega

def oneIndex (u : Fin (R + 1)) (hu : 2 ≤ u.val) : Fin (R + 1) :=
  ⟨1, by have := u.isLt; omega⟩

theorem deletedReturnDigraph_iff (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (J : Finset (Fin (R + 1))) (i j : Fin (R + 1)) :
    returnDigraph (fun _ _ => True) J i j ↔
      returnDigraph (withoutOneArc u) J i j ∨ (i = oneIndex u hu ∧ j = u) := by
  constructor
  · intro h
    rcases h with h | ⟨h, _⟩ | h
    · exact Or.inl (Or.inl h)
    · by_cases hdel : i.val = 1 ∧ j.val = u.val
      · exact Or.inr ⟨Fin.ext hdel.1, Fin.ext hdel.2⟩
      · exact Or.inl (Or.inr (Or.inl ⟨h, hdel⟩))
    · exact Or.inl (Or.inr (Or.inr h))
  · rintro (h | ⟨hi, hj⟩)
    · rcases h with h | ⟨h, _⟩ | h
      · exact Or.inl h
      · exact Or.inr (Or.inl ⟨h, trivial⟩)
      · exact Or.inr (Or.inr h)
    · rw [hi, hj]
      exact Or.inr (Or.inl ⟨by change 1 < u.val; omega, trivial⟩)

theorem fullReturnGraph_eq_deleted_sup_edge (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (J : Finset (Fin (R + 1))) :
    fullReturnGraph J =
      deletedReturnGraph u J ⊔ SimpleGraph.edge (Sum.inl (oneIndex u hu)) (Sum.inr u) := by
  ext x y
  cases x <;> cases y <;>
    simp [fullReturnGraph, deletedReturnGraph, splitGraph, SimpleGraph.edge_adj,
      deletedReturnDigraph_iff u hu J, and_comm]

theorem deletedReturnGraph_not_deleted (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (J : Finset (Fin (R + 1))) :
    ¬(deletedReturnGraph u J).Adj (Sum.inl (oneIndex u hu)) (Sum.inr u) := by
  have hne : oneIndex u hu ≠ u := by
    intro h
    have hv := congrArg Fin.val h
    change 1 = u.val at hv
    omega
  have hu0 : u ≠ 0 := by
    intro h
    have hv := congrArg Fin.val h
    change u.val = 0 at hv
    omega
  change ¬(oneIndex u hu = u ∨
    (oneIndex u hu < u ∧ withoutOneArc u (oneIndex u hu) u) ∨ u = 0 ∧ oneIndex u hu ∈ J)
  simp only [hne, hu0, false_or, false_and, or_false]
  rintro ⟨_, h⟩
  exact h ⟨rfl, rfl⟩

theorem deletedReturnGraph_edge_card_add_one (u : Fin (R + 1)) (hu : 2 ≤ u.val)
    (J : Finset (Fin (R + 1))) (hJ : 0 ∉ J) :
    Nat.card (deletedReturnGraph u J).edgeSet + 1 = (R + 1) ^ 2 + J.card := by
  have h := fullReturnGraph_edge_card J hJ
  rw [fullReturnGraph_eq_deleted_sup_edge u hu J,
    edgeSet_card_sup_edge _ _ _ (deletedReturnGraph_not_deleted u hu J) (by simp)] at h
  exact h

end HartkeMatchingExcess
