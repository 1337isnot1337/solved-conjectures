import Conjectures.RowlandSistosBarronCoefficientsBounds
import Conjectures.RowlandSistosBarronCoefficientsDuality
import Conjectures.RowlandSistosBarronKrawtchouk

/-!
# Rowland–Sistos Barrón conjecture

Complete degree classification for the coefficient polynomials. A cancelled
leading term is restored exactly three degrees lower; no intervening
degree is admissible. The statements hold uniformly in the power.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

theorem coefficientPolynomial_rank_least_residue {M j r : ℕ}
    (hr : r < 3) (hrM : r ≤ M) (hj : j ≤ M)
    (hK : krawtchouk M j r ≠ 0) :
    polynomialRank (coefficientPolynomial M (r + 3 * j)) = M - r + 1 := by
  apply coefficientPolynomial_rank_of_first hrM
  · rw [coefficientPolynomial_coeff_krawtchouk hrM hj]
    exact mul_ne_zero (by exact_mod_cast (Nat.choose_pos hj).ne') hK
  · intro s hs
    apply coefficientPolynomial_leading_zero_of_residue hr hs _ (by omega)
    omega

theorem coefficientPolynomial_rank_restored {M j r : ℕ}
    (hr : r < 3) (hrM : r + 3 ≤ M) (hj : j ≤ M) (hjpos : 0 < j)
    (hK : krawtchouk M j r = 0)
    (hKnext : krawtchouk M (j - 1) (r + 3) ≠ 0) :
    polynomialRank (coefficientPolynomial M (r + 3 * j)) = M - (r + 3) + 1 := by
  apply coefficientPolynomial_rank_of_first hrM
  · have hk : r + 3 * j = (r + 3) + 3 * (j - 1) := by omega
    rw [hk, coefficientPolynomial_coeff_krawtchouk hrM (by omega)]
    exact mul_ne_zero (by exact_mod_cast (Nat.choose_pos (by omega : j - 1 ≤ M)).ne')
      hKnext
  · intro s hs
    by_cases hsr : s = r
    · subst s
      rw [coefficientPolynomial_coeff_krawtchouk (by omega) hj, hK, mul_zero]
    · apply coefficientPolynomial_coeff_sub_zero_of_mod (by omega) (by omega)
      rintro ⟨q, hq⟩
      omega

theorem coefficientPolynomial_rank_residue_one {M j : ℕ}
    (hM : 49 ≤ M) (hj : j ≤ M) :
    polynomialRank (coefficientPolynomial M (1 + 3 * j)) +
      3 * (if 2 * j = M then 1 else 0) = M := by
  by_cases hz : 2 * j = M
  · have hK := (krawtchouk_one_eq_zero_iff hj).2 hz
    have hrest := krawtchouk_restore_one hM hj hK
    have hdeg := coefficientPolynomial_rank_restored (r := 1) (by decide)
      (by omega) hj (by omega) hK hrest
    rw [hdeg, ite_eq_left hz]
    omega
  · have hK : krawtchouk M j 1 ≠ 0 := by
      exact fun hk => hz ((krawtchouk_one_eq_zero_iff hj).1 hk)
    have hdeg := coefficientPolynomial_rank_least_residue (r := 1) (by decide)
      (by omega) hj hK
    rw [hdeg, ite_eq_right hz]
    omega

theorem coefficientPolynomial_rank_residue_two {M j : ℕ}
    (hM : 49 ≤ M) (hj : j ≤ M) :
    polynomialRank (coefficientPolynomial M (2 + 3 * j)) +
      3 * (if ((M : ℚ) - 2 * j) ^ 2 = M then 1 else 0) = M - 1 := by
  by_cases hz : ((M : ℚ) - 2 * j) ^ 2 = M
  · have hK := (krawtchouk_two_eq_zero_iff hj).2 hz
    have hrest := krawtchouk_restore_two hM hj hK
    have hjpos : 0 < j := by
      by_contra hn
      have hj0 : j = 0 := by omega
      have hMq : (49 : ℚ) ≤ M := by exact_mod_cast hM
      simp only [hj0, Nat.cast_zero, mul_zero, sub_zero] at hz
      nlinarith
    have hdeg := coefficientPolynomial_rank_restored (r := 2) (by decide)
      (by omega) hj hjpos hK hrest
    rw [hdeg, ite_eq_left hz]
    omega
  · have hK : krawtchouk M j 2 ≠ 0 := by
      exact fun hk => hz ((krawtchouk_two_eq_zero_iff hj).1 hk)
    have hdeg := coefficientPolynomial_rank_least_residue (r := 2) (by decide)
      (by omega) hj hK
    rw [hdeg, ite_eq_right hz]
    omega

end

end RowlandSistosBarron
