import Mathlib.LinearAlgebra.Matrix.HadamardMatrix
import Mathlib.Algebra.Group.AddChar
import Mathlib.Tactic.Ring

/-! Fourier compression of a matrix with equal cyclic row and column orbits.

All matrices here are actual matrices. The character embedding and the compressed
matrix are finite sums, rather than unspecified spectral data.
-/

open scoped BigOperators Matrix ComplexConjugate

namespace HadamardAutomorphism

variable {R : Type*} [CommRing R] [StarRing R] [IsDomain R]

theorem nontrivial_character_sum_zero {G : Type*} [AddCommGroup G] [Fintype G]
    (χ : AddChar G R) (hχ : χ ≠ 1) : ∑ a, χ a = 0 := by
  obtain ⟨b, hb⟩ := AddChar.ne_one_iff.mp hχ
  have hsum : χ b * (∑ a, χ a) = ∑ a, χ a := by
    rw [Finset.mul_sum]
    simp only [← AddChar.map_add_eq_mul]
    exact Fintype.sum_bijective _ (AddGroup.addLeft_bijective b) _ _ (fun _ => rfl)
  exact eq_zero_of_mul_eq_self_left hb hsum

section Gram

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]

/-- An invariant subspace with a scalar Gram matrix inherits the same
orthogonality constant as the original matrix. -/
theorem compressed_gram
    (H : Matrix ι ι R) (V : Matrix ι κ R) (A : Matrix κ κ R)
    (n q : R) (hq : q ≠ 0)
    (hH : Hᴴ * H = n • (1 : Matrix ι ι R))
    (hV : Vᴴ * V = q • (1 : Matrix κ κ R))
    (hintertwine : H * V = V * A) :
    Aᴴ * A = n • (1 : Matrix κ κ R) := by
  have h : q • (Aᴴ * A) = q • (n • (1 : Matrix κ κ R)) := by
    calc
      q • (Aᴴ * A) = Aᴴ * (Vᴴ * V) * A := by
        rw [hV]
        simp [Matrix.mul_smul, Matrix.smul_mul]
      _ = (V * A)ᴴ * (V * A) := by
        rw [Matrix.conjTranspose_mul]
        simp only [Matrix.mul_assoc]
      _ = (H * V)ᴴ * (H * V) := by rw [hintertwine]
      _ = Vᴴ * (Hᴴ * H) * V := by
        rw [Matrix.conjTranspose_mul]
        simp only [Matrix.mul_assoc]
      _ = q • (n • (1 : Matrix κ κ R)) := by
        rw [hH]
        simp [Matrix.mul_smul, Matrix.smul_mul, hV, smul_smul, mul_comm]
  exact (smul_right_injective _ hq) h

/-- The determinant identity needed after replacing sign rows by indicators. -/
theorem determinant_norm_of_gram (X : Matrix κ κ R) (p : R)
    (hX : Xᴴ * X = p • (1 : Matrix κ κ R)) :
    star X.det * X.det = p ^ Fintype.card κ := by
  have h := congrArg Matrix.det hX
  simpa only [Matrix.det_mul, Matrix.det_conjTranspose, Matrix.det_smul,
    Matrix.det_one, mul_one] using h

end Gram

section Embedding

variable {I G : Type*} [Fintype I] [DecidableEq I] [Fintype G] [AddCommGroup G]

/-- One fixed coordinate and equal additive-group orbits. -/
abbrev OrbitIndex (I G : Type*) := Option (I × G)

/-- The literal character vector on each moving orbit. -/
def fourierEmbedding (χ : AddChar G R) : Matrix (OrbitIndex I G) I R
  | none, _ => 0
  | some (i, a), j => if i = j then χ a else 0

/-- The Fourier sum of each moving-by-moving sign block. -/
def fourierBlock (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) : Matrix I I R :=
  fun i j => ∑ a : G, H (some (i, 0)) (some (j, a)) * χ a

theorem embedding_gram (χ : AddChar G R)
    (hχ : ∀ a, star (χ a) * χ a = 1) :
    (fourierEmbedding (I := I) χ)ᴴ * fourierEmbedding χ =
      (Fintype.card G : R) • (1 : Matrix I I R) := by
  classical
  ext i j
  by_cases hij : i = j
  · subst j
    simp [Matrix.mul_apply, fourierEmbedding, Fintype.sum_prod_type, hχ]
  · simp [Matrix.mul_apply, fourierEmbedding, Fintype.sum_prod_type, hij]

theorem hadamard_mul_embedding_apply
    (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) (r : OrbitIndex I G) (j : I) :
    (H * fourierEmbedding χ) r j = ∑ b : G, H r (some (j, b)) * χ b := by
  classical
  simp [Matrix.mul_apply, fourierEmbedding, Fintype.sum_prod_type]

theorem embedding_mul_apply (χ : AddChar G R) (A : Matrix I I R)
    (i : I) (a : G) (j : I) :
    (fourierEmbedding χ * A) (some (i, a)) j = χ a * A i j := by
  classical
  simp [Matrix.mul_apply, fourierEmbedding]

/-- Simultaneous translation makes the Fourier subspace invariant. -/
theorem fourier_intertwine
    (H : Matrix (OrbitIndex I G) (OrbitIndex I G) R)
    (χ : AddChar G R) (hχ : χ ≠ 1)
    (hfixed : ∀ j b, H none (some (j, b)) = H none (some (j, 0)))
    (hblock : ∀ i j a b,
      H (some (i, a)) (some (j, b)) = H (some (i, 0)) (some (j, b - a))) :
    H * fourierEmbedding χ = fourierEmbedding χ * fourierBlock H χ := by
  classical
  ext r j
  cases r with
  | none =>
      rw [hadamard_mul_embedding_apply]
      simp only [hfixed]
      rw [← Finset.mul_sum, nontrivial_character_sum_zero χ hχ]
      simp [Matrix.mul_apply, fourierEmbedding]
  | some r =>
      rcases r with ⟨i, a⟩
      rw [hadamard_mul_embedding_apply, embedding_mul_apply]
      simp only [hblock]
      calc
        (∑ b : G, H (some (i, 0)) (some (j, b - a)) * χ b) =
            ∑ b : G, H (some (i, 0)) (some (j, b)) * χ (b + a) := by
          simpa using (Fintype.sum_equiv (Equiv.addRight a)
            (fun b => H (some (i, 0)) (some (j, b - a)) * χ b)
            (fun b => H (some (i, 0)) (some (j, b)) * χ (b + a))
            (by intro b; simp)).symm
        _ = χ a * fourierBlock H χ i j := by
          simp only [AddChar.map_add_eq_mul, fourierBlock]
          rw [Finset.mul_sum]
          congr 1
          funext b
          ring

end Embedding

end HadamardAutomorphism
