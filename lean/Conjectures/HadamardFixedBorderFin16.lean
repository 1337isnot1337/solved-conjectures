import Conjectures.HadamardFixedBorderTransport
import Mathlib.Data.Fintype.EquivFin

/-!
# The sixteen-position source layout for fixed-border transport

This adapter accepts the finite certificate in its flattened matrix layout.
Every sign and certificate identity remains an explicit premise. The adapter
uses the canonical index `4 * block + position`; it does not import, regenerate,
or certify any unpublished literal matrix data.
-/

namespace HadamardFixedBorder

open Matrix

/-- The canonical sixteen-position ordering, with four consecutive blocks. -/
abbrev flatIndex : BlockIndex (Fin 4) ≃ Fin 16 := finProdFinEquiv

theorem flatIndex_apply_val (p : BlockIndex (Fin 4)) :
    (flatIndex p).val = p.2.val + 4 * p.1.val := rfl

theorem flatIndex_symm_fst_val (i : Fin 16) :
    (flatIndex.symm i).1.val = i.val / 4 := rfl

theorem flatIndex_symm_snd_val (i : Fin 16) :
    (flatIndex.symm i).2.val = i.val % 4 := rfl

/-- The block-ones matrix in the flattened source layout. -/
def flatBlocks : Matrix (Fin 16) (Fin 16) ℤ :=
  (blockOnes (Fin 4)).submatrix flatIndex.symm flatIndex.symm

/-- The untwisted coefficient array in the flattened source layout. -/
def flatGamma (Γ : Matrix (Fin 4) (Fin 4) ℤ) : Matrix (Fin 16) (Fin 16) ℤ :=
  (gammaPermutation Γ (Equiv.refl (Fin 4))).submatrix flatIndex.symm flatIndex.symm

/-- This is the integer-division test for membership in the same block. -/
theorem flatBlocks_apply (i j : Fin 16) :
    flatBlocks i j = if i.val / 4 = j.val / 4 then 1 else 0 := by
  simp only [flatBlocks, Matrix.submatrix_apply, blockOnes, Fin.ext_iff,
    flatIndex_symm_fst_val]

/-- Within a block pair, the coefficient is supported on equal residues
modulo four, exactly as in the finite source layout. -/
theorem flatGamma_apply (Γ : Matrix (Fin 4) (Fin 4) ℤ) (i j : Fin 16) :
    flatGamma Γ i j = Γ (flatIndex.symm i).1 (flatIndex.symm j).1 *
      if i.val % 4 = j.val % 4 then 1 else 0 := by
  simp only [flatGamma, Matrix.submatrix_apply, gammaPermutation, Equiv.coe_refl, id_eq,
    Fin.ext_iff, flatIndex_symm_snd_val]

theorem flatBlocks_submatrix :
    flatBlocks.submatrix flatIndex flatIndex = blockOnes (Fin 4) := by
  ext p q
  simp only [flatBlocks, Matrix.submatrix_apply, Equiv.symm_apply_apply]

theorem flatGamma_submatrix (Γ : Matrix (Fin 4) (Fin 4) ℤ) :
    (flatGamma Γ).submatrix flatIndex flatIndex =
      gammaPermutation Γ (Equiv.refl (Fin 4)) := by
  ext p q
  simp only [flatGamma, Matrix.submatrix_apply, Equiv.symm_apply_apply]

/-- A certificate in the exact rectangular dimensions of the finite data.
The five identities and three sign conditions are assumptions, not computed
facts of this adapter. -/
structure FlatCertificate (Γ : Matrix (Fin 4) (Fin 4) ℤ) where
  K : Matrix (Fin 12) (Fin 12) ℤ
  E : Matrix (Fin 12) (Fin 16) ℤ
  F : Matrix (Fin 16) (Fin 12) ℤ
  K_sign : SignMatrix K
  E_sign : SignMatrix E
  F_sign : SignMatrix F
  K_gram : K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ)
  E_gram : E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ)
  F_gram : F * Fᵀ = (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ) - (4 : ℤ) • flatBlocks
  balanced : flatBlocks * Eᵀ = 0
  cross : flatGamma Γ * Eᵀ + F * Kᵀ = 0

namespace FlatCertificate

variable {Γ : Matrix (Fin 4) (Fin 4) ℤ}

