module
public import Mathlib.Algebra.Polynomial.Eval.Degree
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Basic.Real.Basic
import Mathlib.Tactic.Linarith

@[expose] public section
namespace CyrusianKaplan

open Polynomial Finset
open scoped BigOperators

/-- If all residue polynomials have the same coefficient in degree
d and none has larger degree, subtracting that monomial leaves a
uniform explicit bound of order x^(d-1), including small x≥1. -/
theorem finite_polynomials_common_top_uniform_error {ι : Type*} [Fintype ι]
    (P : ι → ℝ[X]) (d : ℕ) (C : ℝ)
    (hD : ∀ i,(P i).natDegree≤d)
    (hC : ∀ i,(P i).coeff d=C) :
    ∃ D : ℝ, 0≤D ∧ ∀ (i : ι) (x : ℝ), 1≤x →
      |(P i).eval x-C*x^d|≤D*x^(d-1) := by
  let D := ∑ i, ∑ j∈range d,|(P i).coeff j|
  have hPos (i : ι) : 0 ≤ ∑ j∈range d,|(P i).coeff j| :=
    sum_nonneg (fun j _ => abs_nonneg _)
  refine ⟨D,sum_nonneg (fun i _ => hPos i),?_⟩
  intro i x hx
  have hD' : (P i).natDegree<d+1 := Nat.lt_succ_of_le (hD i)
  rw [eval_eq_sum_range' hD',Finset.sum_range_succ,hC i,add_sub_cancel_right]
  have hRow : (∑ j∈range d,|(P i).coeff j|)≤D :=
    Finset.single_le_sum (fun k _ => hPos k) (Finset.mem_univ i)
  calc
    _ ≤ ∑ j∈range d, |(P i).coeff j*x^j| := abs_sum_le_sum_abs _ _
    _ ≤ ∑ j∈range d, |(P i).coeff j| *x^(d-1) := by
      apply Finset.sum_le_sum
      intro j hj
      rw [abs_mul,abs_of_nonneg (pow_nonneg (by linarith : 0≤x) _)]
      exact mul_le_mul_of_nonneg_left
        (pow_le_pow_right₀ hx (by have hh := Finset.mem_range.mp hj; omega)) (abs_nonneg _)
    _ = (∑ j∈range d,|(P i).coeff j|)*x^(d-1) := (Finset.sum_mul _ _ _).symm
    _ ≤ _ := mul_le_mul_of_nonneg_right hRow (pow_nonneg (by linarith : 0≤x) _)

end CyrusianKaplan
