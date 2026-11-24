import Conjectures.SteinerbergerFeldheimJoint

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The two existential bounds in Stefan Steinerberger, *A Sharp Estimate for
Probability Distributions*, arXiv:1801.00663v3, §1.3, pp. 2–3, are false.
The proof formalizes the quadratic-hazard argument already recorded in
`results/steinerberger-feldheim-tail/PROOF.md`, first committed by Cinna Davis
in commit `6a8c0b0ac8c5a903405782b0a0df03c9ad78cdc6` (24 November 2026).
The recorded priority qualification remains: the repository's search found
no earlier full counterexample, which is not a guarantee of priority.

The constructed law is absolutely continuous, concentrated on the positive
half-line, has positive mass above every real threshold, a positive finite
mean, and an explicitly verified median. The probabilities below are the
actual joint events under the product measure; its coordinate maps are
independent and identically distributed. Both original bounds fail at every
positive threshold. The separate smoothing and rate supplements in the
repository entry are outside this theorem's scope.
-/

open Set MeasureTheory Real
open scoped ENNReal

namespace Conjectures.SteinerbergerFeldheim

/-- The source's distribution hypotheses, with noncompact support stated as
positive probability above every threshold for a nonnegative law. -/
def AdmissibleLaw (μ : Measure ℝ) : Prop :=
  IsProbabilityMeasure μ ∧ μ ≪ volume ∧ (∀ᵐ x ∂μ, 0 ≤ x) ∧
    ∀ a : ℝ, 0 < μ (Ioi a)

/-- Both half-line probabilities are at least one half, the usual median condition. -/
def IsMedian (μ : Measure ℝ) (m : ℝ) : Prop :=
  (1 / 2 : ℝ≥0∞) ≤ μ (Iic m) ∧ (1 / 2 : ℝ≥0∞) ≤ μ (Ici m)

/-- Steinerberger's median-normalized existential guess. -/
def MedianGuess : Prop :=
  ∀ μ : Measure ℝ, AdmissibleLaw μ → ∀ m : ℝ, 0 < m → IsMedian μ m →
    ∃ z : ℝ, 0 < z ∧ 2 * log 2 * z / m ≤ eventRatio μ z

/-- Steinerberger's mean-normalized existential guess, on laws with finite positive mean. -/
def MeanGuess : Prop :=
  ∀ μ : Measure ℝ, AdmissibleLaw μ → Integrable (fun x : ℝ => x) μ →
    0 < (∫ x, x ∂μ) → ∃ z : ℝ, 0 < z ∧ 2 * z / (∫ x, x ∂μ) ≤ eventRatio μ z

lemma law_admissible : AdmissibleLaw law :=
  ⟨inferInstance, law_absolutelyContinuous, law_nonneg_ae, law_unbounded⟩

lemma law_median : IsMedian law medianValue := by
  constructor
  · rw [median_lower_half]
  · rw [median_upper_half]

/-- The witness has a unique median, so the counterexample is independent of
any convention for choosing a median when a general law has several. -/
lemma law_median_unique {m : ℝ} (hm : IsMedian law m) : m = medianValue := by
  have h0 : law (Iic (0 : ℝ)) = 0 := by
    rw [← compl_Ioi, measure_compl measurableSet_Ioi (measure_ne_top _ _),
      law_univ, law_Ioi (le_refl 0)]
    simp [survival]
  have hmp : 0 < m := by
    by_contra h
    have hzero := measure_mono_null (Iic_subset_Iic.mpr (le_of_not_gt h)) h0
    have hlo := hm.1
    rw [hzero] at hlo
    norm_num at hlo
  have hlo := (ENNReal.toReal_le_toReal (by norm_num : (1 / 2 : ℝ≥0∞) ≠ ∞)
    (measure_ne_top law (Iic m))).mpr hm.1
  have hup := (ENNReal.toReal_le_toReal (by norm_num : (1 / 2 : ℝ≥0∞) ≠ ∞)
    (measure_ne_top law (Ici m))).mpr hm.2
  norm_num at hlo hup
  rw [law_Ici hmp.le, ENNReal.toReal_ofReal (survival_pos m).le] at hup
  have hsum := probReal_add_probReal_compl (μ := law) (s := Ioi m) measurableSet_Ioi
  simp only [compl_Ioi, Measure.real, law_Ioi hmp.le,
    ENNReal.toReal_ofReal (survival_pos m).le] at hsum
  have hs : survival m = 1 / 2 := by linarith
  have he : -m - m ^ 2 / 200 = -medianValue - medianValue ^ 2 / 200 := by
    apply exp_injective
    change survival m = survival medianValue
    rw [hs, survival_median]
  have hmed := medianValue_pos
  nlinarith

