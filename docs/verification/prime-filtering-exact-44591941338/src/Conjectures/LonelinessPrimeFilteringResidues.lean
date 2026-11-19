import Conjectures.LonelinessPrimeFilteringArithmetic

/-! Full residue and unit adapters for prime filtering. The residue identities
hold for every natural modulus parameter. Primality is required for lifting
a nonzero residue to a unit modulo a power of the modulus. -/

namespace Loneliness.PrimeFilteringResidues

open Loneliness.PrimeFilteringArithmetic

/-- At a higher valuation level the change is a full multiple of `p^(m+1)`. -/
theorem step_expansion_of_next_pow_dvd {p m j k x : ℕ} (hj : j ≤ m)
    (hx : p ^ (j + 1) ∣ x) :
    (1 + k * p ^ (m - j)) * x =
      x + (k * (x / p ^ (j + 1))) * p ^ (m + 1) := by
  have hpower : p ^ (m - j) * p ^ (j + 1) = p ^ (m + 1) := by
    rw [← pow_add, ← Nat.add_assoc, Nat.sub_add_cancel hj]
  calc
    (1 + k * p ^ (m - j)) * x = x + k * p ^ (m - j) * x := by ring
    _ = x + k * p ^ (m - j) * ((x / p ^ (j + 1)) * p ^ (j + 1)) := by
      rw [Nat.div_mul_cancel hx]
    _ = x + (k * (x / p ^ (j + 1))) * (p ^ (m - j) * p ^ (j + 1)) := by ring
    _ = x + (k * (x / p ^ (j + 1))) * p ^ (m + 1) := by rw [hpower]

/-- The full residue modulo `p^(m+1)` is preserved. -/
theorem residue_step_of_next_pow_dvd {p m j k x : ℕ} (hj : j ≤ m)
    (hx : p ^ (j + 1) ∣ x) :
    ((1 + k * p ^ (m - j)) * x) % p ^ (m + 1) = x % p ^ (m + 1) := by
  rw [step_expansion_of_next_pow_dvd hj hx, Nat.add_mul_mod_self_right]

/-- Reducing modulo `p^(m+1)` does not change the digit at position `m`. -/
theorem digit_mod_prime_power (p m x : ℕ) :
    digit p m (x % p ^ (m + 1)) = digit p m x := by
  unfold digit
  rw [pow_succ, Nat.mod_mul_right_div_self, ZMod.natCast_mod]

theorem digit_eq_of_mod_eq {p m x y : ℕ}
    (h : x % p ^ (m + 1) = y % p ^ (m + 1)) :
    digit p m x = digit p m y := by
  calc
    digit p m x = digit p m (x % p ^ (m + 1)) := (digit_mod_prime_power p m x).symm
    _ = digit p m (y % p ^ (m + 1)) := congrArg (digit p m) h
    _ = digit p m y := digit_mod_prime_power p m y

/-- A natural number nonzero modulo a prime is coprime to each positive power. -/
theorem coprime_prime_power_of_nonzero {p m a : ℕ} (hp : p.Prime)
    (ha : (a : ZMod p) ≠ 0) : Nat.Coprime a (p ^ (m + 1)) := by
  have hcoprime : Nat.Coprime p a := hp.coprime_iff_not_dvd.mpr
    (fun h => ha ((ZMod.natCast_eq_zero_iff a p).mpr h))
  exact hcoprime.symm.pow_right (m + 1)

theorem isUnit_prime_power_of_nonzero {p m a : ℕ} (hp : p.Prime)
    (ha : (a : ZMod p) ≠ 0) : IsUnit (a : ZMod (p ^ (m + 1))) :=
  (ZMod.isUnit_iff_coprime a _).mpr (coprime_prime_power_of_nonzero hp ha)

/-- The lifted unit has the specified natural representative modulo the power. -/
theorem exists_unit_lift {p m a : ℕ} (hp : p.Prime) (ha : (a : ZMod p) ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ, (u : ZMod (p ^ (m + 1))) = (a : ZMod (p ^ (m + 1))) :=
  ⟨ZMod.unitOfCoprime a (coprime_prime_power_of_nonzero hp ha), rfl⟩

/-- The natural representative of a nonzero residue is also a valid unit lift. -/
theorem val_coprime_prime_power_of_nonzero {p m : ℕ} (hp : p.Prime)
    (a : ZMod p) (ha : a ≠ 0) : Nat.Coprime a.val (p ^ (m + 1)) := by
  let : NeZero p := ⟨hp.ne_zero⟩
  apply coprime_prime_power_of_nonzero hp
  simpa only [ZMod.natCast_zmod_val] using ha

theorem exists_unit_val_lift {p m : ℕ} (hp : p.Prime) (a : ZMod p) (ha : a ≠ 0) :
    ∃ u : (ZMod (p ^ (m + 1)))ˣ,
      (u : ZMod (p ^ (m + 1))) = (a.val : ZMod (p ^ (m + 1))) :=
  ⟨ZMod.unitOfCoprime a.val (val_coprime_prime_power_of_nonzero hp a ha), rfl⟩

end Loneliness.PrimeFilteringResidues
