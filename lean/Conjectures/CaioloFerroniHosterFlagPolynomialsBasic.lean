import Conjectures.CaioloFerroniHosterArithmetic

/-! Rank-selected flag formulas used by the exact discriminant certificate. -/

namespace CaioloFerroniHoster

open Finset
open scoped BigOperators

set_option linter.unnecessarySeqFocus false
set_option linter.unusedTactic false
set_option linter.unreachableTactic false

theorem gaussian_zero {A : Type*} [Semiring A] (q : A) {d i : ℕ} (h : d < i) :
    gaussian q d i = 0 := by
  induction d generalizing i with
  | zero =>
    have hi : i ≠ 0 := by omega
    simp [gaussian, hi]
  | succ d ih =>
    cases i with
    | zero => omega
    | succ i =>
      simp [gaussian, ih (i := i) (by omega), ih (i := i + 1) (by omega)]

def productFlagPruned (q : ℝ) (d t : ℕ) : List ℕ → ℝ
  | [] => 1
  | r :: s => ∑ i ∈ range (r + 1), if i ≤ d ∧ r - i ≤ t then
    gaussian q d i * (Nat.choose t (r - i) : ℝ) * productFlagPruned q i (r - i) s else 0

theorem productFlag_prune (q : ℝ) (d t : ℕ) (s : List ℕ) :
    productFlag q d t s = productFlagPruned q d t s := by
  induction s generalizing d t with
  | nil => rfl
  | cons r s ih =>
    rw [productFlag, productFlagPruned]
    refine Finset.sum_congr rfl fun i _ => ?_
    by_cases hd : i ≤ d
    · by_cases ht : r - i ≤ t
      · simp [hd, ht, ih]
      · simp [ht, Nat.choose_eq_zero_of_lt (Nat.lt_of_not_ge ht)]
    · simp [hd, gaussian_zero q (Nat.lt_of_not_ge hd)]

theorem flagPolynomialEmpty (q : ℝ) : coalescedFlag q [] = 1 := rfl

@[local simp] theorem gaussian_4_0 (q : ℝ) : gaussian q 4 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_3_0 (q : ℝ) : gaussian q 3 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_2_0 (q : ℝ) : gaussian q 2 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_1_0 (q : ℝ) : gaussian q 1 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_0_0 (q : ℝ) : gaussian q 0 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_0_1 (q : ℝ) : gaussian q 0 1 = 0 := by
  exact gaussian_zero q (by decide)

@[local simp] theorem gaussian_1_1 (q : ℝ) : gaussian q 1 1 = 1 * q ^ 0 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_2_1 (q : ℝ) : gaussian q 2 1 = 1 * q ^ 0 + 1 * q ^ 1 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_3_1 (q : ℝ) : gaussian q 3 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_4_1 (q : ℝ) : gaussian q 4 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^ 3 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_5_1 (q : ℝ) : gaussian q 5 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_1_2 (q : ℝ) : gaussian q 1 2 = 0 := by
  exact gaussian_zero q (by decide)

@[local simp] theorem gaussian_2_2 (q : ℝ) : gaussian q 2 2 = 1 * q ^ 0 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_3_2 (q : ℝ) : gaussian q 3 2 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_4_2 (q : ℝ) : gaussian q 4 2 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_5_2 (q : ℝ) : gaussian q 5 2 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 2 * q ^ 4 + 1 * q ^ 5 + 1 * q ^ 6 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_6_2 (q : ℝ) : gaussian q 6 2 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 3 * q ^ 4 + 2 * q ^ 5 + 2 * q ^ 6 + 1 * q ^ 7 + 1 * q ^ 8 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_2_3 (q : ℝ) : gaussian q 2 3 = 0 := by
  exact gaussian_zero q (by decide)

@[local simp] theorem gaussian_3_3 (q : ℝ) : gaussian q 3 3 = 1 * q ^ 0 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_4_3 (q : ℝ) : gaussian q 4 3 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^ 3 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_5_3 (q : ℝ) : gaussian q 5 3 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 2 * q ^ 4 + 1 * q ^ 5 + 1 * q ^ 6 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_6_3 (q : ℝ) : gaussian q 6 3 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^
    3 + 3 * q ^ 4 + 3 * q ^ 5 + 3 * q ^ 6 + 2 * q ^ 7 + 1 * q ^ 8 + 1 * q ^ 9 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_7_3 (q : ℝ) : gaussian q 7 3 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^
    3 + 4 * q ^ 4 + 4 * q ^ 5 + 5 * q ^ 6 + 4 * q ^ 7 + 4 * q ^ 8 + 3 * q ^ 9 + 2 * q ^ 10 + 1 * q ^ 11 +
    1 * q ^ 12 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_3_4 (q : ℝ) : gaussian q 3 4 = 0 := by
  exact gaussian_zero q (by decide)

