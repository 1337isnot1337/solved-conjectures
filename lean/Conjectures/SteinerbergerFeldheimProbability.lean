import Conjectures.SteinerbergerFeldheimQuantities
import Mathlib.MeasureTheory.Measure.Prod
import Mathlib.MeasureTheory.Integral.Bochner.ContinuousLinearMap
import Mathlib.Probability.Independence.Basic

/-!
# Steinerberger's quantitative Feldheim-tail conjecture

The probabilities here are product-measure probabilities of the exact events
in Questions 1 and 2 of Steinerberger's list.  Fubini's theorem and an affine
substitution connect those events to the verified uniform integral estimate.
The concluding witness has an absolutely continuous, nonnegative law with
unbounded support, finite positive expectation, and an actual median.
-/

open MeasureTheory Set Filter ProbabilityTheory
open scoped ENNReal Topology

namespace SteinerbergerFeldheim
noncomputable section

/-- The numerator event in the two original questions. -/
def numeratorEvent (z : ℝ) : Set (ℝ × ℝ) :=
  {p | 2 * z ≤ p.1 + p.2 ∧ min p.1 p.2 ≤ z}

/-- The denominator event in the two original questions. -/
def denominatorEvent (z : ℝ) : Set (ℝ × ℝ) :=
  {p | 2 * z ≤ p.1 + p.2 ∧ z ≤ min p.1 p.2}

/-- The ratio for two independent random variables with common law `μ`. -/
def tailRatio (μ : Measure ℝ) (z : ℝ) : ℝ :=
  (μ.prod μ).real (numeratorEvent z) / (μ.prod μ).real (denominatorEvent z)

/-- The half of the numerator event where the first coordinate is at most `z`. -/
def halfEvent (z : ℝ) : Set (ℝ × ℝ) := {p | p.1 ≤ z ∧ 2 * z - p.1 ≤ p.2}

theorem halfEvent_measurable (z : ℝ) : MeasurableSet (halfEvent z) :=
  (isClosed_le continuous_fst continuous_const).measurableSet.inter
    (isClosed_le (continuous_const.sub continuous_fst) continuous_snd).measurableSet

theorem numeratorEvent_union (z : ℝ) :
    numeratorEvent z = halfEvent z ∪ Prod.swap ⁻¹' halfEvent z := by
  ext p
  simp only [numeratorEvent, halfEvent, mem_ofPred_eq, mem_union, mem_preimage,
    Prod.swap, min_le_iff]
  constructor
  · rintro ⟨hs, hx | hy⟩
    · exact Or.inl ⟨hx, by linarith⟩
    · exact Or.inr ⟨hy, by linarith⟩
  · rintro (⟨hx, hs⟩ | ⟨hy, hs⟩)
    · exact ⟨by linarith, Or.inl hx⟩
    · exact ⟨by linarith, Or.inr hy⟩

theorem denominatorEvent_rectangle (z : ℝ) :
    denominatorEvent z = Ici z ×ˢ Ici z := by
  ext p
  simp only [denominatorEvent, mem_ofPred_eq, le_min_iff, mem_prod, mem_Ici]
  constructor
  · exact fun h => h.2
  · exact fun h => ⟨by linarith [h.1, h.2], h⟩

theorem denominator_probability {z : ℝ} (hz : 0 ≤ z) :
    (law.prod law).real (denominatorEvent z) = survival z ^ 2 := by
  rw [denominatorEvent_rectangle, measureReal_prod_prod, law_real_Ici hz]
  ring

theorem denominator_probability_pos {z : ℝ} (hz : 0 ≤ z) :
    0 < (law.prod law).real (denominatorEvent z) := by
  rw [denominator_probability hz]
  exact pow_pos (survival_pos z) 2

