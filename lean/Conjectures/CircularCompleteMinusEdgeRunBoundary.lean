import Conjectures.CircularCompleteMinusEdgeRunExtrema

/-! At a special position, the special vertex cannot share a run
boundary with a different non-endpoint normal vertex. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

theorem LinearEdgeOrder.vertex_starts_every_occurrence_of_no_consecutive
    (L : LinearEdgeOrder C) (s : V)
    (h : ∀ a b : Fin (Fintype.card G.edgeSet),b.val=a.val+1 →
      s∈L.verticesAt a → s∉L.verticesAt b)
    (i : Fin (Fintype.card G.edgeSet)) (hi : s∈L.verticesAt i) : s∈L.runStartsAt i := by
  refine (L.mem_runStartsAt_iff s i).mpr ⟨hi,fun a e ha => ?_⟩
  exact h a i e.symm ha hi

theorem LinearEdgeOrder.nonendpoint_first_pos_not_special (L : LinearEdgeOrder C)
    (i : Fin (Fintype.card G.edgeSet)) {z b s : V}
    (hzb : z≠b) (hzs : z≠s) (hbs : b≠s)
    (hz : z∈L.runStartsAt i) (hb : i.val=0 → b∈L.verticesAt i)
    (hs : ∀ a b : Fin (Fintype.card G.edgeSet),b.val=a.val+1 →
      s∈L.verticesAt a → s∉L.verticesAt b) : s∉L.verticesAt i := by
  intro hi
  by_cases h₀ : i.val=0
  · have hHere := ((L.mem_runStartsAt_iff z i).mp hz).1
    exact (L.atMostTwo_verticesAt i hbs (hb h₀) hi hHere).elim hzb hzs
  · exact hzs (L.unique_run_start_away_from_zero i h₀ hz
      (L.vertex_starts_every_occurrence_of_no_consecutive s hs i hi))

theorem LinearEdgeOrder.first_positions_of_nonendpoint_distinct (L : LinearEdgeOrder C)
    (i : Fin (Fintype.card G.edgeSet)) {x y b : V}
    (hx : x∈L.runStartsAt i) (hy : y∈L.runStartsAt i)
    (hxb : x≠b) (hyb : y≠b) (hb : i.val=0 → b∈L.verticesAt i) : x=y := by
  by_cases hi : i.val=0
  · have hX := ((L.mem_runStartsAt_iff x i).mp hx).1
    have hY := ((L.mem_runStartsAt_iff y i).mp hy).1
    exact ((L.atMostTwo_verticesAt i hxb hX (hb hi) hY).resolve_right hyb).symm
  · exact L.unique_run_start_away_from_zero i hi hx hy

theorem LinearEdgeOrder.one_of_two_vertices_persists (L : LinearEdgeOrder C)
    {i j : Fin (Fintype.card G.edgeSet)} (hij : j.val=i.val+1)
    {x y : V} (hne : x≠y) (hx : x∈L.verticesAt i) (hy : y∈L.verticesAt i) :
    x∈L.verticesAt j ∨ y∈L.verticesAt j := by
  have hc := L.consecutive_card_inter hij
  obtain ⟨z,hz⟩ := Finset.card_pos.mp (by omega : 0<(L.verticesAt j∩L.verticesAt i).card)
  obtain ⟨hzj,hzi⟩ := Finset.mem_inter.mp hz
  rcases L.atMostTwo_verticesAt i hne hx hy hzi with e|e
  · exact Or.inl (e ▸ hzj)
  · exact Or.inr (e ▸ hzj)

theorem LinearEdgeOrder.nonendpoint_last_pos_not_special (L : LinearEdgeOrder C)
    (i : Fin (Fintype.card G.edgeSet)) {z b s : V}
    (hzb : z≠b) (hzs : z≠s) (hbs : b≠s)
    (hz : z∈L.verticesAt i)
    (hb : i.val+1=Fintype.card G.edgeSet → b∈L.verticesAt i)
    (hzLast : ∀ j : Fin (Fintype.card G.edgeSet),i.val<j.val → z∉L.verticesAt j)
    (hs : ∀ a b : Fin (Fintype.card G.edgeSet),b.val=a.val+1 →
      s∈L.verticesAt a → s∉L.verticesAt b) : s∉L.verticesAt i := by
  intro hi
  by_cases hLast : i.val+1=Fintype.card G.edgeSet
  · exact (L.atMostTwo_verticesAt i hbs (hb hLast) hi hz).elim hzb hzs
  · let j : Fin (Fintype.card G.edgeSet) := ⟨i.val+1,by
      have iLt := i.isLt
      omega⟩
    rcases L.one_of_two_vertices_persists (j:=j) rfl hzs hz hi with h|h
    · exact hzLast j (Nat.lt_succ_self _) h
    · exact hs i j rfl hi h

end CircularCompleteMinusEdge
