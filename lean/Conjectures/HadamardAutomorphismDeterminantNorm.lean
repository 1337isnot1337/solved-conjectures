import Conjectures.HadamardAutomorphismIndicator
import Conjectures.HadamardAutomorphismDeterminant

/-! The determinant of the actual indicator Fourier matrix has a quotient of
norm 599 cubed once its reductions modulo both conjugate primes are nonzero.
-/

open scoped BigOperators Matrix

namespace HadamardAutomorphism

variable {R I G : Type*} [CommRing R] [StarRing R] [IsDomain R] [CharZero R]
  [Fintype I] [DecidableEq I]

omit [IsDomain R] in
theorem matrix_ne_zero_of_gram_599 [Nonempty I] (X : Matrix I I R)
    (hX : Xᴴ * X = (599 : R) • (1 : Matrix I I R)) : X ≠ 0 := by
  intro hz
  obtain ⟨i⟩ := ‹Nonempty I›
  have hi := congrArg (fun M : Matrix I I R => M i i) hX
  rw [hz] at hi
  norm_num at hi

/-- A genuine Gram matrix forces at least one nonconstant binary block. -/
theorem indicator_exists_nonconstant [Nonempty I] [Fintype G] [AddCommGroup G]
    (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) (hχ : χ ≠ 1)
    (hX : (indicatorFourierBlock H χ)ᴴ * indicatorFourierBlock H χ =
      (599 : R) • (1 : Matrix I I R)) :
    ∃ i j, (negativeBlock H i j).Nonempty ∧ negativeBlock H i j ≠ Finset.univ := by
  classical
  by_contra hn
  apply matrix_ne_zero_of_gram_599 _ hX
  ext i j
  by_cases hne : (negativeBlock H i j).Nonempty
  · have hfull : negativeBlock H i j = Finset.univ := by
      by_contra hp
      exact hn ⟨i, j, hne, hp⟩
    simpa only [indicatorFourierBlock, hfull] using
      nontrivial_character_sum_zero χ hχ
  · have he := Finset.not_nonempty_iff_eq_empty.mp hne
    simp [indicatorFourierBlock, he]

omit [IsDomain R] [CharZero R] in
theorem determinant_divisible_of_gram_two_primes
    (X : Matrix I I R) (P Q : Ideal R) [P.IsPrime] [Q.IsPrime]
    (hpP : (599 : R) ∈ P) (hpQ : (599 : R) ∈ Q)
    (hPQ : P ⊓ Q = Ideal.span ({(599 : R)} : Set R))
    (hX : Xᴴ * X = (599 : R) • (1 : Matrix I I R))
    (hXP : X.map (Ideal.Quotient.mk P) ≠ 0)
    (hXQ : X.map (Ideal.Quotient.mk Q) ≠ 0) : (599 : R) ∣ X.det := by
  have hd := det_divisible_of_two_primes Xᴴ X 599 P Q hpP hpQ hPQ hX hXP hXQ
  rw [Matrix.det_conjTranspose] at hd
  obtain ⟨u, hu⟩ := hd
  refine ⟨star u, ?_⟩
  have h := congrArg star hu
  simpa only [star_star, star_mul, star_ofNat, mul_comm] using h

/-- This quotient is constructed from divisibility; it is not an assumed
algebraic integer of the forbidden norm. -/
theorem determinant_quotient_norm_cube (X : Matrix I I R)
    (hcard : Fintype.card I = 5)
    (hX : Xᴴ * X = (599 : R) • (1 : Matrix I I R))
    (hdiv : (599 : R) ∣ X.det) :
    ∃ u : R, X.det = 599 * u ∧ u * star u = 599 ^ 3 := by
  obtain ⟨u, hu⟩ := hdiv
  refine ⟨u, hu, ?_⟩
  have hd : star X.det * X.det = (599 : R) ^ 5 := by
    simpa only [hcard] using determinant_norm_of_gram X 599 hX
  have hcancel : (599 : R) ^ 2 * (u * star u) = (599 : R) ^ 2 * 599 ^ 3 := by
    calc
      (599 : R) ^ 2 * (u * star u) = star X.det * X.det := by
        rw [hu, star_mul, star_ofNat]
        ring
      _ = (599 : R) ^ 5 := hd
      _ = (599 : R) ^ 2 * 599 ^ 3 := by ring
  exact mul_left_cancel₀ (by norm_num : (599 : R) ^ 2 ≠ 0) hcancel

end HadamardAutomorphism
