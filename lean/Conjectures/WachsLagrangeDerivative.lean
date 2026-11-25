module
public import Mathlib.RingTheory.PowerSeries.Derivative
public import Mathlib.RingTheory.PowerSeries.Inverse
public import Mathlib.Tactic.Ring

@[expose] public section
namespace WachsCompleteGraph

open PowerSeries

variable {K : Type*} [Field K]

private theorem derivative_mul_series (A B : K⟦X⟧) :
    derivative (A * B) = A * derivative B + B * derivative A := by
  rw [Derivation.leibniz]
  simp only [Algebra.smul_def,Algebra.algebraMap_self, RingHom.id_apply]

theorem derivative_inverse_unit (U : K⟦X⟧) (hU : constantCoeff U ≠ 0) :
    derivative U⁻¹ = -(U⁻¹ ^ 2 * derivative U) := by
  have h := PowerSeries.mul_inv_cancel U hU
  have h₁ : U * derivative U⁻¹ + U⁻¹ * derivative U = 0 := by
    rw [← derivative_mul_series,h,derivative_one]
  have h₂ := congrArg (U⁻¹ * ·) h₁
  rw [mul_add,←mul_assoc,PowerSeries.inv_mul_cancel U hU,one_mul,mul_zero,
    ← mul_assoc,← pow_two] at h₂
  exact eq_neg_of_add_eq_zero_left h₂

/-- Logarithmic derivative of an inverse power, stated without any
analytic convergence assumption. -/
theorem derivative_inverse_power (U : K⟦X⟧) (hU : constantCoeff U ≠ 0) (d : ℕ) :
    derivative (U⁻¹ ^ d) = -((d : K⟦X⟧) * U⁻¹ ^ (d+1) * derivative U) := by
  cases d with
  | zero => simp
  | succ d =>
    rw [derivative_pow,derivative_inverse_unit U hU]
    simp only [Nat.add_sub_cancel]
    rw [show d + 1 + 1 = d + 2 by omega,pow_add U⁻¹ d 2]
    ring

end WachsCompleteGraph
