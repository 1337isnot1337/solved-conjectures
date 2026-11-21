import Conjectures.BrownMolIntegerCert
import Conjectures.BrownMolRootBound
import Mathlib.Tactic.ComputeDegree

/-!
The r=200 polynomial has a nonzero root in the forbidden disk. The
identification with the literal subtree polynomial and the infinite family
remain separate obligations.
-/
open Polynomial
noncomputable section
namespace BrownMol
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

def A : ℂ[X] := 1 + X*(1+X)^4
def B : ℂ[X] := (1+X)^4+4
def P : ℂ[X] := A^200 + 200*B

theorem A_degree : A.natDegree ≤ 5 := by
  unfold A
  compute_degree!

theorem B_degree : B.natDegree ≤ 4 := by
  unfold B
  compute_degree!

theorem P_degree : P.natDegree ≤ 1000 := by
  have ha : (A^200).natDegree ≤ 1000 := by
    calc
      _ ≤ 200*A.natDegree := natDegree_pow_le
      _ ≤ 200*5 := Nat.mul_le_mul_left 200 A_degree
      _ = 1000 := by norm_num
  have hb : (200*B).natDegree ≤ 4 := by
    calc
      _ ≤ (200 : ℂ[X]).natDegree + B.natDegree := natDegree_mul_le
      _ ≤ 0+4 := by simpa using B_degree
      _ = 4 := by norm_num
  exact (natDegree_add_le _ _).trans (max_le ha (le_trans hb (by norm_num)))

theorem A_eval (z : ℂ) : A.eval z = 1+z*(1+z)^4 := by simp [A]
theorem B_eval (z : ℂ) : B.eval z = (1+z)^4+4 := by simp [B]
theorem P_eval (z : ℂ) : P.eval z = (1+z*(1+z)^4)^200 + 200*((1+z)^4+4) := by simp [P,A_eval,B_eval]

theorem A_deriv_eval (z : ℂ) : A.derivative.eval z = (1+z)^3*(1+5*z) := by
  simp [A, derivative_add, derivative_mul, derivative_pow, eval_add, eval_mul]
  ring

theorem B_deriv_eval (z : ℂ) : B.derivative.eval z = 4*(1+z)^3 := by
  simp [B, derivative_add, derivative_pow, eval_add, eval_mul]

theorem P_deriv_eval (z : ℂ) : P.derivative.eval z =
    200*(1+z*(1+z)^4)^199*(1+z)^3*(1+5*z)+800*(1+z)^3 := by
  simp only [P, derivative_add, derivative_mul, derivative_pow,
    eval_add, eval_mul, eval_C, eval_pow, A_eval, A_deriv_eval, B_deriv_eval]
  push_cast
  simp only [mul_assoc]
  norm_num
  ring

theorem center_in_disk : ‖BrownInteger.c + (1/2 : ℂ)‖ < (12/25 : ℝ) := by
  have h := Complex.norm_le_abs_re_add_abs_im (BrownInteger.c + (1/2 : ℂ))
  norm_num [BrownInteger.c, Complex.add_re, Complex.add_im, Complex.mul_re, Complex.mul_im] at h
  norm_num [BrownInteger.c] at ⊢
  linarith

theorem finite_root : ∃ z : ℂ, P.IsRoot z ∧ z ≠ 0 ∧ ‖z+(1/2 : ℂ)‖ < 1/2 := by
  have hv : ‖P.eval BrownInteger.c‖ < 1 := by rw [P_eval]; exact BrownInteger.value_norm
  have hd : 50000 < ‖P.derivative.eval BrownInteger.c‖ := by
    rw [P_deriv_eval]
    exact lt_trans (by norm_num) BrownInteger.derivative_norm
  obtain ⟨z,hroot,hclose⟩ := root_near_of_log_derivative P BrownInteger.c (1/50)
    (by norm_num) hv P_degree hd (by norm_num)
  refine ⟨z,hroot,?_,?_⟩
  · intro hz
    subst z
    have hh : P.eval 0 = (1001 : ℂ) := by norm_num [P_eval]
    rw [Polynomial.IsRoot, hh] at hroot
    norm_num at hroot
  · have htri := norm_add_le (z-BrownInteger.c) (BrownInteger.c+(1/2 : ℂ))
    have heq : z-BrownInteger.c+(BrownInteger.c+(1/2 : ℂ)) = z+(1/2 : ℂ) := by ring
    rw [heq] at htri
    rw [norm_sub_rev] at htri
    linarith [center_in_disk]

end BrownMol
end
