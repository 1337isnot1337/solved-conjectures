import Conjectures.CircularCompleteMinusEdgeVertexColors

/-! The literal total of positions occupied by the two special
vertices. They cannot occupy the same position because their
mutual edge is precisely the deleted one. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

omit [Fintype V] [DecidableEq V] in
theorem actual_special_positions_disjoint (L : LinearEdgeOrder C) (huv : u≠v) :
    Disjoint (L.incidentPositions u) (L.incidentPositions v) := by
  apply Finset.disjoint_left.mpr
  intro i hi hj
  have he := (Sym2.mem_and_mem_iff huv).mp
    ⟨(L.mem_incidentPositions _ _).mp hi,(L.mem_incidentPositions _ _).mp hj⟩
  have hx := (L.position.symm i).property
  rw [he] at hx
  have hadj : (graph u v).Adj u v := hx
  exact ((graph_adj u v u v).mp hadj).2 rfl

theorem actual_special_positions_card (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    (L.incidentPositions u ∪ L.incidentPositions v).card=4*h-6 := by
  classical
  have e : (graph u v).degree v=(graph v u).degree v := by
    rw [← SimpleGraph.ncard_neighborSet,← SimpleGraph.ncard_neighborSet]
    exact congrArg (fun G : SimpleGraph V => (G.neighborSet v).ncard) (graph_swap u v)
  rw [Finset.card_union_of_disjoint (actual_special_positions_disjoint L huv),
    L.card_incidentPositions u,L.card_incidentPositions v,
    graph_special_degree huv,e,graph_special_degree huv.symm,hV]
  omega

end CircularCompleteMinusEdge
