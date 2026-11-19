import Conjectures.LonelinessKZGeneral

/-! Sixteen exact dual rows for the five-speed threshold `1/6`.

The prefix bounds are `1/225`, `1/36`, `1/9`, and `4/9`.
Every row is checked by the kernel against the original prefix and adjacent-ratio
constraints. The resulting product lower bound is `7/2430000`. -/

namespace Loneliness.FiveRunnerNorm.Data

open scoped BigOperators
open KZProduct

def scale : ℕ := 900

def boundData : Array ℕ := #[0, 4, 25, 100, 400]

def bounds (r : ℕ) : ℕ := boundData[r]?.getD 0

def rowData : Array DualRow := #[
  ⟨1, #[0, 0, 0, 0, 0, 0, 0, 0]⟩,
  ⟨1, #[1, 0, 0, 0, 0, 0, 0, 0]⟩,
  ⟨7, #[0, 3, 0, 0, 1, 0, 0, 0]⟩,
  ⟨1, #[0, 1, 0, 0, 0, 0, 0, 0]⟩,
  ⟨37, #[0, 0, 9, 0, 3, 7, 0, 0]⟩,
  ⟨7, #[4, 0, 3, 0, 0, 1, 0, 0]⟩,
  ⟨37, #[0, 0, 21, 0, 7, 4, 0, 0]⟩,
  ⟨1, #[0, 0, 1, 0, 0, 0, 0, 0]⟩,
  ⟨175, #[0, 0, 0, 27, 9, 21, 37, 0]⟩,
  ⟨37, #[28, 0, 0, 9, 0, 3, 7, 0]⟩,
  ⟨7, #[0, 0, 0, 3, 1, 0, 1, 0]⟩,
  ⟨7, #[0, 4, 0, 3, 0, 0, 1, 0]⟩,
  ⟨25, #[0, 0, 0, 9, 3, 7, 4, 0]⟩,
  ⟨37, #[16, 0, 0, 21, 0, 7, 4, 0]⟩,
  ⟨175, #[0, 0, 0, 111, 37, 28, 16, 0]⟩,
  ⟨1, #[0, 0, 0, 1, 0, 0, 0, 0]⟩]

def row (m : Fin (2^4)) : DualRow := rowData[m.val]!

theorem rows_valid : ∀ m : Fin (2^4),
    DualValid 4 bounds (fun i => m.val.testBit i.val) (row m) := by
  decide +kernel

theorem prefix_eq (r : ℕ) (hr : r ≤ 4) :
    KZGeneral.boundValue bounds scale r = (kzBound 5 r : ℝ) := by
  interval_cases r <;>
    norm_num [KZGeneral.boundValue, bounds, boundData, scale, kzBound]

theorem increment_positive : ∀ i < 4, 0 < KZGeneral.increment bounds scale i := by
  intro i hi
  interval_cases i <;>
    norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale]

theorem product_value :
    (∏ i ∈ Finset.range 4, KZGeneral.increment bounds scale i) = (7 / 2430000 : ℝ) := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, bounds, boundData, scale,
    Finset.prod_range_succ]

theorem numerical_margin :
    1 < (∏ i ∈ Finset.range 4, KZGeneral.increment bounds scale i) * (347143 : ℝ) := by
  rw [product_value]
  norm_num

theorem product_lower_bound (t : ℕ → ℝ)
    (ht : ∀ i < 4, 0 < t i)
    (hprefix : ∀ r ≤ 4, KZGeneral.boundValue bounds scale r ≤ ∑ i ∈ Finset.range r, t i)
    (hratio : ∀ i, i+1 < 4 → 3*t i ≤ 4*t (i+1)) :
    ∏ i ∈ Finset.range 4, KZGeneral.increment bounds scale i ≤
      ∏ i ∈ Finset.range 4, t i := by
  exact KZGeneral.product_of_certificate 4 bounds scale (by decide) (by decide)
    row rows_valid increment_positive t ht hprefix hratio

end Loneliness.FiveRunnerNorm.Data
