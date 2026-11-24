import Conjectures.CaioloFerroniHosterFlagPolynomialsBasic

/-! Flag polynomial evaluations with three or four selected ranks. -/

namespace CaioloFerroniHoster

open Finset
open scoped BigOperators

set_option linter.unnecessarySeqFocus false
set_option linter.unusedTactic false
set_option linter.unreachableTactic false

attribute [local simp]
  gaussian_4_0 gaussian_3_0 gaussian_2_0 gaussian_1_0 gaussian_0_0 gaussian_0_1
  gaussian_1_1 gaussian_2_1 gaussian_3_1 gaussian_4_1 gaussian_5_1 gaussian_1_2
  gaussian_2_2 gaussian_3_2 gaussian_4_2 gaussian_5_2 gaussian_6_2 gaussian_2_3
  gaussian_3_3 gaussian_4_3 gaussian_5_3 gaussian_6_3 gaussian_7_3 gaussian_3_4
  gaussian_4_4 gaussian_5_4 gaussian_6_4 gaussian_7_4 gaussian_8_4 gaussian_5_0
  gaussian_6_1 gaussian_7_2 gaussian_8_3 gaussian_6_0 gaussian_7_1 gaussian_8_2
  gaussian_7_0 gaussian_8_1 gaussian_8_0 productFlags_4_0_3 productFlags_4_1_3 productFlags_3_1_3
  productFlags_2_2_3 productFlags_1_3_3 productFlags_0_4_3 productFlags_4_0_2 productFlags_4_1_2 productFlags_3_1_2
  productFlags_2_2_2 productFlags_1_3_2 productFlags_0_4_2 productFlags_4_0_1 productFlags_4_1_1 productFlags_3_1_1
  productFlags_2_2_1 productFlags_1_3_1 productFlags_0_4_1 productFlags_0_3_2 productFlags_1_2_2 productFlags_2_1_2
  productFlags_3_0_2 productFlags_0_3_1 productFlags_1_2_1 productFlags_2_1_1 productFlags_3_0_1 productFlags_0_2_1
  productFlags_1_1_1 productFlags_2_0_1 productFlags_4_0_32 productFlags_4_1_32 productFlags_3_1_32
    productFlags_2_2_32
  productFlags_1_3_32 productFlags_0_4_32 productFlags_4_0_31 productFlags_4_1_31 productFlags_3_1_31
    productFlags_2_2_31
  productFlags_1_3_31 productFlags_0_4_31 productFlags_4_0_21 productFlags_4_1_21

@[local simp] private theorem productFlags_3_1_21 (q : ℝ) : productFlagPruned q 3 1 [2, 1] = 3 * q ^ 0 + 4
    * q ^ 1 + 4 * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_2_2_21 (q : ℝ) : productFlagPruned q 2 2 [2, 1] = 7 * q ^ 0 + 5
    * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_1_3_21 (q : ℝ) : productFlagPruned q 1 3 [2, 1] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_0_4_21 (q : ℝ) : productFlagPruned q 0 4 [2, 1] = 12 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial421 (q : ℝ) : coalescedFlag q [4, 2, 1] = 1 * q ^ 0 + 3 * q ^ 1 + 7 * q ^ 2 + 13 * q
    ^ 3 + (45 / 2) * q ^ 4 + 38 * q ^ 5 + (109 / 2) * q ^ 6 + 73 * q ^ 7 + (191 / 2) * q ^ 8 + 111 * q ^ 9
    + 128 * q ^ 10 + (281 / 2) * q ^ 11 + (283 / 2) * q ^ 12 + (285 / 2) * q ^ 13 + (267 / 2) * q ^ 14 +
    116 * q ^ 15 + (195 / 2) * q ^ 16 + 70 * q ^ 17 + 45 * q ^ 18 + (51 / 2) * q ^ 19 + 10 * q ^ 20 + (7 /
    2) * q ^ 21 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_0_3_21 (q : ℝ) : productFlagPruned q 0 3 [2, 1] = 6 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_1_2_21 (q : ℝ) : productFlagPruned q 1 2 [2, 1] = 6 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_2_1_21 (q : ℝ) : productFlagPruned q 2 1 [2, 1] = 3 * q ^ 0 + 3
    * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_3_0_21 (q : ℝ) : productFlagPruned q 3 0 [2, 1] = 1 * q ^ 0 + 2
    * q ^ 1 + 2 * q ^ 2 + 1 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial321 (q : ℝ) : coalescedFlag q [3, 2, 1] = 1 * q ^ 0 + 3 * q ^ 1 + 6 * q ^ 2 + 10 * q
    ^ 3 + 17 * q ^ 4 + 24 * q ^ 5 + 33 * q ^ 6 + 41 * q ^ 7 + 47 * q ^ 8 + 54 * q ^ 9 + 56 * q ^ 10 + 53 *
    q ^ 11 + 49 * q ^ 12 + 39 * q ^ 13 + 30 * q ^ 14 + 22 * q ^ 15 + 12 * q ^ 16 + 6 * q ^ 17 + 1 * q ^ 18
    := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_4_0_321 (q : ℝ) : productFlagPruned q 4 0 [3, 2, 1] = 1 * q ^ 0
    + 3 * q ^ 1 + 5 * q ^ 2 + 6 * q ^ 3 + 5 * q ^ 4 + 3 * q ^ 5 + 1 * q ^ 6 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_4_1_321 (q : ℝ) : productFlagPruned q 4 1 [3, 2, 1] = 4 * q ^ 0
    + 9 * q ^ 1 + 14 * q ^ 2 + 15 * q ^ 3 + 11 * q ^ 4 + 6 * q ^ 5 + 1 * q ^ 6 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_3_1_321 (q : ℝ) : productFlagPruned q 3 1 [3, 2, 1] = 4 * q ^ 0
    + 8 * q ^ 1 + 8 * q ^ 2 + 4 * q ^ 3 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_2_2_321 (q : ℝ) : productFlagPruned q 2 2 [3, 2, 1] = 12 * q ^
    0 + 12 * q ^ 1 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_1_3_321 (q : ℝ) : productFlagPruned q 1 3 [3, 2, 1] = 24 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

@[local simp] private theorem productFlags_0_4_321 (q : ℝ) : productFlagPruned q 0 4 [3, 2, 1] = 24 * q ^ 0 := by
  rw [productFlagPruned]
  norm_num [Finset.sum_range_succ, Nat.choose, productFlagPruned.eq_1] <;> ring

theorem flagPolynomial4321 (q : ℝ) : coalescedFlag q [4, 3, 2, 1] = 1 * q ^ 0 + 4 * q ^ 1 + 10 * q ^ 2 +
    20 * q ^ 3 + 35 * q ^ 4 + 63 * q ^ 5 + 93 * q ^ 6 + 129 * q ^ 7 + 173 * q ^ 8 + 207 * q ^ 9 + 245 * q
    ^ 10 + 276 * q ^ 11 + 285 * q ^ 12 + 293 * q ^ 13 + 280 * q ^ 14 + 249 * q ^ 15 + 215 * q ^ 16 + 161 *
    q ^ 17 + 112 * q ^ 18 + 67 * q ^ 19 + 32 * q ^ 20 + 13 * q ^ 21 + 1 * q ^ 22 := by
  rw [coalescedFlag]
  simp only [productFlag_prune]
  norm_num [Finset.sum_range_succ, auxChoose, Finset.prod_range_succ, productFlagPruned.eq_1] <;> ring

end CaioloFerroniHoster
