import Conjectures.LonelinessPrimeFilteringResidues
import Lean.Elab.Tactic.Omega

/-! Avoiding the two extreme top digits gives a lower bound for both
distances from a natural residue to a multiple of `p^(m+1)`. These are
arithmetic statements; they do not assume a runner theorem or a filtering
existence theorem. -/

namespace Loneliness.PrimeFilteringDigitBound

open Loneliness.PrimeFilteringArithmetic Loneliness.PrimeFilteringResidues

/-- A residue whose top digit avoids `0` and `-1` lies at least `p^m`
from either endpoint of the interval of residues modulo `p^(m+1)`. -/
theorem residue_bounds_of_digit_avoiding {p m x : ℕ} (hp : 0 < p)
    (hzero : digit p m x ≠ 0) (hlast : digit p m x ≠ -1) :
    p ^ m ≤ x % p ^ (m + 1) ∧
      x % p ^ (m + 1) + p ^ m ≤ p ^ (m + 1) := by
  let r := x % p ^ (m + 1)
  let d := r / p ^ m
  have hpow : 0 < p ^ m := pow_pos hp m
  have hr : r < p ^ m * p := by
    dsimp [r]
    rw [← pow_succ]
    exact Nat.mod_lt _ (pow_pos hp (m + 1))
  have hdlt : d < p := Nat.div_lt_of_lt_mul hr
  have hcast : (d : ZMod p) = digit p m x := digit_mod_prime_power p m x
  have hdpos : 0 < d := by
    apply Nat.pos_of_ne_zero
    intro hd
    apply hzero
    rw [← hcast, hd, Nat.cast_zero]
  have hlastcast : ((p - 1 : ℕ) : ZMod p) = -1 := by
    rw [Nat.cast_sub (Nat.succ_le_of_lt hp), ZMod.natCast_self, Nat.cast_one, zero_sub]
  have hdlast : d ≠ p - 1 := by
    intro hd
    apply hlast
    rw [← hcast, hd, hlastcast]
  have hdgap : d + 2 ≤ p := by omega
  have hleft : p ^ m ≤ r := by
    by_contra h
    exact (Nat.ne_of_gt hdpos) (Nat.div_eq_of_lt (Nat.lt_of_not_ge h))
  have hquot : r < p ^ m * (d + 1) := Nat.lt_mul_div_succ r hpow
  have hright : r + p ^ m ≤ p ^ m * p := by
    calc
      r + p ^ m ≤ p ^ m * (d + 1) + p ^ m :=
        Nat.add_le_add_right (Nat.le_of_lt hquot) _
      _ = p ^ m * (d + 2) := by ring
      _ ≤ p ^ m * p := Nat.mul_le_mul_left _ hdgap
  refine ⟨hleft, ?_⟩
  simpa only [r, pow_succ] using hright

/-- The folded natural residue is at least `p^m` when the top digit
avoids the two extreme residues. Primality of `p` is not needed. -/
theorem folded_lower_of_digit_avoiding {p m x : ℕ} (hp : 0 < p)
    (hzero : digit p m x ≠ 0) (hlast : digit p m x ≠ -1) :
    p ^ m ≤ min (x % p ^ (m + 1)) (p ^ (m + 1) - x % p ^ (m + 1)) := by
  obtain ⟨hleft, hright⟩ := residue_bounds_of_digit_avoiding hp hzero hlast
  exact le_min hleft (Nat.le_sub_of_add_le' hright)

end Loneliness.PrimeFilteringDigitBound
