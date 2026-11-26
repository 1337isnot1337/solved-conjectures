import Mathlib.Algebra.Order.Ring.Nat

/-! The integer count of special columns in Step 5. This
does not assume they already form complete columns. -/

namespace CircularCompleteMinusEdge

/-- Once the special positions are unions of full columns,
there are exactly two special columns in each half. -/
theorem two_special_columns_each_half {h a b : ℕ} (hh : 4≤h)
    (hb : b≤h)
    (hCount : a*(h-1)+b*(h-2)=4*h-6) : a=2 ∧ b=2 := by
  let k := h-2
  have hk : 2≤k := by omega
  have he₁ : h-1=k+1 := by omega
  have he₂ : 4*h-6=4*k+2 := by omega
  rw [he₁,he₂,Nat.mul_add,Nat.mul_one] at hCount
  unfold k at hCount
  have hEq : (a+b)*k+a=4*k+2 := by
    rw [Nat.add_mul]
    unfold k
    omega
  have hLow : 4≤a+b := by
    by_contra! hBad
    have hMul := Nat.mul_le_mul_right k (show a+b≤3 by omega)
    omega
  have hHigh : a+b≤4 := by
    by_contra! hBad
    have hMul := Nat.mul_le_mul_right k (show 5≤a+b by omega)
    have hk₂ : k=2 := by omega
    rw [hk₂] at hEq
    have hA : a=0 := by omega
    have hh₂ : h=4 := by omega
    omega
  have hAB : a+b=4 := by omega
  rw [hAB] at hEq
  omega

end CircularCompleteMinusEdge
