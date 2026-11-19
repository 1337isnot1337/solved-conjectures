import Conjectures.HadamardAutomorphismArithmetic
import Mathlib.Data.Rat.Lemmas
import Mathlib.Data.Nat.Squarefree

/-! The rational-coordinate version of the quadratic norm obstruction. -/

namespace HadamardAutomorphism

theorem rational_den_one_of_prime_square (B : ℚ) (n : ℤ)
    (h : 479 * B ^ 2 = (n : ℚ)) : B.den = 1 := by
  have hB : B ^ 2 = Rat.divInt n 479 := by
    rw [Rat.divInt_eq_div]
    apply (eq_div_iff (by norm_num : (479 : ℚ) ≠ 0)).mpr
    linarith
  have hdZ : (((B ^ 2).den : ℕ) : ℤ) ∣ 479 := by
    rw [hB]
    exact Rat.den_dvd n 479
  have hdN : B.den ^ 2 ∣ 479 := by
    exact_mod_cast (show ((B.den ^ 2 : ℕ) : ℤ) ∣ 479 by simpa using hdZ)
  have hunit : IsUnit B.den := prime_479.squarefree B.den (by simpa [pow_two] using hdN)
  exact Nat.isUnit_iff.mp hunit

theorem no_norm_cube_rational (A : ℤ) (B : ℚ) :
    (A : ℚ) ^ 2 + 479 * B ^ 2 ≠ 4 * 599 ^ 3 := by
  intro h
  have hden : B.den = 1 := rational_den_one_of_prime_square B (4 * 599 ^ 3 - A ^ 2) (by
    push_cast
    linarith)
  have hB : (B.num : ℚ) = B := Rat.coe_int_num_of_den_eq_one hden
  have hZ : A ^ 2 + 479 * B.num ^ 2 = 4 * 599 ^ 3 := by
    exact_mod_cast (show (A : ℚ) ^ 2 + 479 * (B.num : ℚ) ^ 2 = 4 * 599 ^ 3 by
      rw [hB]
      exact h)
  exact no_norm_cube A B.num hZ

theorem no_norm_prime_rational (A : ℤ) (B : ℚ) :
    (A : ℚ) ^ 2 + 479 * B ^ 2 ≠ 4 * 599 := by
  intro h
  have hden : B.den = 1 := rational_den_one_of_prime_square B (4 * 599 - A ^ 2) (by
    push_cast
    linarith)
  have hB : (B.num : ℚ) = B := Rat.coe_int_num_of_den_eq_one hden
  have hZ : A ^ 2 + 479 * B.num ^ 2 = 4 * 599 := by
    exact_mod_cast (show (A : ℚ) ^ 2 + 479 * (B.num : ℚ) ^ 2 = 4 * 599 by
      rw [hB]
      exact h)
  exact no_norm_prime A B.num hZ

end HadamardAutomorphism
