import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic

/-! The divided-difference sum recurrence in §4 of the Kauers–Koutschan proof. -/

open scoped BigOperators

namespace KauersKoutschan

def sign (n : ℕ) : ℚ := (-1) ^ n

theorem sign_succ (n : ℕ) : sign (n + 1) = -sign n := by
  simp [sign, pow_succ]

theorem sign_add_two (n : ℕ) : sign (n + 2) = sign n := by
  rw [show n + 2 = (n + 1) + 1 by omega, sign_succ, sign_succ, neg_neg]

theorem sign_sq (n : ℕ) : sign n * sign n = 1 := by
  induction n with
  | zero => norm_num [sign]
  | succ n ih => rw [sign_succ, neg_mul_neg, ih]

/-- The signed derangement numbers, including the initial moment. -/
def moment : ℕ → ℚ
  | 0 => 1
  | n + 1 => -(n + 1 : ℚ) * moment n + 1

def derangement (n : ℕ) : ℚ := sign n * moment n

theorem derangement_succ (n : ℕ) :
    derangement (n + 1) = (n + 1 : ℚ) * derangement n + sign (n + 1) := by
  simp only [derangement, moment, sign_succ]
  ring

private def denom (m k : ℕ) : ℚ := 2 * (k : ℚ) - m

/-- The centered summand vanishes by the field's convention for division by zero. -/
def dividedSum (m : ℕ) : ℚ :=
  sign m * ∑ k ∈ Finset.range (m + 1), moment k / denom m k

def momentSum (m : ℕ) : ℚ :=
  sign m * ∑ k ∈ Finset.range (m + 1), moment k

theorem momentSum_succ (m : ℕ) :
    momentSum (m + 1) = derangement (m + 1) - momentSum m := by
  rw [momentSum, Finset.sum_range_succ, derangement, momentSum, sign_succ]
  ring

private theorem sign_add (m n : ℕ) : sign (m + n) = sign m * sign n :=
  pow_add (-1 : ℚ) m n

/-- The exact divided difference from equation (3). -/
def dividedDifference (k j : ℕ) : ℚ :=
  (sign j * derangement k - sign k * derangement j) / ((k : ℚ) - j)

private theorem sum_pair (m : ℕ) (f : ℕ → ℚ) (hcenter : 2 ∣ m → f (m / 2) = 0) :
    (∑ j ∈ Finset.range (m + 1), f j) =
      ∑ j ∈ Finset.range ((m + 1) / 2), (f j + f (m - j)) := by
  let h := (m + 1) / 2
  let r := m + 1 - h
  have hrh : r + h = m + 1 := by dsimp [r, h]; omega
  have hl : (∑ j ∈ Finset.range r, f j) = ∑ j ∈ Finset.range h, f j := by
    rcases (show r = h ∨ r = h + 1 by dsimp [r, h]; omega) with he | ho
    · rw [he]
    · rw [ho, Finset.sum_range_succ]
      have hmh : m = 2 * h := by dsimp [r, h] at *; omega
      have hh : m / 2 = h := by omega
      rw [← hh, hcenter ⟨h, hmh⟩, add_zero]
  have hu : (∑ j ∈ Finset.range h, f (r + j)) =
      ∑ j ∈ Finset.range h, f (m - j) := by
    rw [← Finset.sum_range_reflect (fun j => f (r + j)) h]
    apply Finset.sum_congr rfl
    intro j hj
    have hjh := Finset.mem_range.mp hj
    congr 1
    omega
  change _ = ∑ j ∈ Finset.range h, _
  rw [← hrh, Finset.sum_range_add, hl, hu, Finset.sum_add_distrib]

