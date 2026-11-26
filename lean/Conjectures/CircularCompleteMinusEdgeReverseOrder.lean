import Conjectures.CircularCompleteMinusEdgeOrder
import Mathlib.Tactic.Abel

/-! Reversing an actual linear edge order preserves its structural
properties when the cyclic hue labels are reflected as well. -/

namespace CircularCompleteMinusEdge
open scoped Fin.NatCast

variable {V : Type*} {G : SimpleGraph V} [Fintype G.edgeSet] {n : ℕ} [NeZero n]

def ProperColoring.reflected (C : ProperColoring G n) (a : Fin n) : ProperColoring G n where
  color e := a-C.color e
  proper e f hne hi he := by
    apply C.proper e f hne hi
    have h := congrArg (fun b : Fin n => a-b) he
    simpa only [sub_sub_cancel] using h

omit [Fintype G.edgeSet] in
theorem ProperColoring.reflected_arc (C : ProperColoring G n) (a : Fin n)
    (hn : 2≤n) (e f : G.edgeSet) (h : (C.reflected a).Arc e f) : C.Arc f e := by
  obtain ⟨hne,hI,hC⟩ := ((C.reflected a).arc_iff_add hn e f).mp h
  have hSub : (a-C.color f)-(a-C.color e)=1 := by
    change (a-C.color f)=(a-C.color e)+1 at hC
    rw [hC,add_comm (a-C.color e) 1,add_sub_cancel_right]
  have hD : C.color e-C.color f=1 := by
    calc
      _ = (a-C.color f)-(a-C.color e) := by abel
      _ = _ := hSub
  exact (C.arc_iff_add hn f e).mpr ⟨hne.symm,incident_symm hI,
    (sub_eq_iff_eq_add.mp hD).trans (add_comm _ _)⟩

/-- The exact table order read from the other end, with the
same edges and no new choice of graph labels. -/
def LinearEdgeOrder.reverse {C : ProperColoring G n} (L : LinearEdgeOrder C) (hn : 2≤n) :
    LinearEdgeOrder (C.reflected ((Fintype.card G.edgeSet+1:ℕ):Fin n)) where
  position := L.position.trans Fin.revPerm
  arc_increases e f h := by
    have ho := L.arc_increases f e (C.reflected_arc _ hn e f h)
    change (L.position e).rev < (L.position f).rev
    exact Fin.rev_lt_rev.mpr ho
  consecutive e f h := by
    apply incident_symm
    apply L.consecutive f e
    change (L.position f).rev.val=(L.position e).rev.val+1 at h
    have he := (L.position e).isLt
    have hf := (L.position f).isLt
    change Fintype.card G.edgeSet-((L.position f).val+1) =
      Fintype.card G.edgeSet-((L.position e).val+1)+1 at h
    omega
  color_position e := by
    have hx := L.color_position e
    change (((Fintype.card G.edgeSet+1:ℕ):Fin n))-C.color e=
      (((L.position e).rev.val+1:ℕ):Fin n)
    symm
    apply (eq_sub_iff_add_eq).mpr
    rw [hx,← Nat.cast_add]
    apply congrArg (fun t : ℕ => (t:Fin n))
    have he := (L.position e).isLt
    change (Fintype.card G.edgeSet-((L.position e).val+1)+1)+((L.position e).val+1)=
      Fintype.card G.edgeSet+1
    omega

theorem LinearEdgeOrder.reverse_position_symm {C : ProperColoring G n}
    (L : LinearEdgeOrder C) (hn : 2≤n) (i : Fin (Fintype.card G.edgeSet)) :
    (L.reverse hn).position.symm i = L.position.symm i.rev := rfl

end CircularCompleteMinusEdge
