module

public import Mathlib.Data.Rat.Defs
public import Mathlib.Data.Nat.Factorial.Basic
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic

@[expose] public section
namespace LassalleRefinement

def rootLo : ℚ := 367049266052/100000000000
def rootHi : ℚ := 367049266055/100000000000

def besselFinite (R : ℚ) (m : ℕ) : ℚ :=
  (-R)^m / ((m.factorial : ℚ)*(m+1).factorial)

def besselPositive (R : ℚ) (m : ℕ) : ℚ :=
  R^m / ((m.factorial : ℚ)*(m+1).factorial)

def weight (m : ℕ) : ℚ :=
  max 1 (4*(m:ℚ)^2) * ∑ i ∈ Finset.range (m+1),
    besselPositive rootHi i * besselPositive rootHi (m-i)

theorem rootLo_lt_rootHi : rootLo < rootHi := by decide +kernel

theorem bessel_odd_partial_positive :
    0 < ∑ i ∈ Finset.range 22, besselFinite rootLo i := by decide +kernel

theorem bessel_even_partial_negative :
    (∑ i ∈ Finset.range 21, besselFinite rootHi i) < 0 := by decide +kernel

theorem bessel_power_sum_bounds :
    rootHi < 3671/1000 ∧ rootHi/2-1 < 84/100 ∧ rootHi^2/12-1 < (36/100)^2 := by decide +kernel

theorem bessel_tail_ratio_bound :
    2*rootHi/(8*9)*(16/15)^2 < (1/8 : ℚ) := by decide +kernel

theorem bessel_certificate_error_budget :
    weight 15*(8/7) + 32/2^40*(∑ i ∈ Finset.range 15, weight i) < (1/1000000 : ℚ) := by
  decide +kernel

end LassalleRefinement
