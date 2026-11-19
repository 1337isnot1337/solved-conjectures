import Conjectures.LonelinessKZSmallData

/-! A stronger global arithmetic bound for the six-speed spectrum. Once the
geometric prefix and determinant inputs are proved, this one global bound is
already smaller than each concrete four- and five-parameter search bound. -/

namespace Loneliness.KZSmall.SixSpectrum

open scoped BigOperators

theorem numerical_margin_21829 :
    1 < (21829 : ℝ)^2 * ∏ i ∈ Finset.range 5,
      KZGeneral.increment bounds scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData,
    scale, Finset.prod_range_succ]

theorem norm_cutoff_21829 (t : ℕ → ℝ) (S : ℝ) (hS : 0 < S)
    (ht : ∀ i < 5, 0 < t i)
    (hprefix : ∀ r ≤ 5, KZGeneral.boundValue bounds scale r ≤
      ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 5 → 3*t i ≤ 4*t (i+1))
    (hdet : ∏ i ∈ Finset.range 5, t i = 1 / S) :
    S < (21829 : ℝ)^2 := by
  have h := KZGeneral.norm_square_cutoff 5 (KZGeneral.increment bounds scale) t
    S 1 21829 hS (product_lower_bound t ht hprefix hratio) hdet numerical_margin_21829
  simpa using h

/-- The two concrete four-parameter matrices have Gram determinants eight
and nine. The global squared-norm bound suffices for either one. -/
theorem concrete_four_parameter_bound (S D : ℝ) (hS : S < (21829 : ℝ)^2)
    (hD : 8 ≤ D) : S < (9075 : ℝ)^2 * D := by
  nlinarith

theorem concrete_five_parameter_bound (S D : ℝ) (hS : S < (21829 : ℝ)^2)
    (hD : 1 ≤ D) : S < (54450 : ℝ)^2 * D := by
  nlinarith

end Loneliness.KZSmall.SixSpectrum
