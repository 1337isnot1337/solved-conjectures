module

public import Conjectures.GrochenigBlocksAlgebra
public import Conjectures.GrochenigGaussianBasic
public import Mathlib.Algebra.Polynomial.Eval.Degree
public import Mathlib.Data.Finset.Lattice.Fold
public import Mathlib.Order.Filter.AtTopBot.Group
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Positivity

/-!
# The exact finite Gaussian blocks

These are the polynomials, coefficients, normalization, and test points in
Section 1 of the source proof. Every block size is allowed, including zero;
the infinite construction uses the positive sizes `n + 1`.
-/

@[expose] public section

namespace Grochenig

open Polynomial Filter
open scoped BigOperators Topology

noncomputable section

def blockPolynomial (N : ℕ) : ℝ[X] :=
  ∏ j ∈ Finset.range N, (X - C (Real.exp (4 * Real.pi * ((j : ℝ) + 1))))

theorem blockPolynomial_eq (N : ℕ) : blockPolynomial N =
    ∏ j ∈ Finset.range N, (X - C (Real.exp (4 * Real.pi * ((j : ℝ) + 1)))) := by
  simp only [blockPolynomial]

def rawBlockCoeff (N k : ℕ) : ℝ :=
  (blockPolynomial N).coeff k * Real.exp (4 * Real.pi * (k : ℝ) ^ 2)

theorem rawBlockCoeff_eq (N k : ℕ) : rawBlockCoeff N k =
    (blockPolynomial N).coeff k * Real.exp (4 * Real.pi * (k : ℝ) ^ 2) := by
  simp only [rawBlockCoeff]

def blockMass (N : ℕ) : ℝ := ∑ k : Fin (N + 1), |rawBlockCoeff N k.val|

theorem blockMass_eq (N : ℕ) : blockMass N = ∑ k : Fin (N + 1), |rawBlockCoeff N k.val| := by
  simp only [blockMass]

def blockCoeff (N k : ℕ) : ℝ := ((1 / 2 : ℝ) ^ N / blockMass N) * rawBlockCoeff N k

theorem blockCoeff_eq (N k : ℕ) :
    blockCoeff N k = ((1 / 2 : ℝ) ^ N / blockMass N) * rawBlockCoeff N k := by
  simp only [blockCoeff]

def block (N : ℕ) (x : ℝ) : ℝ :=
  ∑ k : Fin (N + 1), blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))

theorem block_eq (N : ℕ) (x : ℝ) : block N x =
    ∑ k : Fin (N + 1), blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ)) := by
  simp only [block]

def testPoint (j : ℕ) : ℝ := (j : ℝ) + 1 / 2

theorem testPoint_eq (j : ℕ) : testPoint j = (j : ℝ) + 1 / 2 := by
  simp only [testPoint]

def blockMargin (N : ℕ) : ℝ :=
  Finset.univ.inf' Finset.univ_nonempty
    (fun j : Fin (N + 1) => |block N (testPoint j.val)|)

theorem blockMargin_eq (N : ℕ) : blockMargin N =
    Finset.univ.inf' Finset.univ_nonempty
      (fun j : Fin (N + 1) => |block N (testPoint j.val)|) := by
  simp only [blockMargin]

@[simp] theorem blockPolynomial_natDegree (N : ℕ) : (blockPolynomial N).natDegree = N := by
  rw [blockPolynomial_eq, Polynomial.natDegree_finsetProd_X_sub_C_eq_card]
  simp

theorem blockPolynomial_coeff_signed_pos (N k : ℕ) (hk : k ≤ N) :
    0 < (-1 : ℝ) ^ (N - k) * (blockPolynomial N).coeff k := by
  simpa only [blockPolynomial_eq, Finset.card_range] using
    coeff_prod_X_sub_C_signed_pos (Finset.range N)
      (fun j => Real.exp (4 * Real.pi * ((j : ℝ) + 1)))
      (fun _ _ => Real.exp_pos _) k (by simpa using hk)

theorem rawBlockCoeff_signed_pos (N k : ℕ) (hk : k ≤ N) :
    0 < (-1 : ℝ) ^ (N - k) * rawBlockCoeff N k := by
  rw [rawBlockCoeff_eq, ← mul_assoc]
  exact mul_pos (blockPolynomial_coeff_signed_pos N k hk) (Real.exp_pos _)

theorem rawBlockCoeff_ne_zero (N k : ℕ) (hk : k ≤ N) : rawBlockCoeff N k ≠ 0 :=
  right_ne_zero_of_mul (rawBlockCoeff_signed_pos N k hk).ne'

theorem blockMass_pos (N : ℕ) : 0 < blockMass N := by
  rw [blockMass_eq]
  exact Finset.sum_pos
    (fun k _ => abs_pos.mpr (rawBlockCoeff_ne_zero N k.val (by omega)))
    Finset.univ_nonempty

