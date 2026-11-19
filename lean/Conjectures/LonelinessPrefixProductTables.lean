import Conjectures.LonelinessPrefixProduct
import Mathlib.Tactic.IntervalCases

/-! Exact arithmetic for the prefix-product inputs in the spectrum proofs.

The ordinary successive-minimum tables below are usable with `reciprocal_bound`
and `reciprocal_bound_of_strict_prefixes`. The separate KZ tables at the end
certify numerical inputs only: KZ squared lengths need not be nondecreasing,
so the ordinary prefix-product theorem is not asserted to apply to them.
-/

open scoped BigOperators

namespace Loneliness.PrefixProduct

noncomputable def sixSpectrum : ℕ → ℝ
  | 0 => 1 / 33
  | 1 => 2 / 55
  | 2 => 1 / 10
  | 3 => 1 / 6
  | 4 => 1 / 3
  | _ => 1

noncomputable def sevenEquality : ℕ → ℝ
  | 0 => 1 / 28
  | 1 => 1 / 21
  | 2 => 1 / 15
  | 3 => 1 / 10
  | 4 => 1 / 6
  | 5 => 1 / 3
  | _ => 1

noncomputable def eightEquality : ℕ → ℝ
  | 0 => 1 / 36
  | 1 => 1 / 28
  | 2 => 1 / 21
  | 3 => 1 / 15
  | 4 => 1 / 10
  | 5 => 1 / 6
  | 6 => 1 / 3
  | _ => 1

noncomputable def sevenSpectrum : ℕ → ℝ
  | 0 => 4 / 231
  | 1 => 1 / 33
  | 2 => 1 / 15
  | 3 => 1 / 10
  | 4 => 1 / 6
  | 5 => 1 / 3
  | _ => 1

noncomputable def eightSpectrum : ℕ → ℝ
  | 0 => 1 / 92
  | 1 => 4 / 161
  | 2 => 1 / 21
  | 3 => 1 / 15
  | 4 => 1 / 10
  | 5 => 1 / 6
  | 6 => 1 / 3
  | _ => 1

theorem sixSpectrum_positive : ∀ i < 5, 0 < sixSpectrum i := by
  intro i hi
  interval_cases i <;> norm_num [sixSpectrum]

theorem sevenEquality_positive : ∀ i < 6, 0 < sevenEquality i := by
  intro i hi
  interval_cases i <;> norm_num [sevenEquality]

theorem eightEquality_positive : ∀ i < 7, 0 < eightEquality i := by
  intro i hi
  interval_cases i <;> norm_num [eightEquality]

theorem sevenSpectrum_positive : ∀ i < 6, 0 < sevenSpectrum i := by
  intro i hi
  interval_cases i <;> norm_num [sevenSpectrum]

theorem eightSpectrum_positive : ∀ i < 7, 0 < eightSpectrum i := by
  intro i hi
  interval_cases i <;> norm_num [eightSpectrum]

theorem sixSpectrum_product_three :
    ∏ i ∈ Finset.range 3, sixSpectrum i = 1 / 9075 := by
  norm_num [Finset.prod_range_succ, sixSpectrum]

theorem sixSpectrum_product_four :
    ∏ i ∈ Finset.range 4, sixSpectrum i = 1 / 54450 := by
  norm_num [Finset.prod_range_succ, sixSpectrum]

theorem sixSpectrum_product_five :
    ∏ i ∈ Finset.range 5, sixSpectrum i = 1 / 163350 := by
  norm_num [Finset.prod_range_succ, sixSpectrum]

theorem sevenEquality_product :
    ∏ i ∈ Finset.range 6, sevenEquality i = 1 / 1587600 := by
  norm_num [Finset.prod_range_succ, sevenEquality]

theorem eightEquality_product :
    ∏ i ∈ Finset.range 7, eightEquality i = 1 / 57153600 := by
  norm_num [Finset.prod_range_succ, eightEquality]

theorem sevenSpectrum_product :
    ∏ i ∈ Finset.range 6, sevenSpectrum i = 1 / 5145525 := by
  norm_num [Finset.prod_range_succ, sevenSpectrum]

theorem eightSpectrum_product :
    ∏ i ∈ Finset.range 7, eightSpectrum i = 1 / 209960100 := by
  norm_num [Finset.prod_range_succ, eightSpectrum]

/-- Prefix bounds from the subspace calculation are explicit hypotheses. -/
theorem seven_equality_bound (x : ℕ → ℝ) (hx : ∀ i < 6, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio 6))
    (hprefix : ∀ k ≤ 6, ∑ i ∈ Finset.range k, sevenEquality i ≤
      ∑ i ∈ Finset.range k, x i)
    {V Δ : ℝ} (hV : 0 < V) (hproduct : ∏ i ∈ Finset.range 6, x i ≤ Δ / V) :
    V ≤ 1587600 * Δ :=
  reciprocal_bound 6 x sevenEquality hx sevenEquality_positive hmono hprefix
    hV (by norm_num) sevenEquality_product hproduct

