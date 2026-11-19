import Conjectures.LonelinessModularCoverFastCounts

/-! A population count with structural recursion on a single bit-width bound.
Its value agrees with the existing count on every natural number. -/

namespace Loneliness.Modular.SupportSearch.Bits.Fuel

def countAux : ℕ → ℕ → ℕ
  | 0, _ => 0
  | fuel + 1, n => countAux fuel (n >>> 1) + if n.testBit 0 then 1 else 0

theorem countAux_eq (fuel n : ℕ) (h : n < 2^fuel) :
    countAux fuel n = Fast.count n := by
  induction fuel generalizing n with
  | zero =>
    have hn : n = 0 := by simpa using h
    subst n
    rfl
  | succ fuel ih =>
    have hsmall : n >>> 1 < 2^fuel := by
      rw [Nat.shiftRight_eq_div_pow]
      apply (Nat.div_lt_iff_lt_mul (by decide : 0 < 2^1)).2
      change n < 2^fuel * 2
      simpa only [pow_succ] using h
    rw [countAux, ih (n >>> 1) hsmall]
    rw [← Fast.count_bit]
    exact congrArg Fast.count (Nat.bit_testBit_zero_shiftRight_one n)

def count (n : ℕ) : ℕ := countAux (n.log2 + 1) n

theorem count_eq_fast (n : ℕ) : count n = Fast.count n :=
  countAux_eq (n.log2 + 1) n (Nat.lt_log2_self)

theorem count_eq (n : ℕ) : count n = n.bitIndices.length :=
  (count_eq_fast n).trans (Fast.count_eq n)

end Loneliness.Modular.SupportSearch.Bits.Fuel
