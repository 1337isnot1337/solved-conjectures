module
public import Conjectures.WachsActualGammaSumLaw

@[expose] public section
namespace WachsCompleteGraph

open MeasureTheory ProbabilityTheory

theorem independentSumLaw_above_ae {μ ν : Measure ℝ} [IsProbabilityMeasure ν] (c : ℝ)
    (hμ : ∀ᵐ x ∂μ, c ≤ x) (hν : ∀ᵐ y ∂ν, 0 < y) :
    ∀ᵐ z ∂independentSumLaw μ ν, c < z := by
  unfold independentSumLaw
  rw [ae_map_iff (by fun_prop : AEMeasurable (fun xy : ℝ × ℝ => xy.1+xy.2) (μ.prod ν))]
  · apply (Measure.ae_prod_iff_ae_ae (by measurability)).mpr
    filter_upwards [hμ] with x hx
    filter_upwards [hν] with y hy
    exact hx.trans_lt (lt_add_of_pos_right x hy)
  · exact measurableSet_lt measurable_const measurable_id

theorem shiftedGammaLaw_shift_le (k p : ℕ) (rates : Fin p → ℝ)
    (hr : ∀ i,0 < rates i) :
    ∀ᵐ z ∂shiftedGammaLaw k p rates, ((k+1:ℕ):ℝ) ≤ z := by
  induction p with
  | zero =>
    unfold shiftedGammaLaw
    have hS : MeasurableSet {z : ℝ | ((k+1:ℕ):ℝ) ≤ z} := measurableSet_Ici
    exact (ae_dirac_iff (p:=fun z : ℝ => ((k+1:ℕ):ℝ)≤z) hS).mpr le_rfl
  | succ p ih =>
    have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
      (hr (Fin.last p))
    unfold shiftedGammaLaw
    exact (independentSumLaw_above_ae _ (ih _ (fun i => hr i.castSucc))
      (gamma_measure_positive_ae k (rates (Fin.last p)))).mono (fun _ h => h.le)

theorem shiftedGammaLaw_strictly_above_shift (k p : ℕ) (rates : Fin (p+1) → ℝ)
    (hr : ∀ i,0 < rates i) :
    ∀ᵐ z ∂shiftedGammaLaw k (p+1) rates, ((k+1:ℕ):ℝ) < z := by
  have _ := isProbabilityMeasure_gammaMeasure (by positivity : (0:ℝ)<((k+1:ℕ):ℝ))
    (hr (Fin.last p))
  unfold shiftedGammaLaw
  exact independentSumLaw_above_ae _ (shiftedGammaLaw_shift_le k p _ (fun i => hr i.castSucc))
    (gamma_measure_positive_ae k (rates (Fin.last p)))

end WachsCompleteGraph