/-- The two representations of the full sum in §4 agree at every index. -/
theorem dividedSum_eq_pair_sum (m : ℕ) :
    dividedSum m =
      ∑ j ∈ Finset.range ((m + 1) / 2), dividedDifference (m - j) j := by
  rw [dividedSum, sum_pair m (fun k => moment k / denom m k), Finset.mul_sum]
  · apply Finset.sum_congr rfl
    intro j hj
    have hjm : j ≤ m := by have := Finset.mem_range.mp hj; omega
    have hd : denom m j = -((↑(m - j) : ℚ) - j) := by
      simp only [denom, Nat.cast_sub hjm]
      ring
    have hd' : denom m (m - j) = (↑(m - j) : ℚ) - j := by
      simp only [denom, Nat.cast_sub hjm]
      ring
    have hs : sign j * sign (m - j) = sign m := by
      rw [← sign_add, show j + (m - j) = m by omega]
    rw [hd, hd', div_neg, neg_add_eq_sub, div_sub_div_same, ← mul_div_assoc]
    simp only [dividedDifference, derangement, ← mul_assoc, hs, mul_comm (sign (m - j)) (sign j)]
    ring
  · rintro ⟨k, hk⟩
    have hhalf : m / 2 = k := by omega
    have hzero : denom m k = 0 := by rw [hk]; simp [denom]
    rw [hhalf, hzero, div_zero]

/-- The omitted pairs in equation (6), with denominators independent of the base index. -/
theorem truncated_pair_sum (h s cutoff : ℕ) (hc : cutoff ≤ (s + 1) / 2) :
    (∑ j ∈ Finset.range (h + cutoff), dividedDifference (2 * h + s - j) j) =
      dividedSum (2 * h + s) -
        ∑ i ∈ Finset.range ((s + 1) / 2 - cutoff),
          sign s * (moment (h + s - (cutoff + i)) - moment (h + (cutoff + i))) /
            ((s - 2 * (cutoff + i) : ℕ) : ℚ) := by
  have hsplit : (2 * h + s + 1) / 2 =
      (h + cutoff) + ((s + 1) / 2 - cutoff) := by omega
  have hsplitSum := Finset.sum_range_add (fun j => dividedDifference (2 * h + s - j) j)
    (h + cutoff) ((s + 1) / 2 - cutoff)
  have htail :
      (∑ i ∈ Finset.range ((s + 1) / 2 - cutoff),
        dividedDifference (2 * h + s - (h + cutoff + i)) (h + cutoff + i)) =
        ∑ i ∈ Finset.range ((s + 1) / 2 - cutoff),
          sign s * (moment (h + s - (cutoff + i)) - moment (h + (cutoff + i))) /
            ((s - 2 * (cutoff + i) : ℕ) : ℚ) := by
    apply Finset.sum_congr rfl
    intro i hi
    have hib := Finset.mem_range.mp hi
    have hj : 2 * (cutoff + i) < s := by omega
    have hupper : 2 * h + s - (h + cutoff + i) = h + s - (cutoff + i) := by omega
    rw [hupper, show h + cutoff + i = h + (cutoff + i) by omega]
    have hden : (↑(h + s - (cutoff + i)) : ℚ) - ↑(h + (cutoff + i)) =
        ↑(s - 2 * (cutoff + i)) := by
      push_cast [Nat.cast_sub (show cutoff + i ≤ h + s by omega),
        Nat.cast_sub (show 2 * (cutoff + i) ≤ s by omega)]
      ring
    have hsign : sign (h + (cutoff + i)) * sign (h + s - (cutoff + i)) = sign s := by
      rw [← sign_add, show h + (cutoff + i) + (h + s - (cutoff + i)) = 2 * h + s by omega,
        sign_add]
      simp [sign, pow_mul]
    simp only [dividedDifference, derangement, hden, ← mul_assoc, hsign,
      mul_comm (sign (h + s - (cutoff + i))) (sign (h + (cutoff + i)))]
    ring
  rw [dividedSum_eq_pair_sum, hsplit, hsplitSum, htail]
  abel

private theorem recip_sum_zero (m : ℕ) :
    (∑ k ∈ Finset.range (m + 1), 1 / denom m k) = 0 := by
  set s : ℚ := ∑ k ∈ Finset.range (m + 1), 1 / denom m k
  have h : s = -s := by
    change (∑ k ∈ Finset.range (m + 1), 1 / denom m k) =
      -(∑ k ∈ Finset.range (m + 1), 1 / denom m k)
    rw [← Finset.sum_neg_distrib]
    conv_lhs => rw [← Finset.sum_range_reflect]
    apply Finset.sum_congr rfl
    intro k hk
    have hkm : k ≤ m := by simpa using (Finset.mem_range.mp hk)
    have hr : denom m (m - k) = -denom m k := by
      simp only [denom, Nat.cast_sub hkm]
      ring
    rw [show m + 1 - 1 - k = m - k by omega, hr, div_neg]
  linarith

private theorem sum_center (m : ℕ) :
    (∑ k ∈ Finset.range (m + 1), if denom m k = 0 then moment k else 0) =
      if m % 2 = 0 then moment (m / 2) else 0 := by
  classical
  have heq (k : ℕ) : denom m k = 0 ↔ 2 * k = m := by
    unfold denom
    rw [sub_eq_zero]
    exact_mod_cast (Iff.rfl : 2 * k = m ↔ 2 * k = m)
  simp_rw [heq]
  by_cases hm : m % 2 = 0
  · rw [ite_eq_left hm]
    simp_rw [show ∀ k : ℕ, (2 * k = m) ↔ k = m / 2 by omega]
    simp [show m / 2 < m + 1 by omega]
  · rw [ite_eq_right hm]
    exact Finset.sum_eq_zero fun k _ => ite_eq_right (by omega)

private theorem sign_even (m : ℕ) (hm : m % 2 = 0) : sign m = 1 := by
  rw [show m = 2 * (m / 2) by omega, sign, pow_mul]
  norm_num

private theorem weighted_sum (m : ℕ) :
    (∑ k ∈ Finset.range (m + 1), moment (k + 1) / denom m k) =
      -((m + 2 : ℚ) / 2) * (∑ k ∈ Finset.range (m + 1), moment k / denom m k)
        - (∑ k ∈ Finset.range (m + 1), moment k) / 2
        + (if m % 2 = 0 then moment (m / 2) else 0) / 2 := by
  classical
  have step (k : ℕ) : moment (k + 1) / denom m k =
      -((m + 2 : ℚ) / 2) * (moment k / denom m k) - moment k / 2 +
      (if denom m k = 0 then moment k else 0) / 2 + 1 / denom m k := by
    by_cases hk : denom m k = 0
    · simp [hk]
    · rw [moment, ite_eq_right hk]
      field_simp [hk]
      unfold denom
      ring
  simp_rw [step]
  rw [Finset.sum_add_distrib, Finset.sum_add_distrib, Finset.sum_sub_distrib,
    ← Finset.mul_sum, ← Finset.sum_div, ← Finset.sum_div, sum_center, recip_sum_zero, add_zero]

/-- Equation (5), with the center correction at even indices. -/
theorem dividedSum_add_two (m : ℕ) :
    dividedSum (m + 2) =
      derangement (m + 1) - ((m + 2 : ℚ) / 2) * dividedSum m - momentSum m / 2 +
        (if m % 2 = 0 then moment (m / 2) else 0) / 2 := by
  rw [dividedSum, sign_add_two]
  rw [Finset.sum_range_succ, Finset.sum_range_succ']
  have hden (k : ℕ) : denom (m + 2) (k + 1) = denom m k := by
    simp only [denom, Nat.cast_add, Nat.cast_one, Nat.cast_ofNat]
    ring
  simp_rw [hden]
  rw [weighted_sum]
  have hend : moment 0 / denom (m + 2) 0 + moment (m + 2) / denom (m + 2) (m + 2) =
      -moment (m + 1) := by
    simp only [moment, denom, Nat.cast_zero, mul_zero, zero_sub, Nat.cast_add, Nat.cast_ofNat]
    have h : (m : ℚ) + 2 ≠ 0 := by positivity
    field_simp
    ring
  rw [hden (m + 1)] at hend
  have hcenter :
      sign m * (if m % 2 = 0 then moment (m / 2) else 0) =
        if m % 2 = 0 then moment (m / 2) else 0 := by
    split_ifs with h
    · rw [sign_even m h, one_mul]
    · rw [mul_zero]
  rw [derangement, sign_succ, dividedSum, momentSum]
  linear_combination sign m * hend + hcenter / 2

end KauersKoutschan
