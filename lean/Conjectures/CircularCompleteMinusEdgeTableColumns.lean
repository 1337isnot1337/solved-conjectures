import Mathlib.Algebra.Order.Ring.Nat
import Mathlib.Data.Fintype.Card

/-! Exact quotient/remainder enumeration of columns in a table
with whole rows and one partial last row. -/

namespace CircularCompleteMinusEdge

private theorem table_position_lt_iff {width rows tail col q : ℕ}
    (hc : col<width) (ht : tail≤width) :
    width*q+col < width*rows+tail ↔ q<rows+(if col<tail then 1 else 0) := by
  by_cases hQ : q<rows
  · have hm := Nat.mul_le_mul_left width (show q+1≤rows by omega)
    rw [Nat.mul_add,mul_one] at hm
    constructor
    · intro _
      exact hQ.trans_le (Nat.le_add_right _ _)
    · intro _
      omega
  · by_cases hQR : q=rows
    · subst q
      by_cases hC : col<tail <;> simp [hC]
    · have hGe : rows+1≤q := by omega
      have hmul := Nat.mul_le_mul_left width hGe
      rw [Nat.mul_add,mul_one] at hmul
      constructor
      · intro h
        omega
      · intro h
        split_ifs at h <;> omega

/-- Literal positions in column a, over r full rows and one
tail of length t. The row is floor division by the table width. -/
def tableColumnEquiv (w r t : ℕ) (ht : t≤w) (a : Fin w) :
    {i : Fin (w*r+t) // i.val%w=a.val} ≃ Fin (r+(if a.val<t then 1 else 0)) where
  toFun i := ⟨i.val.val/w,by
    apply (table_position_lt_iff a.isLt ht).mp
    have h := Nat.mod_add_div i.val.val w
    rw [i.property] at h
    have hi := i.val.isLt
    omega⟩
  invFun q := ⟨⟨w*q.val+a.val,(table_position_lt_iff a.isLt ht).mpr q.isLt⟩,by
    change (w*q.val+a.val)%w=a.val
    rw [Nat.add_comm,Nat.add_mul_mod_self_left,Nat.mod_eq_of_lt a.isLt]⟩
  left_inv i := by
    apply Subtype.ext
    apply Fin.ext
    change w*(i.val.val/w)+a.val=i.val.val
    have h := Nat.mod_add_div i.val.val w
    rw [i.property] at h
    omega
  right_inv q := by
    apply Fin.ext
    change (w*q.val+a.val)/w=q.val
    have hw : 0<w := Nat.zero_lt_of_lt a.isLt
    have hm : (w*q.val+a.val)%w=a.val := by
      rw [Nat.add_comm,Nat.add_mul_mod_self_left,Nat.mod_eq_of_lt a.isLt]
    have h := Nat.mod_add_div (w*q.val+a.val) w
    rw [hm] at h
    have hmEq : w*((w*q.val+a.val)/w)=w*q.val := by omega
    exact le_antisymm (Nat.le_of_mul_le_mul_left hmEq.le hw) (Nat.le_of_mul_le_mul_left hmEq.ge hw)

theorem tableColumn_card (w r t : ℕ) (ht : t≤w) (a : Fin w) :
    Fintype.card {i : Fin (w*r+t) // i.val%w=a.val} = r+(if a.val<t then 1 else 0) := by
  rw [Fintype.card_congr (tableColumnEquiv w r t ht a),Fintype.card_fin]

end CircularCompleteMinusEdge
