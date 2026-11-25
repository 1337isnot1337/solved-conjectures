module
public import Conjectures.WachsExpectationSigns
public import Mathlib.Analysis.Calculus.Deriv.MeanValue

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries Polynomial

theorem expectation_odd_strictAnti {μ : Measure ℝ} [IsProbabilityMeasure μ] [NullSingletonClass μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A)
    (hμ : ∀ᵐ x ∂μ, 0 < x) {k : ℕ} (hk : Even k) :
    StrictAnti fun t => (expectationPolynomial μ (k+1)).eval t := by
  apply strictAnti_of_deriv_neg
  intro t
  rw [Polynomial.deriv]
  exact expectation_derivative_negative h hμ hk t

theorem expectation_odd_unique_simple_root {μ : Measure ℝ} [IsProbabilityMeasure μ] [NullSingletonClass μ]
    {A : PowerSeries ℝ} (h : ProbabilitySeriesMoments μ A)
    (hμ : ∀ᵐ x ∂μ, 0 < x) {k : ℕ} (hk : Even k) {b : ℝ} (hb : 0 < b)
    (hneg : ∀ᵐ x ∂μ,1-b*x < 0) :
    ∃ t ∈ Set.Ioo 0 b, (expectationPolynomial μ (k+1)).IsRoot t ∧
      (expectationPolynomial μ (k+1)).rootMultiplicity t = 1 ∧
      ∀ x, (expectationPolynomial μ (k+1)).IsRoot x → x=t := by
  let P := expectationPolynomial μ (k+1)
  have ho : Odd (k+1) := hk.add_one
  have h0 : P.eval 0 = 1 := expectation_eval_zero h _
  have h1 : P.eval b < 0 := expectation_odd_sign_right h ho b hneg
  have hsign : P.eval 0 * P.eval b < 0 := by rwa [h0,one_mul]
  obtain ⟨t,ht,hroot⟩ := exists_root_between hb hsign
  have hP : P ≠ 0 := by
    intro hZ
    rw [hZ,eval_zero] at h0
    exact zero_ne_one h0
  have hs : P.derivative.eval t < 0 := expectation_derivative_negative h hμ hk t
  have hsimple : P.rootMultiplicity t = 1 := by
    have hpos := (rootMultiplicity_pos hP).mpr hroot
    have hn : ¬1 < P.rootMultiplicity t := by
      intro hh
      exact hs.ne ((one_lt_rootMultiplicity_iff_isRoot hP).mp hh).2
    omega
  refine ⟨t,ht,hroot,hsimple,fun x hx => ?_⟩
  apply (expectation_odd_strictAnti h hμ hk).injective
  exact hx.trans hroot.symm

end WachsCompleteGraph