@[local simp] theorem gaussian_4_4 (q : ℝ) : gaussian q 4 4 = 1 * q ^ 0 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_5_4 (q : ℝ) : gaussian q 5 4 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_6_4 (q : ℝ) : gaussian q 6 4 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 3 * q ^ 4 + 2 * q ^ 5 + 2 * q ^ 6 + 1 * q ^ 7 + 1 * q ^ 8 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_7_4 (q : ℝ) : gaussian q 7 4 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^
    3 + 4 * q ^ 4 + 4 * q ^ 5 + 5 * q ^ 6 + 4 * q ^ 7 + 4 * q ^ 8 + 3 * q ^ 9 + 2 * q ^ 10 + 1 * q ^ 11 +
    1 * q ^ 12 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_8_4 (q : ℝ) : gaussian q 8 4 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^
    3 + 5 * q ^ 4 + 5 * q ^ 5 + 7 * q ^ 6 + 7 * q ^ 7 + 8 * q ^ 8 + 7 * q ^ 9 + 7 * q ^ 10 + 5 * q ^ 11 +
    5 * q ^ 12 + 3 * q ^ 13 + 2 * q ^ 14 + 1 * q ^ 15 + 1 * q ^ 16 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_5_0 (q : ℝ) : gaussian q 5 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_6_1 (q : ℝ) : gaussian q 6 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 + 1 * q ^ 5 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_7_2 (q : ℝ) : gaussian q 7 2 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 3 * q ^ 4 + 3 * q ^ 5 + 3 * q ^ 6 + 2 * q ^ 7 + 2 * q ^ 8 + 1 * q ^ 9 + 1 * q ^ 10 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_8_3 (q : ℝ) : gaussian q 8 3 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^
    3 + 4 * q ^ 4 + 5 * q ^ 5 + 6 * q ^ 6 + 6 * q ^ 7 + 6 * q ^ 8 + 6 * q ^ 9 + 5 * q ^ 10 + 4 * q ^ 11 +
    3 * q ^ 12 + 2 * q ^ 13 + 1 * q ^ 14 + 1 * q ^ 15 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_6_0 (q : ℝ) : gaussian q 6 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_7_1 (q : ℝ) : gaussian q 7 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 + 1 * q ^ 5 + 1 * q ^ 6 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_8_2 (q : ℝ) : gaussian q 8 2 = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^
    3 + 3 * q ^ 4 + 3 * q ^ 5 + 4 * q ^ 6 + 3 * q ^ 7 + 3 * q ^ 8 + 2 * q ^ 9 + 2 * q ^ 10 + 1 * q ^ 11 +
    1 * q ^ 12 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_7_0 (q : ℝ) : gaussian q 7 0 = 1 * q ^ 0 := by
  simp [gaussian]

@[local simp] theorem gaussian_8_1 (q : ℝ) : gaussian q 8 1 = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^
    3 + 1 * q ^ 4 + 1 * q ^ 5 + 1 * q ^ 6 + 1 * q ^ 7 := by
  rw [gaussian]
  first | simp; done | simp; ring

@[local simp] theorem gaussian_8_0 (q : ℝ) : gaussian q 8 0 = 1 * q ^ 0 := by
  simp [gaussian]

