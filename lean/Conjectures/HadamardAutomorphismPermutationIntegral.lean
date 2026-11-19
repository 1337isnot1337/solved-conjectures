import Conjectures.HadamardAutomorphismFixedPoints
import Mathlib.Algebra.Ring.Commute
import Mathlib.Data.Int.Cast.Lemmas
import Mathlib.Algebra.Star.Basic
import Mathlib.NumberTheory.NumberField.Basic

/-!
# Transporting real sign matrices to integers and number rings

The integer matrix is defined entry by entry. Its real image is proved to be
the given matrix, and injectivity of the integer-to-real map transfers every
orthogonality equation. Mapping the resulting integer equations then gives
matrices over arbitrary commutative rings, including rings of integers.
-/

namespace HadamardAutomorphism

open NumberField
open scoped BigOperators Matrix

noncomputable def integerSign (x : ℝ) : ℤ := by
  classical
  exact if x = 1 then 1 else -1

theorem integerSign_values (x : ℝ) : integerSign x = 1 ∨ integerSign x = -1 := by
  classical
  by_cases hx : x = 1 <;> simp [integerSign, hx]

theorem integerSign_cast (x : ℝ) (hx : x ^ 2 = 1) : (integerSign x : ℝ) = x := by
  rcases sq_eq_one_iff.mp hx with rfl | rfl <;> norm_num [integerSign]

variable {I J : Type*}

noncomputable def integerSignMatrix (H : Matrix I J ℝ) : Matrix I J ℤ :=
  fun i j => integerSign (H i j)

theorem integerSignMatrix_cast (H : Matrix I J ℝ) (hsign : ∀ i j, H i j ^ 2 = 1) :
    ∀ i j, (integerSignMatrix H i j : ℝ) = H i j :=
  fun i j => integerSign_cast (H i j) (hsign i j)

theorem integerSignMatrix_real_map (H : Matrix I J ℝ) (hsign : ∀ i j, H i j ^ 2 = 1) :
    (integerSignMatrix H).map (Int.castRingHom ℝ) = H := by
  ext i j
  exact integerSignMatrix_cast H hsign i j

theorem integerSignMatrix_values (H : Matrix I J ℝ) :
    ∀ i j, integerSignMatrix H i j = 1 ∨ integerSignMatrix H i j = -1 :=
  fun i j => integerSign_values (H i j)

theorem integerSignMatrix_orthogonal [Fintype J] [DecidableEq I]
    (H : Matrix I J ℝ) (n : ℕ) (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (n : ℝ) else 0) :
    ∀ i k, ∑ j, integerSignMatrix H i j * integerSignMatrix H k j =
      if i = k then (n : ℤ) else 0 := by
  intro i k
  apply Int.cast_injective (α := ℝ)
  push_cast
  simpa only [integerSignMatrix_cast H hsign] using horth i k

noncomputable def signMatrixOver (A : Type*) [Ring A] (H : Matrix I J ℝ) : Matrix I J A :=
  fun i j => (integerSignMatrix H i j : A)

theorem signMatrixOver_values (A : Type*) [Ring A] (H : Matrix I J ℝ) :
    ∀ i j, signMatrixOver A H i j = 1 ∨ signMatrixOver A H i j = -1 := by
  intro i j
  rcases integerSignMatrix_values H i j with h | h
  · left
    simp only [signMatrixOver, h, Int.cast_one]
  · right
    simp only [signMatrixOver, h, Int.cast_neg, Int.cast_one]

theorem signMatrixOver_signs (A : Type*) [Ring A] (H : Matrix I J ℝ) :
    ∀ i j, signMatrixOver A H i j ^ 2 = 1 := by
  intro i j
  rcases signMatrixOver_values A H i j with h | h <;> simp [h]

/-- Integer transport preserves all rows of the Hadamard orthogonality equation. -/
theorem signMatrixOver_orthogonal (A : Type*) [CommRing A]
    [Fintype J] [DecidableEq I] (H : Matrix I J ℝ) (n : ℕ)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (n : ℝ) else 0) :
    ∀ i k, ∑ j, signMatrixOver A H i j * signMatrixOver A H k j =
      if i = k then (n : A) else 0 := by
  intro i k
  have h := congrArg (Int.castRingHom A) (integerSignMatrix_orthogonal H n hsign horth i k)
  simpa [signMatrixOver] using h

