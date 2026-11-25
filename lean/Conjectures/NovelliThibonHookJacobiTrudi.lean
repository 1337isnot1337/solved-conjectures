module
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Matrix
variable {R : Type*} [CommRing R]

/-- Complete homogeneous functions after evaluation at (1-z),
with the standard zero convention below degree zero. -/
def virtualComplete (z : R) (d : ℤ) : R :=
  if d=0 then 1 else if 0<d then 1-z else 0

theorem virtualComplete_of_pos (z : R) {d : ℤ} (hd : 0<d) :
    virtualComplete z d = 1-z := by simp [virtualComplete,hd,hd.ne']

noncomputable def specializedJacobiTrudi {k : ℕ}
    (shape : Fin k → ℕ) (z : R) : Matrix (Fin k) (Fin k) R :=
  Matrix.of fun i j => virtualComplete z ((shape i:ℤ)-i.val+j.val)

/-- Matrix of the simultaneous column differences (subtract each
preceding original column). -/
def columnShift (k : ℕ) : Matrix (Fin k) (Fin k) R :=
  Matrix.of fun i j => if i.val+1=j.val then 1 else 0

theorem det_columnDiff (k : ℕ) :
    (1-columnShift (R:=R) k : Matrix (Fin k) (Fin k) R).det = 1 := by
  classical
  have hu : (1-columnShift (R:=R) k : Matrix (Fin k) (Fin k) R).IsUpperTriangular := by
    intro i j hij
    have hv : j.val < i.val := hij
    have he : i≠j := Fin.ne_of_val_ne hv.ne'
    have hl : i.val+1≠j.val := by omega
    simp [Matrix.sub_apply,he,columnShift,hl]
  rw [Matrix.det_of_isUpperTriangular hu]
  simp [Matrix.sub_apply,columnShift]

theorem mul_columnShift_zero {k : ℕ} (M : Matrix (Fin (k+1)) (Fin (k+1)) R) (i : Fin (k+1)) :
    (M*columnShift (R:=R) (k+1)) i 0 = 0 := by
  simp [Matrix.mul_apply,columnShift]

theorem mul_columnShift_succ {k : ℕ} (M : Matrix (Fin (k+1)) (Fin (k+1)) R)
    (i : Fin (k+1)) (j : Fin k) :
    (M*columnShift (R:=R) (k+1)) i j.succ = M i j.castSucc := by
  classical
  rw [Matrix.mul_apply,Finset.sum_eq_single j.castSucc]
  · simp [columnShift]
  · intro p _ hp
    have h : p.val ≠ j.val := fun he => hp (Fin.ext he)
    simp [columnShift,h]
  · simp

def hookRows (k a : ℕ) (i : Fin (k+1)) : ℕ := if i=0 then a else 1

/-- Actual Jacobi–Trudi determinant on the specialized complete
homogeneous sequence, for every hook and every coefficient ring. -/
theorem specializedJacobiTrudi_hook (k a : ℕ) (ha : 0<a) (z : R) :
    (specializedJacobiTrudi (hookRows k a) z).det = (1-z)*(-z)^k := by
  classical
  let A := specializedJacobiTrudi (hookRows k a) z
  let D : Matrix (Fin (k+1)) (Fin (k+1)) R := 1-columnShift (k+1)
  have h0 (i : Fin (k+1)) : (A*D) i 0=A i 0 := by
    simp [D,Matrix.mul_sub,Matrix.sub_apply,mul_columnShift_zero]
  have hs (i : Fin (k+1)) (j : Fin k) : (A*D) i j.succ=A i j.succ-A i j.castSucc := by
    simp [D,Matrix.mul_sub,Matrix.sub_apply,mul_columnShift_succ]
  have hl : (A*D).IsLowerTriangular := by
    intro i j hij
    induction j using Fin.cases with
    | zero => exact (Fin.not_lt_zero _ hij).elim
    | succ j =>
      rw [hs]
      have hval : i.val < j.val+1 := hij
      have hp₁ : 0 < ((hookRows k a i:ℤ)-i.val+j.succ.val) := by
        change 0 < ((hookRows k a i:ℤ)-i.val+(j.val+1:ℕ))
        omega
      have hp₂ : 0 < ((hookRows k a i:ℤ)-i.val+j.castSucc.val) := by
        have hp : 0 < hookRows k a i := by by_cases he : i=0 <;> simp [hookRows,he,ha]
        change 0 < ((hookRows k a i:ℤ)-i.val+j.val)
        omega
      change virtualComplete z ((hookRows k a i:ℤ)-i.val+j.succ.val) -
        virtualComplete z ((hookRows k a i:ℤ)-i.val+j.castSucc.val) = 0
      rw [virtualComplete_of_pos z hp₁,virtualComplete_of_pos z hp₂,sub_self]
  have hdiag0 : (A*D) 0 0=1-z := by
    rw [h0]
    simp [A,specializedJacobiTrudi,hookRows,virtualComplete_of_pos,ha]
  have hdiag (j : Fin k) : (A*D) j.succ j.succ = -z := by
    rw [hs]
    have h₁ : ((hookRows k a j.succ:ℤ)-j.succ.val+j.succ.val)=1 := by simp [hookRows]
    have h₂ : ((hookRows k a j.succ:ℤ)-j.succ.val+j.castSucc.val)=0 := by
      simp only [hookRows,Fin.succ_ne_zero,ite_false]
      simp only [Fin.val_succ,Fin.val_castSucc]
      omega
    change virtualComplete z ((hookRows k a j.succ:ℤ)-j.succ.val+j.succ.val) -
      virtualComplete z ((hookRows k a j.succ:ℤ)-j.succ.val+j.castSucc.val) = -z
    rw [h₁,h₂]
    simp [virtualComplete]
  have hD : D.det=1 := det_columnDiff (k+1)
  calc
    A.det = (A*D).det := by rw [Matrix.det_mul,hD,mul_one]
    _ = _ := by
      rw [Matrix.det_of_isLowerTriangular _ hl,Fin.prod_univ_succ,hdiag0]
      simp [hdiag]

/-- Nonhooks vanish under the same specialization: both leading rows
of Jacobi–Trudi have strictly positive indices. -/
theorem specializedJacobiTrudi_nonhook {k : ℕ} (shape : Fin (k+2) → ℕ)
    (h₀ : 0 < shape 0) (h₁ : 2 ≤ shape 1) (z : R) :
    (specializedJacobiTrudi shape z).det=0 := by
  classical
  apply Matrix.det_zero_of_row_eq (i:=0) (j:=1) (by intro he; have h := congrArg Fin.val he; simp at h)
  funext j
  have ha : 0 < (shape 0:ℤ)-(0 : Fin (k+2)).val+j.val := by simp; omega
  have hb : 0 < (shape 1:ℤ)-(1 : Fin (k+2)).val+j.val := by simp; omega
  simp only [specializedJacobiTrudi,Matrix.of_apply,virtualComplete_of_pos _ ha,virtualComplete_of_pos _ hb]

end NovelliThibon
