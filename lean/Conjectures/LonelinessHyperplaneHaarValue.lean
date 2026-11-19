import Conjectures.LonelinessHyperplaneHaar
import Mathlib.MeasureTheory.Constructions.BorelSpace.Order
import Mathlib.Probability.Distributions.Uniform

/-! Literal uniform-distribution statement for the exact hyperplane profile
under standard product Haar probability on the shift torus. -/

namespace Loneliness.Hyperplane

open scoped ENNReal
open MeasureTheory

noncomputable section

private theorem uniform_interval_tail (A : ℝ) (hA : 0 < A) (u : ℝ) :
    (ENNReal.ofReal (2 * A) • (volume : Measure ℝ).restrict
      (Set.Icc (1 / 2 - 1 / (2 * A)) (1 / 2))) (Set.Ici u) =
      ENNReal.ofReal (min 1 (A * (1 - 2 * u))) := by
  let a : ℝ := 1 / 2 - 1 / (2 * A)
  have htwo : 0 < 2 * A := by positivity
  have hcal : 2 * A * (1 / 2 - a) = 1 := by
    dsimp only [a]
    field_simp [ne_of_gt hA] <;> ring
  have hinter : Set.Ici u ∩ Set.Icc a (1 / 2) = Set.Icc (max a u) (1 / 2) := by
    ext x
    constructor
    · rintro ⟨hux, hax, hxb⟩
      exact ⟨max_le hax hux, hxb⟩
    · rintro ⟨hmax, hxb⟩
      exact ⟨(le_max_right a u).trans hmax, (le_max_left a u).trans hmax, hxb⟩
  have hreal : 2 * A * (1 / 2 - max a u) = min 1 (A * (1 - 2 * u)) := by
    by_cases hu : u ≤ a
    · rw [max_eq_left hu]
      have hscale := mul_le_mul_of_nonneg_left hu (le_of_lt hA)
      rw [min_eq_left (by nlinarith : (1 : ℝ) ≤ A * (1 - 2 * u))]
      exact hcal
    · have hau : a ≤ u := le_of_lt (lt_of_not_ge hu)
      rw [max_eq_right hau]
      have hscale := mul_le_mul_of_nonneg_left hau (le_of_lt hA)
      rw [min_eq_right (by nlinarith : A * (1 - 2 * u) ≤ (1 : ℝ))]
      ring
  change (ENNReal.ofReal (2 * A) • (volume : Measure ℝ).restrict
    (Set.Icc a (1 / 2))) (Set.Ici u) = _
  rw [Measure.smul_apply, Measure.restrict_apply measurableSet_Ici,
    hinter, Real.volume_Icc, smul_eq_mul, ← ENNReal.ofReal_mul (le_of_lt htwo), hreal]

variable {ι : Type*} [Fintype ι]

theorem continuous_torusPredictedValue (m : ι → ℤ) :
    Continuous (torusPredictedValue m) := by
  have hp : Continuous (normalPhase m (torusCenter : ι → UnitAddCircle)) := by
    exact (continuous_normalHom m).comp (continuous_const.sub continuous_id)
  exact continuous_const.sub (hp.norm.div_const (normalMass m))

theorem haar_predictedValue_distribution (m : ι → ℤ) (hm : PrimitiveNormal m) :
    Measure.map (torusPredictedValue m) (volume : Measure (ι → UnitAddCircle)) =
      ENNReal.ofReal (2 * normalMass m) • (volume : Measure ℝ).restrict
        (Set.Icc (1 / 2 - 1 / (2 * normalMass m)) (1 / 2)) := by
  letI : IsProbabilityMeasure (volume : Measure UnitAddCircle) :=
    ⟨UnitAddCircle.measure_univ⟩
  apply Measure.ext_of_Ici
  intro u
  rw [Measure.map_apply (continuous_torusPredictedValue m).measurable measurableSet_Ici]
  change (volume : Measure (ι → UnitAddCircle)) {s | u ≤ torusPredictedValue m s} = _
  rw [haar_predictedValue_tail m hm u]
  exact (uniform_interval_tail (normalMass m) (normalMass_pos m hm) u).symm

/-- The hyperplane maximum, viewed through its quotient-compatible profile,
has Mathlib's actual uniform-distribution predicate on the stated interval. -/
theorem haar_predictedValue_isUniform (m : ι → ℤ) (hm : PrimitiveNormal m) :
    MeasureTheory.pdf.IsUniform (torusPredictedValue m)
      (Set.Icc (1 / 2 - 1 / (2 * normalMass m)) (1 / 2))
      (volume : Measure (ι → UnitAddCircle)) := by
  refine ⟨(continuous_torusPredictedValue m).aemeasurable, ?_⟩
  rw [haar_predictedValue_distribution m hm]
  have hA := normalMass_pos m hm
  have hlen : (1 / 2 : ℝ) - (1 / 2 - 1 / (2 * normalMass m)) =
      (2 * normalMass m)⁻¹ := by ring
  rw [ProbabilityTheory.cond, Real.volume_Icc, hlen,
    ENNReal.ofReal_inv_of_pos (by positivity : 0 < 2 * normalMass m), inv_inv]

end

end Loneliness.Hyperplane
