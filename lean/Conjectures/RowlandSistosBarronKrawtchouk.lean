import Conjectures.RowlandSistosBarronCoefficientsExpansion
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.Positivity

/-!
# Rowland–Sistos Barrón conjecture

The Krawtchouk coefficient formulas and restoration of the next possible
coefficient in Sections 2 and 4 of the existing result's `PROOF.md`.
Every value is extracted from the actual generating polynomial defined
in `RowlandSistosBarronCoefficientsExpansion`.
-/

open Polynomial

namespace RowlandSistosBarron

noncomputable section

private theorem plus_derivative_pow (n : ℕ) :
    (1 + X : ℚ[X]) * derivative ((1 + X) ^ n) = C (n : ℚ) * (1 + X) ^ n := by
  cases n with
  | zero => simp
  | succ n =>
    rw [derivative_pow_succ]
    simp only [derivative_add, derivative_one, derivative_X, zero_add, mul_one]
    rw [pow_succ]
    simp only [Nat.cast_succ]
    ring

private theorem minus_derivative_pow (n : ℕ) :
    (1 - X : ℚ[X]) * derivative ((1 - X) ^ n) = -C (n : ℚ) * (1 - X) ^ n := by
  cases n with
  | zero => simp
  | succ n =>
    rw [derivative_pow_succ]
    simp only [derivative_sub, derivative_one, derivative_X, zero_sub]
    rw [pow_succ]
    simp only [Nat.cast_succ]
    ring

theorem krawtchouk_differential {M j : ℕ} (hj : j ≤ M) :
    (1 - X ^ 2) * derivative (krawtchoukPolynomial M j) =
      (C ((M : ℚ) - 2 * j) - C (M : ℚ) * X) * krawtchoukPolynomial M j := by
  have ha := plus_derivative_pow (M - j)
  have hb := minus_derivative_pow j
  unfold krawtchoukPolynomial
  rw [derivative_mul]
  calc
    _ = (1 - X) * ((1 + X) * derivative ((1 + X) ^ (M - j))) * (1 - X) ^ j +
        (1 + X) * (1 + X) ^ (M - j) * ((1 - X) * derivative ((1 - X) ^ j)) := by ring
    _ = (1 - X) * (C ((M - j : ℕ) : ℚ) * (1 + X) ^ (M - j)) * (1 - X) ^ j +
        (1 + X) * (1 + X) ^ (M - j) * (-C (j : ℚ) * (1 - X) ^ j) := by rw [ha, hb]
    _ = _ := by
      rw [Nat.cast_sub hj]
      simp only [map_sub, map_mul, map_ofNat]
      ring

@[simp] theorem krawtchouk_zero (M j : ℕ) : krawtchouk M j 0 = 1 := by
  simp [krawtchouk, krawtchoukPolynomial, coeff_zero_eq_eval_zero]

private theorem coeff_X_derivative (p : ℚ[X]) (n : ℕ) :
    (X * derivative p).coeff n = (n : ℚ) * p.coeff n := by
  cases n with
  | zero => simp
  | succ n => simp [coeff_derivative, mul_comm]