theorem block_scale_pos (N : ℕ) : 0 < (1 / 2 : ℝ) ^ N / blockMass N :=
  div_pos (pow_pos (by norm_num) N) (blockMass_pos N)

theorem blockCoeff_signed_pos (N k : ℕ) (hk : k ≤ N) :
    0 < (-1 : ℝ) ^ (N - k) * blockCoeff N k := by
  rw [blockCoeff_eq]
  convert mul_pos (block_scale_pos N) (rawBlockCoeff_signed_pos N k hk) using 1
  ring

theorem blockCoeff_ne_zero (N k : ℕ) (hk : k ≤ N) : blockCoeff N k ≠ 0 :=
  right_ne_zero_of_mul (blockCoeff_signed_pos N k hk).ne'

theorem blockCoeff_mul_succ_neg (N k : ℕ) (hk : k < N) :
    blockCoeff N k * blockCoeff N (k + 1) < 0 :=
  adjacent_mul_neg_of_signed_pos hk (blockCoeff_signed_pos N k hk.le)
    (blockCoeff_signed_pos N (k + 1) (Nat.succ_le_of_lt hk))

theorem blockCoeff_eq_zero_of_lt (N k : ℕ) (hk : N < k) : blockCoeff N k = 0 := by
  have hcoeff : (blockPolynomial N).coeff k = 0 :=
    Polynomial.coeff_eq_zero_of_natDegree_lt (by simpa using hk)
  simp only [blockCoeff_eq, rawBlockCoeff_eq, hcoeff, zero_mul, mul_zero]

theorem sum_abs_blockCoeff (N : ℕ) :
    (∑ k : Fin (N + 1), |blockCoeff N k.val|) = (1 / 2 : ℝ) ^ N := by
  simp only [blockCoeff_eq, abs_mul, abs_of_pos (block_scale_pos N)]
  rw [← Finset.mul_sum, ← blockMass_eq]
  exact div_mul_cancel₀ _ (blockMass_pos N).ne'

theorem weighted_gaussian_translate (k : ℕ) (x : ℝ) :
    Real.exp (4 * Real.pi * (k : ℝ) ^ 2) * gaussian (x - 2 * (k : ℝ)) =
      gaussian x * Real.exp (4 * Real.pi * x) ^ k := by
  rw [gaussian_eq, gaussian_eq, ← Real.exp_nat_mul, ← Real.exp_add, ← Real.exp_add]
  congr 1
  ring

/-- The exact factorization that places the block's zeros and fixes its test signs. -/
theorem block_factorization (N : ℕ) (x : ℝ) :
    block N x = ((1 / 2 : ℝ) ^ N / blockMass N) * gaussian x *
      (blockPolynomial N).eval (Real.exp (4 * Real.pi * x)) := by
  rw [block_eq]
  calc
    _ = ∑ k : Fin (N + 1),
        (((1 / 2 : ℝ) ^ N / blockMass N) * gaussian x) *
          ((blockPolynomial N).coeff k.val * Real.exp (4 * Real.pi * x) ^ k.val) := by
      apply Finset.sum_congr rfl
      intro k _
      rw [blockCoeff_eq, rawBlockCoeff_eq]
      calc
        _ = ((1 / 2 : ℝ) ^ N / blockMass N) * (blockPolynomial N).coeff k.val *
            (Real.exp (4 * Real.pi * (k.val : ℝ) ^ 2) *
              gaussian (x - 2 * (k.val : ℝ))) := by ring
        _ = _ := by rw [weighted_gaussian_translate]; ring
    _ = (((1 / 2 : ℝ) ^ N / blockMass N) * gaussian x) *
        ∑ k : Fin (N + 1),
          (blockPolynomial N).coeff k.val * Real.exp (4 * Real.pi * x) ^ k.val := by
      rw [Finset.mul_sum]
    _ = _ := by
      congr 1
      rw [Fin.sum_univ_eq_sum_range
        (fun k : ℕ => (blockPolynomial N).coeff k * Real.exp (4 * Real.pi * x) ^ k) (N + 1),
        Polynomial.eval_eq_sum_range, blockPolynomial_natDegree]

theorem blockPolynomial_test_signed_pos (N j : ℕ) (hj : j ≤ N) :
    0 < (-1 : ℝ) ^ (N - j) *
      (blockPolynomial N).eval (Real.exp (4 * Real.pi * testPoint j)) := by
  rw [blockPolynomial_eq, Polynomial.eval_prod]
  simp only [Polynomial.eval_sub, Polynomial.eval_X, Polynomial.eval_C]
  apply signed_product_range_pos N j hj
  · intro i hi
    apply sub_pos.mpr
    apply Real.exp_lt_exp.mpr
    apply mul_lt_mul_of_pos_left _ (by positivity : 0 < 4 * Real.pi)
    have hij : (i : ℝ) + 1 ≤ (j : ℝ) := by exact_mod_cast Nat.succ_le_of_lt hi
    rw [testPoint_eq]
    linarith
  · intro i _
    apply sub_neg.mpr
    apply Real.exp_lt_exp.mpr
    apply mul_lt_mul_of_pos_left _ (by positivity : 0 < 4 * Real.pi)
    rw [testPoint_eq, Nat.cast_add]
    have hi : (0 : ℝ) ≤ i := Nat.cast_nonneg _
    linarith

