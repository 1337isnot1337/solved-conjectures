module
public import Conjectures.PomeranceSarkozyRareGaussianVarianceWeight
public import Conjectures.PomeranceSarkozyRareCumulantTaylor
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory

noncomputable def gaussianRareCumulantIntegrand (t s : ℝ) : ℝ :=
  bernoulliCenteredCumulant (normalTailProbability s) t

noncomputable def gaussianRareCumulant (t : ℝ) : ℝ := ∫ s,gaussianRareCumulantIntegrand t s

private theorem gaussianRareCumulantIntegrand_measurable (t : ℝ) :
    Measurable (gaussianRareCumulantIntegrand t) := by
  unfold gaussianRareCumulantIntegrand bernoulliCenteredCumulant bernoulliExponentialDenominator
  have hp := normalTailProbability_measurable
  fun_prop

theorem gaussianRareCumulantIntegrand_integrable (t : ℝ) :
    Integrable (gaussianRareCumulantIntegrand t) := by
  let c := Real.exp (3*|t|) *|t| ^3/6+t^2/2
  refine (normalTailVarianceWeight_integrable.const_mul c).mono'
    (gaussianRareCumulantIntegrand_measurable t).aestronglyMeasurable ?_
  exact Filter.Eventually.of_forall (fun s=>by
    rw [Real.norm_eq_abs]
    unfold gaussianRareCumulantIntegrand normalTailVarianceWeight
    let p := normalTailProbability s
    let a := bernoulliCenteredCumulant p t
    let v := p*(1-p)
    change |a|≤c*v
    obtain ⟨hp,hp'⟩ := normalTailProbability_mem_Icc s
    have hV₂ : 0≤ v*t^2/2 := by
      unfold v
      exact div_nonneg (mul_nonneg (mul_nonneg hp (sub_nonneg.mpr hp')) (sq_nonneg _)) (by norm_num)
    have hR : |a-v*t^2/2|≤Real.exp (3*|t|)*v*|t| ^3/6 :=
      by simpa only [a,v,p,mul_assoc] using
        bernoulliCenteredCumulant_quadratic_error (normalTailProbability s) t hp hp'
    calc
      _ ≤ |a-v*t^2/2|+|v*t^2/2| := by
        simpa only [sub_zero] using abs_sub_le a (v*t^2/2) 0
      _ ≤ Real.exp (3*|t|) *v*|t| ^3/6+v*t^2/2 := by
        rw [abs_of_nonneg hV₂]
        exact add_le_add hR le_rfl
      _ = _ := by unfold c; ring)

/-- The Gaussian integral defining the rare-deviation cumulant
has exactly the written quadratic coefficient, with a checked
variance-weighted remainder before taking the limit. -/
theorem gaussianRareCumulant_quadratic_error (t : ℝ) :
    |gaussianRareCumulant t-(1/Real.sqrt Real.pi)*t^2/2| ≤ (Real.exp (3*|t|) *|t| ^3/6)*(1/Real.sqrt Real.pi) := by
  let v := normalTailVarianceWeight
  let f := gaussianRareCumulantIntegrand t
  let c := Real.exp (3*|t|) *|t| ^3/6
  have hV : Integrable (fun s=>v s*t^2/2) := (normalTailVarianceWeight_integrable.mul_const _).div_const _
  have hF : Integrable f := gaussianRareCumulantIntegrand_integrable t
  have he : (∫ s,v s*t^2/2)=(1/Real.sqrt Real.pi)*t^2/2 := by
    rw [integral_div,integral_mul_const,normalTailVarianceWeight_integral]
  change |(∫ s,f s)-(1/Real.sqrt Real.pi)*t^2/2|≤ c*(1/Real.sqrt Real.pi)
  rw [← he,← integral_sub hF hV,← normalTailVarianceWeight_integral,← integral_const_mul]
  have hn : |∫ s,f s-v s*t^2/2| ≤ ∫ s,|f s-v s*t^2/2| := by
    let g (s : ℝ) := f s-v s*t^2/2
    change |(∫ s,g s)|≤∫ s,|g s|
    calc
      _ = ‖∫ s,g s‖ := (Real.norm_eq_abs _).symm
      _ ≤ ∫ s,‖g s‖ := norm_integral_le_integral_norm (μ:=volume) g
      _ = _ := integral_congr_ae (Filter.Eventually.of_forall fun s=>Real.norm_eq_abs (g s))
  refine hn.trans ?_
  refine integral_mono ?_ (normalTailVarianceWeight_integrable.const_mul _) ?_
  · simpa only [Real.norm_eq_abs,Pi.sub_apply] using (hF.sub hV).norm
  · intro s
    obtain ⟨h₀,h₁⟩ := normalTailProbability_mem_Icc s
    have h := bernoulliCenteredCumulant_quadratic_error (normalTailProbability s) t h₀ h₁
    unfold f v gaussianRareCumulantIntegrand normalTailVarianceWeight
    exact h.trans_eq (by unfold c; ring)

end PomeranceSarkozy
