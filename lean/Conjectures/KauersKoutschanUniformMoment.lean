import Conjectures.KauersKoutschanFactorialMoment
import Mathlib.Analysis.SpecialFunctions.Gamma.Beta

/-! The uniform conditional coordinate moments give the exact two independent
factorials after the radial moment is taken. -/

namespace KauersKoutschan

open Polynomial MeasureTheory

/-- The two factorial moments agree with the radial factorial and uniform
fraction decomposition on every pair of monomials. -/
theorem uniform_monomial_factorial_moment (a b : ℕ) :
    factorialMoment (X ^ (a + b + 1) : ℝ[X]) *
      (∫ t in (0 : ℝ)..1, t ^ a * (1 - t) ^ b) =
      (a.factorial : ℝ) * (b.factorial : ℝ) := by
  rw [factorialMoment_X_pow]
  have hg := Complex.Gamma_mul_Gamma_eq_betaIntegral
    (s := (a : ℂ) + 1) (t := (b : ℂ) + 1)
    (by simp; positivity) (by simp; positivity)
  rw [Complex.Gamma_nat_eq_factorial, Complex.Gamma_nat_eq_factorial,
    show ((a : ℂ) + 1) + ((b : ℂ) + 1) = ((a + b + 1 : ℕ) : ℂ) + 1 by push_cast; ring,
    Complex.Gamma_nat_eq_factorial] at hg
  let realIntegral : ℝ := ∫ t in (0 : ℝ)..1, t ^ a * (1 - t) ^ b
  have hb : Complex.betaIntegral ((a : ℂ) + 1) ((b : ℂ) + 1) = (realIntegral : ℂ) := by
    dsimp only [realIntegral]
    rw [← intervalIntegral.integral_ofReal, Complex.betaIntegral]
    congr 1
    funext x
    simp [Complex.cpow_natCast]
  rw [hb] at hg
  have hr := congrArg Complex.re hg
  simpa [Complex.mul_re] using hr.symm

end KauersKoutschan
