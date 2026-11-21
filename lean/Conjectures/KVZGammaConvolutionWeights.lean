module

public import Conjectures.KVZGammaDensityBasic
public import Conjectures.KVZGammaPowerAlgebra
public import Mathlib.MeasureTheory.Integral.Prod
public import Mathlib.MeasureTheory.Function.SpecialFunctions.Basic
public import Mathlib.Tactic.Linarith

/-!
# Integrability for the literal gamma convolution

All integrals use Lebesgue measure restricted to the positive half-line.
The separable majorant is a sum of two ordinary gamma moments, so every
Fubini hypothesis used by the determinant composition is proved here.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Set Real

noncomputable section

private theorem gamma_moment_integrand (a d : ℝ) {u : ℝ} (hu : 0 < u) :
    gammaDensity a u * u ^ d = exp (-u) * u ^ (a + d - 1) / Gamma a := by
  change (u ^ (a - 1) * exp (-u) / Gamma a) * u ^ d =
    exp (-u) * u ^ (a + d - 1) / Gamma a
  rw [show a + d - 1 = (a - 1) + d by ring, rpow_add hu]
  ring

/-- The combined exponent is the only integrability condition needed for
this literal moment formula. -/
theorem gamma_moment_integrable {a d : ℝ} (had : 0 < a + d) :
    Integrable (fun u => gammaDensity a u * u ^ d)
      (volume.restrict (Ioi 0)) := by
  have hbase : Integrable (fun u : ℝ => exp (-u) * u ^ (a + d - 1))
      (volume.restrict (Ioi 0)) := GammaIntegral_convergent had
  apply (hbase.div_const (Gamma a)).congr
  exact ae_restrict_of_forall_mem measurableSet_Ioi fun u hu =>
    (gamma_moment_integrand a d hu).symm

theorem gamma_moment_integral {a d : ℝ} (had : 0 < a + d) :
    (∫ u in Ioi 0, gammaDensity a u * u ^ d) = Gamma (a + d) / Gamma a := by
  calc
    _ = ∫ u in Ioi 0, exp (-u) * u ^ (a + d - 1) / Gamma a :=
      setIntegral_congr_fun measurableSet_Ioi fun u hu => gamma_moment_integrand a d hu
    _ = (∫ u in Ioi 0, exp (-u) * u ^ (a + d - 1)) / Gamma a :=
      integral_div _ _
    _ = _ := by rw [← Gamma_eq_integral had]

theorem gamma_density_integrable {a : ℝ} (ha : 0 < a) :
    Integrable (gammaDensity a) (volume.restrict (Ioi 0)) := by
  simpa only [rpow_zero, mul_one] using
    (gamma_moment_integrable (a := a) (d := 0) (by simpa using ha))

/-- A uniform power bound that works for every nonnegative real exponent. -/
theorem convolution_weight_bound {δ u : ℝ} (hδ : 0 ≤ δ) (hu : 0 < u) :
    (1 + u) ^ δ ≤ (2 : ℝ) ^ δ * (1 + u ^ δ) := by
  have htwo : 0 ≤ (2 : ℝ) ^ δ := rpow_nonneg (by norm_num) _
  have hupow : 0 ≤ u ^ δ := rpow_nonneg hu.le _
  by_cases hu1 : u ≤ 1
  · calc
      (1 + u) ^ δ ≤ (2 : ℝ) ^ δ :=
        rpow_le_rpow (by linarith) (by linarith) hδ
      _ ≤ (2 : ℝ) ^ δ * (1 + u ^ δ) := by
        simpa only [mul_one] using
          mul_le_mul_of_nonneg_left (show 1 ≤ 1 + u ^ δ by linarith) htwo
  · have hu1' : 1 ≤ u := (lt_of_not_ge hu1).le
    calc
      (1 + u) ^ δ ≤ (2 * u) ^ δ :=
        rpow_le_rpow (by linarith) (by linarith) hδ
      _ = (2 : ℝ) ^ δ * u ^ δ := mul_rpow (by norm_num) hu.le
      _ ≤ (2 : ℝ) ^ δ * (1 + u ^ δ) :=
        mul_le_mul_of_nonneg_left (by linarith) htwo

/-- The one-variable majorant needed for every expanded determinant term. -/
theorem gamma_weight_integrable {a δ : ℝ} (ha : 0 < a) (hδ : 0 ≤ δ) :
    Integrable (fun u => gammaDensity a u * (1 + u) ^ δ)
      (volume.restrict (Ioi 0)) := by
  have hzero := gamma_density_integrable ha
  have hmoment := gamma_moment_integrable (a := a) (d := δ)
    (add_pos_of_pos_of_nonneg ha hδ)
  have hm : AEStronglyMeasurable (fun u => gammaDensity a u * (1 + u) ^ δ)
      (volume.restrict (Ioi 0)) := by
    apply Measurable.aestronglyMeasurable
    change Measurable (fun u : ℝ => u ^ (a - 1) * exp (-u) / Gamma a * (1 + u) ^ δ)
    fun_prop
  apply ((hzero.add hmoment).const_mul ((2 : ℝ) ^ δ)).mono' hm
  refine ae_restrict_of_forall_mem measurableSet_Ioi fun u hu => ?_
  change 0 < u at hu
  have hg := gammaDensity_nonneg ha hu
  have hw : 0 ≤ (1 + u) ^ δ := rpow_nonneg (by linarith) _
  rw [Real.norm_of_nonneg (mul_nonneg hg hw)]
  calc
    _ ≤ gammaDensity a u * ((2 : ℝ) ^ δ * (1 + u ^ δ)) :=
      mul_le_mul_of_nonneg_left (convolution_weight_bound hδ hu) hg
    _ = _ := by
      dsimp only [Pi.add_apply]
      ring

