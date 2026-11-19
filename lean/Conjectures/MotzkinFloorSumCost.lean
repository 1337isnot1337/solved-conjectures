import Conjectures.MotzkinFloorSum
import Mathlib.Data.Nat.Size

/-! The floor-sum loop is bounded by the Euclidean algorithm. Two Euclidean
steps reduce the binary length of the modulus, giving a logarithmic bound on
the number of iterations independently of the number of summands. -/
namespace Motzkin.FloorSum

def euclidSteps (M A : ℕ) : ℕ :=
  if hM : M=0 then 0 else 1+euclidSteps (A%M) M
termination_by M
decreasing_by exact Nat.mod_lt _ (Nat.pos_of_ne_zero hM)

def iterations (n M A B : ℕ) : ℕ :=
  if hM : M=0 then 0 else
  let height := (A%M)*n+B%M
  if height < M then 1
  else 1+iterations (height/M) (A%M) M (height%M)
termination_by M
decreasing_by exact Nat.mod_lt _ (Nat.pos_of_ne_zero hM)

theorem iterations_le_euclidSteps (n M A B : ℕ) :
    iterations n M A B ≤ euclidSteps M A := by
  induction M using Nat.strong_induction_on generalizing n A B with
  | h M ih =>
    by_cases hM : M=0
    · subst M
      simp [iterations,euclidSteps]
    rw [iterations,euclidSteps,dite_eq_right hM,dite_eq_right hM]
    dsimp only
    by_cases hheight : (A%M)*n+B%M < M
    · rw [ite_eq_left hheight]
      omega
    · rw [ite_eq_right hheight]
      exact Nat.add_le_add_left
        (ih (A%M) (Nat.mod_lt A (Nat.pos_of_ne_zero hM)) _ _ _) 1

theorem twice_remainder_lt {M r : ℕ} (hr : 0 < r) (hrM : r < M) :
    2*(M%r) < M := by
  by_cases hsmall : 2*r ≤ M
  · have hh := Nat.mod_lt M hr
    omega
  · have hrem : M%r=M-r := by
      rw [Nat.mod_eq_sub_mod hrM.le,Nat.mod_eq_of_lt (by omega)]
    rw [hrem]
    omega

theorem size_lt_of_twice_lt {q M : ℕ} (h : 2*q < M) : q.size < M.size := by
  by_cases hq : q=0
  · subst q
    simpa only [Nat.size_zero] using Nat.size_pos.mpr (by omega : 0 < M)
  have hs : (2*q).size=q.size+1 := by
    simpa [Nat.shiftLeft_eq,mul_comm] using Nat.size_shiftLeft (m:=q) hq 1
  have hm := Nat.size_le_size h.le
  rw [hs] at hm
  omega

theorem euclidSteps_le_size (M A : ℕ) : euclidSteps M A ≤ 2*M.size := by
  induction M using Nat.strong_induction_on generalizing A with
  | h M ih =>
    by_cases hM : M=0
    · subst M
      simp [euclidSteps]
    have hMp : 0 < M := Nat.pos_of_ne_zero hM
    have hsize : 0 < M.size := Nat.size_pos.mpr hMp
    have hlt : A%M < M := Nat.mod_lt A hMp
    rw [euclidSteps,dite_eq_right hM]
    by_cases hr : A%M=0
    · rw [hr]
      simp only [euclidSteps,dite_eq_left rfl]
      omega
    · rw [euclidSteps,dite_eq_right hr]
      have hnext : M%(A%M) < M :=
        (Nat.mod_lt M (Nat.pos_of_ne_zero hr)).trans hlt
      have hb := ih (M%(A%M)) hnext (A%M)
      have hs := size_lt_of_twice_lt (twice_remainder_lt (Nat.pos_of_ne_zero hr) hlt)
      omega

theorem size_eq_log2_add_one {M : ℕ} (hM : 0 < M) : M.size=M.log2+1 := by
  apply Nat.le_antisymm
  · apply Nat.size_le.mpr
    exact (Nat.log2_lt hM.ne').mp (by omega)
  · have hh : M.log2 < M.size := Nat.lt_size.mpr (Nat.log2_self_le hM.ne')
    omega

theorem iterations_le_log2 (n M A B : ℕ) (hM : 0 < M) :
    iterations n M A B ≤ 2*(M.log2+1) := by
  rw [← size_eq_log2_add_one hM]
  exact (iterations_le_euclidSteps n M A B).trans (euclidSteps_le_size M A)

theorem next_count_le (n M A B : ℕ) (hM : 0 < M) :
    ((A%M)*n+B%M)/M ≤ n := by
  have ha := Nat.mod_lt A hM
  have hb := Nat.mod_lt B hM
  have hheight : (A%M)*n+B%M < (n+1)*M := by
    have hmul := Nat.mul_le_mul_right n (show A%M+1 ≤ M by omega)
    nlinarith
  have hh : ((A%M)*n+B%M)/M < n+1 := (Nat.div_lt_iff_lt_mul hM).mpr hheight
  omega

end Motzkin.FloorSum
