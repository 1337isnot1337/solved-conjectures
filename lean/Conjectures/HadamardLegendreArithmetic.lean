import Conjectures.HadamardAutomorphismArithmeticBasic
import Mathlib.NumberTheory.SumTwoSquares
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-!
# The exponent obstruction for the prime 599

Clearing rational denominators and applying the prime-factor characterization
of a sum of two integer squares shows that 599 can occur only to an even
exponent in a rational sum of two squares.
-/

namespace HadamardLegendre

theorem integer_sum_two_squares_pow_599_even (a b : ℤ) (D d : ℕ)
    (hD : D ≠ 0) (h : a ^ 2 + b ^ 2 = (599 : ℤ) ^ d * (D : ℤ) ^ 2) :
    Even d := by
  let : Fact (Nat.Prime 599) := ⟨HadamardAutomorphism.prime_599⟩
  cases d with
  | zero => exact ⟨0, rfl⟩
  | succ d =>
    have hnat : 599 ^ (d + 1) * D ^ 2 = a.natAbs ^ 2 + b.natAbs ^ 2 := by
      have hz : (599 : ℤ) ^ (d + 1) * (D : ℤ) ^ 2 =
          (a.natAbs : ℤ) ^ 2 + (b.natAbs : ℤ) ^ 2 := by
        simpa only [Int.natCast_natAbs, sq_abs] using h.symm
      exact_mod_cast hz
    have hn : 599 ^ (d + 1) * D ^ 2 ≠ 0 :=
      mul_ne_zero (pow_ne_zero _ (by decide)) (pow_ne_zero _ hD)
    have hdvd : 599 ∣ 599 ^ (d + 1) * D ^ 2 := by
      refine ⟨599 ^ d * D ^ 2, ?_⟩
      rw [pow_succ]
      ring
    have hmem := HadamardAutomorphism.prime_599.mem_primeFactors hdvd hn
    have he := Nat.eq_sq_add_sq_iff.mp
      ⟨a.natAbs, b.natAbs, hnat⟩ 599 hmem (by decide)
    rw [padicValNat.mul (pow_ne_zero _ (by decide)) (pow_ne_zero _ hD),
      padicValNat.prime_pow, padicValNat.pow] at he
    rw [Nat.even_iff] at he ⊢
    omega

theorem rational_sum_two_squares_pow_599_even (a b : ℚ) (d : ℕ)
    (h : a ^ 2 + b ^ 2 = 599 ^ d) : Even d := by
  let D : ℕ := a.den * b.den
  let A : ℤ := a.num * (b.den : ℤ)
  let B : ℤ := b.num * (a.den : ℤ)
  have ha0 : (a.den : ℚ) ≠ 0 := by exact_mod_cast a.den_ne_zero
  have hb0 : (b.den : ℚ) ≠ 0 := by exact_mod_cast b.den_ne_zero
  have ha : a * (a.den : ℚ) = (a.num : ℚ) :=
    ((div_eq_iff ha0).mp a.num_div_den).symm
  have hb : b * (b.den : ℚ) = (b.num : ℚ) :=
    ((div_eq_iff hb0).mp b.num_div_den).symm
  have hA : (A : ℚ) = a * (D : ℚ) := by
    dsimp [A, D]
    push_cast
    rw [← ha]
    ring
  have hB : (B : ℚ) = b * (D : ℚ) := by
    dsimp [B, D]
    push_cast
    rw [← hb]
    ring
  have hrat : (A : ℚ) ^ 2 + (B : ℚ) ^ 2 =
      (599 : ℚ) ^ d * (D : ℚ) ^ 2 := by
    rw [hA, hB]
    calc
      (a * (D : ℚ)) ^ 2 + (b * (D : ℚ)) ^ 2 =
          (a ^ 2 + b ^ 2) * (D : ℚ) ^ 2 := by ring
      _ = (599 : ℚ) ^ d * (D : ℚ) ^ 2 := by rw [h]
  have hint : A ^ 2 + B ^ 2 = (599 : ℤ) ^ d * (D : ℤ) ^ 2 := by
    exact_mod_cast hrat
  exact integer_sum_two_squares_pow_599_even A B D d
    (mul_ne_zero a.den_ne_zero b.den_ne_zero) hint

theorem rational_sum_two_squares_ne_599 (a b : ℚ) : a ^ 2 + b ^ 2 ≠ 599 := by
  intro h
  have he := rational_sum_two_squares_pow_599_even a b 1 (by simpa using h)
  norm_num at he

end HadamardLegendre