theorem powerKernel_le_product_weights {δ u v : ℝ}
    (hδ : 0 ≤ δ) (hu : 0 < u) (hv : 0 < v) :
    powerKernel δ u v ≤ (1 + u) ^ δ * (1 + v) ^ δ := by
  unfold powerKernel
  calc
    (u + v) ^ δ ≤ ((1 + u) * (1 + v)) ^ δ :=
      rpow_le_rpow (add_pos hu hv).le (by nlinarith [mul_pos hu hv]) hδ
    _ = _ := mul_rpow (by linarith) (by linarith)

/-- Pairwise integrability for the first determinant composition. -/
theorem gamma_power_integrable {a δ v : ℝ}
    (ha : 0 < a) (hδ : 0 < δ) (hv : 0 < v) :
    Integrable (fun u => gammaDensity a u * powerKernel δ u v)
      (volume.restrict (Ioi 0)) := by
  have hm : AEStronglyMeasurable (fun u => gammaDensity a u * powerKernel δ u v)
      (volume.restrict (Ioi 0)) := by
    apply Measurable.aestronglyMeasurable
    change Measurable (fun u : ℝ =>
      u ^ (a - 1) * exp (-u) / Gamma a * (u + v) ^ δ)
    fun_prop
  apply ((gamma_weight_integrable ha hδ.le).mul_const ((1 + v) ^ δ)).mono' hm
  refine ae_restrict_of_forall_mem measurableSet_Ioi fun u hu => ?_
  have hg := gammaDensity_nonneg ha hu
  have hp : 0 ≤ powerKernel δ u v := rpow_nonneg (add_pos hu hv).le _
  rw [Real.norm_of_nonneg (mul_nonneg hg hp)]
  calc
    _ ≤ gammaDensity a u * ((1 + u) ^ δ * (1 + v) ^ δ) :=
      mul_le_mul_of_nonneg_left (powerKernel_le_product_weights hδ.le hu hv) hg
    _ = _ := by ring

/-- Absolute integrability on the actual two-dimensional positive domain. -/
theorem gamma_product_integrable {a b δ : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hδ : 0 < δ) :
    Integrable (fun p : ℝ × ℝ =>
      gammaDensity a p.1 * powerKernel δ p.1 p.2 * gammaDensity b p.2)
      ((volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0))) := by
  have hm : AEStronglyMeasurable (fun p : ℝ × ℝ =>
      gammaDensity a p.1 * powerKernel δ p.1 p.2 * gammaDensity b p.2)
      ((volume.restrict (Ioi 0)).prod (volume.restrict (Ioi 0))) := by
    apply Measurable.aestronglyMeasurable
    change Measurable (fun p : ℝ × ℝ =>
      p.1 ^ (a - 1) * exp (-p.1) / Gamma a * (p.1 + p.2) ^ δ *
        (p.2 ^ (b - 1) * exp (-p.2) / Gamma b))
    fun_prop
  apply ((gamma_weight_integrable ha hδ.le).mul_prod
    (gamma_weight_integrable hb hδ.le)).mono' hm
  rw [Measure.prod_restrict]
  refine ae_restrict_of_forall_mem (measurableSet_Ioi.prod measurableSet_Ioi) fun p hp => ?_
  have hga := gammaDensity_nonneg ha hp.1
  have hgb := gammaDensity_nonneg hb hp.2
  have hpow : 0 ≤ powerKernel δ p.1 p.2 := rpow_nonneg (add_pos hp.1 hp.2).le _
  rw [Real.norm_of_nonneg (mul_nonneg (mul_nonneg hga hpow) hgb)]
  calc
    _ ≤ gammaDensity a p.1 * ((1 + p.1) ^ δ * (1 + p.2) ^ δ) * gammaDensity b p.2 :=
      mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_left (powerKernel_le_product_weights hδ.le hp.1 hp.2) hga) hgb
    _ = _ := by ring

/-- Pairwise integrability for the second determinant composition. -/
theorem gamma_half_integrable {a b δ : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hδ : 0 < δ) :
    Integrable (fun v => gammaDensity b v *
      ∫ u in Ioi 0, gammaDensity a u * powerKernel δ u v)
      (volume.restrict (Ioi 0)) := by
  have hprod := gamma_product_integrable ha hb hδ
  convert hprod.integral_prod_right using 1
  funext v
  dsimp only
  rw [integral_mul_const]
  ring

end

end KVZGamma