theorem signMatrixOver_invariant (A : Type*) [Ring A] (H : Matrix I J ℝ)
    (σ : Equiv.Perm I) (τ : Equiv.Perm J)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) :
    ∀ i j, signMatrixOver A H (σ i) (τ j) = signMatrixOver A H i j := by
  intro i j
  exact congrArg (fun x => (integerSign x : A)) (hinv i j)

/-- Every ring homomorphism acts on the transported entries as it acts on integers. -/
theorem map_signMatrixOver {A B : Type*} [Ring A] [Ring B]
    (φ : A →+* B) (H : Matrix I J ℝ) :
    (signMatrixOver A H).map φ = signMatrixOver B H := by
  ext i j
  exact map_intCast φ _

theorem signMatrixOver_star (A : Type*) [Ring A] [StarRing A] (H : Matrix I J ℝ) :
    ∀ i j, star (signMatrixOver A H i j) = signMatrixOver A H i j := by
  intro i j
  exact star_intCast _

theorem real_column_orthogonality [Fintype I] [DecidableEq I] (H : Matrix I I ℝ) (n : ℕ) (hn : n ≠ 0)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (n : ℝ) else 0) :
    ∀ i k, ∑ j, H j i * H j k = if i = k then (n : ℝ) else 0 := by
  have hm : H * H.transpose = (n : ℝ) • (1 : Matrix I I ℝ) := by
    ext i k
    simpa [Matrix.mul_apply, Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply]
      using horth i k
  have hn' : (n : ℝ) ≠ 0 := by exact_mod_cast hn
  have hc := transpose_mul_eq_of_mul_transpose H hn' hm
  intro i k
  have h := congrArg (fun M : Matrix I I ℝ => M i k) hc
  simpa [Matrix.mul_apply, Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply] using h

/-- The transported matrix satisfies the exact conjugate-transpose equation
required by the Fourier argument over any commutative star ring. -/
theorem signMatrixOver_conjTranspose_mul [Fintype I] [DecidableEq I]
    (A : Type*) [CommRing A] [StarRing A]
    (H : Matrix I I ℝ) (n : ℕ) (hn : n ≠ 0)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (n : ℝ) else 0) :
    (signMatrixOver A H)ᴴ * signMatrixOver A H = (n : A) • (1 : Matrix I I A) := by
  have hc := real_column_orthogonality H n hn horth
  have hcol := signMatrixOver_orthogonal A H.transpose n (fun i j => hsign j i) hc
  ext i k
  simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, signMatrixOver_star]
  simpa [Matrix.transpose_apply, Matrix.smul_apply, Matrix.one_apply, signMatrixOver,
    integerSignMatrix] using hcol i k

variable (K : Type*) [Field K] [NumberField K]

/-- The actual sign matrix in the ring of integers of a number field. -/
noncomputable abbrev numberRingSignMatrix (H : Matrix I I ℝ) : Matrix I I (𝓞 K) :=
  signMatrixOver (𝓞 K) H

theorem numberRingSignMatrix_coe (H : Matrix I I ℝ) :
    (numberRingSignMatrix K H).map (algebraMap (𝓞 K) K) = signMatrixOver K H :=
  map_signMatrixOver (algebraMap (𝓞 K) K) H

/-- A real Hadamard sign matrix gives an integer-coefficient matrix in `𝓞 K`,
with every orthogonality equation preserved. -/
theorem real_hadamard_number_ring [Fintype I] [DecidableEq I] (H : Matrix I I ℝ) (n : ℕ)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (n : ℝ) else 0) :
    (∀ i j, numberRingSignMatrix K H i j = 1 ∨ numberRingSignMatrix K H i j = -1) ∧
    (∀ i k, ∑ j, numberRingSignMatrix K H i j * numberRingSignMatrix K H k j =
      if i = k then (n : 𝓞 K) else 0) := by
  exact ⟨signMatrixOver_values (𝓞 K) H, signMatrixOver_orthogonal (𝓞 K) H n hsign horth⟩

end HadamardAutomorphism