/-- Convert the source certificate to the block-product layout used by the
generic quotient transport, preserving the actual entries and corner. -/
def toFiniteCertificate (C : FlatCertificate Γ) : FiniteCertificate Γ where
  K := C.K
  E := C.E.submatrix id flatIndex
  F := C.F.submatrix flatIndex id
  K_sign := C.K_sign
  E_sign := fun i j => C.E_sign i (flatIndex j)
  F_sign := fun i j => C.F_sign (flatIndex i) j
  K_gram := C.K_gram
  E_gram := by
    change C.E.submatrix id flatIndex * C.Eᵀ.submatrix flatIndex id = _
    rw [Matrix.submatrix_mul_equiv, C.E_gram, Matrix.submatrix_id_id]
  F_gram := by
    change C.F.submatrix flatIndex (Equiv.refl (Fin 12)) *
      C.Fᵀ.submatrix (Equiv.refl (Fin 12)) flatIndex = _
    rw [Matrix.submatrix_mul_equiv, C.F_gram]
    change (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ).submatrix flatIndex flatIndex -
      (4 : ℤ) • flatBlocks.submatrix flatIndex flatIndex = _
    rw [Matrix.submatrix_one_equiv, flatBlocks_submatrix]
  balanced := by
    change blockOnes (Fin 4) * C.Eᵀ.submatrix flatIndex id = 0
    calc
      blockOnes (Fin 4) * C.Eᵀ.submatrix flatIndex id =
          flatBlocks.submatrix flatIndex flatIndex * C.Eᵀ.submatrix flatIndex id := by
        rw [flatBlocks_submatrix]
      _ = (flatBlocks * C.Eᵀ).submatrix flatIndex id :=
        Matrix.submatrix_mul_equiv _ _ _ _ _
      _ = 0 := by
        rw [C.balanced]
        rfl
  cross := by
    change gammaPermutation Γ (Equiv.refl (Fin 4)) * C.Eᵀ.submatrix flatIndex id +
      C.F.submatrix flatIndex id * C.Kᵀ = 0
    calc
      gammaPermutation Γ (Equiv.refl (Fin 4)) * C.Eᵀ.submatrix flatIndex id +
          C.F.submatrix flatIndex id * C.Kᵀ =
          (flatGamma Γ).submatrix flatIndex flatIndex * C.Eᵀ.submatrix flatIndex id +
            C.F.submatrix flatIndex (Equiv.refl (Fin 12)) *
              C.Kᵀ.submatrix (Equiv.refl (Fin 12)) id := by
        rw [flatGamma_submatrix]
        rfl
      _ = (flatGamma Γ * C.Eᵀ).submatrix flatIndex id +
          (C.F * C.Kᵀ).submatrix flatIndex id := by
        rw [Matrix.submatrix_mul_equiv, Matrix.submatrix_mul_equiv]
      _ = (flatGamma Γ * C.Eᵀ + C.F * C.Kᵀ).submatrix flatIndex id := rfl
      _ = 0 := by
        rw [C.cross]
        rfl

@[simp]
theorem toFiniteCertificate_K (C : FlatCertificate Γ) : C.toFiniteCertificate.K = C.K := rfl

@[simp]
theorem toFiniteCertificate_E_apply (C : FlatCertificate Γ) (i : Fin 12)
    (p : BlockIndex (Fin 4)) : C.toFiniteCertificate.E i p = C.E i (flatIndex p) := rfl

@[simp]
theorem toFiniteCertificate_F_apply (C : FlatCertificate Γ) (p : BlockIndex (Fin 4))
    (i : Fin 12) : C.toFiniteCertificate.F p i = C.F (flatIndex p) i := rfl

end FlatCertificate

/-- The complete conditional transport starting from sixteen-position finite
data. All three sign properties and all five target identities are explicit. -/
theorem flat_border_certificate_transport {Q : Type*}
    [Fintype Q] [AddGroup Q] [DecidableEq Q]
    {Γ : Matrix (Fin 4) (Fin 4) ℤ} (C : FlatCertificate Γ) (e : Q ≃ Fin 4) :
    let T := C.toFiniteCertificate.transport e (negPermutation Q)
    SignMatrix C.K ∧ SignMatrix T.E ∧ SignMatrix T.F ∧
      C.K * C.Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      T.E * T.Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      T.F * T.Fᵀ =
        (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
          (4 : ℤ) • blockOnes Q ∧
      blockOnes Q * T.Eᵀ = 0 ∧ gammaReflection Γ * T.Eᵀ + T.F * C.Kᵀ = 0 :=
  border_certificate_transport C.toFiniteCertificate e

/-- A cardinality hypothesis suffices: the quotient labeling is constructed
inside the proof. The resulting matrices satisfy all five identities and all
three sign conditions with the original corner `C.K`. -/
theorem exists_transported_matrices_of_card_four {Q : Type*}
    [Fintype Q] [AddGroup Q] [DecidableEq Q]
    {Γ : Matrix (Fin 4) (Fin 4) ℤ} (C : FlatCertificate Γ)
    (hQ : Fintype.card Q = 4) :
    ∃ (E : Matrix (Fin 12) (BlockIndex Q) ℤ) (F : Matrix (BlockIndex Q) (Fin 12) ℤ),
      SignMatrix C.K ∧ SignMatrix E ∧ SignMatrix F ∧
        C.K * C.Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
        E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
        F * Fᵀ =
          (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
            (4 : ℤ) • blockOnes Q ∧
        blockOnes Q * Eᵀ = 0 ∧ gammaReflection Γ * Eᵀ + F * C.Kᵀ = 0 := by
  let e := Fintype.equivFinOfCardEq hQ
  let T := C.toFiniteCertificate.transport e (negPermutation Q)
  exact ⟨T.E, T.F, flat_border_certificate_transport C e⟩

end HadamardFixedBorder
