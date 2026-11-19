import Mathlib.Algebra.Order.Chebyshev
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Sum
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp

/-! A product lower bound from prefix-sum lower bounds.

The sequence whose product is bounded must be positive and nondecreasing.
The comparison sequence need only be positive. All hypotheses are finite:
values of either sequence beyond the stated length are irrelevant. The strict
version needs only one strict prefix inequality.

No lattice or geometric theorem is assumed implicitly. The final reciprocal
bounds retain the product estimate as an explicit hypothesis.
-/

open scoped BigOperators

namespace Loneliness.PrefixProduct

theorem log_tangent {x y : ℝ} (hx : 0 < x) (hy : 0 < y) :
    (x - y) / x ≤ Real.log x - Real.log y := by
  have h := Real.log_le_sub_one_of_pos (div_pos hy hx)
  rw [Real.log_div hy.ne' hx.ne'] at h
  have he : y / x - 1 = -((x - y) / x) := by field_simp; ring
  rw [he] at h
  linarith

theorem log_tangent_strict {x y : ℝ} (hx : 0 < x) (hy : 0 < y) (hne : x ≠ y) :
    (x - y) / x < Real.log x - Real.log y := by
  have hne' : y / x ≠ 1 := by
    intro h
    apply hne
    exact ((div_eq_one_iff_eq hx.ne').mp h).symm
  have h := Real.log_lt_sub_one_of_pos (div_pos hy hx) hne'
  rw [Real.log_div hy.ne' hx.ne'] at h
  have he : y / x - 1 = -((x - y) / x) := by field_simp; ring
  rw [he] at h
  linarith

noncomputable def weight (n : ℕ) (x : ℕ → ℝ) (i : ℕ) : ℝ := if i < n then (x i)⁻¹ else 0

theorem weighted_difference_nonneg (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i) :
    0 ≤ ∑ i ∈ Finset.range n, (x i - y i) / x i := by
  have hwpos : 0 ≤ weight n x := by
    intro i
    by_cases hi : i < n
    · simp only [weight, ite_eq_left hi]
      exact inv_nonneg.mpr (hx i hi).le
    · simp [weight, hi]
  have hwanti : AntitoneOn (weight n x) (Set.Iio n) := by
    intro i hi j hj hij
    simp only [Set.mem_Iio] at hi hj
    simp only [weight, ite_eq_left hi, ite_eq_left hj]
    exact inv_anti₀ (hx i hi) (hmono hi hj hij)
  have hab := Finset.sum_mul_le_sum_mul_of_sum_range_le hprefix hwpos hwanti
  have hyw : (∑ i ∈ Finset.range n, y i * weight n x i) =
      ∑ i ∈ Finset.range n, y i / x i := by
    apply Finset.sum_congr rfl
    intro i hi
    simp [weight, Finset.mem_range.mp hi, div_eq_mul_inv]
  have hxw : (∑ i ∈ Finset.range n, x i * weight n x i) =
      ∑ i ∈ Finset.range n, x i / x i := by
    apply Finset.sum_congr rfl
    intro i hi
    simp [weight, Finset.mem_range.mp hi, div_eq_mul_inv]
  rw [hyw, hxw] at hab
  simpa only [sub_div, Finset.sum_sub_distrib, sub_nonneg] using hab

theorem sum_log_le (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i) :
    ∑ i ∈ Finset.range n, Real.log (y i) ≤ ∑ i ∈ Finset.range n, Real.log (x i) := by
  have hsum := Finset.sum_le_sum (s := Finset.range n)
    (fun i hi => log_tangent (hx i (Finset.mem_range.mp hi)) (hy i (Finset.mem_range.mp hi)))
  have hnonneg := weighted_difference_nonneg n x y hx hmono hprefix
  rw [Finset.sum_sub_distrib] at hsum
  linarith

theorem sum_log_lt_of_ne (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i)
    (hne : ∃ i < n, x i ≠ y i) :
    ∑ i ∈ Finset.range n, Real.log (y i) < ∑ i ∈ Finset.range n, Real.log (x i) := by
  obtain ⟨j, hj, hne⟩ := hne
  have hsum := Finset.sum_lt_sum (s := Finset.range n)
    (fun i hi => log_tangent (hx i (Finset.mem_range.mp hi)) (hy i (Finset.mem_range.mp hi)))
    ⟨j, Finset.mem_range.mpr hj, log_tangent_strict (hx j hj) (hy j hj) hne⟩
  have hnonneg := weighted_difference_nonneg n x y hx hmono hprefix
  rw [Finset.sum_sub_distrib] at hsum
  linarith

/-- Prefix domination of a positive comparison sequence bounds its product
by the product of the positive nondecreasing sequence. -/
theorem prod_le (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i) :
    ∏ i ∈ Finset.range n, y i ≤ ∏ i ∈ Finset.range n, x i := by
  have hlog := sum_log_le n x y hx hy hmono hprefix
  rw [← Real.log_prod (fun i hi => (hy i (Finset.mem_range.mp hi)).ne'),
    ← Real.log_prod (fun i hi => (hx i (Finset.mem_range.mp hi)).ne')] at hlog
  exact (Real.log_le_log_iff
    (Finset.prod_pos (fun i hi => hy i (Finset.mem_range.mp hi)))
    (Finset.prod_pos (fun i hi => hx i (Finset.mem_range.mp hi)))).mp hlog

theorem prod_lt_of_ne (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i)
    (hne : ∃ i < n, x i ≠ y i) :
    ∏ i ∈ Finset.range n, y i < ∏ i ∈ Finset.range n, x i := by
  have hlog := sum_log_lt_of_ne n x y hx hy hmono hprefix hne
  rw [← Real.log_prod (fun i hi => (hy i (Finset.mem_range.mp hi)).ne'),
    ← Real.log_prod (fun i hi => (hx i (Finset.mem_range.mp hi)).ne')] at hlog
  exact (Real.log_lt_log_iff
    (Finset.prod_pos (fun i hi => hy i (Finset.mem_range.mp hi)))
    (Finset.prod_pos (fun i hi => hx i (Finset.mem_range.mp hi)))).mp hlog

/-- A single strict prefix suffices, even if some successive `x` values coincide. -/
theorem prod_lt_of_strict_prefix (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i)
    (hstrict : ∃ k ≤ n, ∑ i ∈ Finset.range k, y i < ∑ i ∈ Finset.range k, x i) :
    ∏ i ∈ Finset.range n, y i < ∏ i ∈ Finset.range n, x i := by
  apply prod_lt_of_ne n x y hx hy hmono hprefix
  by_contra h
  push Not at h
  obtain ⟨k, hk, hstrict⟩ := hstrict
  have heq : (∑ i ∈ Finset.range k, y i) = ∑ i ∈ Finset.range k, x i := by
    apply Finset.sum_congr rfl
    intro i hi
    exact (h i (lt_of_lt_of_le (Finset.mem_range.mp hi) hk)).symm
  linarith

theorem reciprocal_bound (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i)
    {V Δ B : ℝ} (hV : 0 < V) (hB : 0 < B)
    (hcomparison : ∏ i ∈ Finset.range n, y i = 1 / B)
    (hproduct : ∏ i ∈ Finset.range n, x i ≤ Δ / V) : V ≤ B * Δ := by
  have h := (prod_le n x y hx hy hmono hprefix).trans hproduct
  rw [hcomparison] at h
  have h' := (div_le_div_iff₀ hB hV).mp h
  nlinarith

theorem reciprocal_strict_bound (n : ℕ) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k ≤ n, ∑ i ∈ Finset.range k, y i ≤ ∑ i ∈ Finset.range k, x i)
    (hstrict : ∃ k ≤ n, ∑ i ∈ Finset.range k, y i < ∑ i ∈ Finset.range k, x i)
    {V Δ B : ℝ} (hV : 0 < V) (hB : 0 < B)
    (hcomparison : ∏ i ∈ Finset.range n, y i = 1 / B)
    (hproduct : ∏ i ∈ Finset.range n, x i ≤ Δ / V) : V < B * Δ := by
  have h := (prod_lt_of_strict_prefix n x y hx hy hmono hprefix hstrict).trans_le hproduct
  rw [hcomparison] at h
  have h' := (div_lt_div_iff₀ hB hV).mp h
  nlinarith

theorem reciprocal_bound_of_strict_prefixes (n : ℕ) (hn : 0 < n) (x y : ℕ → ℝ)
    (hx : ∀ i < n, 0 < x i) (hy : ∀ i < n, 0 < y i)
    (hmono : MonotoneOn x (Set.Iio n))
    (hprefix : ∀ k, 0 < k → k ≤ n →
      ∑ i ∈ Finset.range k, y i < ∑ i ∈ Finset.range k, x i)
    {V Δ B : ℝ} (hV : 0 < V) (hB : 0 < B)
    (hcomparison : ∏ i ∈ Finset.range n, y i = 1 / B)
    (hproduct : ∏ i ∈ Finset.range n, x i ≤ Δ / V) : V < B * Δ := by
  apply reciprocal_strict_bound n x y hx hy hmono
  · intro k hk
    rcases Nat.eq_zero_or_pos k with rfl | hkpos
    · simp
    · exact (hprefix k hkpos hk).le
  · exact ⟨n, le_rfl, hprefix n hn le_rfl⟩
  · exact hV
  · exact hB
  · exact hcomparison
  · exact hproduct

end Loneliness.PrefixProduct