theorem eight_equality_bound (x : ℕ → ℝ) (hx : ∀ i < 7, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio 7))
    (hprefix : ∀ k ≤ 7, ∑ i ∈ Finset.range k, eightEquality i ≤
      ∑ i ∈ Finset.range k, x i)
    {V Δ : ℝ} (hV : 0 < V) (hproduct : ∏ i ∈ Finset.range 7, x i ≤ Δ / V) :
    V ≤ 57153600 * Δ :=
  reciprocal_bound 7 x eightEquality hx eightEquality_positive hmono hprefix
    hV (by norm_num) eightEquality_product hproduct

theorem six_spectrum_bound (x : ℕ → ℝ) (hx : ∀ i < 5, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio 5))
    (hprefix : ∀ k, 0 < k → k ≤ 5 → ∑ i ∈ Finset.range k, sixSpectrum i <
      ∑ i ∈ Finset.range k, x i)
    {V Δ : ℝ} (hV : 0 < V) (hproduct : ∏ i ∈ Finset.range 5, x i ≤ Δ / V) :
    V < 163350 * Δ :=
  reciprocal_bound_of_strict_prefixes 5 (by decide) x sixSpectrum hx
    sixSpectrum_positive hmono hprefix hV (by norm_num) sixSpectrum_product_five hproduct

theorem seven_spectrum_bound (x : ℕ → ℝ) (hx : ∀ i < 6, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio 6))
    (hprefix : ∀ k, 0 < k → k ≤ 6 → ∑ i ∈ Finset.range k, sevenSpectrum i <
      ∑ i ∈ Finset.range k, x i)
    {V Δ : ℝ} (hV : 0 < V) (hproduct : ∏ i ∈ Finset.range 6, x i ≤ Δ / V) :
    V < 5145525 * Δ :=
  reciprocal_bound_of_strict_prefixes 6 (by decide) x sevenSpectrum hx
    sevenSpectrum_positive hmono hprefix hV (by norm_num) sevenSpectrum_product hproduct

theorem eight_spectrum_bound (x : ℕ → ℝ) (hx : ∀ i < 7, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio 7))
    (hprefix : ∀ k, 0 < k → k ≤ 7 → ∑ i ∈ Finset.range k, eightSpectrum i <
      ∑ i ∈ Finset.range k, x i)
    {V Δ : ℝ} (hV : 0 < V) (hproduct : ∏ i ∈ Finset.range 7, x i ≤ Δ / V) :
    V < 209960100 * Δ :=
  reciprocal_bound_of_strict_prefixes 7 (by decide) x eightSpectrum hx
    eightSpectrum_positive hmono hprefix hV (by norm_num) eightSpectrum_product hproduct

/-- Numerical input for the separate KZ minimization theorem. -/
def kzIncrement (k i : ℕ) : ℚ :=
  4 * ((1 / (k - i : ℕ) - 1 / (k + 1 : ℕ)) ^ 2 -
    (1 / (k + 1 - i : ℕ) - 1 / (k + 1 : ℕ)) ^ 2)

theorem kzIncrement_positive (k i : ℕ) (hk : 9 ≤ k) (hk' : k ≤ 13) (hi : i < k - 1) :
    0 < kzIncrement k i := by
  interval_cases k <;> interval_cases i <;> norm_num [kzIncrement]

theorem kzIncrement_ratio (k i : ℕ) (hk : 9 ≤ k) (hk' : k ≤ 13) (hi : i < k - 2) :
    4 * kzIncrement k i < 3 * kzIncrement k (i + 1) := by
  interval_cases k <;> interval_cases i <;> norm_num [kzIncrement]

theorem kzIncrement_product_nine :
    ∏ i ∈ Finset.range 8, kzIncrement 9 i = 2482597 / 826841416968000000000 := by
  norm_num [Finset.prod_range_succ, kzIncrement]

theorem kzIncrement_product_ten :
    ∏ i ∈ Finset.range 9, kzIncrement 10 i =
      31983096361649 / 4289227381918300405953600000000 := by
  norm_num [Finset.prod_range_succ, kzIncrement]

theorem kzIncrement_product_eleven :
    ∏ i ∈ Finset.range 10, kzIncrement 11 i = 289 / 20428512501085573500000 := by
  norm_num [Finset.prod_range_succ, kzIncrement]

theorem kzIncrement_product_twelve :
    ∏ i ∈ Finset.range 11, kzIncrement 12 i =
      1476748201913 / 70457736818858675876241619968000000 := by
  norm_num [Finset.prod_range_succ, kzIncrement]

theorem kzIncrement_product_thirteen :
    ∏ i ∈ Finset.range 12, kzIncrement 13 i =
      89348172069691 / 3616460531462492894939937597619200000000 := by
  norm_num [Finset.prod_range_succ, kzIncrement]

end Loneliness.PrefixProduct
