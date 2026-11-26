module

public import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
public import Mathlib.Data.Nat.Prime.Basic
public import Mathlib.Order.Interval.Finset.Nat

@[expose] public section
namespace PomeranceSarkozy

open Filter Topology
open scoped NNReal

/-- Parameters of the growing arithmetic sample and its independent Poisson model. -/
noncomputable def psL (X : ℕ) : ℝ := Real.log (Real.log X)

noncomputable def psH (X : ℕ) : ℕ := ⌊10 * psL X⌋₊
noncomputable def psY (X : ℕ) : ℕ := ⌊psL X ^ 6⌋₊
noncomputable def psZ (X : ℕ) : ℝ := (X : ℝ) ^ (1 / psL X ^ 6 : ℝ)
noncomputable def psR (X : ℕ) : ℕ := ⌊psL X ^ 3⌋₊
noncomputable def psStart (X : ℕ) : ℕ := ⌈Real.sqrt X⌉₊
noncomputable def psLength (X : ℕ) : ℕ := X + 1 - psStart X

noncomputable def psOffsets (X : ℕ) : Finset ℕ := Finset.Icc 1 (psH X)
noncomputable def psPrimes (X : ℕ) : Finset ℕ := (Finset.Ioc (psY X) ⌊psZ X⌋₊).filter Nat.Prime
noncomputable def psRate (X : ℕ) : ℝ≥0 := ∑ p ∈ psPrimes X, (p : ℝ≥0)⁻¹

theorem psL_tendsto : Tendsto psL atTop atTop :=
  Real.tendsto_log_atTop.comp (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop)

end PomeranceSarkozy
