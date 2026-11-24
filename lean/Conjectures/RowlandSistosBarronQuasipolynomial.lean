import Mathlib.Algebra.Polynomial.Roots
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.LinearCombination
import Mathlib.Tactic.NormNum

/-!
# Rowland–Sistos Barrón conjecture

The nonquasipolynomial conclusion in Section 5 of the existing proof.
The source's undefined term “pseudo-polynomial” is interpreted explicitly
as polynomial on each residue class modulo one fixed positive integer.
The proof works over every field of characteristic zero.
-/

open Polynomial

namespace RowlandSistosBarron

/-- One fixed positive modulus and one polynomial per residue, beyond a threshold. -/
def EventuallyQuasipolynomial {K : Type*} [Semiring K] (f : ℕ → K) : Prop :=
  ∃ q : ℕ, 0 < q ∧ ∃ P : ℕ → Polynomial K, ∃ N : ℕ,
    ∀ n : ℕ, N ≤ n → f n = (P (n % q)).eval (n : K)

theorem not_isSquare_between_successive {a b : ℕ}
    (hlo : a ^ 2 < b) (hhi : b < (a + 1) ^ 2) : ¬ IsSquare b := by
  rintro ⟨m, hm⟩
  by_cases hma : m ≤ a
  · have hp := Nat.pow_le_pow_left hma 2
    nlinarith
  · have hp := Nat.pow_le_pow_left (by omega : a + 1 ≤ m) 2
    nlinarith

theorem large_progression_square {L N t : ℕ} (hL : 0 < L) :
    N + 50 ≤ (L * (t + N + 50)) ^ 2 := by
  have hprod := Nat.mul_le_mul_right (t + N + 50) (Nat.succ_le_of_lt hL)
  simp only [Nat.one_mul] at hprod
  have hbase : 1 ≤ L * (t + N + 50) := by omega
  have hsq : L * (t + N + 50) ≤ (L * (t + N + 50)) ^ 2 := by
    simpa only [pow_two, Nat.mul_one] using
      Nat.mul_le_mul_left (L * (t + N + 50)) hbase
  omega

theorem progression_square_add_not_square {L N t : ℕ} (hL : 0 < L) :
    ¬ IsSquare ((L * (t + N + 50)) ^ 2 + L) := by
  have hbase : L ≤ L * (t + N + 50) := by
    simpa only [Nat.mul_one] using
      Nat.mul_le_mul_left L (by omega : 1 ≤ t + N + 50)
  apply not_isSquare_between_successive (a := L * (t + N + 50))
  · omega
  · nlinarith

theorem progression_square_add_injective {L N : ℕ} (hL : 0 < L) :
    Function.Injective (fun t : ℕ => (L * (t + N + 50)) ^ 2 + L) := by
  intro t u h
  have hs := Nat.add_right_cancel h
  have hb := Nat.pow_left_injective (by decide : 2 ≠ 0) hs
  have ht := mul_left_cancel₀ (Nat.ne_of_gt hL) hb
  omega

/-- The proved rank formula cannot agree eventually with a fixed residue-polynomial family. -/
theorem not_eventuallyQuasipolynomial_of_square_formula
    {K : Type*} [Field K] [CharZero K] (f : ℕ → K)
    (hformula : ∀ M : ℕ, 49 ≤ M →
      2 * f M + 6 * (if M % 2 = 0 then 1 else 0) +
        12 * (if IsSquare M then 1 else 0) = 7 * (M : K) ^ 2 + 3 * M + 2) :
    ¬ EventuallyQuasipolynomial f := by
  classical
  rintro ⟨q, hq, P, N, hP⟩
  let Q : Polynomial K := 2 * P 0 + 6 - (7 * X ^ 2 + 3 * X + 2)
  have heval {n : ℕ} (hn : N ≤ n) (h49 : 49 ≤ n)
      (hnq : n % q = 0) (hn2 : n % 2 = 0) (hns : ¬ IsSquare n) :
      Q.eval (n : K) = 0 := by
    have h := hformula n h49
    rw [ite_eq_left hn2, ite_eq_right hns, mul_one, mul_zero, add_zero,
      hP n hn, hnq] at h
    simpa [Q] using sub_eq_zero.mpr h
  have hinj : Function.Injective
      (fun t : ℕ => (((2 * q * (t + N + 50)) ^ 2 + 2 * q : ℕ) : K)) := by
    intro t u h
    exact progression_square_add_injective (N := N) (by omega : 0 < 2 * q)
      (Nat.cast_injective h)
  have hzero : Q = 0 := by
    apply eq_of_infinite_eval_eq Q 0
    apply (Set.infinite_range_of_injective hinj).mono
    rintro x ⟨t, rfl⟩
    simp only [Set.mem_ofPred_eq, eval_zero]
    have hbig := large_progression_square (L := 2 * q) (N := N) (t := t) (by omega)
    apply heval (by omega) (by omega)
    · simp [Nat.add_mod, Nat.mul_mod, Nat.pow_mod]
    · simp [Nat.add_mod, Nat.mul_mod, Nat.pow_mod]
    · exact progression_square_add_not_square (by omega : 0 < 2 * q)
  let s : ℕ := (2 * q * (N + 50)) ^ 2
  have hlarge : N + 50 ≤ s := by
    simpa only [Nat.zero_add] using
      large_progression_square (L := 2 * q) (N := N) (t := 0) (by omega)
  have hsq : IsSquare s := ⟨2 * q * (N + 50), by simp [s, pow_two]⟩
  have hs2 : s % 2 = 0 := by simp [s, Nat.mul_mod, Nat.pow_mod]
  have hsqmod : s % q = 0 := by simp [s, Nat.mul_mod, Nat.pow_mod]
  have h := hformula s (by omega)
  rw [ite_eq_left hs2, ite_eq_left hsq, mul_one, mul_one, hP s (by omega), hsqmod] at h
  have hz : 2 * (P 0).eval (s : K) + 6 - (7 * (s : K) ^ 2 + 3 * s + 2) = 0 := by
    have hz := congrArg (fun p : Polynomial K => p.eval (s : K)) hzero
    simpa [Q] using hz
  have h12 : (12 : K) = 0 := by linear_combination h - hz
  exact (by norm_num : (12 : K) ≠ 0) h12

end RowlandSistosBarron
