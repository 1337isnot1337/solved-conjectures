import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Tactic

open scoped BigOperators
namespace EkhadZeilberger

/-- The lag between two window starts. -/
def windowLag (i j : ℕ) : ℕ := (i-j)+(j-i)

theorem windowLag_self (i : ℕ) : windowLag i i = 0 := by simp [windowLag]

theorem windowLag_comm (i j : ℕ) : windowLag i j = windowLag j i := by
  unfold windowLag
  omega

theorem windowLag_of_le {i j : ℕ} (h : i≤j) : windowLag i j = j-i := by
  simp [windowLag,Nat.sub_eq_zero_of_le h]

private theorem reverse_positive_lags (N : ℕ) (g : ℕ→ℝ) :
    (∑ i ∈ Finset.range N,g (N-i)) = ∑ i ∈ Finset.range N,g (i+1) := by
  rw [← Finset.sum_range_reflect (fun i => g (i+1))]
  apply Finset.sum_congr rfl
  intro i hi
  have hn := Finset.mem_range.mp hi
  congr 1
  omega

/-- Rectangular lag multiplicities, including the zero-lag diagonal. -/
theorem windowLag_sum_rectangle (N : ℕ) (g : ℕ→ℝ) :
    (∑ i ∈ Finset.range N,∑ j ∈ Finset.range N,g (windowLag i j)) =
      (N:ℝ)*g 0 + 2*∑ d ∈ Finset.range N,((N:ℝ)-(d+1:ℕ))*g (d+1) := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Finset.sum_range_succ]
    conv_lhs =>
      enter [1,2,i]
      rw [Finset.sum_range_succ]
    rw [Finset.sum_add_distrib, ih,Finset.sum_range_succ,windowLag_self]
    have hlag (i : ℕ) (hi : i∈Finset.range N) :
        g (windowLag i N)=g (N-i) :=
      congrArg g (windowLag_of_le (Nat.le_of_lt (Finset.mem_range.mp hi)))
    have hrow : (∑ i∈Finset.range N,g (windowLag i N)) = ∑ i∈Finset.range N,g (i+1) :=
      (Finset.sum_congr rfl hlag).trans (reverse_positive_lags N g)
    have hcol : (∑ i∈Finset.range N,g (windowLag N i)) = ∑ i∈Finset.range N,g (i+1) := by
      simp_rw [windowLag_comm N]
      exact hrow
    rw [hrow,hcol,Finset.sum_range_succ]
    have hmul (d : ℕ) :
        (((N+1:ℕ):ℝ)-(d+1:ℕ))*g (d+1) =
          ((N:ℝ)-(d+1:ℕ))*g (d+1)+g (d+1) := by push_cast; ring
    simp_rw [hmul]
    rw [Finset.sum_add_distrib]
    push_cast
    ring

end EkhadZeilberger
