module
public import Conjectures.WachsProbabilityConvolution

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory ProbabilityTheory

noncomputable def shiftedGammaLaw (k : ℕ) : (p : ℕ) → (Fin p → ℝ) → Measure ℝ
  | 0, _ => Measure.dirac ((k+1:ℕ):ℝ)
  | p+1, r => independentSumLaw (shiftedGammaLaw k p (fun i => r i.castSucc))
      (gammaMeasure ((k+1:ℕ):ℝ) (r (Fin.last p)))

theorem shiftedGammaLaw_isProbability (k p : ℕ) (rates : Fin p → ℝ)
    (hr : ∀ i, 0 < rates i) : IsProbabilityMeasure (shiftedGammaLaw k p rates) := by
  induction p with
  | zero => unfold shiftedGammaLaw; infer_instance
  | succ p ih =>
    have _ := ih (fun i => rates i.castSucc) (fun i => hr i.castSucc)
    have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
      (hr (Fin.last p))
    unfold shiftedGammaLaw
    infer_instance

theorem shiftedGammaLaw_positive (k p : ℕ) (rates : Fin p → ℝ)
    (hr : ∀ i, 0 < rates i) : ∀ᵐ z ∂shiftedGammaLaw k p rates, 0 < z := by
  induction p with
  | zero =>
    unfold shiftedGammaLaw
    have hS : MeasurableSet {z : ℝ | 0 < z} := measurableSet_Ioi
    exact (ae_dirac_iff (p:=fun z : ℝ => 0<z) hS).mpr (by exact_mod_cast Nat.zero_lt_succ k)
  | succ p ih =>
    have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
      (hr (Fin.last p))
    unfold shiftedGammaLaw
    exact independentSumLaw_positive_ae (ih _ (fun i => hr i.castSucc))
      (gamma_measure_positive_ae k (rates (Fin.last p)))

theorem independentSumLaw_nullSingleton {μ ν : Measure ℝ} [IsProbabilityMeasure ν]
    [NullSingletonClass ν] : NullSingletonClass (independentSumLaw μ ν) where
  measure_singleton z := by
    let f : ℝ × ℝ → ℝ := fun xy => xy.1+xy.2
    have hm : Measurable f := by dsimp [f]; fun_prop
    unfold independentSumLaw
    change (Measure.map f (μ.prod ν)) {z} = 0
    rw [Measure.map_apply hm (measurableSet_singleton z),
      Measure.prod_apply (hm (measurableSet_singleton z))]
    have h (x : ℝ) : Prod.mk x ⁻¹' (f ⁻¹' {z}) = {z-x} := by
      ext y
      change x+y=z ↔ y=z-x
      constructor <;> intro h <;> linarith
    simp_rw [h,measure_singleton]
    simp

theorem shiftedGammaLaw_nullSingleton (k p : ℕ) (rates : Fin (p+1) → ℝ)
    (hr : ∀ i,0 < rates i) : NullSingletonClass (shiftedGammaLaw k (p+1) rates) := by
  have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
    (hr (Fin.last p))
  have _ : NullSingletonClass (gammaMeasure ((k+1:ℕ):ℝ) (rates (Fin.last p))) := by
    unfold gammaMeasure
    infer_instance
  exact independentSumLaw_nullSingleton

/-- The formal Gamma sum series is the actual exponential moment
series of the shifted sum of independent Mathlib Gamma distributions. -/
theorem shiftedGammaLaw_seriesMoments (k p : ℕ) (rates : Fin p → ℝ)
    (hr : ∀ i, 0 < rates i) :
    ProbabilitySeriesMoments (shiftedGammaLaw k p rates) (gammaSumSeries p (k+1) rates) := by
  induction p with
  | zero => simpa [shiftedGammaLaw,gammaSumSeries] using constant_series_moments ((k+1:ℕ):ℝ)
  | succ p ih =>
    have _ := shiftedGammaLaw_isProbability k p (fun i => rates i.castSucc) (fun i => hr i.castSucc)
    have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
      (hr (Fin.last p))
    rw [gammaSumSeries,Fin.prod_univ_castSucc,←mul_assoc]
    exact probabilitySeriesMoments_independentSum (ih _ (fun i => hr i.castSucc))
      (gamma_series_moments k _ (hr (Fin.last p)))

end WachsCompleteGraph