theorem flagPolynomial4 (q : ℝ) : coalescedFlag q [4] = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^ 3 +
    (67 / 12) * q ^ 4 + (35 / 6) * q ^ 5 + (25 / 3) * q ^ 6 + (28 / 3) * q ^ 7 + (271 / 24) * q ^ 8 + (65
    / 6) * q ^ 9 + (71 / 6) * q ^ 10 + (31 / 3) * q ^ 11 + (125 / 12) * q ^ 12 + (55 / 6) * q ^ 13 + (23 /
    3) * q ^ 14 + (17 / 3) * q ^ 15 + (101 / 24) * q ^ 16 + (13 / 6) * q ^ 17 + (7 / 6) * q ^ 18 + (2 / 3)
    * q ^ 19 + (1 / 2) * q ^ 20 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial3 (q : ℝ) : coalescedFlag q [3] = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 3 * q ^ 3 +
    (29 / 6) * q ^ 4 + (11 / 2) * q ^ 5 + (15 / 2) * q ^ 6 + (15 / 2) * q ^ 7 + (17 / 2) * q ^ 8 + 9 * q ^
    9 + 9 * q ^ 10 + 7 * q ^ 11 + (20 / 3) * q ^ 12 + (9 / 2) * q ^ 13 + (7 / 2) * q ^ 14 + (5 / 2) * q ^
    15 + 1 * q ^ 16 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial2 (q : ℝ) : coalescedFlag q [2] = 1 * q ^ 0 + 1 * q ^ 1 + 2 * q ^ 2 + 2 * q ^ 3 + (7
    / 2) * q ^ 4 + 4 * q ^ 5 + 5 * q ^ 6 + 4 * q ^ 7 + (9 / 2) * q ^ 8 + 3 * q ^ 9 + 3 * q ^ 10 + 2 * q ^
    11 + 1 * q ^ 12 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial1 (q : ℝ) : coalescedFlag q [1] = 1 * q ^ 0 + 1 * q ^ 1 + 1 * q ^ 2 + 1 * q ^ 3 + 2
    * q ^ 4 + 1 * q ^ 5 + 1 * q ^ 6 + 1 * q ^ 7 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_3 (q : ℝ) : productFlagPruned q 4 0 [3] = 1 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_3 (q : ℝ) : productFlagPruned q 4 1 [3] = 2 * q ^ 0 + 2 * q ^ 1 + 3
    * q ^ 2 + 2 * q ^ 3 + 1 * q ^ 4 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_1_3 (q : ℝ) : productFlagPruned q 3 1 [3] = 2 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_2_3 (q : ℝ) : productFlagPruned q 2 2 [3] = 3 * q ^ 0 + 1 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_3_3 (q : ℝ) : productFlagPruned q 1 3 [3] = 4 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_4_3 (q : ℝ) : productFlagPruned q 0 4 [3] = 4 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial43 (q : ℝ) : coalescedFlag q [4, 3] = 1 * q ^ 0 + 2 * q ^ 1 + 4 * q ^ 2 + 7 * q ^ 3
    + (71 / 6) * q ^ 4 + (52 / 3) * q ^ 5 + (143 / 6) * q ^ 6 + (91 / 3) * q ^ 7 + (223 / 6) * q ^ 8 +
    (124 / 3) * q ^ 9 + (136 / 3) * q ^ 10 + (281 / 6) * q ^ 11 + (271 / 6) * q ^ 12 + (265 / 6) * q ^ 13
    + (235 / 6) * q ^ 14 + (98 / 3) * q ^ 15 + (155 / 6) * q ^ 16 + (53 / 3) * q ^ 17 + (35 / 3) * q ^ 18
    + (37 / 6) * q ^ 19 + 3 * q ^ 20 + (1 / 2) * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_2 (q : ℝ) : productFlagPruned q 4 0 [2] = 1 * q ^ 0 + 1 * q ^ 1 + 2
    * q ^ 2 + 1 * q ^ 3 + 1 * q ^ 4 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_2 (q : ℝ) : productFlagPruned q 4 1 [2] = 2 * q ^ 0 + 2 * q ^ 1 + 3
    * q ^ 2 + 2 * q ^ 3 + 1 * q ^ 4 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_1_2 (q : ℝ) : productFlagPruned q 3 1 [2] = 2 * q ^ 0 + 2 * q ^ 1 + 2
    * q ^ 2 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_2_2 (q : ℝ) : productFlagPruned q 2 2 [2] = 4 * q ^ 0 + 2 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_3_2 (q : ℝ) : productFlagPruned q 1 3 [2] = 6 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_4_2 (q : ℝ) : productFlagPruned q 0 4 [2] = 6 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial42 (q : ℝ) : coalescedFlag q [4, 2] = 1 * q ^ 0 + 2 * q ^ 1 + 5 * q ^ 2 + 8 * q ^ 3
    + (29 / 2) * q ^ 4 + 22 * q ^ 5 + 32 * q ^ 6 + 40 * q ^ 7 + (211 / 4) * q ^ 8 + 58 * q ^ 9 + 67 * q ^
    10 + 70 * q ^ 11 + (141 / 2) * q ^ 12 + 68 * q ^ 13 + 64 * q ^ 14 + 53 * q ^ 15 + (177 / 4) * q ^ 16 +
    30 * q ^ 17 + 19 * q ^ 18 + 10 * q ^ 19 + 4 * q ^ 20 + 1 * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_1 (q : ℝ) : productFlagPruned q 4 0 [1] = 1 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_1 (q : ℝ) : productFlagPruned q 4 1 [1] = 2 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_1_1 (q : ℝ) : productFlagPruned q 3 1 [1] = 2 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_2_1 (q : ℝ) : productFlagPruned q 2 2 [1] = 3 * q ^ 0 + 1 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_3_1 (q : ℝ) : productFlagPruned q 1 3 [1] = 4 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_4_1 (q : ℝ) : productFlagPruned q 0 4 [1] = 4 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial41 (q : ℝ) : coalescedFlag q [4, 1] = 1 * q ^ 0 + 2 * q ^ 1 + 4 * q ^ 2 + 7 * q ^ 3
    + (71 / 6) * q ^ 4 + (52 / 3) * q ^ 5 + (143 / 6) * q ^ 6 + (91 / 3) * q ^ 7 + (223 / 6) * q ^ 8 +
    (124 / 3) * q ^ 9 + (136 / 3) * q ^ 10 + (281 / 6) * q ^ 11 + (271 / 6) * q ^ 12 + (265 / 6) * q ^ 13
    + (235 / 6) * q ^ 14 + (98 / 3) * q ^ 15 + (155 / 6) * q ^ 16 + (50 / 3) * q ^ 17 + (29 / 3) * q ^ 18
    + (31 / 6) * q ^ 19 + 2 * q ^ 20 + (1 / 2) * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_3_2 (q : ℝ) : productFlagPruned q 0 3 [2] = 3 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_2_2 (q : ℝ) : productFlagPruned q 1 2 [2] = 3 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_1_2 (q : ℝ) : productFlagPruned q 2 1 [2] = 2 * q ^ 0 + 1 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_0_2 (q : ℝ) : productFlagPruned q 3 0 [2] = 1 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial32 (q : ℝ) : coalescedFlag q [3, 2] = 1 * q ^ 0 + 2 * q ^ 1 + 4 * q ^ 2 + 6 * q ^ 3
    + (21 / 2) * q ^ 4 + (27 / 2) * q ^ 5 + (37 / 2) * q ^ 6 + (43 / 2) * q ^ 7 + (49 / 2) * q ^ 8 + 27 *
    q ^ 9 + 28 * q ^ 10 + 25 * q ^ 11 + 23 * q ^ 12 + (35 / 2) * q ^ 13 + (27 / 2) * q ^ 14 + (19 / 2) * q
    ^ 15 + 5 * q ^ 16 + 2 * q ^ 17 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_3_1 (q : ℝ) : productFlagPruned q 0 3 [1] = 3 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_2_1 (q : ℝ) : productFlagPruned q 1 2 [1] = 3 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_1_1 (q : ℝ) : productFlagPruned q 2 1 [1] = 2 * q ^ 0 + 1 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_0_1 (q : ℝ) : productFlagPruned q 3 0 [1] = 1 * q ^ 0 + 1 * q ^ 1 + 1
    * q ^ 2 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial31 (q : ℝ) : coalescedFlag q [3, 1] = 1 * q ^ 0 + 2 * q ^ 1 + 4 * q ^ 2 + 6 * q ^ 3
    + (21 / 2) * q ^ 4 + (27 / 2) * q ^ 5 + (37 / 2) * q ^ 6 + (43 / 2) * q ^ 7 + (49 / 2) * q ^ 8 + 27 *
    q ^ 9 + 28 * q ^ 10 + 25 * q ^ 11 + 23 * q ^ 12 + (35 / 2) * q ^ 13 + (27 / 2) * q ^ 14 + (19 / 2) * q
    ^ 15 + 5 * q ^ 16 + 2 * q ^ 17 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_2_1 (q : ℝ) : productFlagPruned q 0 2 [1] = 2 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_1_1 (q : ℝ) : productFlagPruned q 1 1 [1] = 2 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_0_1 (q : ℝ) : productFlagPruned q 2 0 [1] = 1 * q ^ 0 + 1 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial21 (q : ℝ) : coalescedFlag q [2, 1] = 1 * q ^ 0 + 2 * q ^ 1 + 3 * q ^ 2 + 4 * q ^ 3
    + 6 * q ^ 4 + 8 * q ^ 5 + 9 * q ^ 6 + 9 * q ^ 7 + 9 * q ^ 8 + 7 * q ^ 9 + 6 * q ^ 10 + 5 * q ^ 11 + 2
    * q ^ 12 + 1 * q ^ 13 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_32 (q : ℝ) : productFlagPruned q 4 0 [3, 2] = 1 * q ^ 0 + 2 * q ^ 1
    + 3 * q ^ 2 + 3 * q ^ 3 + 2 * q ^ 4 + 1 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_32 (q : ℝ) : productFlagPruned q 4 1 [3, 2] = 3 * q ^ 0 + 5 * q ^ 1
    + 8 * q ^ 2 + 7 * q ^ 3 + 5 * q ^ 4 + 2 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_1_32 (q : ℝ) : productFlagPruned q 3 1 [3, 2] = 3 * q ^ 0 + 4 * q ^ 1
    + 4 * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_2_32 (q : ℝ) : productFlagPruned q 2 2 [3, 2] = 7 * q ^ 0 + 5 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_3_32 (q : ℝ) : productFlagPruned q 1 3 [3, 2] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_4_32 (q : ℝ) : productFlagPruned q 0 4 [3, 2] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial432 (q : ℝ) : coalescedFlag q [4, 3, 2] = 1 * q ^ 0 + 3 * q ^ 1 + 7 * q ^ 2 + 13 * q
    ^ 3 + (45 / 2) * q ^ 4 + 38 * q ^ 5 + (109 / 2) * q ^ 6 + 73 * q ^ 7 + (191 / 2) * q ^ 8 + 111 * q ^ 9
    + 128 * q ^ 10 + (281 / 2) * q ^ 11 + (283 / 2) * q ^ 12 + (285 / 2) * q ^ 13 + (267 / 2) * q ^ 14 +
    116 * q ^ 15 + (195 / 2) * q ^ 16 + 71 * q ^ 17 + 48 * q ^ 18 + (55 / 2) * q ^ 19 + 13 * q ^ 20 + (9 /
    2) * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_31 (q : ℝ) : productFlagPruned q 4 0 [3, 1] = 1 * q ^ 0 + 2 * q ^ 1
    + 3 * q ^ 2 + 3 * q ^ 3 + 2 * q ^ 4 + 1 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_31 (q : ℝ) : productFlagPruned q 4 1 [3, 1] = 3 * q ^ 0 + 5 * q ^ 1
    + 8 * q ^ 2 + 7 * q ^ 3 + 5 * q ^ 4 + 2 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_3_1_31 (q : ℝ) : productFlagPruned q 3 1 [3, 1] = 3 * q ^ 0 + 4 * q ^ 1
    + 4 * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_2_2_31 (q : ℝ) : productFlagPruned q 2 2 [3, 1] = 7 * q ^ 0 + 5 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_1_3_31 (q : ℝ) : productFlagPruned q 1 3 [3, 1] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_0_4_31 (q : ℝ) : productFlagPruned q 0 4 [3, 1] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial431 (q : ℝ) : coalescedFlag q [4, 3, 1] = 1 * q ^ 0 + 3 * q ^ 1 + 7 * q ^ 2 + 13 * q
    ^ 3 + (45 / 2) * q ^ 4 + 38 * q ^ 5 + (109 / 2) * q ^ 6 + 73 * q ^ 7 + (191 / 2) * q ^ 8 + 111 * q ^ 9
    + 128 * q ^ 10 + (281 / 2) * q ^ 11 + (283 / 2) * q ^ 12 + (285 / 2) * q ^ 13 + (267 / 2) * q ^ 14 +
    116 * q ^ 15 + (195 / 2) * q ^ 16 + 71 * q ^ 17 + 48 * q ^ 18 + (55 / 2) * q ^ 19 + 13 * q ^ 20 + (9 /
    2) * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_0_21 (q : ℝ) : productFlagPruned q 4 0 [2, 1] = 1 * q ^ 0 + 2 * q ^ 1
    + 3 * q ^ 2 + 3 * q ^ 3 + 2 * q ^ 4 + 1 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] theorem productFlags_4_1_21 (q : ℝ) : productFlagPruned q 4 1 [2, 1] = 3 * q ^ 0 + 4 * q ^ 1
    + 5 * q ^ 2 + 5 * q ^ 3 + 2 * q ^ 4 + 1 * q ^ 5 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

end CaioloFerroniHoster
