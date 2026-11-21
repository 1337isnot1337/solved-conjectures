module

public import Conjectures.GrochenigWitness
public import Conjectures.GrochenigGaussian
public import Conjectures.GrochenigDensityLocalFiniteness

/-!
# The upper-density assertion in Gröchenig's Problem 4.12 is false

One fixed sequence has absolute coefficient mass one and even support. Its Gaussian shift
sum is nonzero and extends to an entire function, so its real zeros are
locally finite. The literal source densities are one half for coefficient
sign changes and at least one for the zero set.

This theorem concerns the upper-density assertion. It makes no claim about
the separate lower-density comparison.
-/

@[expose] public section

namespace Grochenig

open scoped ENNReal

noncomputable section

theorem constructed_zeros_locallyFinite :
    LocallyFiniteSet (zeroSet (seriesValue center)) :=
  zeroSet_locallyFinite_of_entire (entireValue center)
    (differentiable_entireValue center constructed_slot_injective)
    (seriesValue center) (entireValue_ofReal center) constructed_nonzero

theorem constructed_density_violation :
    upperCoefficientDensity (coefficient center) <
      upperBeurlingDensity (zeroSet (seriesValue center)) := by
  rw [constructed_coefficient_density]
  exact lt_of_lt_of_le (by norm_num : (1 : ℝ≥0∞) / 2 < 1) constructed_zero_density

/-- The full infinite witness, with convergence, entire extension, local
finiteness, and both exact source-density conclusions. -/
theorem upper_density_counterexample :
    ∃ (c : ℤ → ℝ) (f : ℝ → ℝ) (F : ℂ → ℂ),
      Summable (fun k : ℤ => |c k|) ∧
      (∑' k : ℤ, |c k|) = 1 ∧
      (∀ k : ℤ, c k ≠ 0 → Even k) ∧
      IsPolyaFrequency gaussian ∧
      IsBoundedShiftSum gaussian c f ∧ InVInfinity gaussian f ∧
      (∃ x : ℝ, f x ≠ 0) ∧ Differentiable ℂ F ∧
      (∀ x : ℝ, F (x : ℂ) = (f x : ℂ)) ∧
      LocallyFiniteSet (zeroSet f) ∧
      upperCoefficientDensity c = (1 : ℝ≥0∞) / 2 ∧
      1 ≤ upperBeurlingDensity (zeroSet f) ∧
      upperCoefficientDensity c < upperBeurlingDensity (zeroSet f) := by
  have hsum := isBoundedShiftSum_seriesValue center constructed_slot_injective
  exact ⟨coefficient center, seriesValue center, entireValue center,
    coefficient_abs_summable center constructed_slot_injective,
    sum_abs_coefficient center constructed_slot_injective,
    coefficient_even_support center center_even,
    gaussian_isPolyaFrequency, hsum, ⟨coefficient center, hsum⟩,
    constructed_nonzero, differentiable_entireValue center constructed_slot_injective,
    entireValue_ofReal center, constructed_zeros_locallyFinite,
    constructed_coefficient_density, constructed_zero_density, constructed_density_violation⟩

/-- The proposed upper-density comparison fails even among nonzero functions
with locally finite zero sets and bounded, convergent source representations. -/
theorem source_upper_density_disproof :
    ¬∀ (g : ℝ → ℝ) (c : ℤ → ℝ) (f : ℝ → ℝ), IsPolyaFrequency g →
      IsBoundedShiftSum g c f → (∃ x : ℝ, f x ≠ 0) →
      LocallyFiniteSet (zeroSet f) →
      upperBeurlingDensity (zeroSet f) ≤ upperCoefficientDensity c := by
  intro h
  have hle := h gaussian (coefficient center) (seriesValue center)
    gaussian_isPolyaFrequency (isBoundedShiftSum_seriesValue center constructed_slot_injective)
    constructed_nonzero constructed_zeros_locallyFinite
  exact (not_le_of_gt constructed_density_violation) hle

end

end Grochenig
