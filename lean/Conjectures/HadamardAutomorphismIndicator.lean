import Conjectures.HadamardAutomorphismFourier
import Mathlib.Tactic.NormNum

/-! Replacement of real sign blocks by their actual negative-position supports.
The resulting indicator Fourier matrix has Gram constant 599 at order2396.
-/

open scoped BigOperators Matrix

namespace HadamardAutomorphism

noncomputable section

variable {R I G : Type*} [CommRing R] [StarRing R] [IsDomain R] [CharZero R]
  [Fintype I] [DecidableEq I] [Fintype G] [AddCommGroup G]

def negativeBlock (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (i j : I) : Finset G := by
  classical
  exact Finset.univ.filter fun a => H (some (i, 0)) (some (j, a)) = -1

def indicatorFourierBlock (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) : Matrix I I R :=
  fun i j => ∑ a ∈ negativeBlock H i j, χ a

omit [StarRing R] in
theorem fourierBlock_eq_indicator
    (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) (hχ : χ ≠ 1)
    (hsign : ∀ i j a, H (some (i, 0)) (some (j, a)) = 1 ∨
      H (some (i, 0)) (some (j, a)) = -1) :
    fourierBlock H χ = (-2 : R) • indicatorFourierBlock H χ := by
  classical
  ext i j
  have hterm (a : G) : H (some (i, 0)) (some (j, a)) * χ a =
      χ a - 2 * (if H (some (i, 0)) (some (j, a)) = -1 then χ a else 0) := by
    rcases hsign i j a with h | h
    · simp [h, one_ne_neg_one]
    · simp [h]
      ring
  simp only [fourierBlock, hterm, Finset.sum_sub_distrib]
  rw [nontrivial_character_sum_zero χ hχ, ← Finset.mul_sum]
  simp [indicatorFourierBlock, negativeBlock, Finset.sum_filter, smul_eq_mul]

theorem indicator_gram_599
    (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) (hχ : χ ≠ 1)
    (hunit : ∀ a, star (χ a) * χ a = 1)
    (hH : Hᴴ * H = (2396 : R) • (1 : Matrix (OrbitIndex I G) (OrbitIndex I G) R))
    (hsign : ∀ i j a, H (some (i, 0)) (some (j, a)) = 1 ∨
      H (some (i, 0)) (some (j, a)) = -1)
    (hfixed : ∀ j b, H none (some (j, b)) = H none (some (j, 0)))
    (hblock : ∀ i j a b,
      H (some (i, a)) (some (j, b)) = H (some (i, 0)) (some (j, b - a))) :
    (indicatorFourierBlock H χ)ᴴ * indicatorFourierBlock H χ =
      (599 : R) • (1 : Matrix I I R) := by
  have hq : (Fintype.card G : R) ≠ 0 := by
    exact_mod_cast (Fintype.card_ne_zero : Fintype.card G ≠ 0)
  have hgram := compressed_gram H (fourierEmbedding χ) (fourierBlock H χ)
    2396 (Fintype.card G) hq hH (embedding_gram χ hunit)
    (fourier_intertwine H χ hχ hfixed hblock)
  rw [fourierBlock_eq_indicator H χ hχ hsign] at hgram
  have hfour : (4 : R) • ((indicatorFourierBlock H χ)ᴴ * indicatorFourierBlock H χ) =
      (4 : R) • ((599 : R) • (1 : Matrix I I R)) := by
    simpa only [Matrix.conjTranspose_smul, star_neg, star_ofNat,
      Matrix.smul_mul, Matrix.mul_smul, smul_smul, neg_mul_neg,
      show (2 : R) * 2 = 4 by norm_num,
      show (4 : R) * 599 = 2396 by norm_num] using hgram
  ext i j
  exact mul_left_cancel₀ (by norm_num : (4 : R) ≠ 0)
    (congrArg (fun M : Matrix I I R => M i j) hfour)

end

end HadamardAutomorphism
