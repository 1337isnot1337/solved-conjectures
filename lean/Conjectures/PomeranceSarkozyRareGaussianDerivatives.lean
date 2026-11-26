module
public import Conjectures.PomeranceSarkozyRareGaussianCumulant
public import Conjectures.PomeranceSarkozyRareCumulantFirstBound
public import Mathlib.Analysis.Calculus.ParametricIntegral
import Mathlib.Tactic.Linarith

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory Set
open scoped Topology

noncomputable def gaussianRareFirstIntegrand (t s : ℝ) : ℝ :=
  bernoulliTiltedProbability (normalTailProbability s) t-normalTailProbability s

noncomputable def gaussianRareSecondIntegrand (t s : ℝ) : ℝ :=
  normalTailVarianceWeight s*Real.exp t/(bernoulliExponentialDenominator (normalTailProbability s) t)^2

private theorem firstIntegrand_measurable (t : ℝ) : Measurable (gaussianRareFirstIntegrand t) := by
  unfold gaussianRareFirstIntegrand bernoulliTiltedProbability bernoulliExponentialDenominator
  have h := normalTailProbability_measurable
  fun_prop

private theorem secondIntegrand_measurable (t : ℝ) : Measurable (gaussianRareSecondIntegrand t) := by
  unfold gaussianRareSecondIntegrand normalTailVarianceWeight bernoulliExponentialDenominator
  have h := normalTailProbability_measurable
  fun_prop

private theorem real_abs_bound_ball (t z : ℝ) (hz : z∈Metric.ball t 1) : |z|≤ |t|+1 := by
  have hd : |z-t|<1 := by simpa only [Metric.mem_ball,Real.dist_eq] using hz
  have h := abs_sub_le z t 0
  rw [sub_zero,sub_zero] at h
  linarith

/-- The first derivative is the integral of the exact tilted
Bernoulli derivative, justified by an integrable local envelope. -/
theorem gaussianRareCumulant_hasDerivAt (t : ℝ) :
    Integrable (gaussianRareFirstIntegrand t) ∧
      HasDerivAt gaussianRareCumulant (∫ s,gaussianRareFirstIntegrand t s) t := by
  let T := |t|+1
  let C := (Real.exp T+1)*Real.exp T
  have hG (s z : ℝ) (hz : z∈Metric.ball t 1) :
      ‖gaussianRareFirstIntegrand z s‖≤ C*normalTailVarianceWeight s := by
    obtain ⟨hp₀,hp₁⟩ := normalTailProbability_mem_Icc s
    have hb := bernoulliTiltedProbability_sub_parameter_abs_le (normalTailProbability s) z hp₀ hp₁
    rw [Real.norm_eq_abs]
    refine hb.trans ?_
    have he := Real.exp_le_exp.mpr (real_abs_bound_ball t z hz)
    apply mul_le_mul_of_nonneg_right _ (normalTailVarianceWeight_nonneg s)
    exact mul_le_mul (add_le_add he le_rfl) he (Real.exp_pos _).le (by positivity)
  exact hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ:=volume) (F:=gaussianRareCumulantIntegrand) (F':=gaussianRareFirstIntegrand)
    (Metric.ball_mem_nhds t (by norm_num : (0:ℝ)<1))
    (Filter.Eventually.of_forall (fun z=>(gaussianRareCumulantIntegrand_integrable z).aestronglyMeasurable))
    (gaussianRareCumulantIntegrand_integrable t) (firstIntegrand_measurable t).aestronglyMeasurable
    (Filter.Eventually.of_forall hG) (normalTailVarianceWeight_integrable.const_mul C)
    (Filter.Eventually.of_forall (fun s z _=>
      bernoulliCenteredCumulant_hasDerivAt (normalTailProbability_mem_Icc s).1
        (normalTailProbability_mem_Icc s).2 z))

/-- The second derivative is exactly the integral in the rare
deviation proof, without a formal interchange of divergent series. -/
theorem gaussianRareFirst_hasDerivAt (t : ℝ) :
    Integrable (gaussianRareSecondIntegrand t) ∧
      HasDerivAt (fun z=>∫ s,gaussianRareFirstIntegrand z s) (∫ s,gaussianRareSecondIntegrand t s) t := by
  let T := |t|+1
  let C := Real.exp (3*T)
  have hG (s z : ℝ) (hz : z∈Metric.ball t 1) :
      ‖gaussianRareSecondIntegrand z s‖≤ C*normalTailVarianceWeight s := by
    obtain ⟨hp₀,hp₁⟩ := normalTailProbability_mem_Icc s
    have hb := bernoulliTiltedProbability_derivative_bound (normalTailProbability s) z hp₀ hp₁
    have hN : 0≤gaussianRareSecondIntegrand z s := hb.1
    rw [Real.norm_eq_abs,abs_of_nonneg hN]
    have hB : gaussianRareSecondIntegrand z s≤Real.exp (3*|z|)*normalTailVarianceWeight s := by
      simpa only [gaussianRareSecondIntegrand,normalTailVarianceWeight,mul_assoc] using hb.2
    refine hB.trans ?_
    have he := Real.exp_le_exp.mpr (by linarith [real_abs_bound_ball t z hz] : 3*|z|≤ 3*T)
    change Real.exp (3*|z|)*normalTailVarianceWeight s≤ _
    exact mul_le_mul_of_nonneg_right he (normalTailVarianceWeight_nonneg s)
  exact hasDerivAt_integral_of_dominated_loc_of_deriv_le
    (μ:=volume) (F:=gaussianRareFirstIntegrand) (F':=gaussianRareSecondIntegrand)
    (Metric.ball_mem_nhds t (by norm_num : (0:ℝ)<1))
    (Filter.Eventually.of_forall (fun z=>(firstIntegrand_measurable z).aestronglyMeasurable))
    (gaussianRareCumulant_hasDerivAt t).1 (secondIntegrand_measurable t).aestronglyMeasurable
    (Filter.Eventually.of_forall hG) (normalTailVarianceWeight_integrable.const_mul C)
    (Filter.Eventually.of_forall (fun s z _=>
      (bernoulliTiltedProbability_hasDerivAt (normalTailProbability_mem_Icc s).1
        (normalTailProbability_mem_Icc s).2 z).sub_const _))

end PomeranceSarkozy
