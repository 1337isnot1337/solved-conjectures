module
public import Mathlib.NumberTheory.ArithmeticFunction.VonMangoldt
public import Mathlib.NumberTheory.Chebyshev
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Finset ArithmeticFunction
open scoped BigOperators

/-- The finite convolution underlying the reciprocal-prime estimate:
the divisor-sum logarithm can be counted by its positive multiples. -/
theorem mangoldt_floor_sum_eq (N : ℕ) :
    (∑ j ∈ Finset.range N,Real.log ((j+1:ℕ):ℝ)) =
      ∑ d ∈ Finset.range (N+1),ArithmeticFunction.vonMangoldt d*((N/d:ℕ):ℝ) := by
  have hdiv (j : ℕ) (hj : j∈Finset.range N) :
      (j+1).divisors=(Finset.range (N+1)).filter (fun d => d∣j+1) := by
    ext d
    constructor
    · intro h
      have hh := Nat.mem_divisors.mp h
      have hd := Nat.le_of_dvd (by omega : 0<j+1) hh.1
      have hj' := Finset.mem_range.mp hj
      exact Finset.mem_filter.mpr ⟨Finset.mem_range.mpr (by omega),hh.1⟩
    · intro h
      exact Nat.mem_divisors.mpr ⟨(Finset.mem_filter.mp h).2,by omega⟩
  calc
    _ = ∑ j ∈ Finset.range N,∑ d ∈ Finset.range (N+1),if d∣j+1 then ArithmeticFunction.vonMangoldt d else 0 := by
      apply Finset.sum_congr rfl
      intro j hj
      rw [← vonMangoldt_sum,hdiv j hj,Finset.sum_filter]
    _ = _ := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro d _
      rw [← Finset.sum_filter,Finset.sum_const,Nat.card_multiples,nsmul_eq_mul,mul_comm]

theorem log_nat_factorial_as_sum (N : ℕ) :
    Real.log (N.factorial:ℝ)=∑ j ∈ Finset.range N,Real.log ((j+1:ℕ):ℝ) := by
  induction N with
  | zero => simp
  | succ N ih =>
    rw [Nat.factorial_succ,Nat.cast_mul,Real.log_mul (by positivity) (by positivity),
      Finset.sum_range_succ,← ih]
    exact add_comm _ _

/-- Exact finite identity for every integer cutoff, including zero. -/
theorem log_factorial_eq_mangoldt_floors (N : ℕ) :
    Real.log (N.factorial:ℝ)=∑ d ∈ Finset.range (N+1),ArithmeticFunction.vonMangoldt d*((N/d:ℕ):ℝ) :=
  (log_nat_factorial_as_sum N).trans (mangoldt_floor_sum_eq N)

end PomeranceSarkozy
