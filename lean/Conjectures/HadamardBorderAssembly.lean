import Conjectures.HadamardBorderInflation
import Mathlib.Data.Matrix.Block

/-!
# Assembly of the actual fixed-border matrix

This module forms the displayed block matrix. Its intermediate Gram theorem
takes the five finite-border identities explicitly, while the core Gram and
cross identities are proved from the actual normalized input rows.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

/-- Twelve border positions together with the four group-indexed core blocks. -/
abbrev BorderIndex (G : Type*) := Fin 12 ⊕ BlockIndex G

variable {G Q : Type*} [AddCommGroup G] [AddCommGroup Q]

/-- The actual bordered matrix, with no abstract matrix witness in its definition. -/
def borderedMatrix (π : G →+ Q)
    (K : Matrix (Fin 12) (Fin 12) ℤ)
    (E : Matrix (Fin 12) (BlockIndex Q) ℤ)
    (F : Matrix (BlockIndex Q) (Fin 12) ℤ) (f : Rows G) :
    Matrix (BorderIndex G) (BorderIndex G) ℤ :=
  Matrix.fromBlocks K (E.submatrix id (blockProjection π))
    (inflateRows (blockProjection π) F) (core f)

theorem borderedMatrix_sign (π : G →+ Q)
    (K : Matrix (Fin 12) (Fin 12) ℤ)
    (E : Matrix (Fin 12) (BlockIndex Q) ℤ)
    (F : Matrix (BlockIndex Q) (Fin 12) ℤ) (f : Rows G)
    (hK : SignMatrix K) (hE : SignMatrix E) (hF : SignMatrix F)
    (hf : ∀ i, SignValued (f i)) :
    SignMatrix (borderedMatrix π K E F f) := by
  intro u v
  rcases u with u | u <;> rcases v with v | v
  · exact hK u v
  · exact hE u (blockProjection π v)
  · exact hF (blockProjection π u) v
  · exact core_sign f hf u v

section Gram

variable [Fintype G] [Fintype Q] [DecidableEq G] [DecidableEq Q]

/-- The five fixed-border identities and the original normalized row data
give the Gram matrix of the actual assembled matrix. -/
theorem borderedMatrix_gram (π : G →+ Q) (hπ : Function.Surjective π)
    (K : Matrix (Fin 12) (Fin 12) ℤ)
    (E : Matrix (Fin 12) (BlockIndex Q) ℤ)
    (F : Matrix (BlockIndex Q) (Fin 12) ℤ) (f : Rows G)
    (hQ : Fintype.card Q = 4) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if π u = 0 then -12 else 4)
    (d : ℤ) (a : Fin 3 → ℤ)
    (hzero : ∀ q, compress π (f 0) q = d)
    (hother : ∀ r : Fin 3, ∀ q,
      compress π (f r.succ) q = a r + if q = 0 then 2 else 0)
    (hK : K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ))
    (hE : E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ))
    (hF : F * Fᵀ =
      (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
        (4 : ℤ) • blockOnes Q)
    (hbalanced : blockOnes Q * Eᵀ = 0)
    (hcross : gammaReflection gamma * Eᵀ + F * Kᵀ = 0) :
    borderedMatrix π K E F f * (borderedMatrix π K E F f)ᵀ =
      (4 * (Fintype.card G : ℤ) + 12) •
        (1 : Matrix (BorderIndex G) (BorderIndex G) ℤ) := by
  have hcard : Fintype.card G = 4 * Nat.card π.ker := by
    simpa only [hQ] using fintype_card_eq_card_mul_kernel_card π hπ
  have hcardZ := congrArg (fun n : ℕ => (n : ℤ)) hcard
  norm_num only [Nat.cast_mul] at hcardZ
  have hsize :
      12 + 16 * (Nat.card π.ker : ℤ) = 4 * (Fintype.card G : ℤ) + 12 := by
    rw [hcardZ]
    ring
  have htop :
      K * Kᵀ +
        E.submatrix id (blockProjection π) * (E.submatrix id (blockProjection π))ᵀ =
      (4 * (Fintype.card G : ℤ) + 12) •
        (1 : Matrix (Fin 12) (Fin 12) ℤ) := by
    rw [hK, fixed_border_columns_lift_gram π hπ E hE, ← add_smul, hsize]
  have hbottom :
      inflateRows (blockProjection π) F * (inflateRows (blockProjection π) F)ᵀ +
        core f * (core f)ᵀ =
      (4 * (Fintype.card G : ℤ) + 12) •
        (1 : Matrix (BlockIndex G) (BlockIndex G) ℤ) := by
    rw [fixed_border_rows_lift_gram π F hF, core_gram_of_two_level π f hf hcorr]
    abel
  have hlower :
      inflateRows (blockProjection π) F * Kᵀ +
        core f * (E.submatrix id (blockProjection π))ᵀ = 0 := by
    change inflateRows (blockProjection π) F * Kᵀ +
      core f * inflateRows (blockProjection π) Eᵀ = 0
    rw [inflateRows_mul,
      core_mul_inflate_transpose_of_normalized π f E d a hzero hother hbalanced]
    change inflateRows (blockProjection π)
      (F * Kᵀ + gammaReflection gamma * Eᵀ) = 0
    have hcross' : F * Kᵀ + gammaReflection gamma * Eᵀ = 0 := by
      rw [add_comm]
      exact hcross
    rw [hcross']
    rfl
  have hupper :
      K * (inflateRows (blockProjection π) F)ᵀ +
        E.submatrix id (blockProjection π) * (core f)ᵀ = 0 := by
    have h := congrArg Matrix.transpose hlower
    simpa only [Matrix.transpose_add, Matrix.transpose_mul,
      Matrix.transpose_transpose, Matrix.transpose_zero] using h
  simp only [borderedMatrix, Matrix.fromBlocks_transpose, Matrix.fromBlocks_multiply]
  rw [htop, hupper, hlower, hbottom]
  simpa only [Matrix.fromBlocks_one, smul_zero] using
    (Matrix.fromBlocks_smul (4 * (Fintype.card G : ℤ) + 12)
      (1 : Matrix (Fin 12) (Fin 12) ℤ)
      (0 : Matrix (Fin 12) (BlockIndex G) ℤ)
      (0 : Matrix (BlockIndex G) (Fin 12) ℤ)
      (1 : Matrix (BlockIndex G) (BlockIndex G) ℤ)).symm

end Gram

omit [AddCommGroup G] in
theorem bordered_index_card [Fintype G] :
    Fintype.card (BorderIndex G) = 4 * Fintype.card G + 12 := by
  simp [BorderIndex, BlockIndex, Nat.add_comm]

end HadamardBorderConstruction