theorem product_real_apply {s : Set (ℝ × ℝ)} (hs : MeasurableSet s) :
    (law.prod law).real s = ∫ x, law.real (Prod.mk x ⁻¹' s) ∂law := by
  rw [Measure.real, Measure.prod_apply hs]
  exact (integral_toReal (measurable_measure_prodMk_left hs).aemeasurable
    (ae_of_all _ (fun x => measure_lt_top law (Prod.mk x ⁻¹' s)))).symm

theorem halfEvent_integral {z : ℝ} (hz : 0 < z) :
    (law.prod law).real (halfEvent z) =
      ∫ x in (0 : ℝ)..z, density x * survival (2 * z - x) := by
  rw [product_real_apply (halfEvent_measurable z)]
  calc
    _ = ∫ x, (Iic z).indicator (fun x => survival (2 * z - x)) x ∂law := by
      apply integral_congr_ae
      exact ae_of_all _ (fun x => by
        dsimp only
        by_cases hx : x ≤ z
        · rw [Set.indicator_of_mem (show x ∈ Iic z from hx)]
          have hs : Prod.mk x ⁻¹' halfEvent z = Ici (2 * z - x) := by
            ext y
            simp [halfEvent, hx]
          rw [hs, law_real_Ici (by linarith)]
        · rw [Set.indicator_of_notMem (show x ∉ Iic z from hx)]
          have hs : Prod.mk x ⁻¹' halfEvent z = ∅ := by
            ext y
            simp [halfEvent, hx]
          simp [hs])
    _ = ∫ x in Iic z, survival (2 * z - x) ∂law := integral_indicator measurableSet_Iic
    _ = ∫ x in Ioc (0 : ℝ) z, density x * survival (2 * z - x) := by
      rw [law, setIntegral_withDensity_eq_setIntegral_toReal_smul
        continuous_density.measurable.ennreal_ofReal
        (ae_of_all _ (fun _ => ENNReal.ofReal_lt_top)) _ measurableSet_Iic,
        Measure.restrict_restrict measurableSet_Iic]
      have hs : Iic z ∩ Ioi (0 : ℝ) = Ioc 0 z := by ext x; simp [and_comm]
      rw [hs]
      apply setIntegral_congr_fun measurableSet_Ioc
      intro x hx
      dsimp only
      rw [ENNReal.toReal_ofReal (density_pos hx.1.le).le, smul_eq_mul]
    _ = _ := (intervalIntegral.integral_of_le hz.le).symm

theorem halfEvent_swap_probability (z : ℝ) :
    (law.prod law).real (Prod.swap ⁻¹' halfEvent z) =
      (law.prod law).real (halfEvent z) := by
  have h : (law.prod law) (Prod.swap ⁻¹' halfEvent z) = (law.prod law) (halfEvent z) := by
    rw [← Measure.map_apply measurable_swap (halfEvent_measurable z), Measure.prod_swap]
  exact congrArg ENNReal.toReal h

theorem numerator_probability_le (z : ℝ) :
    (law.prod law).real (numeratorEvent z) ≤ 2 * (law.prod law).real (halfEvent z) := by
  rw [numeratorEvent_union]
  have h := measureReal_union_le (μ := law.prod law) (halfEvent z) (Prod.swap ⁻¹' halfEvent z)
  rw [halfEvent_swap_probability] at h
  linarith

theorem density_survival_factor (z x : ℝ) :
    density x * survival (2 * z - x) = survival z ^ 2 *
      ((1 + x / 100) * Real.exp (-(z - x) ^ 2 / 100)) := by
  have he : survival x * survival (2 * z - x) = survival z ^ 2 *
      Real.exp (-(z - x) ^ 2 / 100) := by
    simp only [survival, pow_two]
    rw [← Real.exp_add, ← Real.exp_add, ← Real.exp_add]
    congr 1
    ring
  rw [density, mul_assoc, he]
  ring

theorem halfEvent_normalized_integral (z : ℝ) :
    (∫ x in (0 : ℝ)..z, density x * survival (2 * z - x)) =
      survival z ^ 2 * (z * profile z) := by
  let F : ℝ → ℝ := fun x => (1 + x / 100) * Real.exp (-(z - x) ^ 2 / 100)
  have hs := intervalIntegral.smul_integral_comp_sub_mul F (a := (0 : ℝ)) (b := 1) z z
  simp only [smul_eq_mul, mul_one, sub_self, mul_zero, sub_zero] at hs
  have hf : (fun t => F (z - z * t)) =
      (fun t => (1 + z / 100 * (1 - t)) * Real.exp (-(z ^ 2 / 100) * t ^ 2)) := by
    funext t
    dsimp [F]
    congr 1
    · ring
    · congr 1
      ring
  rw [hf] at hs
  calc
    _ = ∫ x in (0 : ℝ)..z, survival z ^ 2 * F x := by
      apply intervalIntegral.integral_congr
      intro x _
      exact density_survival_factor z x
    _ = survival z ^ 2 * (∫ x in (0 : ℝ)..z, F x) :=
      intervalIntegral.integral_const_mul _ _
    _ = _ := by rw [← hs]; rfl

theorem tailRatio_le_profile {z : ℝ} (hz : 0 < z) :
    tailRatio law z ≤ 2 * z * profile z := by
  unfold tailRatio
  rw [denominator_probability hz.le]
  apply (div_le_iff₀ (pow_pos (survival_pos z) 2)).mpr
  have h := numerator_probability_le z
  rw [halfEvent_integral hz, halfEvent_normalized_integral] at h
  nlinarith

/-- The same law violates both proposed lower bounds at every positive threshold. -/
theorem strict_counterbounds {z : ℝ} (hz : 0 < z) :
    tailRatio law z < (2 * Real.log 2) * z / median ∧
      tailRatio law z < 2 * z / mean := by
  have hupper : tailRatio law z ≤ 2 * z * (401 / 400) :=
    (tailRatio_le_profile hz).trans
      (mul_le_mul_of_nonneg_left (profile_uniform hz) (by positivity))
  constructor
  · have h := mul_lt_mul_of_pos_left median_coefficient_gap (show 0 < 2 * z by positivity)
    calc
      _ ≤ 2 * z * (401 / 400) := hupper
      _ < 2 * z * (Real.log 2 / median) := h
      _ = _ := by ring
  · have h := mul_lt_mul_of_pos_left mean_coefficient_gap (show 0 < 2 * z by positivity)
    calc
      _ ≤ 2 * z * (401 / 400) := hupper
      _ < 2 * z * (1 / mean) := h
      _ = _ := by ring

theorem independent_coordinates :
    IndepFun (Prod.fst : ℝ × ℝ → ℝ) Prod.snd (law.prod law) :=
  indepFun_prod (X := id) (Y := id) measurable_id measurable_id

theorem first_coordinate_law : Measure.map Prod.fst (law.prod law) = law :=
  measurePreserving_fst.map_eq

theorem second_coordinate_law : Measure.map Prod.snd (law.prod law) = law :=
  measurePreserving_snd.map_eq

/-- A fully semantic counterexample to both of Steinerberger's questions. -/
theorem counterexample :
    ∃ μ : Measure ℝ, IsProbabilityMeasure μ ∧ μ ≪ volume ∧
      (∀ᵐ x ∂μ, 0 ≤ x) ∧ (∀ a : ℝ, 0 < μ (Ioi a)) ∧
      Integrable (fun x : ℝ => x) μ ∧
      ∃ m : ℝ, 0 < m ∧ μ (Iic m) = 1 / 2 ∧ μ (Ici m) = 1 / 2 ∧
        0 < ∫ x, x ∂μ ∧
        ∀ z : ℝ, 0 < z → 0 < (μ.prod μ).real (denominatorEvent z) ∧
          tailRatio μ z < (2 * Real.log 2) * z / m ∧
          tailRatio μ z < 2 * z / (∫ x, x ∂μ) := by
  refine ⟨law, inferInstance, law_absolutelyContinuous, law_nonnegative_ae,
    law_unbounded, integrable_identity, median, median_pos, median_lower_probability,
    median_upper_probability, mean_pos, ?_⟩
  intro z hz
  exact ⟨denominator_probability_pos hz.le, strict_counterbounds hz⟩

end
end SteinerbergerFeldheim