/-- No compact set carries the full mass of the witness distribution. -/
lemma law_not_compactly_supported : ¬ ∃ K : Set ℝ, IsCompact K ∧ law K = 1 := by
  rintro ⟨K, hK, hmass⟩
  obtain ⟨a, ha⟩ := hK.bddAbove
  have hsub : Ioi a ⊆ Kᶜ := by
    intro x hx hxK
    exact (not_lt_of_ge (ha hxK)) hx
  have hcompl : law Kᶜ = 0 := by
    rw [measure_compl hK.measurableSet (measure_ne_top _ _), law_univ, hmass, tsub_self]
  have hzero := measure_mono_null hsub hcompl
  exact (law_unbounded a).ne' hzero

/-- The actual joint probability ratio is strictly below the original median bound
for every positive threshold. -/
theorem median_bound_fails {z : ℝ} (hz : 0 < z) :
    eventRatio law z < 2 * log 2 * z / medianValue := by
  rw [eventRatio_eq hz.le]
  calc
    _ ≤ 2 * z * (401 / 400) :=
      mul_le_mul_of_nonneg_left (tailIntegral_le hz) (by positivity)
    _ < 2 * z * (log 2 / medianValue) :=
      mul_lt_mul_of_pos_left normalized_median_gt (by positivity)
    _ = _ := by ring

theorem median_bound_fails_for_every_median {m z : ℝ} (hm : IsMedian law m) (hz : 0 < z) :
    eventRatio law z < 2 * log 2 * z / m := by
  rw [law_median_unique hm]
  exact median_bound_fails hz

/-- The same law also violates the original expectation bound at every positive threshold. -/
theorem mean_bound_fails {z : ℝ} (hz : 0 < z) :
    eventRatio law z < 2 * z / (∫ x, x ∂law) := by
  rw [eventRatio_eq hz.le, law_mean]
  calc
    _ ≤ 2 * z * (401 / 400) :=
      mul_le_mul_of_nonneg_left (tailIntegral_le hz) (by positivity)
    _ < 2 * z * (1 / meanValue) :=
      mul_lt_mul_of_pos_left reciprocal_mean_gt (by positivity)
    _ = _ := by ring

/-- Disproof of the original median-normalized conjecture. -/
theorem medianGuess_false : ¬ MedianGuess := by
  intro h
  obtain ⟨z, hz, hbound⟩ := h law law_admissible medianValue medianValue_pos law_median
  exact (not_le_of_gt (median_bound_fails hz)) hbound

/-- Disproof of the original expectation-normalized conjecture. -/
theorem meanGuess_false : ¬ MeanGuess := by
  intro h
  have hmean : 0 < (∫ x, x ∂law) := by rw [law_mean]; exact meanValue_pos
  obtain ⟨z, hz, hbound⟩ := h law law_admissible law_integrable_id hmean
  exact (not_le_of_gt (mean_bound_fails hz)) hbound

/-- One common absolutely continuous unbounded law refutes both guesses, with
verified positive denominator, genuine median, and finite positive expectation. -/
theorem counterexample :
    ∃ (μ : Measure ℝ) (m : ℝ), AdmissibleLaw μ ∧ 0 < m ∧ IsMedian μ m ∧
      Integrable (fun x : ℝ => x) μ ∧ 0 < (∫ x, x ∂μ) ∧
      ∀ z : ℝ, 0 < z → 0 < (μ.prod μ).real (denominatorEvent z) ∧
        eventRatio μ z < 2 * log 2 * z / m ∧
        eventRatio μ z < 2 * z / (∫ x, x ∂μ) := by
  refine ⟨law, medianValue, law_admissible, medianValue_pos, law_median,
    law_integrable_id, ?_, ?_⟩
  · rw [law_mean]
    exact meanValue_pos
  · intro z hz
    exact ⟨denominatorEvent_pos z hz.le, median_bound_fails hz, mean_bound_fails hz⟩

end Conjectures.SteinerbergerFeldheim
