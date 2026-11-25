module
public import Conjectures.WachsCompleteGraphPartitionCountRecurrence
public import Mathlib.RingTheory.PowerSeries.Derivative
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Algebra.BigOperators.NatAntidiagonal

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K] [CharZero K]

noncomputable def blockEGF (w : ℕ → K) : K⟦X⟧ :=
  PowerSeries.mk fun n => if n=0 then 0 else w n/(n.factorial:K)

noncomputable def tallyEGF (w : ℕ → K) (k : ℕ) : K⟦X⟧ :=
  PowerSeries.mk fun n => canonicalPartitionWeightSum w n k/(n.factorial:K)

theorem coeff_blockEGF_derivative (w : ℕ → K) (j : ℕ) :
    coeff j (derivative (blockEGF w)) = w (j+1)/(j.factorial:K) := by
  rw [coeff_derivative]
  simp only [blockEGF,PowerSeries.coeff_mk,Nat.add_one_ne_zero,ite_false,Nat.factorial_succ,Nat.cast_mul,Nat.cast_add,Nat.cast_one]
  have h₀ : (j.factorial:K) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero j
  have h₁ : (j:K)+1 ≠ 0 := by exact_mod_cast Nat.add_one_ne_zero j
  field_simp

private theorem normalized_choose_term (n j : ℕ) (hj : j ≤ n) (x y : K) :
    (n.choose j : K) * x * y / (n.factorial:K) =
      (x / (j.factorial:K)) * (y / ((n-j).factorial:K)) := by
  have h : (n.choose j : K)*(j.factorial:K)*((n-j).factorial:K) = n.factorial := by
    exact_mod_cast Nat.choose_mul_factorial_mul_factorial hj
  have h₀ : (n.factorial:K) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
  have h₁ : (j.factorial:K) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero j
  have h₂ : ((n-j).factorial:K) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero (n-j)
  field_simp
  linear_combination x*y*h

theorem tally_derivative (w : ℕ → K) (k : ℕ) :
    derivative (tallyEGF w (k+1)) = derivative (blockEGF w) * tallyEGF w k := by
  ext n
  rw [coeff_derivative,coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  simp only [tallyEGF,PowerSeries.coeff_mk,coeff_blockEGF_derivative]
  rw [canonicalPartitionWeightSum_succ]
  have h : (∑ j ∈ Finset.range (n+1), (n.choose j:K)*w (j+1)*canonicalPartitionWeightSum w (n-j) k) /
      ((n+1).factorial:K) * ((n:K)+1) =
      (∑ j ∈ Finset.range (n+1), (n.choose j:K)*w (j+1)*canonicalPartitionWeightSum w (n-j) k) /
      (n.factorial:K) := by
    rw [Nat.factorial_succ]
    push_cast
    have h₁ : (n:K)+1 ≠ 0 := by exact_mod_cast Nat.add_one_ne_zero n
    have h₂ : (n.factorial:K) ≠ 0 := by exact_mod_cast Nat.factorial_ne_zero n
    field_simp
  rw [h,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro j hj
  exact normalized_choose_term n j (Nat.le_of_lt_succ (Finset.mem_range.mp hj)) _ _

end WachsCompleteGraph
