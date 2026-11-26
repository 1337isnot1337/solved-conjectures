module
public import Conjectures.PomeranceSarkozyRareGaussianVarianceWeight
public import Mathlib.Probability.Moments.Basic
public import Mathlib.MeasureTheory.Measure.Lebesgue.Integral
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Set MeasureTheory ProbabilityTheory
open scoped ENNReal NNReal

noncomputable def standardGaussianNorm : ℝ := (Real.sqrt (2*Real.pi))⁻¹

theorem standardGaussianNorm_pos : 0<standardGaussianNorm := by
  unfold standardGaussianNorm
  positivity

private theorem normalTailProbability_eq_integral (a : ℝ) :
    normalTailProbability a = ∫ x in Ioi a,gaussianPDFReal 0 1 x := by
  unfold normalTailProbability
  rw [measureReal_def,gaussianReal_apply_eq_integral 0 (by norm_num : (1:ℝ≥0)≠0),
    ENNReal.toReal_ofReal (setIntegral_nonneg measurableSet_Ioi (fun x _=>gaussianPDFReal_nonneg _ _ _))]

/-- An elementary lower bound from the unit interval just above
the threshold. Its exponent has the exact quadratic coefficient
needed for the rare-rate cubic asymptotic. -/
theorem normalTailProbability_gaussian_lower (a : ℝ) (ha : 0≤a) :
    standardGaussianNorm*Real.exp (-(a+1)^2/2)≤normalTailProbability a := by
  rw [normalTailProbability_eq_integral]
  let b := standardGaussianNorm*Real.exp (-(a+1)^2/2)
  have hS : Ioc a (a+1)⊆Ioi a := fun _ h=>h.1
  have hPDF := integrable_gaussianPDFReal 0 1
  have he : (∫ x : ℝ in Ioc a (a+1),b)=b := by
    rw [setIntegral_const,Real.volume_real_Ioc_of_le (by linarith),smul_eq_mul]
    simp
  have hDom : ∀ x∈Ioc a (a+1),b≤gaussianPDFReal 0 1 x := by
    intro x hx
    have hx0 : 0≤x := ha.trans hx.1.le
    have hz : -(a+1)^2/2≤ -x^2/2 := by nlinarith [mul_nonneg (sub_nonneg.mpr hx.2) (show 0≤a+1+x by linarith)]
    simp only [gaussianPDFReal_def,NNReal.coe_one,mul_one,sub_zero]
    exact mul_le_mul_of_nonneg_left (Real.exp_le_exp.mpr hz) standardGaussianNorm_pos.le
  calc
    b = ∫ x : ℝ in Ioc a (a+1),b := he.symm
    _ ≤ ∫ x in Ioc a (a+1),gaussianPDFReal 0 1 x :=
      setIntegral_mono_on (integrableOn_const (measure_Ioc_lt_top.ne))
        hPDF.integrableOn measurableSet_Ioc hDom
    _ ≤ _ := setIntegral_mono_set hPDF.integrableOn (Filter.Eventually.of_forall (fun _=>gaussianPDFReal_nonneg _ _ _))
      (Filter.Eventually.of_forall fun _ hx=>hS hx)

/-- Standard Gaussian upper tail, checked by the exact Gaussian MGF.
Together with the elementary lower bound this avoids relying on
any numerical Gaussian approximations for the rare asymptotics. -/
theorem normalTailProbability_gaussian_upper (a : ℝ) (ha : 0≤a) :
    normalTailProbability a≤ Real.exp (-a^2/2) := by
  let μ := gaussianReal 0 1
  have hE : Integrable (fun x : ℝ=>Real.exp (a*x)) μ := by
    exact (integrable_exp_mul_gaussianReal (μ:=0) (v:=1) a)
  calc
    normalTailProbability a ≤ μ.real {x | a≤(id : ℝ→ℝ) x} :=
      measureReal_mono (fun _ hx=>le_of_lt hx) (measure_ne_top μ _)
    _ ≤ Real.exp (-a*a)*mgf id μ a := measure_ge_le_exp_mul_mgf a ha hE
    _ = _ := by
      unfold μ
      rw [mgf_id_gaussianReal,← Real.exp_add]
      push_cast
      congr 1
      ring

end PomeranceSarkozy
