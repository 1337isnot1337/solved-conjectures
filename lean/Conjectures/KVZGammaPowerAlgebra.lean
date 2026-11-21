module

public import Mathlib.Analysis.SpecialFunctions.Pow.Real
public import Mathlib.RingTheory.Polynomial.Pochhammer
public import Mathlib.LinearAlgebra.Vandermonde
public import Mathlib.LinearAlgebra.Matrix.Rank
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Data.Nat.Choose.Sum
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-!
# Algebra for the power kernel in the gamma-quotient theorem

The signature uses the actual falling factorials. The integer cutoff is
proved by an explicit rectangular factorization of the power matrix, so
the vanishing assertion holds at every order above the polynomial rank.
-/

@[expose] public section

namespace KVZGamma

open Matrix
open scoped BigOperators

noncomputable section

/-- The falling factorial of the exponent, including the empty product. -/
def falling (δ : ℝ) (n : ℕ) : ℝ := (descPochhammer ℝ n).eval δ

/-- The unnormalized signature; its sign is the signature in the source. -/
def powerSignature (δ : ℝ) (r : ℕ) : ℝ :=
  (-1 : ℝ) ^ (r.choose 2) * ∏ i : Fin r, falling δ i.val

/-- The literal power kernel on the positive quadrant. -/
def powerKernel (δ u v : ℝ) : ℝ := Real.rpow (u + v) δ

/-- Materialize the defining equation in the module that owns the signature. -/
theorem powerSignature_eq (δ : ℝ) (r : ℕ) :
    powerSignature δ r = (-1 : ℝ) ^ (r.choose 2) * ∏ i : Fin r, falling δ i.val := by
  simp only [powerSignature]

/-- Materialize the literal kernel formula before downstream composition proofs. -/
theorem powerKernel_eq (δ u v : ℝ) : powerKernel δ u v = Real.rpow (u + v) δ := by
  simp only [powerKernel]

@[simp] theorem falling_zero (δ : ℝ) : falling δ 0 = 1 := by
  simp [falling]

theorem falling_succ (δ : ℝ) (n : ℕ) :
    falling δ (n + 1) = falling δ n * (δ - n) := by
  exact descPochhammer_succ_eval n δ

theorem falling_eq_prod (δ : ℝ) (n : ℕ) :
    falling δ n = ∏ k ∈ Finset.range n, (δ - k) :=
  descPochhammer_eval_eq_prod_range n δ

theorem falling_ne_zero {δ : ℝ} (hδ : ∀ k : ℕ, δ ≠ k) (n : ℕ) :
    falling δ n ≠ 0 := by
  rw [falling_eq_prod]
  exact Finset.prod_ne_zero_iff.mpr fun k _ => sub_ne_zero.mpr (hδ k)

theorem falling_nat_pos {m n : ℕ} (hn : n ≤ m) : 0 < falling (m : ℝ) n := by
  rw [falling, descPochhammer_eval_eq_descFactorial]
  exact_mod_cast Nat.descFactorial_pos.mpr hn

theorem falling_nat_eq_zero {m n : ℕ} (hmn : m < n) : falling (m : ℝ) n = 0 :=
  descPochhammer_eval_coe_nat_of_lt hmn

theorem prod_neg_one_pow (r : ℕ) :
    (∏ i : Fin r, (-1 : ℝ) ^ i.val) = (-1 : ℝ) ^ (r.choose 2) := by
  induction r with
  | zero => simp
  | succ r ih =>
    rw [Fin.prod_univ_castSucc]
    simp only [Fin.val_castSucc, Fin.val_last, ih]
    rw [← pow_add, Nat.choose_succ_succ, Nat.choose_one_right, Nat.add_comm]

theorem neg_one_pow_mul_self (n : ℕ) :
    (-1 : ℝ) ^ n * (-1 : ℝ) ^ n = 1 := by
  rw [← mul_pow]
  norm_num

theorem powerSignature_ne_zero {δ : ℝ} {r : ℕ}
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) : powerSignature δ r ≠ 0 := by
  exact mul_ne_zero (pow_ne_zero _ (by norm_num))
    (Finset.prod_ne_zero_iff.mpr fun i _ => hfall i)

theorem powerSignature_nat_mul_sign_pos {m r : ℕ} (hr : r ≤ m + 1) :
    0 < powerSignature (m : ℝ) r * (-1 : ℝ) ^ (r.choose 2) := by
  have hprod : 0 < ∏ i : Fin r, falling (m : ℝ) i.val := by
    apply Finset.prod_pos
    intro i _
    exact falling_nat_pos (by omega)
  have heq : powerSignature (m : ℝ) r * (-1 : ℝ) ^ (r.choose 2) =
      ∏ i : Fin r, falling (m : ℝ) i.val := by
    dsimp [powerSignature]
    rw [mul_right_comm, neg_one_pow_mul_self, one_mul]
  simpa only [heq] using hprod

