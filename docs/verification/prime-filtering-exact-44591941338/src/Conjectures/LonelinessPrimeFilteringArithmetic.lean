import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic.Ring

/-! Exact digit arithmetic for prime filtering. The quotient identities use
natural division before reduction modulo `p`. Primality is unnecessary for
these identities; nontriviality is stated explicitly where it is needed. -/

namespace Loneliness.PrimeFilteringArithmetic

/-- The base-`p` digit at position `m`, obtained from natural division. -/
def digit (p m x : ℕ) : ZMod p := ((x / p ^ m : ℕ) : ZMod p)

/-- Multiplication by an integer commutes with the quotient at a divisible level. -/
theorem digit_mul_of_dvd {p j k x : ℕ} (hx : p ^ j ∣ x) :
    digit p j (k * x) = (k : ZMod p) * digit p j x := by
  unfold digit
  rw [Nat.mul_div_assoc k hx, Nat.cast_mul]

/-- The natural quotient update, before taking any residue. -/
theorem quotient_step {p m j k x : ℕ} (hp : 0 < p) (hj : j ≤ m)
    (hx : p ^ j ∣ x) :
    ((1 + k * p ^ (m - j)) * x) / p ^ m =
      x / p ^ m + k * (x / p ^ j) := by
  have hpower : p ^ m = p ^ j * p ^ (m - j) := by
    rw [← pow_add, Nat.add_sub_of_le hj]
  have hmultiple : (k * x / p ^ j) * p ^ m = k * p ^ (m - j) * x := by
    calc
      (k * x / p ^ j) * p ^ m =
          (k * (x / p ^ j)) * (p ^ j * p ^ (m - j)) := by
        rw [Nat.mul_div_assoc k hx, hpower]
      _ = k * p ^ (m - j) * ((x / p ^ j) * p ^ j) := by ring
      _ = k * p ^ (m - j) * x := by rw [Nat.div_mul_cancel hx]
  have hexpand : (1 + k * p ^ (m - j)) * x =
      x + (k * x / p ^ j) * p ^ m := by
    rw [hmultiple]
    ring
  rw [hexpand, Nat.add_mul_div_right _ _ (pow_pos hp m), Nat.mul_div_assoc k hx]

/-- The affine update of the top digit at a divisible lower level. -/
theorem digit_step {p m j k x : ℕ} (hp : 0 < p) (hj : j ≤ m)
    (hx : p ^ j ∣ x) :
    digit p m ((1 + k * p ^ (m - j)) * x) =
      digit p m x + (k : ZMod p) * digit p j x := by
  unfold digit
  rw [quotient_step hp hj hx, Nat.cast_add, Nat.cast_mul]

/-- A divisible input has zero leading digit exactly when one more power divides. -/
theorem digit_eq_zero_iff {p j x : ℕ} (hx : p ^ j ∣ x) :
    digit p j x = 0 ↔ p ^ (j + 1) ∣ x := by
  rw [digit, ZMod.natCast_eq_zero_iff, Nat.dvd_div_iff_mul_dvd hx, pow_succ]

theorem leading_digit_ne_zero {p j d : ℕ} (hd : p ^ j ∣ d)
    (hnext : ¬ p ^ (j + 1) ∣ d) :
    ((d / p ^ j : ℕ) : ZMod p) ≠ 0 := by
  intro hzero
  exact hnext ((digit_eq_zero_iff hd).mp hzero)

/-- Inputs at higher valuation levels have no residue correction. -/
theorem digit_step_of_next_pow_dvd {p m j k x : ℕ} (hp : 0 < p) (hj : j ≤ m)
    (hx : p ^ (j + 1) ∣ x) :
    digit p m ((1 + k * p ^ (m - j)) * x) = digit p m x := by
  have hlower : p ^ j ∣ x := (Nat.pow_dvd_pow p (Nat.le_succ j)).trans hx
  rw [digit_step hp hj hlower, (digit_eq_zero_iff hlower).mpr hx, mul_zero, add_zero]

/-- Below the top level the multiplier is congruent to one. -/
theorem multiplier_cast_of_lt {p m j k : ℕ} (hj : j < m) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) = 1 := by
  rw [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_pow, ZMod.natCast_self,
    zero_pow (Nat.ne_of_gt (Nat.sub_pos_of_lt hj)), mul_zero, add_zero]

theorem multiplier_ne_zero_of_lt {p m j k : ℕ} (hp : 1 < p) (hj : j < m) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := by
  rw [multiplier_cast_of_lt hj]
  intro hzero
  have hdvd : p ∣ 1 := (ZMod.natCast_eq_zero_iff 1 p).mp
    (by simpa only [Nat.cast_one] using hzero)
  exact (not_le_of_gt hp) (Nat.le_of_dvd Nat.one_pos hdvd)

theorem multiplier_cast_at_top {p m k : ℕ} :
    ((1 + k * p ^ (m - m) : ℕ) : ZMod p) = 1 + (k : ZMod p) := by
  simp only [Nat.sub_self, pow_zero, mul_one, Nat.cast_add, Nat.cast_one]

/-- At the top level the sole excluded multiplier parameter is minus one. -/
theorem multiplier_ne_zero_at_top {p m k : ℕ} (hk : (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - m) : ℕ) : ZMod p) ≠ 0 := by
  rw [multiplier_cast_at_top]
  intro hzero
  apply hk
  exact eq_neg_iff_add_eq_zero.mpr ((add_comm _ _).trans hzero)

theorem multiplier_ne_zero {p m j k : ℕ} (hp : 1 < p) (hj : j ≤ m)
    (htop : j = m → (k : ZMod p) ≠ -1) :
    ((1 + k * p ^ (m - j) : ℕ) : ZMod p) ≠ 0 := by
  rcases lt_or_eq_of_le hj with hlt | rfl
  · exact multiplier_ne_zero_of_lt hp hlt
  · exact multiplier_ne_zero_at_top (htop rfl)

end Loneliness.PrimeFilteringArithmetic
