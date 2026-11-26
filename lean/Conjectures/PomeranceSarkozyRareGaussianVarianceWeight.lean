module
public import Conjectures.PomeranceSarkozyGaussianVarianceIntegral
public import Mathlib.MeasureTheory.Function.L1Space.Integrable

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal NNReal ProbabilityTheory

noncomputable def normalTailProbability (s : ℝ) : ℝ := (gaussianReal 0 1).real (Ioi s)

theorem normalTailProbability_mem_Icc (s : ℝ) :
    normalTailProbability s ∈ Icc (0:ℝ) 1 :=
  ⟨ENNReal.toReal_nonneg,measureReal_le_one⟩

theorem normalTailProbability_measurable : Measurable normalTailProbability := by
  have h : Antitone normalTailProbability := by
    intro s t hst
    exact measureReal_mono (Ioi_subset_Ioi hst) (measure_ne_top (gaussianReal 0 1) _)
  exact h.measurable

noncomputable def normalTailVarianceWeight (s : ℝ) : ℝ :=
  normalTailProbability s*(1-normalTailProbability s)

theorem normalTailVarianceWeight_nonneg (s : ℝ) : 0 ≤ normalTailVarianceWeight s := by
  obtain ⟨h₀,h₁⟩ := normalTailProbability_mem_Icc s
  exact mul_nonneg h₀ (sub_nonneg.mpr h₁)

private theorem normalTailVarianceWeight_ofReal (s : ℝ) :
    ENNReal.ofReal (normalTailVarianceWeight s)=
      (gaussianReal 0 1) (Ioi s)*(gaussianReal 0 1) (Iic s) := by
  have h : (gaussianReal 0 1).real (Iic s)=1-normalTailProbability s := by
    rw [← compl_Ioi,probReal_compl_eq_one_sub measurableSet_Ioi]
    rfl
  unfold normalTailVarianceWeight
  rw [← h,ENNReal.ofReal_mul (normalTailProbability_mem_Icc s).1]
  unfold normalTailProbability
  rw [ofReal_measureReal,ofReal_measureReal]

/-- The tail-variance envelope used for differentiation under the
Gaussian cumulant integral is genuinely integrable. -/
theorem normalTailVarianceWeight_integrable : Integrable normalTailVarianceWeight := by
  have hm : Measurable normalTailVarianceWeight :=
    normalTailProbability_measurable.mul (measurable_const.sub normalTailProbability_measurable)
  refine ⟨hm.aestronglyMeasurable,?_⟩
  rw [hasFiniteIntegral_iff_norm]
  simp_rw [Real.norm_of_nonneg (normalTailVarianceWeight_nonneg _),normalTailVarianceWeight_ofReal,
    gaussian_variance_tail_integral]
  exact ENNReal.ofReal_lt_top

theorem normalTailVarianceWeight_integral :
    ∫ s,normalTailVarianceWeight s = 1/Real.sqrt Real.pi := by
  rw [integral_eq_lintegral_of_nonneg_ae
    (Filter.Eventually.of_forall normalTailVarianceWeight_nonneg)
    normalTailVarianceWeight_integrable.aestronglyMeasurable]
  simp_rw [normalTailVarianceWeight_ofReal,gaussian_variance_tail_integral]
  exact ENNReal.toReal_ofReal (by positivity)

end PomeranceSarkozy
