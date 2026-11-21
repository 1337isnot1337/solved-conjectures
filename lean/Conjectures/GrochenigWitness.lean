module

public import Conjectures.GrochenigSeparation
public import Conjectures.GrochenigSeries
public import Conjectures.GrochenigSignPreservation
public import Conjectures.GrochenigDensity

/-!
# One infinite Gaussian sum with the required density witnesses

The chosen centers satisfy all finite-stage interference estimates. The
absolutely convergent series therefore retains every block's alternating
test values. The zeros and coefficient sign changes below belong to this
single function and this single coefficient sequence at every scale.
-/

@[expose] public section

namespace Grochenig

open Set
open scoped BigOperators ENNReal

noncomputable section

theorem constructed_slot_injective : Function.Injective (slotPosition center) :=
  slotPosition_injective

theorem constructed_test_error (n j : ℕ) (hj : j ≤ n + 1) :
    |seriesValue center ((center n : ℝ) + testPoint j) - block (n + 1) (testPoint j)| <
      3 * blockMargin (n + 1) / 8 := by
  let a : ℕ → ℝ := fun i =>
    block (i + 1) ((center n : ℝ) + testPoint j - (center i : ℝ))
  have ha : Summable a :=
    grouped_blocks_summable center constructed_slot_injective _
  have hearlier := earlier_blocks_small n j hj
  change |∑ i : Fin n, a i.val| < blockMargin (n + 1) / 4 at hearlier
  rw [Fin.sum_univ_eq_sum_range a n] at hearlier
  have hlater (i : ℕ) (hi : n < i) :
      |a i| ≤ blockMargin (n + 1) * (1 / 2 : ℝ) ^ (i + 3) :=
    (later_block_small hi hj).le
  have herror := series_error_lt a ha n (blockMargin (n + 1))
    (blockMargin_pos (n + 1)) hearlier hlater
  have hsum : (∑' i : ℕ, a i) =
      seriesValue center ((center n : ℝ) + testPoint j) :=
    (grouped_blocks_hasSum center constructed_slot_injective _).tsum_eq
  have hselected : a n = block (n + 1) (testPoint j) := by
    dsimp [a]
    congr 1
    ring
  rwa [hsum, hselected] at herror

/-- Every finite block retains the sign of each one of its test values in
the actual infinite sum. -/
theorem constructed_test_same_sign (n j : ℕ) (hj : j ≤ n + 1) :
    0 < seriesValue center ((center n : ℝ) + testPoint j) *
      block (n + 1) (testPoint j) := by
  have hsmall : 3 * blockMargin (n + 1) / 8 < blockMargin (n + 1) := by
    linarith [blockMargin_pos (n + 1)]
  exact mul_pos_of_abs_sub_lt
    (((constructed_test_error n j hj).trans hsmall).trans_le
      (blockMargin_le_test (n + 1) j hj))

theorem constructed_test_adjacent_neg (n j : ℕ) (hj : j < n + 1) :
    seriesValue center ((center n : ℝ) + testPoint j) *
      seriesValue center ((center n : ℝ) + testPoint (j + 1)) < 0 := by
  have hfirst := constructed_test_same_sign n j hj.le
  have hsecond := constructed_test_same_sign n (j + 1) (by omega)
  have hblock := block_test_mul_succ_neg (n + 1) j hj
  have hprod : 0 <
      (seriesValue center ((center n : ℝ) + testPoint j) *
        seriesValue center ((center n : ℝ) + testPoint (j + 1))) *
      (block (n + 1) (testPoint j) * block (n + 1) (testPoint (j + 1))) := by
    convert mul_pos hfirst hsecond using 1
    ring
  rcases mul_pos_iff.mp hprod with h | h
  · exact False.elim ((not_lt_of_ge h.2.le) hblock)
  · exact h.1

theorem constructed_nonzero : ∃ x : ℝ, seriesValue center x ≠ 0 := by
  refine ⟨(center 0 : ℝ) + testPoint 0, ?_⟩
  intro hz
  have h := constructed_test_same_sign 0 0 (by omega)
  rw [hz, zero_mul] at h
  exact (lt_irrefl 0) h

/-- For every positive integer length, one real interval contains at least
that many distinct zeros of the same function. -/
theorem constructed_zero_window (n : ℕ) :
    ∃ a : ℝ, ((n + 1 : ℕ) : ℝ≥0∞) ≤
      intervalCount (zeroSet (seriesValue center)) a ((n + 1 : ℕ) : ℝ) := by
  let a : ℝ := (center n : ℝ) + 1 / 2
  have hsign (j : Fin (n + 1)) :
      seriesValue center (a + (j.val : ℝ)) *
        seriesValue center (a + (j.val : ℝ) + 1) < 0 := by
    have hleft : a + (j.val : ℝ) = (center n : ℝ) + testPoint j.val := by
      dsimp [a, testPoint]
      ring
    have hright : a + (j.val : ℝ) + 1 =
        (center n : ℝ) + testPoint (j.val + 1) := by
      dsimp [a, testPoint]
      simp only [Nat.cast_add, Nat.cast_one]
      ring
    have hproduct := congrArg₂
      (fun u v : ℝ => seriesValue center u * seriesValue center v) hleft hright
    rw [hproduct]
    exact constructed_test_adjacent_neg n j.val j.isLt
  obtain ⟨z, hzmono, hz⟩ := ordered_zero_witnesses (seriesValue center)
    (continuous_seriesValue center constructed_slot_injective) (n + 1) a hsign
  refine ⟨a, card_le_intervalCount _ _ _ z hzmono.injective ?_ ?_⟩
  · intro j
    exact (mem_zeroSet _ _).mpr (hz j).2
  · intro j
    have hj0 : (0 : ℝ) ≤ j.val := Nat.cast_nonneg _
    have hj1 : (j.val : ℝ) + 1 ≤ ((n + 1 : ℕ) : ℝ) := by
      exact_mod_cast (show j.val + 1 ≤ n + 1 from j.isLt)
    constructor <;> linarith [(hz j).1.1, (hz j).1.2]

theorem constructed_zero_density :
    1 ≤ upperBeurlingDensity (zeroSet (seriesValue center)) := by
  apply one_le_upperBeurlingDensity_of_windows
  intro N hN
  cases N with
  | zero => omega
  | succ n => exact constructed_zero_window n

theorem coefficient_center_slot (n k : ℕ) (hk : k ≤ n + 1) :
    coefficient center (center n + 2 * (k : ℤ)) = blockCoeff (n + 1) k := by
  simpa only [slotPosition_eq] using
    coefficient_at_slot center constructed_slot_injective ⟨n, ⟨k, by omega⟩⟩

theorem coefficient_center_odd_zero (n k : ℕ) :
    coefficient center (center n + 2 * (k : ℤ) + 1) = 0 := by
  by_contra hne
  obtain ⟨u, hu⟩ := center_even n
  obtain ⟨v, hv⟩ := coefficient_even_support center center_even _ hne
  omega

theorem coefficient_slot_sign_change (n k : ℕ) (hk : k < n + 1) :
    center n + 2 * (k : ℤ) ∈ coefficientSignChanges (coefficient center) := by
  apply mem_coefficientSignChanges_of_step_two
  · have hnext : center n + 2 * (k : ℤ) + 2 = center n + 2 * ((k + 1 : ℕ) : ℤ) := by
      simp only [Nat.cast_add, Nat.cast_one]
      ring
    rw [hnext, coefficient_center_slot n k hk.le,
      coefficient_center_slot n (k + 1) (by omega)]
    exact blockCoeff_mul_succ_neg (n + 1) k hk
  · exact coefficient_center_odd_zero n k

/-- The source definition, including skipped zero coefficients, has upper
density exactly one half for the constructed sequence. -/
theorem constructed_coefficient_density :
    upperCoefficientDensity (coefficient center) = (1 : ℝ≥0∞) / 2 := by
  apply le_antisymm
  · exact upperCoefficientDensity_le_half (coefficient center)
      (coefficient_even_support center center_even)
  · apply half_le_upperCoefficientDensity
    intro N hN
    cases N with
    | zero => omega
    | succ n =>
      exact ⟨center n, fun k => coefficient_slot_sign_change n k.val k.isLt⟩

end

end Grochenig
