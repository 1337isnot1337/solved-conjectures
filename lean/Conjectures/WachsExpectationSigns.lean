module
public import Conjectures.WachsExpectationDerivative
public import Conjectures.WachsLaguerreSignIntervals

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries

theorem integral_positive_ae {μ : Measure ℝ} [IsProbabilityMeasure μ]
    {f : ℝ → ℝ} (hi : Integrable f μ) (hp : ∀ᵐ x ∂μ, 0 < f x) :
    0 < ∫ x, f x ∂μ := by
  apply (integral_pos_iff_support_of_nonneg_ae (hp.mono (fun _ h => h.le)) hi).mpr
  have hs : ∀ᵐ x ∂μ, x ∈ Function.support f := hp.mono (fun _ h => h.ne')
  have hset : Function.support f =ᵐ[μ] (Set.univ : Set ℝ) := ae_eq_univ.mpr hs
  rw [measure_congr hset,measure_univ]
  exact zero_lt_one

theorem affine_nonzero_ae {μ : Measure ℝ} [NullSingletonClass μ] (t : ℝ) :
    ∀ᵐ x ∂μ, 1-t*x ≠ 0 := by
  by_cases ht : t=0
  · simp [ht]
  · apply ae_iff.mpr
    have h : {x : ℝ | ¬ (1-t*x ≠ 0)} = {t⁻¹} := by
      ext x
      change (¬ (1-t*x ≠ 0)) ↔ x = t⁻¹
      rw [not_ne_iff]
      constructor
      · intro hz
        apply (mul_left_cancel₀ ht)
        rw [mul_inv_cancel₀ ht]
        linarith
      · intro hz
        rw [hz,mul_inv_cancel₀ ht,sub_self]
    rw [h,measure_singleton]

theorem expectation_even_pos {μ : Measure ℝ} [IsProbabilityMeasure μ] [NullSingletonClass μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A) {k : ℕ} (hk : Even k) (t : ℝ) :
    0 < (expectationPolynomial μ k).eval t := by
  rw [expectationPolynomial_eval h k t]
  exact integral_positive_ae (affine_pow_integrable h t k)
    ((affine_nonzero_ae (μ:=μ) t).mono (fun _ hx => hk.pow_pos hx))

theorem expectation_derivative_negative {μ : Measure ℝ} [IsProbabilityMeasure μ] [NullSingletonClass μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A)
    (hμ : ∀ᵐ x ∂μ, 0 < x) {k : ℕ} (hk : Even k) (t : ℝ) :
    (expectationPolynomial μ (k+1)).derivative.eval t < 0 := by
  rw [expectationPolynomial_derivative h k t]
  apply mul_neg_of_neg_of_pos (neg_lt_zero.mpr (by positivity))
  apply integral_positive_ae (mul_affine_integrable h t k)
  filter_upwards [hμ,affine_nonzero_ae (μ:=μ) t] with x hx hn
  exact mul_pos hx (hk.pow_pos hn)

theorem expectation_eval_zero {μ : Measure ℝ} [IsProbabilityMeasure μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A) (k : ℕ) :
    (expectationPolynomial μ k).eval 0 = 1 := by
  rw [expectationPolynomial_eval h k 0]
  simp

theorem expectation_odd_sign_right {μ : Measure ℝ} [IsProbabilityMeasure μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A) {k : ℕ} (hk : Odd k) (b : ℝ)
    (hb : ∀ᵐ x ∂μ, 1-b*x < 0) :
    (expectationPolynomial μ k).eval b < 0 := by
  rw [expectationPolynomial_eval h k b]
  have h' : 0 < ∫ x, -((1-b*x)^k) ∂μ :=
    integral_positive_ae (affine_pow_integrable h b k).neg
      (hb.mono (fun _ hx => neg_pos.mpr (hk.pow_neg hx)))
  rw [integral_neg] at h'
  exact neg_pos.mp h'

end WachsCompleteGraph
