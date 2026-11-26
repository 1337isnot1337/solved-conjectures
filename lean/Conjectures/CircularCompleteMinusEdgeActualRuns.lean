import Conjectures.CircularCompleteMinusEdgeOrder
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise

/-! Literal edge-position and vertex-run cardinalities for Step 4
of the recorded complete-minus-edge argument. -/

namespace CircularCompleteMinusEdge

open scoped BigOperators

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]

def LinearEdgeOrder.verticesAt {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (i : Fin (Fintype.card G.edgeSet)) : Finset V :=
  (L.position.symm i).val.toFinset

@[simp] theorem LinearEdgeOrder.mem_verticesAt {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (i : Fin (Fintype.card G.edgeSet)) (x : V) :
    x∈L.verticesAt i ↔ x∈(L.position.symm i).val :=
  Sym2.mem_toFinset

@[simp] theorem LinearEdgeOrder.card_verticesAt {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (i : Fin (Fintype.card G.edgeSet)) :
    (L.verticesAt i).card=2 :=
  Sym2.card_toFinset_of_not_isDiag _ (G.not_isDiag_of_mem_edgeSet (L.position.symm i).property)

omit [DecidableEq V] in
private theorem sym2_eq_pair_of_distinct_members {x y : V} (hn : x≠y)
    {e : Sym2 V} (hx : x∈e) (hy : y∈e) : e=s(x,y) := by
  obtain ⟨v,hv⟩ := Sym2.mem_iff_exists.mp hx
  rw [hv] at hy ⊢
  rcases Sym2.mem_iff.mp hy with he|he
  · exact (hn he.symm).elim
  · rw [he]

/-- Two distinct vertices are at a common position exactly when
they are adjacent, and that position is unique. This is (M) for
the literal graph, including all pairs involving the deleted edge. -/
theorem LinearEdgeOrder.adj_iff_unique_common_position {C : ProperColoring G n}
    (L : LinearEdgeOrder C) {x y : V} (hn : x≠y) :
    G.Adj x y ↔ ∃! i : Fin (Fintype.card G.edgeSet),x∈L.verticesAt i ∧ y∈L.verticesAt i := by
  constructor
  · intro h
    let e : G.edgeSet := ⟨s(x,y),h⟩
    refine ⟨L.position e,?_,?_⟩
    · simp only [mem_verticesAt,Equiv.symm_apply_apply]
      exact ⟨Sym2.mem_iff.mpr (Or.inl rfl),Sym2.mem_iff.mpr (Or.inr rfl)⟩
    · intro j hj
      have he : L.position.symm j=e := Subtype.ext (sym2_eq_pair_of_distinct_members hn
        ((L.mem_verticesAt j x).mp hj.1) ((L.mem_verticesAt j y).mp hj.2))
      exact (L.position.symm.injective (he.trans (L.position.symm_apply_apply e).symm))
  · rintro ⟨i,⟨hx,hy⟩,_⟩
    have he := sym2_eq_pair_of_distinct_members hn
      ((L.mem_verticesAt i x).mp hx) ((L.mem_verticesAt i y).mp hy)
    have hm := (L.position.symm i).property
    rw [he] at hm
    exact hm

theorem LinearEdgeOrder.consecutive_card_inter {C : ProperColoring G n}
    (L : LinearEdgeOrder C) {i j : Fin (Fintype.card G.edgeSet)}
    (h : j.val=i.val+1) : (L.verticesAt j ∩ L.verticesAt i).card=1 := by
  have hh : (L.position (L.position.symm j)).val=(L.position (L.position.symm i)).val+1 := by
    simpa using h
  obtain ⟨x,hx,hy⟩ := L.consecutive _ _ hh
  have hx' : x∈L.verticesAt j ∩ L.verticesAt i :=
    Finset.mem_inter.mpr ⟨(L.mem_verticesAt j x).mpr hy,(L.mem_verticesAt i x).mpr hx⟩
  have he : L.verticesAt j ∩ L.verticesAt i = {x} := by
    apply Finset.eq_singleton_iff_unique_mem.mpr
    refine ⟨hx',fun y hy' => ?_⟩
    by_contra hne
    have hj := sym2_eq_pair_of_distinct_members hne
      ((L.mem_verticesAt j y).mp (Finset.mem_inter.mp hy').1) hy
    have hi := sym2_eq_pair_of_distinct_members hne
      ((L.mem_verticesAt i y).mp (Finset.mem_inter.mp hy').2) hx
    have e : i=j := L.position.symm.injective (Subtype.ext (hi.trans hj.symm))
    omega
  rw [he,Finset.card_singleton]

private def precedingIndex {N : ℕ} (i : Fin N) : Fin N :=
  ⟨i.val-1,(Nat.sub_le _ _).trans_lt i.isLt⟩

def LinearEdgeOrder.runStartsAt {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (i : Fin (Fintype.card G.edgeSet)) : Finset V :=
  if i.val=0 then L.verticesAt i else L.verticesAt i \ L.verticesAt (precedingIndex i)

theorem LinearEdgeOrder.card_runStartsAt {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (i : Fin (Fintype.card G.edgeSet)) :
    (L.runStartsAt i).card = (if i.val=0 then 2 else 1) := by
  unfold LinearEdgeOrder.runStartsAt
  split_ifs with h
  · exact L.card_verticesAt _
  · have hp : i.val = (precedingIndex i).val+1 := by
      change i.val = i.val-1+1
      omega
    rw [Finset.card_sdiff,Finset.inter_comm,L.consecutive_card_inter hp,L.card_verticesAt]

def LinearEdgeOrder.runCount {C : ProperColoring G n} (L : LinearEdgeOrder C) (x : V) : ℕ :=
  (Finset.univ.filter fun i => x∈L.runStartsAt i).card

/-- Sum of actual vertex run counts is N+1. At the first edge
two runs start; at every other edge exactly one runs starts.
The sum over positions is exactly the same finite double count. -/
theorem LinearEdgeOrder.sum_runCount [Fintype V] {C : ProperColoring G n} (L : LinearEdgeOrder C)
    (hN : 0<Fintype.card G.edgeSet) :
    (∑ x : V,L.runCount x)=Fintype.card G.edgeSet+1 := by
  let N := Fintype.card G.edgeSet
  let z : Fin N := ⟨0,hN⟩
  have hSwap : (∑ x : V,L.runCount x)=∑ i : Fin N,(L.runStartsAt i).card := by
    simp only [LinearEdgeOrder.runCount,Finset.card_filter]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro i _
    rw [← Finset.card_filter]
    congr 1
    ext x
    simp
  rw [hSwap]
  simp only [L.card_runStartsAt]
  have hz (i : Fin N) : (if i.val=0 then (2:ℕ) else 1) = 1+(if i=z then 1 else 0) := by
    by_cases h : i.val=0
    · have hi : i=z := Fin.ext h
      simp [hi,z]
    · have hi : i≠z := fun he => h (congrArg Fin.val he)
      simp [h,hi]
  simp_rw [hz,Finset.sum_add_distrib]
  simp [N]

end CircularCompleteMinusEdge
