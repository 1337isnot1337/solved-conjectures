module
public import Conjectures.PomeranceSarkozyRareGaussianDerivatives
public import Mathlib.Analysis.Calculus.Deriv.MeanValue

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal ProbabilityTheory

theorem normalTailProbability_strict (s : ℝ) :
    0<normalTailProbability s ∧ normalTailProbability s<1 := by
  let μ := gaussianReal 0 1
  have hAbs : (volume : Measure ℝ) ≪ μ :=
    gaussianReal_absolutelyContinuous' 0 (by norm_num : (1:ℝ≥0)≠0)
  have hU : μ (Ioi s)≠0 := by
    intro h
    have h' := hAbs h
    rw [Real.volume_Ioi] at h'
    exact ENNReal.top_ne_zero h'
  have hL : μ (Iic s)≠0 := by
    intro h
    have h' := hAbs h
    rw [Real.volume_Iic] at h'
    exact ENNReal.top_ne_zero h'
  have hC : μ.real (Iic s)=1-normalTailProbability s := by
    rw [← compl_Ioi,probReal_compl_eq_one_sub measurableSet_Ioi]
    rfl
  refine ⟨ENNReal.toReal_pos hU (measure_ne_top μ _),?_⟩
  have h := ENNReal.toReal_pos hL (measure_ne_top μ _)
  change 0<μ.real (Iic s) at h
  rw [hC] at h
  exact sub_pos.mp h

noncomputable def gaussianRareCumulantSlope (t : ℝ) : ℝ :=
  ∫ s,gaussianRareFirstIntegrand t s

theorem gaussianRareCumulantSlope_zero : gaussianRareCumulantSlope 0=0 := by
  unfold gaussianRareCumulantSlope gaussianRareFirstIntegrand bernoulliTiltedProbability
    bernoulliExponentialDenominator
  simp

theorem gaussianRareCumulant_curvature_pos (t : ℝ) :
    0<∫ s,gaussianRareSecondIntegrand t s := by
  have hp (s : ℝ) : 0<gaussianRareSecondIntegrand t s :=
    bernoulliTiltedProbability_derivative_strict (normalTailProbability s) t
      (normalTailProbability_strict s).1 (normalTailProbability_strict s).2
  have hS : Function.support (gaussianRareSecondIntegrand t)=univ := by
    ext s
    simp only [Function.mem_support,mem_univ,iff_true]
    exact (hp s).ne'
  rw [integral_pos_iff_support_of_nonneg_ae (Filter.Eventually.of_forall (fun s=>(hp s).le))
    (gaussianRareFirst_hasDerivAt t).1,hS]
  simp

/-- The limiting cumulant slope is strictly increasing, as required
for identifying the maximizing tilt at interior displacements. -/
theorem gaussianRareCumulantSlope_strictMono : StrictMono gaussianRareCumulantSlope := by
  apply strictMono_of_deriv_pos
  intro t
  unfold gaussianRareCumulantSlope
  rw [(gaussianRareFirst_hasDerivAt t).2.deriv]
  exact gaussianRareCumulant_curvature_pos t

end PomeranceSarkozy
