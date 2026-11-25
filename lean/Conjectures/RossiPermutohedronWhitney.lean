module

public import Conjectures.RossiPermutohedronEulerianDegree
public import Mathlib.Combinatorics.Enumerative.Stirling

@[expose] public section
namespace RossiPermutohedron
open Polynomial

noncomputable def whitneyPolynomial (n : ℕ) : ℝ[X] :=
  (eulerianRec n).comp (1+X)

noncomputable def whitneyStep (n : ℕ) (p : ℝ[X]) : ℝ[X] :=
  C ((n:ℝ)+1)*p + C (n:ℝ)*(X*p) - X*p.derivative - X^2*p.derivative

theorem whitneyPolynomial_succ (n : ℕ) :
    whitneyPolynomial (n+1)=whitneyStep n (whitneyPolynomial n) := by
  simp only [whitneyPolynomial,eulerianRec,eulerianStep,whitneyStep,add_comp,mul_comp,sub_comp,
    one_comp,C_comp,X_comp,derivative_comp,derivative_one,derivative_X,zero_add,
    one_mul,map_add,map_one]
  ring

theorem whitneyStep_coeff_zero (n : ℕ) (p : ℝ[X]) :
    (whitneyStep n p).coeff 0=((n:ℝ)+1)*p.coeff 0 := by
  simp [whitneyStep]

theorem whitneyStep_coeff_succ (n k : ℕ) (p : ℝ[X]) :
    (whitneyStep n p).coeff (k+1)=((n:ℝ)-k)*(p.coeff (k+1)+p.coeff k) := by
  cases k with
  | zero =>
    simp only [whitneyStep,coeff_sub,coeff_add,coeff_C_mul,coeff_X_mul,coeff_derivative,coeff_X_pow_mul']
    norm_num
    ring
  | succ k =>
    simp only [whitneyStep,coeff_sub,coeff_add,coeff_C_mul,coeff_X_mul,coeff_derivative]
    rw [show k+1+1=k+2 by omega,coeff_X_pow_mul,coeff_derivative]
    push_cast
    ring

/-- Frobenius's coefficient identity, with Mathlib's actual Stirling
numbers and the recursively proved Eulerian polynomials. -/
theorem whitneyPolynomial_coeff (n k : ℕ) (hkn : k≤n) :
    (whitneyPolynomial n).coeff k =
      ((n-k).factorial:ℝ)*(Nat.stirlingSecond n (n-k):ℝ) := by
  induction n generalizing k with
  | zero =>
    have h0 : k=0 := by omega
    subst k
    simp [whitneyPolynomial,eulerianRec,Nat.stirlingSecond_zero]
  | succ n ih =>
    rw [whitneyPolynomial_succ]
    cases k with
    | zero =>
      rw [whitneyStep_coeff_zero,ih 0 (by omega)]
      simp [Nat.factorial_succ,Nat.stirlingSecond_self,Nat.cast_add]
    | succ k =>
      rw [whitneyStep_coeff_succ]
      by_cases h : k=n
      · subst k
        simp [Nat.stirlingSecond_succ_zero]
      · have hl : k<n := by omega
        rw [ih (k+1) (by omega),ih k (by omega)]
        let r := n-k
        have hr : r≠0 := by dsimp [r]; omega
        have hEq₁ : n-(k+1)=r-1 := by dsimp [r]; omega
        have hEq₂ : n+1-(k+1)=r := by dsimp [r]; omega
        have hEq₃ : (n:ℝ)-(k:ℝ)=(r:ℝ) := (Nat.cast_sub (by omega : k≤n)).symm
        rw [hEq₁,hEq₂,hEq₃,Nat.stirlingSecond_succ_left n r hr]
        have hf : r.factorial = r*(r-1).factorial := by
          have hpos := Nat.pos_of_ne_zero hr
          simpa only [Nat.sub_add_cancel hpos] using Nat.factorial_succ (r-1)
        change (r:ℝ) * (((r-1).factorial:ℝ)*((Nat.stirlingSecond n (r-1):ℕ):ℝ) +
          (r.factorial:ℝ)*((Nat.stirlingSecond n r:ℕ):ℝ)) =
          (r.factorial:ℝ)*((r*Nat.stirlingSecond n r+Nat.stirlingSecond n (r-1):ℕ):ℝ)
        rw [hf]
        push_cast
        ring

end RossiPermutohedron
