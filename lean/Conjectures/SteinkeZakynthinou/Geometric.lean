module

public import Conjectures.SteinkeZakynthinou.Information
public import Mathlib.Analysis.SpecialFunctions.Sqrt

/-! Summation of the depth charges in the likelihood comparison. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

private theorem sum_growth_le (j : ℕ) :
    (∑ i ∈ Finset.range (j + 1), (4 / 3 : ℝ)^i) ≤ 4 * (4 / 3 : ℝ)^j := by
  induction j with
  | zero => norm_num
  | succ j ih =>
    rw [Finset.sum_range_succ, pow_succ']
    linarith

/-- The square of the sum over active depths is charged to the sum of the
squares at those depths. Even sparse sets of active depths are allowed. -/
theorem sq_sum_growth_le (s : Finset ℕ) :
    (∑ j ∈ s, (4 / 3 : ℝ)^j)^2 ≤ 16 * ∑ j ∈ s, ((4 / 3 : ℝ)^j)^2 := by
  by_cases hs : s.Nonempty
  · let m := s.max' hs
    have hm : m ∈ s := Finset.max'_mem s hs
    have hsub : s ⊆ Finset.range (m + 1) := by
      intro j hj
      exact Finset.mem_range.mpr (Nat.lt_succ_of_le (Finset.le_max' s j hj))
    have hsum : (∑ j ∈ s, (4 / 3 : ℝ)^j) ≤ 4 * (4 / 3 : ℝ)^m :=
      (Finset.sum_le_sum_of_subset_of_nonneg hsub (fun i _ _ => by positivity)).trans
        (sum_growth_le m)
    have hsq := pow_le_pow_left₀ (Finset.sum_nonneg (fun j _ => by positivity) :
      0 ≤ ∑ j ∈ s, (4 / 3 : ℝ)^j) hsum 2
    rw [mul_pow] at hsq
    norm_num at hsq
    exact hsq.trans (mul_le_mul_of_nonneg_left
      (Finset.single_le_sum (fun j _ => sq_nonneg ((4 / 3 : ℝ)^j)) hm) (by norm_num))
  · simp [Finset.not_nonempty_iff_eq_empty.mp hs]

theorem sum_growth_le_of_internalDepth {n : ℕ} (hn : 0 < n) (s : Finset ℕ)
    (h : ∀ j ∈ s, 2^j ≤ 4 * n) :
    (∑ j ∈ s, (4 / 3 : ℝ)^j) ≤ 8 * Real.sqrt n := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  by_cases hs : s.Nonempty
  · let m := s.max' hs
    have hm : m ∈ s := Finset.max'_mem s hs
    have hsub : s ⊆ Finset.range (m + 1) := by
      intro j hj
      exact Finset.mem_range.mpr (Nat.lt_succ_of_le (Finset.le_max' s j hj))
    have hsquare : ((4 / 3 : ℝ)^m)^2 ≤ (2 * Real.sqrt n)^2 := by
      rw [← pow_mul, Nat.mul_comm, pow_mul, mul_pow, Real.sq_sqrt hnR.le]
      norm_num only [Nat.reducePow]
      calc
        _ ≤ (2 : ℝ)^m := pow_le_pow_left₀ (by positivity) (by norm_num) _
        _ ≤ _ := by exact_mod_cast h m hm
    have hm' : (4 / 3 : ℝ)^m ≤ 2 * Real.sqrt n := by
      nlinarith [Real.sqrt_nonneg (n : ℝ), pow_nonneg (by norm_num : (0 : ℝ) ≤ 4 / 3) m]
    calc
      _ ≤ ∑ j ∈ Finset.range (m + 1), (4 / 3 : ℝ)^j :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub (fun j _ _ => by positivity)
      _ ≤ 4 * (4 / 3 : ℝ)^m := sum_growth_le m
      _ ≤ _ := by linarith
  · simp only [Finset.not_nonempty_iff_eq_empty.mp hs, Finset.sum_empty]
    positivity

theorem sum_depth_decay_le (d : ℕ) :
    (∑ j ∈ Finset.range d, ((4 / 3 : ℝ)^j)^2 * (1 / 2 : ℝ)^j) ≤ 9 := by
  have he (j : ℕ) : ((4 / 3 : ℝ)^j)^2 * (1 / 2 : ℝ)^j = (8 / 9 : ℝ)^j := by
    rw [← pow_mul, Nat.mul_comm, pow_mul, ← mul_pow]
    norm_num
  simp only [he]
  have h (k : ℕ) : (∑ j ∈ Finset.range k, (8 / 9 : ℝ)^j) =
      9 * (1 - (8 / 9 : ℝ)^k) := by
    induction k with
    | zero => norm_num
    | succ k ih =>
      rw [Finset.sum_range_succ, ih, pow_succ]
      ring
  rw [h]
  have hn : 0 ≤ (8 / 9 : ℝ)^d := by positivity
  linarith

end SteinkeZakynthinou