theorem krawtchouk_one {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 1 = (M : ℚ) - 2 * j := by
  have h := congrArg (fun p : ℚ[X] => p.coeff 0) (krawtchouk_differential hj)
  simp only [sub_mul, one_mul, mul_assoc, coeff_sub, coeff_C_mul,
    coeff_X_pow_mul', coeff_derivative] at h
  have h0 : (krawtchoukPolynomial M j).coeff 0 = 1 := krawtchouk_zero M j
  simpa [h0, krawtchouk] using h

theorem krawtchouk_recurrence {M j : ℕ} (hj : j ≤ M) (r : ℕ) :
    ((r : ℚ) + 2) * krawtchouk M j (r + 2) =
      ((M : ℚ) - 2 * j) * krawtchouk M j (r + 1) -
        ((M : ℚ) - r) * krawtchouk M j r := by
  have h := krawtchouk_differential hj
  have h' : derivative (krawtchoukPolynomial M j) =
      C ((M : ℚ) - 2 * j) * krawtchoukPolynomial M j +
        X * (X * derivative (krawtchoukPolynomial M j) -
          C (M : ℚ) * krawtchoukPolynomial M j) := by
    linear_combination h
  have hc := congrArg (fun p : ℚ[X] => p.coeff (r + 1)) h'
  simp only [coeff_derivative, coeff_add, coeff_C_mul, coeff_X_mul,
    coeff_sub, coeff_X_derivative, Nat.cast_add, Nat.cast_one] at hc
  dsimp [krawtchouk]
  linear_combination hc

theorem krawtchouk_two {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 2 = (((M : ℚ) - 2 * j) ^ 2 - M) / 2 := by
  have h := krawtchouk_recurrence hj 0
  norm_num only [Nat.cast_zero, zero_add, add_zero, sub_zero, krawtchouk_zero,
    mul_one] at h
  rw [krawtchouk_one hj] at h
  linarith

theorem krawtchouk_three {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 3 =
      (((M : ℚ) - 2 * j) ^ 3 - (3 * M - 2) * ((M : ℚ) - 2 * j)) / 6 := by
  have h := krawtchouk_recurrence hj 1
  norm_num only [Nat.cast_one] at h
  rw [krawtchouk_one hj, krawtchouk_two hj] at h
  nlinarith

theorem krawtchouk_four {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 4 =
      (((M : ℚ) - 2 * j) ^ 4 - 6 * M * ((M : ℚ) - 2 * j) ^ 2 +
        8 * ((M : ℚ) - 2 * j) ^ 2 + 3 * (M : ℚ) ^ 2 - 6 * M) / 24 := by
  have h := krawtchouk_recurrence hj 2
  norm_num only [Nat.cast_ofNat] at h
  rw [krawtchouk_two hj, krawtchouk_three hj] at h
  nlinarith

theorem krawtchouk_five {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 5 =
      ((M : ℚ) - 2 * j) *
        (((M : ℚ) - 2 * j) ^ 4 - 10 * M * ((M : ℚ) - 2 * j) ^ 2 +
          20 * ((M : ℚ) - 2 * j) ^ 2 + 15 * (M : ℚ) ^ 2 - 50 * M + 24) / 120 := by
  have h := krawtchouk_recurrence hj 3
  norm_num only [Nat.cast_ofNat] at h
  rw [krawtchouk_three hj, krawtchouk_four hj] at h
  nlinarith

theorem krawtchouk_one_eq_zero_iff {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 1 = 0 ↔ 2 * j = M := by
  rw [krawtchouk_one hj]
  constructor
  · intro h
    have h' : (2 : ℚ) * j = M := by linarith
    exact_mod_cast h'
  · intro h
    have h' : (2 : ℚ) * j = M := by exact_mod_cast h
    linarith

theorem krawtchouk_two_eq_zero_iff {M j : ℕ} (hj : j ≤ M) :
    krawtchouk M j 2 = 0 ↔ ((M : ℚ) - 2 * j) ^ 2 = M := by
  rw [krawtchouk_two hj]
  constructor <;> intro h <;> linarith

theorem krawtchouk_four_at_two {M j : ℕ} (hj : j ≤ M)
    (hD : (M : ℚ) - 2 * j = 2) :
    krawtchouk M j 4 = ((M : ℚ) - 2) * ((M : ℚ) - 8) / 8 := by
  rw [krawtchouk_four hj, hD]
  ring

theorem krawtchouk_four_at_two_pos {M j : ℕ} (hM : 49 ≤ M) (hj : j ≤ M)
    (hD : (M : ℚ) - 2 * j = 2) : 0 < krawtchouk M j 4 := by
  rw [krawtchouk_four_at_two hj hD]
  have hMq : (49 : ℚ) ≤ M := by exact_mod_cast hM
  have h2 : (0 : ℚ) < M - 2 := by linarith
  have h8 : (0 : ℚ) < M - 8 := by linarith
  positivity

theorem krawtchouk_five_at_plus {m j : ℕ} (hj : j ≤ m ^ 2)
    (hD : (m ^ 2 : ℕ) - 2 * (j : ℚ) = 2 + m) :
    krawtchouk (m ^ 2) j 5 =
      ((m : ℚ) - 6) * (m - 2) * (m + 1) * (m + 2) * (3 * m + 5) / 60 := by
  rw [krawtchouk_five hj, hD]
  push_cast
  ring

theorem krawtchouk_five_at_minus {m j : ℕ} (hj : j ≤ m ^ 2)
    (hD : (m ^ 2 : ℕ) - 2 * (j : ℚ) = 2 - m) :
    krawtchouk (m ^ 2) j 5 =
      -(((m : ℚ) - 2) * (m - 1) * (m + 2) * (m + 6) * (3 * m - 5)) / 60 := by
  rw [krawtchouk_five hj, hD]
  push_cast
  ring

theorem krawtchouk_five_at_plus_pos {m j : ℕ} (hm : 7 ≤ m) (hj : j ≤ m ^ 2)
    (hD : (m ^ 2 : ℕ) - 2 * (j : ℚ) = 2 + m) :
    0 < krawtchouk (m ^ 2) j 5 := by
  rw [krawtchouk_five_at_plus hj hD]
  have hmq : (7 : ℚ) ≤ m := by exact_mod_cast hm
  have h6 : (0 : ℚ) < m - 6 := by linarith
  have h2 : (0 : ℚ) < m - 2 := by linarith
  positivity

theorem krawtchouk_five_at_minus_neg {m j : ℕ} (hm : 7 ≤ m) (hj : j ≤ m ^ 2)
    (hD : (m ^ 2 : ℕ) - 2 * (j : ℚ) = 2 - m) :
    krawtchouk (m ^ 2) j 5 < 0 := by
  rw [krawtchouk_five_at_minus hj hD]
  have hmq : (7 : ℚ) ≤ m := by exact_mod_cast hm
  have h2 : (0 : ℚ) < m - 2 := by linarith
  have h1 : (0 : ℚ) < m - 1 := by linarith
  have h5 : (0 : ℚ) < 3 * m - 5 := by linarith
  have hpos : (0 : ℚ) < (m - 2) * (m - 1) * (m + 2) * (m + 6) * (3 * m - 5) / 60 := by
    positivity
  linarith

theorem krawtchouk_five_at_shifted_square {M j : ℕ} (hj : j ≤ M) (d : ℚ)
    (hsq : d ^ 2 = M) (hD : (M : ℚ) - 2 * j = d + 2) :
    krawtchouk M j 5 =
      (d - 6) * (d - 2) * (d + 1) * (d + 2) * (3 * d + 5) / 60 := by
  rw [krawtchouk_five hj, hD, ← hsq]
  ring

theorem krawtchouk_five_at_shifted_square_ne_zero {M j : ℕ}
    (hM : 49 ≤ M) (hj : j ≤ M) (d : ℚ)
    (hsq : d ^ 2 = M) (hD : (M : ℚ) - 2 * j = d + 2) :
    krawtchouk M j 5 ≠ 0 := by
  rw [krawtchouk_five_at_shifted_square hj d hsq hD]
  have h49 : (49 : ℚ) ≤ d ^ 2 := by rw [hsq]; exact_mod_cast hM
  have h6 : d - 6 ≠ 0 := by
    intro h
    have hd : d = 6 := by linarith
    rw [hd] at h49
    norm_num at h49
  have h2 : d - 2 ≠ 0 := by
    intro h
    have hd : d = 2 := by linarith
    rw [hd] at h49
    norm_num at h49
  have hp1 : d + 1 ≠ 0 := by
    intro h
    have hd : d = -1 := by linarith
    rw [hd] at h49
    norm_num at h49
  have hp2 : d + 2 ≠ 0 := by
    intro h
    have hd : d = -2 := by linarith
    rw [hd] at h49
    norm_num at h49
  have h5 : 3 * d + 5 ≠ 0 := by
    intro h
    have hd : d = -(5 / 3) := by linarith
    rw [hd] at h49
    norm_num at h49
  exact div_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero (mul_ne_zero h6 h2) hp1) hp2) h5)
    (by norm_num)

/-- A cancelled residue-one coefficient is restored at the next permitted degree. -/
theorem krawtchouk_restore_one {M j : ℕ} (hM : 49 ≤ M) (hj : j ≤ M)
    (hzero : krawtchouk M j 1 = 0) : krawtchouk M (j - 1) 4 ≠ 0 := by
  have hmid : 2 * j = M := (krawtchouk_one_eq_zero_iff hj).mp hzero
  have hj1 : 1 ≤ j := by omega
  have hmidq : (2 : ℚ) * j = M := by exact_mod_cast hmid
  have hD : (M : ℚ) - 2 * ((j - 1 : ℕ) : ℚ) = 2 := by
    rw [Nat.cast_sub hj1]
    push_cast
    linarith
  exact ne_of_gt (krawtchouk_four_at_two_pos hM (by omega) hD)

/-- A cancelled residue-two coefficient is restored, for either sign of the square root. -/
theorem krawtchouk_restore_two {M j : ℕ} (hM : 49 ≤ M) (hj : j ≤ M)
    (hzero : krawtchouk M j 2 = 0) : krawtchouk M (j - 1) 5 ≠ 0 := by
  have hsq := (krawtchouk_two_eq_zero_iff hj).mp hzero
  have hMq : (49 : ℚ) ≤ M := by exact_mod_cast hM
  have hj1 : 1 ≤ j := by
    by_contra h
    have hj0 : j = 0 := by omega
    rw [hj0] at hsq
    norm_num at hsq
    nlinarith
  have hD : (M : ℚ) - 2 * ((j - 1 : ℕ) : ℚ) = ((M : ℚ) - 2 * j) + 2 := by
    rw [Nat.cast_sub hj1]
    push_cast
    ring
  exact krawtchouk_five_at_shifted_square_ne_zero hM (by omega) _ hsq hD

end

end RowlandSistosBarron
