module

public import Mathlib.Data.Nat.Choose.Vandermonde
public import Mathlib.Algebra.BigOperators.NatAntidiagonal
public import Mathlib.Data.Rat.Cast.Order
public import Mathlib.Tactic

@[expose] public section
namespace WachsCompleteGraph

/-- The literal integers in the equal-variable Kummer coefficient identity.
Here p is r-2. -/
theorem shifted_vandermonde (p j : ℕ) :
    (∑ i ∈ Finset.range (j+1),p.choose i*(j+1).choose (i+1)) =
      (p+(j+1)).choose j := by
  rw [Nat.add_choose_eq,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ (fun i k => p.choose i*(j+1).choose k)]
  apply Finset.sum_congr rfl
  intro i hi
  have h := Finset.mem_range.mp hi
  have hs : j+1-(j-i)=i+1 := by omega
  rw [←Nat.choose_symm (show j-i≤j+1 by omega),hs]

theorem factorial_scaled_product (p j i : ℕ) (hi : i≤j) :
    ((p.choose i:ℚ)/((i+1).factorial:ℚ))*
      (1/((j-i).factorial:ℚ))*((j+1).factorial:ℚ) =
    (p.choose i:ℚ)*((j+1).choose (i+1):ℚ) := by
  have hn := Nat.choose_mul_factorial_mul_factorial (by omega : i+1≤j+1)
  rw [show j+1-(i+1)=j-i by omega] at hn
  have H := congrArg (fun n : ℕ => (n:ℚ)) hn
  push_cast at H
  have hf (n : ℕ) : (n.factorial:ℚ)≠0 := by positivity
  field_simp
  linear_combination -(p.choose i:ℚ)*H

theorem laguerre_exponential_coefficient (p j : ℕ) :
    (∑ i ∈ Finset.range (j+1),
      ((p.choose i:ℚ)/((i+1).factorial:ℚ))*(1/((j-i).factorial:ℚ))) =
    ((p+(j+1)).choose j:ℚ)/((j+1).factorial:ℚ) := by
  apply (eq_div_iff (by positivity)).2
  rw [Finset.sum_mul]
  simp_rw [Finset.sum_congr rfl (fun i hi =>
    factorial_scaled_product p j i (Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)))]
  exact_mod_cast shifted_vandermonde p j

end WachsCompleteGraph
