module

public import Conjectures.RossiPermutohedronReduction

@[expose] public section
namespace RossiPermutohedron
open Polynomial

/-- The Eulerian recurrence used by Rossi, with n the old length. -/
noncomputable def eulerianStep (n : ℕ) (A : ℝ[X]) : ℝ[X] :=
  (1 + C (n:ℝ)*X)*A + X*(1-X)*A.derivative

/-- This is the recurrence model; identifying it with the literal permutation
enumerator and Rossi's face-lattice characteristic polynomial are separate. -/
noncomputable def eulerianRec : ℕ → ℝ[X]
  | 0 => 1
  | n+1 => eulerianStep n (eulerianRec n)

theorem eulerianStep_eval0 (n : ℕ) (A : ℝ[X]) :
    (eulerianStep n A).eval 0=A.eval 0 := by
  simp [eulerianStep]

theorem eulerianStep_derivative0 (n : ℕ) (A : ℝ[X]) :
    (eulerianStep n A).derivative.eval 0=(n:ℝ)*A.eval 0+2*A.derivative.eval 0 := by
  simp [eulerianStep,derivative_add,derivative_mul,derivative_sub]
  ring

theorem eulerianRec_eval0 (n : ℕ) : (eulerianRec n).eval 0=1 := by
  induction n with
  | zero => simp [eulerianRec]
  | succ n ih => rw [eulerianRec,eulerianStep_eval0,ih]

theorem eulerianRec_derivative0 (n : ℕ) :
    (eulerianRec n).derivative.eval 0=2^n-(n:ℝ)-1 := by
  induction n with
  | zero => simp [eulerianRec]
  | succ n ih =>
    rw [eulerianRec,eulerianStep_derivative0,eulerianRec_eval0,ih,Nat.cast_succ,pow_succ]
    ring

theorem two_pow_ge_two_mul (n : ℕ) (hn : 1≤n) : 2*(n:ℝ)≤(2:ℝ)^n := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases h : 1≤n
    · have hi := ih h
      have hn' : (1:ℝ)≤n := by exact_mod_cast h
      rw [Nat.cast_succ,pow_succ]
      linarith
    · have hn' : n=0 := by omega
      subst n
      norm_num

theorem shiftedEulerianRec_deriv_neg {n : ℕ} (hn : 3≤n) :
    (shiftedEulerian (eulerianRec n)).derivative.eval 0<0 := by
  rw [shiftedEulerian_derivative_eval0,eulerianRec_eval0,eulerianRec_derivative0]
  have h := two_pow_ge_two_mul n (by omega)
  have hn' : (3:ℝ)≤n := by exact_mod_cast hn
  linarith

theorem eulerianRec_positive_root {n : ℕ} (hn : 3≤n) :
    ∃ x∈Set.Ioo (0:ℝ) 1,(shiftedEulerian (eulerianRec n)).IsRoot x :=
  positive_root_of_deriv_neg (shiftedEulerian_eval0 (eulerianRec_eval0 n))
    (shiftedEulerianRec_deriv_neg hn) (by simp [shiftedEulerian_eval1])

end RossiPermutohedron
