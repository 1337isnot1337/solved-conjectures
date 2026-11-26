import Conjectures.CircularCompleteMinusEdgeOrderedRuns

/-! The first and last occurrences of a vertex in the actual edge
order, and the two-endpoint exclusion used in the table proof. -/

namespace CircularCompleteMinusEdge

variable {V : Type*} [DecidableEq V]
    {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]
    {C : ProperColoring G n}

theorem LinearEdgeOrder.atMostTwo_verticesAt (L : LinearEdgeOrder C)
    (i : Fin (Fintype.card G.edgeSet)) {x y z : V} (hne : x≠y)
    (hx : x∈L.verticesAt i) (hy : y∈L.verticesAt i) (hz : z∈L.verticesAt i) :
    z=x ∨ z=y := by
  have he := (Sym2.mem_and_mem_iff hne).mp
    ⟨(L.mem_verticesAt _ _).mp hx,(L.mem_verticesAt _ _).mp hy⟩
  have hh := (L.mem_verticesAt _ _).mp hz
  rw [he] at hh
  exact Sym2.mem_iff.mp hh

theorem LinearEdgeOrder.first_occurrence_starts_run (L : LinearEdgeOrder C)
    (x : V) {m : ℕ} (p : Fin (m+1)→Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hHere : x∈L.verticesAt (p 0)) (hAll : ∀ i,x∈L.verticesAt i → ∃ k,p k=i) :
    x∈L.runStartsAt (p 0) := by
  apply (L.mem_runStartsAt_iff x _).mpr
  refine ⟨hHere,fun j h hJ => ?_⟩
  obtain ⟨k,hk⟩ := hAll j hJ
  have hLe := hp.monotone (Fin.zero_le k)
  rw [hk] at hLe
  change (p 0).val≤j.val at hLe
  omega

theorem LinearEdgeOrder.no_occurrence_after_last (L : LinearEdgeOrder C)
    (x : V) {m : ℕ} (p : Fin (m+1)→Fin (Fintype.card G.edgeSet)) (hp : StrictMono p)
    (hAll : ∀ i,x∈L.verticesAt i → ∃ k,p k=i) {j : Fin (Fintype.card G.edgeSet)}
    (hj : (p (Fin.last m)).val<j.val) : x∉L.verticesAt j := by
  intro h
  obtain ⟨k,hk⟩ := hAll j h
  have hLe : p k≤p (Fin.last m) := hp.monotone (Fin.le_last k)
  rw [hk] at hLe
  exact Nat.not_le_of_lt hj hLe

theorem LinearEdgeOrder.unique_run_start_away_from_zero (L : LinearEdgeOrder C)
    (i : Fin (Fintype.card G.edgeSet)) (hi : i.val≠0)
    {x y : V} (hx : x∈L.runStartsAt i) (hy : y∈L.runStartsAt i) : x=y := by
  have h : (L.runStartsAt i).card≤1 := by simp [L.card_runStartsAt,hi]
  exact Finset.card_le_one.mp h x hx y hy

end CircularCompleteMinusEdge
