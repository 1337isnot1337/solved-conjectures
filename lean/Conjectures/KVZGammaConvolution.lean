module

public import Conjectures.KVZGammaConvolutionWeights
public import Conjectures.KVZGammaConvolutionBeta
public import Mathlib.MeasureTheory.Group.Prod

/-!
# The double positive-domain gamma moment

A volume-preserving linear shear changes the positive quadrant into the
region `0 < t < s`. The checked beta identity evaluates the inner density
convolution, and the remaining integral is an ordinary gamma moment.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Set Real

noncomputable section

private def gammaShear : ℝ × ℝ ≃ᵐ ℝ × ℝ :=
  (MeasurableEquiv.prodComm : ℝ × ℝ ≃ᵐ ℝ × ℝ).trans
    (MeasurableEquiv.shearSubRight ℝ)

private theorem gammaShear_apply (p : ℝ × ℝ) : gammaShear p = (p.2, p.1 - p.2) := rfl

private theorem gammaShear_preserving :
    MeasurePreserving gammaShear
      ((volume : Measure ℝ).prod volume) ((volume : Measure ℝ).prod volume) := by
  exact measurePreserving_prod_sub_swap volume volume

private theorem gamma_product_integral {a b δ : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hδ : 0 < δ) :
    (∫ p : ℝ × ℝ,
      gammaDensity a p.1 * powerKernel δ p.1 p.2 * gammaDensity b p.2
      ∂(volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0))) =
      Gamma (a + b + δ) / Gamma (a + b) := by
  let K : ℝ × ℝ → ℝ := fun p =>
    gammaDensity a p.1 * powerKernel δ p.1 p.2 * gammaDensity b p.2
  let Q : Set (ℝ × ℝ) := Ioi 0 ×ˢ Ioi 0
  let H : ℝ → ℝ := fun s => s ^ δ *
    ∫ t in (0 : ℝ)..s, gammaDensity a t * gammaDensity b (s - t)
  have hQ : MeasurableSet Q := measurableSet_Ioi.prod measurableSet_Ioi
  have hK : Integrable K
      ((volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0))) :=
    gamma_product_integrable ha hb hδ
  have hKI : Integrable (Q.indicator K) ((volume : Measure ℝ).prod volume) := by
    rw [integrable_indicator_iff hQ]
    simpa only [IntegrableOn, Measure.prod_restrict] using hK
  have hKIcomp := gammaShear_preserving.integrable_comp_of_integrable hKI
  have hinner (s : ℝ) :
      (∫ t : ℝ, Q.indicator K (t, s - t)) = (Ioi 0).indicator H s := by
    have hpoint (t : ℝ) : Q.indicator K (t, s - t) =
        (Ioo 0 s).indicator
          (fun t => s ^ δ * (gammaDensity a t * gammaDensity b (s - t))) t := by
      by_cases ht : t ∈ Ioo 0 s
      · have hpos : (t, s - t) ∈ Q := ⟨ht.1, sub_pos.mpr ht.2⟩
        rw [indicator_of_mem hpos, indicator_of_mem ht]
        change gammaDensity a t * (t + (s - t)) ^ δ * gammaDensity b (s - t) =
          s ^ δ * (gammaDensity a t * gammaDensity b (s - t))
        rw [show t + (s - t) = s by ring]
        ring
      · have hnot : (t, s - t) ∉ Q := by
          intro h
          exact ht ⟨h.1, sub_pos.mp h.2⟩
        rw [indicator_of_notMem hnot, indicator_of_notMem ht]
    simp_rw [hpoint]
    rw [integral_indicator measurableSet_Ioo, integral_const_mul]
    by_cases hs : 0 < s
    · rw [indicator_of_mem (s := Ioi (0 : ℝ)) hs]
      dsimp [H]
      rw [intervalIntegral.integral_of_le hs.le, integral_Ioc_eq_integral_Ioo]
    · rw [indicator_of_notMem (s := Ioi (0 : ℝ)) hs]
      have he : Ioo (0 : ℝ) s = ∅ := Ioo_eq_empty_of_le (le_of_not_gt hs)
      simp [he]
  calc
    (∫ p : ℝ × ℝ, K p
      ∂(volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0))) =
        ∫ p : ℝ × ℝ, Q.indicator K p ∂(volume : Measure ℝ).prod volume := by
      rw [Measure.prod_restrict, integral_indicator hQ]
    _ = ∫ p : ℝ × ℝ, Q.indicator K (gammaShear p)
        ∂(volume : Measure ℝ).prod volume :=
      (gammaShear_preserving.integral_comp gammaShear.measurableEmbedding _).symm
    _ = ∫ s : ℝ, ∫ t : ℝ, Q.indicator K (t, s - t) := by
      simpa only [Function.comp_apply, gammaShear_apply] using
        (integral_prod ((Q.indicator K) ∘ gammaShear) hKIcomp)
    _ = ∫ s : ℝ, (Ioi 0).indicator H s :=
      integral_congr_ae (Filter.Eventually.of_forall hinner)
    _ = ∫ s in Ioi 0, H s := integral_indicator measurableSet_Ioi
    _ = ∫ s in Ioi 0, gammaDensity (a + b) s * s ^ δ := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro s hs
      dsimp [H]
      rw [gamma_density_convolution ha hb hs]
      ring
    _ = Gamma (a + b + δ) / Gamma (a + b) :=
      gamma_moment_integral (add_pos (add_pos ha hb) hδ)

/-- The exact double-domain identity used by the determinant composition.
Both gamma densities and the power kernel are their literal source formulas;
all integration is against volume restricted to the positive half-line. -/
theorem gamma_double_integral {a b δ : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hδ : 0 < δ) :
    (∫ v in Ioi 0, gammaDensity b v *
      ∫ u in Ioi 0, gammaDensity a u * powerKernel δ u v) =
      Gamma (a + b + δ) / Gamma (a + b) := by
  have hprod := gamma_product_integrable ha hb hδ
  calc
    _ = ∫ p : ℝ × ℝ,
        gammaDensity a p.1 * powerKernel δ p.1 p.2 * gammaDensity b p.2
        ∂(volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0)) := by
      rw [integral_prod_symm _ hprod]
      apply integral_congr_ae
      exact Filter.Eventually.of_forall fun v => by
        dsimp only
        rw [integral_mul_const]
        ring
    _ = _ := gamma_product_integral ha hb hδ

end

end KVZGamma
