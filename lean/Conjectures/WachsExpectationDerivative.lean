module
public import Conjectures.WachsCompleteGraphActualExpectation
public import Mathlib.Analysis.Calculus.Deriv.Polynomial

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries

noncomputable def expectationPolynomial (μ : Measure ℝ) (k : ℕ) : Polynomial ℝ :=
  ∑ j ∈ Finset.range (k+1), Polynomial.monomial j
    ((k.choose j:ℝ)*(-1:ℝ)^j*(∫ x : ℝ, x^j ∂μ))

theorem expectationPolynomial_eval {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (k : ℕ) (t : ℝ) :
    (expectationPolynomial μ k).eval t = ∫ x, (1-t*x)^k ∂μ := by
  rw [expectationPolynomial,Polynomial.eval_finsetSum,affine_pow_integral h]
  apply Finset.sum_congr rfl
  intro j _
  rw [Polynomial.eval_monomial,h.integral_eq_coeff,show -t=(-1:ℝ)*t by ring,mul_pow]
  ring

private theorem mul_affine_expansion (t x : ℝ) (k : ℕ) :
    x*(1-t*x)^k = ∑ j ∈ Finset.range (k+1),(k.choose j:ℝ)*(-t)^j*x^(j+1) := by
  rw [affine_pow_sum,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  rw [pow_succ]
  ring

theorem mul_affine_integrable {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (t : ℝ) (k : ℕ) :
    Integrable (fun x => x*(1-t*x)^k) μ := by
  simp_rw [mul_affine_expansion t]
  exact integrable_finsetSum _ (fun j _ => (h.moments_integrable (j+1)).const_mul _)

theorem integral_mul_affine {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (t : ℝ) (k : ℕ) :
    (∫ x, x*(1-t*x)^k ∂μ) =
      ∑ j ∈ Finset.range (k+1),(k.choose j:ℝ)*(-t)^j*(∫ x : ℝ, x^(j+1) ∂μ) := by
  simp_rw [mul_affine_expansion t]
  rw [integral_finsetSum _ (fun j _ => (h.moments_integrable (j+1)).const_mul _)]
  apply Finset.sum_congr rfl
  intro j _
  rw [integral_const_mul]

/-- Differentiate the expectation after expanding the finite polynomial,
so no differentiation inside an integral needs to be assumed. -/
theorem expectationPolynomial_derivative {μ : Measure ℝ} {A : PowerSeries ℝ}
    (h : ProbabilitySeriesMoments μ A) (k : ℕ) (t : ℝ) :
    (expectationPolynomial μ (k+1)).derivative.eval t =
      -((k:ℝ)+1)*(∫ x, x*(1-t*x)^k ∂μ) := by
  rw [expectationPolynomial,Finset.sum_range_succ',integral_mul_affine h,Finset.mul_sum,
    Polynomial.derivative_add]
  simp only [Polynomial.derivative_monomial, Nat.cast_zero, mul_zero, Polynomial.monomial_zero_right,add_zero]
  change (Polynomial.derivative (∑ j ∈ Finset.range (k+1), Polynomial.monomial (j+1)
    (((k+1).choose (j+1):ℝ)*(-1:ℝ)^(j+1)*(∫ x : ℝ, x^(j+1) ∂μ)))).eval t = _
  rw [show (Polynomial.derivative (∑ j ∈ Finset.range (k+1), Polynomial.monomial (j+1)
    (((k+1).choose (j+1):ℝ)*(-1:ℝ)^(j+1)*(∫ x : ℝ, x^(j+1) ∂μ)))) =
      ∑ j ∈ Finset.range (k+1), Polynomial.derivative (Polynomial.monomial (j+1)
        (((k+1).choose (j+1):ℝ)*(-1:ℝ)^(j+1)*(∫ x : ℝ, x^(j+1) ∂μ))) from
      map_sum Polynomial.derivative _ _,
    Polynomial.eval_finsetSum]
  apply Finset.sum_congr rfl
  intro j _
  rw [Polynomial.derivative_monomial_succ,Polynomial.eval_monomial,pow_succ,
    show -t=(-1:ℝ)*t by ring,mul_pow]
  have hchoose : ((k:ℝ)+1)*(k.choose j:ℝ) = ((k+1).choose (j+1):ℝ)*((j:ℝ)+1) := by
    exact_mod_cast Nat.add_one_mul_choose_eq k j
  linear_combination ((-1:ℝ)^j*t^j*(∫ x : ℝ, x^(j+1) ∂μ))*hchoose

end WachsCompleteGraph
