import Conjectures.HeimNeuhauserPlanePartition

/-! Explicit bounds for the divisor-square weights in the Fourier moments. -/

namespace PlanePartition

open Finset

private noncomputable def reciprocalSquareSum (n : ℕ) : ℝ :=
  ∑ i ∈ range (n + 1), (1 : ℝ) / (i : ℝ) ^ 2

private theorem reciprocalSquare_tail (n : ℕ) (hn : 10 ≤ n) :
    reciprocalSquareSum n + 1 / (n : ℝ) ≤ 33 / 20 := by
  induction n, hn using Nat.le_induction with
  | base => norm_num [reciprocalSquareSum, sum_range_succ]
  | succ n hn ih =>
    have hpos : 0 < (n : ℝ) := by exact_mod_cast (by omega : 0 < n)
    have step : 1 / ((n : ℝ) + 1) ^ 2 + 1 / ((n : ℝ) + 1) ≤ 1 / (n : ℝ) := by
      field_simp
      nlinarith [sq_nonneg (n : ℝ)]
    rw [reciprocalSquareSum, sum_range_succ]
    change (reciprocalSquareSum n + 1 / ((n + 1 : ℕ) : ℝ) ^ 2) +
      1 / ((n + 1 : ℕ) : ℝ) ≤ 33 / 20
    push_cast
    linarith

private theorem reciprocalSquare_bound (n : ℕ) : reciprocalSquareSum n ≤ 33 / 20 := by
  by_cases h : 10 ≤ n
  · exact (le_add_of_nonneg_right (by positivity)).trans (reciprocalSquare_tail n h)
  · interval_cases n <;> norm_num [reciprocalSquareSum, sum_range_succ]

theorem divisorSquareSum_lower (n : ℕ) : n ^ 2 ≤ divisorSquareSum n := by
  by_cases h : n = 0
  · simp [h, divisorSquareSum]
  · exact single_le_sum (f := fun d : ℕ => d ^ 2) (fun _ _ => Nat.zero_le _) (Nat.mem_divisors.mpr ⟨dvd_refl n, h⟩)

/-- The finite reciprocal-square sum already gives the constant 33/20. -/
theorem divisorSquareSum_upper (n : ℕ) : (divisorSquareSum n : ℝ) ≤ (33 / 20) * (n : ℝ) ^ 2 := by
  unfold divisorSquareSum
  rw [Nat.cast_sum]
  simp only [Nat.cast_pow]
  rw [← Nat.sum_div_divisors n (fun i : ℕ => (i : ℝ) ^ 2)]
  calc
    _ = (n : ℝ) ^ 2 * ∑ d ∈ n.divisors, (1 : ℝ) / (d : ℝ) ^ 2 := by
      rw [mul_sum]
      apply sum_congr rfl
      intro d hd
      have h₀ : (d : ℝ) ≠ 0 := by exact_mod_cast (Nat.pos_of_mem_divisors hd).ne'
      rw [Nat.cast_div (Nat.mem_divisors.mp hd).1 h₀, div_pow]
      ring
    _ ≤ (n : ℝ) ^ 2 * reciprocalSquareSum n := by
      apply mul_le_mul_of_nonneg_left _ (sq_nonneg _)
      apply sum_le_sum_of_subset_of_nonneg
      · intro d hd
        exact mem_range.mpr (Nat.lt_succ_of_le (Nat.divisor_le hd))
      · intro _ _ _
        positivity
    _ ≤ _ := by rw [mul_comm (33 / 20)]; exact mul_le_mul_of_nonneg_left (reciprocalSquare_bound n) (sq_nonneg _)

end PlanePartition
