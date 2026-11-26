import Conjectures.CircularCompleteMinusEdgeOrderedRuns

/-! Bounds and equality cases for the two special vertices,
and the uniqueness needed for the normal vertex of zero slack. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V] [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

omit [Fintype V] in
theorem LinearEdgeOrder.runStarts_subset_incidentPositions (L : LinearEdgeOrder C) (x : V) :
    Finset.univ.filter (fun i => x∈L.runStartsAt i) ⊆ L.incidentPositions x := by
  intro i hi
  have hs := (Finset.mem_filter.mp hi).2
  have h := ((L.mem_runStartsAt_iff x i).mp hs).1
  exact (L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp h)

theorem LinearEdgeOrder.runCount_le_degree [DecidableRel G.Adj] (L : LinearEdgeOrder C) (x : V) :
    L.runCount x≤G.degree x := by
  rw [← L.card_incidentPositions x]
  exact Finset.card_le_card (L.runStarts_subset_incidentPositions x)

theorem LinearEdgeOrder.all_incidentPositions_start_runs_of_runCount_eq_degree
    [DecidableRel G.Adj] (L : LinearEdgeOrder C) (x : V) (h : L.runCount x=G.degree x) :
    ∀ i∈L.incidentPositions x,x∈L.runStartsAt i := by
  intro i hi
  have he : Finset.univ.filter (fun j => x∈L.runStartsAt j) = L.incidentPositions x := by
    apply Finset.eq_of_subset_of_card_le (L.runStarts_subset_incidentPositions x)
    rw [L.card_incidentPositions]
    exact h.ge
  have hm : i ∈ Finset.univ.filter (fun j => x∈L.runStartsAt j) := he.symm ▸ hi
  exact (Finset.mem_filter.mp hm).2

/-- Saturation of the special vertex's upper bound forbids
consecutive appearances, exactly as in the recorded proof. -/
theorem LinearEdgeOrder.no_consecutive_occurrence_of_runCount_eq_degree
    [DecidableRel G.Adj] (L : LinearEdgeOrder C) (x : V) (h : L.runCount x=G.degree x)
    {i j : Fin (Fintype.card G.edgeSet)} (hij : j.val=i.val+1) (hi : x∈L.verticesAt i) :
    x∉L.verticesAt j := by
  intro hj
  have ht := L.all_incidentPositions_start_runs_of_runCount_eq_degree x h j
    ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hj))
  exact ((L.mem_runStartsAt_iff x j).mp ht).2 i hij.symm hi

omit [Fintype V] in
theorem LinearEdgeOrder.commonVertex_unique_of_distinct_positions (L : LinearEdgeOrder C)
    {i j : Fin (Fintype.card G.edgeSet)} (hij : i≠j)
    {x y : V} (hxi : x∈L.verticesAt i) (hxj : x∈L.verticesAt j)
    (hyi : y∈L.verticesAt i) (hyj : y∈L.verticesAt j) : x=y := by
  by_contra he
  have hi := (Sym2.mem_and_mem_iff he).mp
    ⟨(L.mem_verticesAt _ _).mp hxi,(L.mem_verticesAt _ _).mp hyi⟩
  have hj := (Sym2.mem_and_mem_iff he).mp
    ⟨(L.mem_verticesAt _ _).mp hxj,(L.mem_verticesAt _ _).mp hyj⟩
  exact hij (L.position.symm.injective (Subtype.ext (hi.trans hj.symm)))

end CircularCompleteMinusEdge
