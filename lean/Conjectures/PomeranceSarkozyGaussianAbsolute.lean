module
public import Conjectures.PomeranceSarkozyPoissonDifferenceMoment
public import Conjectures.PomeranceSarkozyWeakAbsoluteMoment
public import Mathlib.Analysis.SpecialFunctions.Gaussian.GaussianIntegral
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory ProbabilityTheory Set
open scoped Topology NNReal ProbabilityTheory

private theorem gaussian_weighted_half_integral :
    ∫ x : ℝ in Ioi 0,x*Real.exp (-(1/4:ℝ)*x^2)=2 := by
  apply Complex.ofReal_injective
  rw [← integral_complex_ofReal]
  have hc := integral_mul_cexp_neg_mul_sq (b:= (1/4:ℂ)) (by norm_num)
  push_cast
  convert hc using 1; norm_num

private theorem gaussian_weighted_abs_integral :
    ∫ x : ℝ,|x| * Real.exp (-(1/4:ℝ)*x^2)=4 := by
  let f (x : ℝ) := |x| * Real.exp (-(1/4:ℝ)*x^2)
  change ∫ x : ℝ,f x=4
  have hf : Integrable f := by
    unfold f
    have h := (integrable_mul_exp_neg_mul_sq (by norm_num : (0:ℝ)<1/4)).norm
    simpa only [norm_mul,Real.norm_eq_abs,abs_of_nonneg (Real.exp_nonneg _)] using h
  have hpos : ∫ x : ℝ in Ioi 0,f x=2 := by
    rw [← gaussian_weighted_half_integral]
    apply setIntegral_congr_fun measurableSet_Ioi
    intro x hx
    unfold f
    rw [abs_of_pos hx]
  have hneg : ∫ x : ℝ in Iic 0,f x=2 := calc
    _ = ∫ x : ℝ in Ioi 0,f (-x) := by simpa only [neg_zero] using (integral_comp_neg_Ioi 0 f).symm
    _ = ∫ x : ℝ in Ioi 0,f x := by
      apply setIntegral_congr_fun measurableSet_Ioi
      intro x _
      simp only [f,abs_neg,neg_sq]
    _ = _ := hpos
  rw [← integral_add_compl (s:=Ioi 0) measurableSet_Ioi hf,compl_Ioi,hpos,hneg]
  norm_num

theorem centered_gaussian_two_absolute_moment :
    ∫ x : ℝ,|x| ∂gaussianReal 0 2=2/Real.sqrt Real.pi := by
  have hπ := Real.pi_pos
  rw [integral_gaussianReal_eq_integral_smul (by norm_num : (2:ℝ≥0)≠0)]
  have he (x : ℝ) : gaussianPDFReal 0 2 x • |x| =
      (Real.sqrt (4*Real.pi))⁻¹*(|x| * Real.exp (-(1/4:ℝ)*x^2)) := by
    unfold gaussianPDFReal
    rw [smul_eq_mul]
    push_cast
    have h₁ : 2*Real.pi*2=4*Real.pi := by ring
    have h₂ : -(x-0)^2/(2*2)= -(1/4:ℝ)*x^2 := by ring
    rw [h₁,h₂]
    ring
  simp_rw [he]
  rw [integral_const_mul,gaussian_weighted_abs_integral,Real.sqrt_mul (by norm_num : (0:ℝ)≤4)]
  have hs : Real.sqrt (4:ℝ)=2 := by rw [show (4:ℝ)=(2:ℝ)^2 by norm_num,Real.sqrt_sq (by norm_num)]
  rw [hs]
  field_simp; ring

/-- The absolute first moment converges to the exact Gaussian
constant, justified by the uniform second moment rather than weak
convergence alone. -/
theorem normalizedPoissonDifference_abs_moment_tendsto (b : ℕ→ℝ≥0)
    (hb : Tendsto (fun n => (b n:ℝ)) atTop atTop) :
    Tendsto (fun n => ∫ x : ℝ,|x| ∂(normalizedPoissonDifference (b n):Measure ℝ))
      atTop (𝓝 (2/Real.sqrt Real.pi)) := by
  rw [← centered_gaussian_two_absolute_moment]
  let ν : ProbabilityMeasure ℝ := ⟨gaussianReal 0 2,inferInstance⟩
  have hv : Integrable (fun x : ℝ=>x^2) (ν:Measure ℝ) := by
    have h := memLp_id_gaussianReal (μ:=0) (v:=2) 2
    exact (memLp_two_iff_integrable_sq (by fun_prop)).mp h
  have hv₂ : ∫ x : ℝ,x^2 ∂(ν:Measure ℝ)=2 := by
    have h := variance_fun_id_gaussianReal (μ:=0) (v:=2)
    rw [variance_eq_integral (by fun_prop),integral_id_gaussianReal] at h
    change ∫ x : ℝ,x^2 ∂gaussianReal 0 2=2
    simpa only [sub_zero,NNReal.coe_ofNat] using h
  refine weak_absolute_moment_tendsto (normalizedPoissonDifference_tendsto b hb) 2 (by norm_num) hv hv₂.le ?_
  filter_upwards [hb.eventually_gt_atTop (0:ℝ)] with n hn
  have h := normalizedPoissonDifference_secondMoment (b n) (by exact_mod_cast hn)
  refine ⟨?_,h.le⟩
  by_contra! hni
  rw [integral_undef hni] at h
  norm_num at h

end PomeranceSarkozy