theorem block_test_signed_pos (N j : ℕ) (hj : j ≤ N) :
    0 < (-1 : ℝ) ^ (N - j) * block N (testPoint j) := by
  rw [block_factorization]
  convert mul_pos (mul_pos (block_scale_pos N) (gaussian_pos (testPoint j)))
    (blockPolynomial_test_signed_pos N j hj) using 1
  ring

theorem block_test_ne_zero (N j : ℕ) (hj : j ≤ N) : block N (testPoint j) ≠ 0 :=
  right_ne_zero_of_mul (block_test_signed_pos N j hj).ne'

theorem block_test_mul_succ_neg (N j : ℕ) (hj : j < N) :
    block N (testPoint j) * block N (testPoint (j + 1)) < 0 :=
  adjacent_mul_neg_of_signed_pos hj (block_test_signed_pos N j hj.le)
    (block_test_signed_pos N (j + 1) (Nat.succ_le_of_lt hj))

theorem blockMargin_pos (N : ℕ) : 0 < blockMargin N := by
  rw [blockMargin_eq]
  apply (Finset.lt_inf'_iff _).mpr
  intro j _
  exact abs_pos.mpr (block_test_ne_zero N j.val (by omega))

theorem blockMargin_le_test (N j : ℕ) (hj : j ≤ N) :
    blockMargin N ≤ |block N (testPoint j)| := by
  rw [blockMargin_eq]
  exact Finset.inf'_le _ (Finset.mem_univ (⟨j, by omega⟩ : Fin (N + 1)))

theorem block_bound (N : ℕ) (x : ℝ) : |block N x| ≤ (1 / 2 : ℝ) ^ N := by
  rw [block_eq]
  calc
    _ ≤ ∑ k : Fin (N + 1), |blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))| :=
      Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ k : Fin (N + 1), |blockCoeff N k.val| := by
      apply Finset.sum_le_sum
      intro k _
      rw [abs_mul, abs_gaussian]
      exact mul_le_of_le_one_right (abs_nonneg _) (gaussian_le_one _)
    _ = _ := sum_abs_blockCoeff N

theorem block_continuous (N : ℕ) : Continuous (block N) := by
  change Continuous (fun x =>
    ∑ k : Fin (N + 1), blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ)))
  exact continuous_finsetSum _ fun k _ =>
    continuous_const.mul (gaussian_continuous.comp (continuous_id.sub continuous_const))

theorem block_tendsto_atTop (N : ℕ) : Tendsto (block N) atTop (𝓝 0) := by
  have hk (k : Fin (N + 1)) : Tendsto
      (fun x : ℝ => blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))) atTop (𝓝 0) := by
    have hshift : Tendsto (fun x : ℝ => x - 2 * (k.val : ℝ)) atTop atTop := by
      simpa only [sub_eq_add_neg, id_eq] using
        tendsto_atTop_add_const_right atTop (-(2 * (k.val : ℝ))) tendsto_id
    simpa only [mul_zero, Function.comp_apply] using
      (gaussian_tendsto_atTop.comp hshift).const_mul (blockCoeff N k.val)
  change Tendsto (fun x : ℝ =>
    ∑ k : Fin (N + 1), blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))) atTop (𝓝 0)
  simpa only [Finset.sum_const_zero] using
    tendsto_finsetSum (Finset.univ : Finset (Fin (N + 1))) (fun k _ => hk k)

theorem block_tendsto_atBot (N : ℕ) : Tendsto (block N) atBot (𝓝 0) := by
  have hk (k : Fin (N + 1)) : Tendsto
      (fun x : ℝ => blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))) atBot (𝓝 0) := by
    have hshift : Tendsto (fun x : ℝ => x - 2 * (k.val : ℝ)) atBot atBot := by
      simpa only [sub_eq_add_neg, id_eq] using
        tendsto_atBot_add_const_right atBot (-(2 * (k.val : ℝ))) tendsto_id
    simpa only [mul_zero, Function.comp_apply] using
      (gaussian_tendsto_atBot.comp hshift).const_mul (blockCoeff N k.val)
  change Tendsto (fun x : ℝ =>
    ∑ k : Fin (N + 1), blockCoeff N k.val * gaussian (x - 2 * (k.val : ℝ))) atBot (𝓝 0)
  simpa only [Finset.sum_const_zero] using
    tendsto_finsetSum (Finset.univ : Finset (Fin (N + 1))) (fun k _ => hk k)

end

end Grochenig
