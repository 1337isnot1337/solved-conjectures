import Conjectures.CircularCompleteMinusEdgeActualColumnPeriod
import Conjectures.CircularCompleteMinusEdgeSpecialPositionCount
import Conjectures.CircularCompleteMinusEdgeSelectedColumns
import Conjectures.CircularCompleteMinusEdgeColumnArithmetic

/-! The actual table has two fully special columns in each half.
Their pairings and the positions of the normal vertices remain to
be checked in later steps of the written proof. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

variable {V : Type*} [Fintype V] [DecidableEq V]
    {u v : V} [Fintype (graph u v).edgeSet] {h : ℕ} [NeZero (2*h-1)]
    {C : ProperColoring (graph u v) (2*h-1)}

theorem actual_two_special_columns_each_half (L : LinearEdgeOrder C) (huv : u≠v)
    (hh : 4≤h) (hV : Fintype.card V=2*h-1) :
    ∃ S : Fin (2*h)→Prop,
      (∀ i : Fin (Fintype.card (graph u v).edgeSet),
        S ⟨i.val%(2*h),Nat.mod_lt _ (by omega)⟩ ↔
          (u∈L.verticesAt i ∨ v∈L.verticesAt i)) ∧
      Nat.card {a : Fin (2*h) // S a ∧ a.val<h}=2 ∧
      Nat.card {a : Fin (2*h) // S a ∧ h≤a.val}=2 := by
  classical
  let N := Fintype.card (graph u v).edgeSet
  let w := 2*h
  let r := h-2
  let n := 2*h-1
  have hw : 0<w := by omega
  have hn : n+1=w := by omega
  have hr : h-1=r+1 := by omega
  have he : N=n*(h-1)-1 := by
    have e := graph_edge_card_parameter u v huv h (by omega) hV
    rw [Nat.card_eq_fintype_card] at e
    exact e
  have hN : N=w*r+h := by
    rw [hr,Nat.mul_add,mul_one] at he
    rw [← hn,Nat.add_mul,one_mul]
    omega
  have hwN : w≤N := by
    have hmul : w*1≤w*r := Nat.mul_le_mul_left w (by omega)
    omega
  let rep (a : Fin w) : Fin N := ⟨a.val,a.isLt.trans_le hwN⟩
  let S (a : Fin w) : Prop := u∈L.verticesAt (rep a) ∨ v∈L.verticesAt (rep a)
  have hMember (i : Fin N) :
      S ⟨i.val%w,Nat.mod_lt _ hw⟩ ↔ (u∈L.verticesAt i ∨ v∈L.verticesAt i) := by
    apply actual_special_positions_full_columns L huv hh hV
    change (i.val%w)%w=i.val%w
    exact Nat.mod_mod _ _
  let A : Finset (Fin w) := Finset.univ.filter fun a => S a ∧ a.val<h
  let B : Finset (Fin w) := Finset.univ.filter fun a => S a ∧ h≤a.val
  let F := L.incidentPositions u ∪ L.incidentPositions v
  let E : Fin N ≃ Fin (w*r+h) := (Fin.castOrderIso hN).toEquiv
  let e : ↥F ≃ {i : Fin (w*r+h) // S (tableColumnIndex hw i)} := by
    apply Equiv.subtypeEquiv E
    intro i
    change i∈F ↔ S ⟨i.val%w,Nat.mod_lt _ hw⟩
    rw [hMember,show F=L.incidentPositions u ∪ L.incidentPositions v from rfl,Finset.mem_union]
    exact or_congr ((L.mem_incidentPositions u i).trans (L.mem_verticesAt i u).symm)
      ((L.mem_incidentPositions v i).trans (L.mem_verticesAt i v).symm)
  have hCount := Fintype.card_congr e
  rw [Fintype.card_coe, count_selected_table_positions hw (show h≤w by omega) S] at hCount
  have hAll : F.card=4*h-6 := actual_special_positions_card L huv hh hV
  have hSum : A.card*(h-1)+B.card*(h-2)=4*h-6 := by
    rw [hr]
    exact hCount.symm.trans hAll
  let f (a : ↥B) : Fin h := ⟨a.val.val-h,by
    have hA := a.val.isLt
    change a.val.val < 2*h at hA
    omega⟩
  have hf : Function.Injective f := by
    intro a b hEq
    have ha : h≤a.val.val := (Finset.mem_filter.mp a.property).2.2
    have hb : h≤b.val.val := (Finset.mem_filter.mp b.property).2.2
    have e' := congrArg Fin.val hEq
    change a.val.val-h=b.val.val-h at e'
    exact Subtype.ext (Fin.ext (by omega))
  have hLe := Fintype.card_le_of_injective f hf
  rw [Fintype.card_coe,Fintype.card_fin] at hLe
  obtain ⟨hA,hB⟩ := two_special_columns_each_half hh hLe hSum
  refine ⟨S,hMember,?_,?_⟩
  · rw [Nat.card_eq_fintype_card,Fintype.card_subtype]
    exact hA
  · rw [Nat.card_eq_fintype_card,Fintype.card_subtype]
    exact hB

end CircularCompleteMinusEdge
