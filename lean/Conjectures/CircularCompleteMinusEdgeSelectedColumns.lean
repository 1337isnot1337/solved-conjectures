import Conjectures.CircularCompleteMinusEdgeTableColumns
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Data.Fintype.Sigma
import Mathlib.Data.Fintype.BigOperators

/-! Counting a selected union of full columns in a finite table. -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

def tableColumnIndex {w r t : ℕ} (hw : 0<w) (i : Fin (w*r+t)) : Fin w :=
  ⟨i.val%w,Nat.mod_lt _ hw⟩

private def tableColumnSelectedEquiv {w r t : ℕ} (hw : 0<w) (S : Fin w→Prop) :
    {i : Fin (w*r+t) // S (tableColumnIndex hw i)} ≃
      (Σ a : {b : Fin w // S b}, {i : Fin (w*r+t) // i.val%w=a.val.val}) where
  toFun i := ⟨⟨tableColumnIndex hw i.val,i.property⟩,⟨i.val,rfl⟩⟩
  invFun z := ⟨z.2.val,by
    have e : tableColumnIndex hw z.2.val=z.1.val := Fin.ext z.2.property
    rw [e]
    exact z.1.property⟩
  left_inv _ := rfl
  right_inv := by
    rintro ⟨⟨a,ha⟩,i,hi⟩
    have e : tableColumnIndex hw i=a := Fin.ext hi
    subst a
    rfl

theorem count_selected_table_positions {w r t : ℕ} (hw : 0<w) (ht : t≤w)
    (S : Fin w→Prop) [DecidablePred S] :
    Fintype.card {i : Fin (w*r+t) // S (tableColumnIndex hw i)} =
      (Finset.univ.filter fun a : Fin w => S a ∧ a.val<t).card*(r+1) +
      (Finset.univ.filter fun a : Fin w => S a ∧ t≤a.val).card*r := by
  classical
  rw [Fintype.card_congr (tableColumnSelectedEquiv hw S),Fintype.card_sigma]
  simp only [tableColumn_card w r t ht]
  let A : Finset (Fin w) := Finset.univ.filter S
  let F (a : Fin w) := r+(if a.val<t then 1 else 0)
  have hA : (∑ a : {a : Fin w // S a},F a.val)=∑ a∈A,F a := by
    have hm (a : Fin w) : a∈A ↔ S a := by simp [A]
    let e : {a : Fin w // S a} ≃ ↥A := Equiv.subtypeEquivRight (fun a => (hm a).symm)
    calc
      _ = ∑ a : ↥A,F a.val := (Equiv.sum_comp e (fun a => F a.val))
      _ = _ := Finset.sum_attach A F
  change (∑ a : {a : Fin w // S a},F a.val)=_
  rw [hA,← Finset.sum_filter_add_sum_filter_not A (fun a : Fin w => a.val<t) F]
  have h₁ : (A.filter fun a => a.val<t) = Finset.univ.filter (fun a : Fin w => S a ∧ a.val<t) := by
    ext a
    simp [A]
  have h₂ : (A.filter fun a => ¬a.val<t) = Finset.univ.filter (fun a : Fin w => S a ∧ t≤a.val) := by
    ext a
    simp [A]
  have hC₁ : (∑ a ∈ A.filter (fun a => a.val<t),F a) = (A.filter fun a => a.val<t).card*(r+1) := by
    apply Finset.sum_const_nat
    intro a ha
    simp [F,(Finset.mem_filter.mp ha).2]
  have hC₂ : (∑ a ∈ A.filter (fun a => ¬a.val<t),F a) = (A.filter fun a => ¬a.val<t).card*r := by
    apply Finset.sum_const_nat
    intro a ha
    simp [F,(Finset.mem_filter.mp ha).2]
  rw [hC₁,hC₂,h₁,h₂]

end CircularCompleteMinusEdge
