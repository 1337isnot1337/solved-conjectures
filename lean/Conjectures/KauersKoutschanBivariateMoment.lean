import Conjectures.KauersKoutschanUniformMoment
import Mathlib.Algebra.MvPolynomial.Eval

/-! Exact radial reduction for arbitrary two-variable polynomials. -/

open scoped BigOperators

namespace KauersKoutschan

open Polynomial MeasureTheory

abbrev TwoVariablePolynomial := MvPolynomial (Fin 2) ℝ

/-- Coefficientwise expectation for two independent unit factorial moments. -/
noncomputable def independentFactorialMoment (p : TwoVariablePolynomial) : ℝ :=
  ∑ d ∈ p.support, p.coeff d * ((d 0).factorial : ℝ) * ((d 1).factorial : ℝ)

private noncomputable abbrev uniformBeta (a b : ℕ) : ℝ :=
  ∫ t in (0 : ℝ)..1, t ^ a * (1 - t) ^ b

/-- Average over the fraction of the radius assigned to the first coordinate.
The radius factor is included in the polynomial for the factorial moment. -/
noncomputable def radialAverage (p : TwoVariablePolynomial) : ℝ[X] :=
  ∑ d ∈ p.support, C (p.coeff d * uniformBeta (d 0) (d 1)) * X ^ (d 0 + d 1 + 1)

theorem factorialMoment_radialAverage (p : TwoVariablePolynomial) :
    factorialMoment (radialAverage p) = independentFactorialMoment p := by
  classical
  rw [radialAverage, map_sum, independentFactorialMoment]
  apply Finset.sum_congr rfl
  intro d _
  rw [C_mul', map_smul]
  have h := uniform_monomial_factorial_moment (d 0) (d 1)
  change factorialMoment ((X : ℝ[X]) ^ (d 0 + d 1 + 1)) * uniformBeta (d 0) (d 1) = _ at h
  simp only [smul_eq_mul]
  linear_combination p.coeff d * h

/-- The substitution x₀ = r t, x₁ = r (1 - t). -/
def radialCoordinates (r t : ℝ) : Fin 2 → ℝ :=
  fun i => if i = 0 then r * t else r * (1 - t)

private theorem bivariate_eval_radial (p : TwoVariablePolynomial) (r t : ℝ) :
    MvPolynomial.eval (radialCoordinates r t) p =
      ∑ d ∈ p.support, p.coeff d * ((r * t) ^ (d 0) * (r * (1 - t)) ^ (d 1)) := by
  classical
  rw [MvPolynomial.eval_eq']
  apply Finset.sum_congr rfl
  intro d _
  rw [Fin.prod_univ_two]
  simp [radialCoordinates]

/-- Evaluation of the radial polynomial agrees with the actual uniform
coordinate integral for every radius. -/
theorem radialAverage_eval (p : TwoVariablePolynomial) (r : ℝ) :
    (radialAverage p).eval r = r *
      (∫ t in (0 : ℝ)..1, MvPolynomial.eval (radialCoordinates r t) p) := by
  classical
  change evalRingHom r (radialAverage p) = _
  rw [radialAverage, map_sum]
  calc
    _ = r * ∑ d ∈ p.support,
        (∫ t in (0 : ℝ)..1, p.coeff d * ((r * t) ^ (d 0) * (r * (1 - t)) ^ (d 1))) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro d _
      change (C (p.coeff d * uniformBeta (d 0) (d 1)) * X ^ (d 0 + d 1 + 1)).eval r = _
      simp only [eval_mul, eval_C, eval_pow, eval_X]
      have hi : (fun t : ℝ => p.coeff d * ((r * t) ^ (d 0) * (r * (1 - t)) ^ (d 1))) =
          (fun t : ℝ => (p.coeff d * r ^ (d 0) * r ^ (d 1)) * (t ^ (d 0) * (1 - t) ^ (d 1))) := by
        funext t
        simp only [mul_pow]
        ring
      rw [hi, intervalIntegral.integral_const_mul]
      change p.coeff d * uniformBeta (d 0) (d 1) * r ^ (d 0 + d 1 + 1) =
        r * ((p.coeff d * r ^ (d 0) * r ^ (d 1)) * uniformBeta (d 0) (d 1))
      rw [pow_add, pow_add, pow_one]
      ring
    _ = _ := by
      rw [← intervalIntegral.integral_finsetSum]
      · simp_rw [bivariate_eval_radial p r]
      · intro d _
        have hc : Continuous (fun t : ℝ =>
            p.coeff d * ((r * t) ^ (d 0) * (r * (1 - t)) ^ (d 1))) := by fun_prop
        exact hc.intervalIntegrable 0 1

end KauersKoutschan
