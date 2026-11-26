import Conjectures.CircularCompleteMinusEdgeStepFour
import Conjectures.CircularCompleteMinusEdgeSpecialColumnBackward
import Conjectures.CircularCompleteMinusEdgeTableResidues

/-! The actual special vertices occupy full columns of the table
with period `2h`. This is the first geometric part of Step 5. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

theorem actual_special_positions_full_columns (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∀ i j : Fin (Fintype.card (graph u v).edgeSet),i.val%(2*h)=j.val%(2*h) →
      ((u∈L.verticesAt i ∨ v∈L.verticesAt i) ↔ (u∈L.verticesAt j ∨ v∈L.verticesAt j)) := by
  classical
  let N := Fintype.card (graph u v).edgeSet
  let m := 2*h-1-2
  let S (i : Fin N) := u∈L.verticesAt i ∨ v∈L.verticesAt i
  obtain ⟨b,_,_,_,_,_,hU,hV',hN⟩ := actual_deleted_edge_run_rigidity L huv hh hV
  have hNormal (x : V) (hx : x≠u) (hy : x≠v) :
      ∃ p : Fin (m+1)→Fin N, StrictMono p ∧ (∀ k,x∈L.verticesAt (p k)) ∧
        (∀ j,x∈L.verticesAt j → ∃ k,p k=j) ∧
        (p 0).val<2*h ∧ N≤(p (Fin.last m)).val+2*h ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=2*h := by
    obtain ⟨p,hp,hIn,hAll,hGap,hB,hOther⟩ := hN x hx hy
    refine ⟨p,hp,?_,?_,?_,?_,hGap⟩
    · intro k
      exact (L.mem_verticesAt _ _).mpr ((L.mem_incidentPositions _ _).mp (hIn k))
    · intro j hj
      exact hAll _ ((L.mem_incidentPositions _ _).mpr ((L.mem_verticesAt _ _).mp hj))
    · by_cases him : x=b
      · have ht := (hB him).1
        omega
      · have ht := (hOther him).2.1
        omega
    · by_cases him : x=b
      · have ht : (p (Fin.last m)).val+1=N := (hB him).2
        omega
      · have ht : (p (Fin.last m)).val=(p 0).val+N-2*h := (hOther him).2.2
        omega
  have hFront (x : V) (hx : x≠u) (hy : x≠v) :
      ∃ p : Fin (m+1)→Fin N, StrictMono p ∧ (∀ k,x∈L.verticesAt (p k)) ∧
        (∀ j,x∈L.verticesAt j → ∃ k,p k=j) ∧ (p 0).val<2*h ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=2*h := by
    obtain ⟨p,hp,hIn,hAll,hStart,_,hGap⟩ := hNormal x hx hy
    exact ⟨p,hp,hIn,hAll,hStart,hGap⟩
  have hBack (x : V) (hx : x≠u) (hy : x≠v) :
      ∃ p : Fin (m+1)→Fin N, StrictMono p ∧ (∀ k,x∈L.verticesAt (p k)) ∧
        (∀ j,x∈L.verticesAt j → ∃ k,p k=j) ∧ N≤(p (Fin.last m)).val+2*h ∧
        ∀ k,runStep (fun j => (p j).val) k=1 ∨ runStep (fun j => (p j).val) k=2*h := by
    obtain ⟨p,hp,hIn,hAll,_,hEnd,hGap⟩ := hNormal x hx hy
    exact ⟨p,hp,hIn,hAll,hEnd,hGap⟩
  change ∀ i j : Fin N,i.val%(2*h)=j.val%(2*h) → (S i ↔ S j)
  refine predicate_constant_on_table_columns (show 0<2*h by omega) S ?_
  intro i j he
  exact ⟨L.special_position_forward_period (show 2≤2*h by omega) hFront hU hV' he,
    L.special_position_backward_period (show 2≤2*h-1 by omega) (show 2≤2*h by omega)
      hBack hU hV' he⟩

end CircularCompleteMinusEdge
