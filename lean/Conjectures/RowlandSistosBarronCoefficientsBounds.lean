import Conjectures.RowlandSistosBarronCoefficientsExpansion

/-!
# Rowland–Sistos Barrón conjecture

Degree bounds and noncancelling families for the exact coefficient
polynomials in Sections 3–4 of the recorded proof.
-/

open Polynomial
open scoped BigOperators

namespace RowlandSistosBarron

noncomputable section

theorem coefficientPolynomial_rank_of_first {M k r : ℕ} (hr : r ≤ M)
    (hlead : (coefficientPolynomial M k).coeff (M - r) ≠ 0)
    (hbefore : ∀ s, s < r → (coefficientPolynomial M k).coeff (M - s) = 0) :
    polynomialRank (coefficientPolynomial M k) = M - r + 1 := by
  have hp : coefficientPolynomial M k ≠ 0 := by
    intro h
    exact hlead (by rw [h, coeff_zero])
  rw [polynomialRank_of_ne_zero hp]
  congr 1
  apply natDegree_eq_of_le_of_coeff_ne_zero _ hlead
  apply natDegree_le_iff_coeff_eq_zero.mpr
  intro t ht
  by_cases hMt : M < t
  · exact coefficientPolynomial_coeff_above hMt
  · have hs : M - t < r := by omega
    simpa only [Nat.sub_sub_self (by omega : t ≤ M)] using hbefore (M - t) hs

theorem coefficientPolynomial_leading_zero_of_residue {M k r s : ℕ}
    (hr : r < 3) (hs : s < r) (hk : k % 3 = r) (hM : s ≤ M) :
    (coefficientPolynomial M k).coeff (M - s) = 0 := by
  have hsk : s ≤ k := by omega
  apply coefficientPolynomial_coeff_sub_zero_of_mod hM hsk
  rintro ⟨q, hq⟩
  omega

theorem krawtchouk_at_zero (M j : ℕ) :
    krawtchouk M 0 j = (M.choose j : ℚ) := by
  simp [krawtchouk, krawtchoukPolynomial, coeff_one_add_X_pow]

theorem coefficientPolynomial_rank_residue_zero {M j : ℕ} (hj : j ≤ M) :
    polynomialRank (coefficientPolynomial M (3 * j)) = M + 1 := by
  apply coefficientPolynomial_rank_of_first (r := 0) (Nat.zero_le M)
  · have hc := coefficientPolynomial_coeff_sub_congr (M := M) (r := 0) (j := j)
      (Nat.zero_le M)
    simp only [Nat.sub_zero, Nat.zero_add, Nat.choose_zero_right, Nat.cast_one,
      one_mul, krawtchouk_at_zero] at hc
    rw [Nat.sub_zero, hc]
    exact_mod_cast (Nat.choose_pos hj).ne'
  · intro s hs
    omega

theorem coeff_one_sub_X_pow_top (r : ℕ) :
    ((1 - X : Polynomial ℚ) ^ r).coeff r = (-1 : ℚ) ^ r := by
  have hd : (1 - X : Polynomial ℚ).natDegree = 1 := by
    compute_degree; norm_num
  have hl : (1 - X : Polynomial ℚ).leadingCoeff = -1 := by
    rw [leadingCoeff, hd]
    norm_num [coeff_sub, coeff_one]
  have h := coeff_pow_mul_natDegree (1 - X : ℚ[X]) r
  rw [hd, Nat.mul_one, hl] at h
  exact h

theorem krawtchouk_top {M r : ℕ} (hr : r ≤ M) :
    krawtchouk M r M = (-1 : ℚ) ^ r := by
  unfold krawtchouk krawtchoukPolynomial
  nth_rw 2 [← Nat.sub_add_cancel hr]
  rw [coeff_mul_add_eq_of_natDegree_le (by compute_degree) (by compute_degree),
    coeff_one_add_X_pow, Nat.choose_self, Nat.cast_one,
    coeff_one_sub_X_pow_top, one_mul]

theorem coefficientPolynomial_rank_upper {M r : ℕ} (hr : r ≤ M) :
    polynomialRank (coefficientPolynomial M (3 * M + r)) = M - r + 1 := by
  apply coefficientPolynomial_rank_of_first hr
  · have hc := coefficientPolynomial_coeff_sub_congr (j := M) hr
    rw [Nat.add_comm r, krawtchouk_top hr] at hc
    rw [hc]
    exact mul_ne_zero (by exact_mod_cast (Nat.choose_pos hr).ne')
      (pow_ne_zero _ (by norm_num))
  · intro s hs
    exact coefficientPolynomial_coeff_sub_zero_of_top (by omega) (by omega)

end

end RowlandSistosBarron
