import Conjectures.HartkeMatchingExcessDigits

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The all-input Mersenne-division estimate in Section 2 of the existing proof.
The proof below uses the bit length of the nonzero remainder as a potential.
If an input bit and the corresponding quotient bit are both zero, that
potential increases by one; every other step costs at most `u`. This is the
same zero-run argument, without an auxiliary imperative division algorithm.

The final arithmetic implication remains explicitly conditional on the two
graph-construction lower bounds. It is not an axiom and is not, by itself,
a complete formalization of the named graph conjecture.
-/

namespace HartkeMatchingExcess

private theorem binaryLength_one : binaryLength 1 = 1 := by
  rw [binaryLength_rec (by omega : 0 < 1)]
  simp

private theorem binary_division_potential {u n : ℕ} (hu : 2 ≤ u) (hn : 0 < n)
    (hw : binaryWeight n < u) :
    binaryLength n + u ≤
      u * (binaryWeight n + binaryWeight (n / (2 ^ u - 1))) +
        binaryLength (n % (2 ^ u - 1)) := by
  have hb : 4 ≤ (2 : ℕ) ^ u :=
    le_trans (by norm_num : 4 ≤ 2 ^ 2) (Nat.pow_le_pow_right (by omega) hu)
  have hM : 0 < (2 : ℕ) ^ u - 1 := by omega
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases ha : n / 2 = 0
    · have hn1 : n = 1 := by omega
      subst n
      simp only [binaryLength_one, binaryWeight_one,
        Nat.div_eq_of_lt (by omega : 1 < 2 ^ u - 1), binaryWeight_zero,
        Nat.mod_eq_of_lt (by omega : 1 < 2 ^ u - 1)]
      omega
    · have haPos : 0 < n / 2 := by omega
      have hwRec := binaryWeight_rec n
      have hwa : binaryWeight (n / 2) < u := by omega
      have hi := ih (n / 2) (Nat.div_lt_self hn (by omega)) haPos hwa
      have hquot : n / (2 ^ u - 1) / 2 = n / 2 / (2 ^ u - 1) := by
        rw [Nat.div_div_eq_div_mul, Nat.div_div_eq_div_mul, Nat.mul_comm]
      have hwq := binaryWeight_rec (n / (2 ^ u - 1))
      rw [hquot] at hwq
      have hbit := Nat.mod_lt n (by omega : 0 < 2)
      have hqbit := Nat.mod_lt (n / (2 ^ u - 1)) (by omega : 0 < 2)
      have hrPos : 0 < n % (2 ^ u - 1) := sparse_mersenne_mod_pos (by omega) hn hw
      have hrOldPos : 0 < (n / 2) % (2 ^ u - 1) :=
        sparse_mersenne_mod_pos (by omega) haPos hwa
      have hrOldLt := Nat.mod_lt (n / 2) hM
      have hlOld : binaryLength ((n / 2) % (2 ^ u - 1)) ≤ u :=
        (binaryLength_le_iff _ _).mpr (by omega)
      have hlPos := binaryLength_pos hrPos
      have hnRec := Nat.mod_add_div n 2
      have haRec := Nat.mod_add_div (n / 2) (2 ^ u - 1)
      have hqRec := Nat.mod_add_div (n / (2 ^ u - 1)) 2
      rw [hquot] at hqRec
      have hrRec := Nat.mod_add_div n (2 ^ u - 1)
      have hrStep :
          n % (2 ^ u - 1) + (2 ^ u - 1) * ((n / (2 ^ u - 1)) % 2) =
            2 * ((n / 2) % (2 ^ u - 1)) + n % 2 := by
        nlinarith
      rw [binaryLength_rec hn]
      by_cases hbits : n % 2 + (n / (2 ^ u - 1)) % 2 = 0
      · have hb0 : n % 2 = 0 := by omega
        have hd0 : (n / (2 ^ u - 1)) % 2 = 0 := by omega
        have hrEq : n % (2 ^ u - 1) = 2 * ((n / 2) % (2 ^ u - 1)) := by
          simpa [hb0, hd0] using hrStep
        rw [hrEq, binaryLength_double hrOldPos]
        have hwEq : binaryWeight n + binaryWeight (n / (2 ^ u - 1)) =
            binaryWeight (n / 2) + binaryWeight (n / 2 / (2 ^ u - 1)) := by
          omega
        rw [hwEq]
        omega
      · have hmore : binaryWeight (n / 2) + binaryWeight (n / 2 / (2 ^ u - 1)) + 1 ≤
            binaryWeight n + binaryWeight (n / (2 ^ u - 1)) := by
          omega
        have hmul := Nat.mul_le_mul_left u hmore
        nlinarith

/-- The full long-division estimate, with no bound on the integer input. -/
theorem mersenne_division_weight_bound {u n : ℕ} (hu : 2 ≤ u) (hn : 0 < n)
    (hw : binaryWeight n < u) :
    binaryLength n ≤ u * (binaryWeight n + binaryWeight (n / (2 ^ u - 1))) := by
  have hi := binary_division_potential hu hn hw
  have hb : 4 ≤ (2 : ℕ) ^ u :=
    le_trans (by norm_num : 4 ≤ 2 ^ 2) (Nat.pow_le_pow_right (by omega) hu)
  have hr := Nat.mod_lt n (by omega : 0 < (2 : ℕ) ^ u - 1)
  have hl : binaryLength (n % (2 ^ u - 1)) ≤ u :=
    (binaryLength_le_iff _ _).mpr (by omega)
  omega

theorem sparse_division_weight_bound {n : ℕ} (hn : 0 < n) :
    binaryLength n ≤ (binaryWeight n + 1) *
      (binaryWeight n + binaryWeight (n / (2 ^ (binaryWeight n + 1) - 1))) := by
  have hp := binaryWeight_pos hn
  exact mersenne_division_weight_bound (by omega) hn (by omega)

/-- The arithmetic conclusion when both documented graph witnesses are available. -/
theorem binaryLength_le_excess_bound {n C : ℕ} (hn : 0 < n)
    (hbinary : binaryWeight n ≤ C)
    (hdeleted : binaryWeight (n / (2 ^ (binaryWeight n + 1) - 1)) ≤ C + 1) :
    binaryLength n ≤ (2 * C + 1) * (C + 1) := by
  have hi := sparse_division_weight_bound hn
  have hm : (binaryWeight n + 1) *
        (binaryWeight n + binaryWeight (n / (2 ^ (binaryWeight n + 1) - 1))) ≤
      (C + 1) * (2 * C + 1) :=
    Nat.mul_le_mul (by omega) (by omega)
  nlinarith

/-- A bound on both witness excesses forces a finite bound on the matching count. -/
theorem input_lt_of_excess_bounds {n C : ℕ} (hn : 0 < n)
    (hbinary : binaryWeight n ≤ C)
    (hdeleted : binaryWeight (n / (2 ^ (binaryWeight n + 1) - 1)) ≤ C + 1) :
    n < 2 ^ ((2 * C + 1) * (C + 1)) := by
  exact (binaryLength_le_iff n _).mp (binaryLength_le_excess_bound hn hbinary hdeleted)

end HartkeMatchingExcess
