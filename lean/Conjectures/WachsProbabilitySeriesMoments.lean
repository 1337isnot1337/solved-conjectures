module
public import Conjectures.WachsGammaMeasureMoments
public import Conjectures.WachsMomentFactorLogConcavity
public import Mathlib.MeasureTheory.Integral.Prod
public import Mathlib.MeasureTheory.Measure.Dirac.Basic

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory PowerSeries ProbabilityTheory

structure ProbabilitySeriesMoments (μ : Measure ℝ) (A : PowerSeries ℝ) : Prop where
  moments_integrable (j : ℕ) : Integrable (fun x : ℝ => x^j) μ
  integral_eq_coeff (j : ℕ) : (∫ x : ℝ, x^j ∂μ) = (j.factorial:ℝ)*coeff j A

theorem gamma_series_moments (n : ℕ) (a : ℝ) (ha : 0 < a) :
    ProbabilitySeriesMoments (gammaMeasure ((n+1:ℕ):ℝ) a) (gammaMomentFactor (n+1) a) :=
  ⟨fun j => integrable_gamma_nat_power n j ha,fun j => gamma_nat_integral_matches_formal n j ha⟩

theorem constant_series_moments (c : ℝ) :
    ProbabilitySeriesMoments (Measure.dirac c) (expAt c) := by
  refine ⟨fun j => ?_, fun j => ?_⟩
  · exact integrable_dirac (by simp)
  · rw [integral_dirac,expAt_real_coeff]
    have h : (j.factorial:ℝ) ≠ 0 := by positivity
    field_simp

noncomputable def independentSumLaw (μ ν : Measure ℝ) : Measure ℝ :=
  Measure.map (fun xy : ℝ × ℝ => xy.1+xy.2) (μ.prod ν)

noncomputable instance (μ ν : Measure ℝ) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    IsProbabilityMeasure (independentSumLaw μ ν) where
  measure_univ := by
    unfold independentSumLaw
    rw [Measure.map_apply (by fun_prop) MeasurableSet.univ,Set.preimage_univ,measure_univ]

theorem independentSumLaw_positive_ae {μ ν : Measure ℝ} [IsProbabilityMeasure ν]
    (hμ : ∀ᵐ x ∂μ, 0 < x) (hν : ∀ᵐ y ∂ν, 0 < y) :
    ∀ᵐ z ∂independentSumLaw μ ν, 0 < z := by
  unfold independentSumLaw
  rw [ae_map_iff (by fun_prop : AEMeasurable (fun xy : ℝ × ℝ => xy.1+xy.2) (μ.prod ν))]
  · apply (Measure.ae_prod_iff_ae_ae (by measurability)).mpr
    filter_upwards [hμ] with x hx
    filter_upwards [hν] with y hy
    exact add_pos hx hy
  · exact measurableSet_lt measurable_const measurable_id

end WachsCompleteGraph