theorem powerSignature_nat_eq_zero {m r : ℕ} (hr : m + 1 < r) :
    powerSignature (m : ℝ) r = 0 := by
  have hp : (∏ i : Fin r, falling (m : ℝ) i.val) = 0 :=
    Finset.prod_eq_zero (Finset.mem_univ (⟨m + 1, hr⟩ : Fin r))
      (falling_nat_eq_zero (Nat.lt_succ_self m))
  rw [powerSignature_eq, hp, mul_zero]

theorem powerSignature_three (δ : ℝ) : powerSignature δ 3 = δ ^ 2 * (1 - δ) := by
  have hf1 : falling δ 1 = δ := by simpa using falling_succ δ 0
  have hf2 : falling δ 2 = δ * (δ - 1) := by simpa [hf1] using falling_succ δ 1
  rw [powerSignature_eq, Fin.prod_univ_three]
  norm_num [hf1, hf2]
  ring

theorem vandermonde_det_pos {r : ℕ} {v : Fin r → ℝ} (hv : StrictMono v) :
    0 < (Matrix.vandermonde v).det := by
  rw [Matrix.det_vandermonde]
  apply Finset.prod_pos
  intro i _
  apply Finset.prod_pos
  intro j hj
  exact sub_pos.mpr (hv (Finset.mem_Ioi.mp hj))

theorem vandermonde_neg_det {r : ℕ} (v : Fin r → ℝ) :
    (Matrix.vandermonde fun i => -v i).det =
      (-1 : ℝ) ^ (r.choose 2) * (Matrix.vandermonde v).det := by
  calc
    (Matrix.vandermonde fun i => -v i).det =
        (Matrix.of fun i j : Fin r => (-1 : ℝ) ^ j.val *
          Matrix.vandermonde v i j).det := by
      apply congrArg Matrix.det
      ext i j
      change (-v i) ^ j.val = (-1 : ℝ) ^ j.val * (v i) ^ j.val
      rw [neg_eq_neg_one_mul, mul_pow]
    _ = _ := by rw [Matrix.det_mul_row, prod_neg_one_pow]

/-- An integer power matrix factors through the `m + 1` monomials. -/
theorem power_nat_matrix_factorization {r : ℕ} (m : ℕ)
    (u v : Fin r → ℝ) :
    Matrix.of (fun i j : Fin r => (u i + v j) ^ m) =
      Matrix.of (fun (i : Fin r) (k : Fin (m + 1)) => u i ^ k.val) *
        Matrix.of (fun (k : Fin (m + 1)) (j : Fin r) =>
          (m.choose k.val : ℝ) * v j ^ (m - k.val)) := by
  ext i j
  rw [Matrix.mul_apply]
  simp only [Matrix.of_apply]
  rw [Fin.sum_univ_eq_sum_range
    (fun k : ℕ => u i ^ k * ((m.choose k : ℝ) * v j ^ (m - k))) (m + 1), add_pow]
  apply Finset.sum_congr rfl
  intro k _
  ring

/-- All integer-order minors above the polynomial rank vanish. -/
theorem powerKernel_nat_det_eq_zero {r m : ℕ} (hr : m + 1 < r)
    (u v : Fin r → ℝ) :
    (Matrix.of fun i j : Fin r => powerKernel (m : ℝ) (u i) (v j)).det = 0 := by
  let A : Matrix (Fin r) (Fin (m + 1)) ℝ := Matrix.of fun i k => u i ^ k.val
  let B : Matrix (Fin (m + 1)) (Fin r) ℝ :=
    Matrix.of fun k j => (m.choose k.val : ℝ) * v j ^ (m - k.val)
  have hmatrix : (Matrix.of fun i j : Fin r => powerKernel (m : ℝ) (u i) (v j)) = A * B := by
    simpa only [powerKernel, Real.rpow_eq_pow, Real.rpow_natCast, A, B] using
      power_nat_matrix_factorization m u v
  rw [hmatrix]
  by_contra hdet
  have hfull := Matrix.rank_of_det_ne_zero hdet
  have hrank := (Matrix.rank_mul_le_left A B).trans (Matrix.rank_le_width A)
  simp only [Fintype.card_fin] at hfull
  omega

end

end KVZGamma
