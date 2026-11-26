import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! # The uniform error budget for the plane-curve reduction -/

namespace Conjectures.AsgarliGhiocaYip

private theorem factorial_le_pow_pred {d : ℕ} (hd : 1 ≤ d) : d.factorial ≤ d ^ (d - 1) := by
  induction d with
  | zero => omega
  | succ d ih =>
    by_cases hz : d = 0
    · subst d; decide
    have hd' : 1 ≤ d := by omega
    have he : d - 1 + 1 = d := by omega
    rw [Nat.factorial_succ, Nat.succ_sub_one, ← he, pow_succ]
    rw [he]
    exact (Nat.mul_le_mul_left _ ((ih hd').trans (Nat.pow_le_pow_left (Nat.le_succ d) _))).trans_eq
      (Nat.mul_comm ..)

theorem twice_factorial_pow_le {d k : ℕ} (hd : 2 ≤ d) (hk : 0 < k) :
    2 * d.factorial ^ k ≤ d ^ (d * k) := by
  have h : 2 * d.factorial ≤ d ^ d := calc
    _ ≤ d * d ^ (d - 1) := Nat.mul_le_mul hd (factorial_le_pow_pred (by omega))
    _ = _ := by rw [← pow_succ', Nat.sub_add_cancel (show 1 ≤ d by omega)]
  calc
    _ ≤ 2 ^ k * d.factorial ^ k := Nat.mul_le_mul_right _ (by
      simpa only [pow_one] using Nat.pow_le_pow_right (by decide : 0 < 2) hk)
    _ = (2 * d.factorial) ^ k := (mul_pow ..).symm
    _ ≤ (d ^ d) ^ k := Nat.pow_le_pow_left h _
    _ = _ := (pow_mul ..).symm

theorem four_le_ordering_degree_bound {d k : ℕ} (hd : 2 ≤ d) (hk : 0 < k) :
    4 ≤ d ^ (d * k) := by
  have hdk : d ≤ d * k := by simpa using Nat.mul_le_mul_left d hk
  exact (Nat.pow_le_pow_left hd 2).trans (Nat.pow_le_pow_right (by omega) (hd.trans hdk))

theorem plane_bound_threshold {q N D : ℕ} (hN : 0 < N) (hND : 2 * N ≤ D)
    (hD : 4 ≤ D) (hq : D^8 ≤ q) : 9 * (N + 1)^4 < q := by
  have hND' : N + 1 ≤ D := Nat.le_trans (Nat.add_le_add_left hN N) (by omega)
  have h : (9 : ℕ) < D^4 := (by decide : 9 < 4^4).trans_le (Nat.pow_le_pow_left hD _)
  have hp : 0 < D^4 := by positivity
  calc
    _ ≤ 9 * D^4 := Nat.mul_le_mul_left _ (Nat.pow_le_pow_left hND' _)
    _ < D^4 * D^4 := Nat.mul_lt_mul_of_pos_right h hp
    _ = D^8 := (pow_add D 4 4).symm
    _ ≤ q := hq

/-- A degree-`N` plane bound and the deletion of at most `(2*N^2+1)*N`
points leave at least half the field, uniformly in the size of the family. -/
theorem point_count_after_plane_exclusions {q N D B : ℕ} (hN : 0 < N) (hND : 2 * N ≤ D)
    (hD : 4 ≤ D) (hq : D^8 ≤ q)
    (hcount : (q : ℝ) - 2 * (N : ℝ)^3 * Real.sqrt q - (2 * (N : ℝ)^2 + 1) * N ≤ B) :
    q ≤ 2 * B := by
  have hD' : (4 : ℝ) ≤ D := by exact_mod_cast hD
  have hN' : (1 : ℝ) ≤ N := by exact_mod_cast hN
  have hND' : (2 : ℝ) * N ≤ D := by exact_mod_cast hND
  have hq' : (D : ℝ)^8 ≤ q := by exact_mod_cast hq
  have hS := Real.sq_sqrt (show (0 : ℝ) ≤ q by positivity)
  have hs : (D : ℝ)^4 ≤ Real.sqrt q := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [← pow_mul, hS]
    exact hq'
  have hN3 : 8 * (N : ℝ)^3 ≤ (D : ℝ)^3 := calc
    _ = (2 * (N : ℝ))^3 := by ring
    _ ≤ _ := by gcongr
  have hD3 : 2 * (D : ℝ)^3 ≤ (D : ℝ)^4 := by
    nlinarith [mul_le_mul_of_nonneg_right (show (2 : ℝ) ≤ D by linarith) (by positivity : 0 ≤ (D : ℝ)^3)]
  have hroot : 16 * (N : ℝ)^3 ≤ Real.sqrt q := by linarith
  have h₁ : 8 * (2 * (N : ℝ)^3 * Real.sqrt q) ≤ q := by
    nlinarith [mul_le_mul_of_nonneg_right hroot (Real.sqrt_nonneg (q : ℝ))]
  have hk : (1 : ℝ) ≤ (N : ℝ)^2 := by nlinarith [sq_nonneg ((N : ℝ) - 1)]
  have hD5 : (24 : ℝ) ≤ (D : ℝ)^5 := by
    have ht : (4 : ℝ)^5 ≤ (D : ℝ)^5 := by gcongr
    linarith
  have h₂ : 8 * ((2 * (N : ℝ)^2 + 1) * N) ≤ q := by
    nlinarith [mul_le_mul_of_nonneg_right hk (by positivity : 0 ≤ (N : ℝ)),
      mul_le_mul_of_nonneg_right hD5 (by positivity : 0 ≤ (D : ℝ)^3)]
  exact_mod_cast (show (q : ℝ) ≤ 2 * B by linarith)

end Conjectures.AsgarliGhiocaYip
