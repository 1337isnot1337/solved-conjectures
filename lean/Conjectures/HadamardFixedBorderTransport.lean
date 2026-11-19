import Mathlib.Data.Matrix.Mul
import Mathlib.Logic.Equiv.Fin.Basic

/-!
# Transport of a certified fixed border to a four-element quotient

This is a conditional matrix transport theorem. The five finite certificate
identities and all sign entries are explicit fields of the input certificate.
No literal certificate, core normalization, or Hadamard existence assertion is
assumed to have been proved by this module.

The right border is reindexed through a bijection of quotient labels. The left
border is also permuted within each quotient block. The latter permutation may
be arbitrary; in an additive group, negation gives the reflection required by
the fixed-border construction. The argument does not require a splitting of
any extension or a classification of groups of order four.
-/

namespace HadamardFixedBorder

open Matrix

/-- Four quotient blocks, each indexed by the quotient type. -/
abbrev BlockIndex (Q : Type*) := Fin 4 × Q

/-- Every entry of a rectangular integer matrix is a sign. -/
def SignMatrix {I J : Type*} (M : Matrix I J ℤ) : Prop :=
  ∀ i j, M i j = 1 ∨ M i j = -1

/-- The block diagonal matrix with an all-ones matrix in each block. -/
def blockOnes (Q : Type*) : Matrix (BlockIndex Q) (BlockIndex Q) ℤ :=
  fun p q => if p.1 = q.1 then 1 else 0

/-- The coefficient array with the same permutation inside every block. -/
def gammaPermutation {Q : Type*} [DecidableEq Q]
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) (r : Equiv.Perm Q) :
    Matrix (BlockIndex Q) (BlockIndex Q) ℤ :=
  fun p q => Γ p.1 q.1 * if r p.2 = q.2 then 1 else 0

/-- A relabeling which preserves the four block labels. -/
def blockEquiv {P Q : Type*} (e : Q ≃ P) : BlockIndex Q ≃ BlockIndex P :=
  Equiv.prodCongr (Equiv.refl (Fin 4)) e

@[simp]
theorem blockEquiv_apply {P Q : Type*} (e : Q ≃ P) (p : BlockIndex Q) :
    blockEquiv e p = (p.1, e p.2) := rfl

theorem blockOnes_submatrix {P Q : Type*} (e f : Q ≃ P) :
    (blockOnes P).submatrix (blockEquiv e) (blockEquiv f) = blockOnes Q := rfl

/-- The independent row permutation becomes the permutation in the core's
coefficient array after relabeling. -/
theorem gammaPermutation_submatrix {P Q : Type*} [DecidableEq P] [DecidableEq Q]
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) (e : Q ≃ P) (r : Equiv.Perm Q) :
    (gammaPermutation Γ (Equiv.refl P)).submatrix
        (blockEquiv (r.trans e)) (blockEquiv e) = gammaPermutation Γ r := by
  ext ⟨i, x⟩ ⟨j, y⟩
  change Γ i j * (if e (r x) = e y then 1 else 0) =
    Γ i j * (if r x = y then 1 else 0)
  simp only [e.injective.eq_iff]

/-- All mathematical premises of the finite border are explicit. For the
literal finite data, use `Q = Fin 4` and the identity permutation. -/
structure Certificate (Q : Type*) [Fintype Q] [DecidableEq Q]
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) (r : Equiv.Perm Q) where
  K : Matrix (Fin 12) (Fin 12) ℤ
  E : Matrix (Fin 12) (BlockIndex Q) ℤ
  F : Matrix (BlockIndex Q) (Fin 12) ℤ
  K_sign : SignMatrix K
  E_sign : SignMatrix E
  F_sign : SignMatrix F
  K_gram : K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ)
  E_gram : E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ)
  F_gram : F * Fᵀ =
    (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) - (4 : ℤ) • blockOnes Q
  balanced : blockOnes Q * Eᵀ = 0
  cross : gammaPermutation Γ r * Eᵀ + F * Kᵀ = 0

/-- The source shape corresponding to sixteen quotient positions. -/
abbrev FiniteCertificate (Γ : Matrix (Fin 4) (Fin 4) ℤ) :=
  Certificate (Fin 4) Γ (Equiv.refl (Fin 4))

namespace Certificate

variable {P Q : Type*} [Fintype P] [Fintype Q] [DecidableEq P] [DecidableEq Q]
variable {Γ : Matrix (Fin 4) (Fin 4) ℤ}

/-- Transport the complete certificate. The right border only changes labels;
the left border also applies the specified quotient permutation. -/
def transport (C : Certificate P Γ (Equiv.refl P)) (e : Q ≃ P)
    (r : Equiv.Perm Q) : Certificate Q Γ r where
  K := C.K
  E := C.E.submatrix id (blockEquiv e)
  F := C.F.submatrix (blockEquiv (r.trans e)) id
  K_sign := C.K_sign
  E_sign := fun i j => C.E_sign i (blockEquiv e j)
  F_sign := fun i j => C.F_sign (blockEquiv (r.trans e) i) j
  K_gram := C.K_gram
  E_gram := by
    change C.E.submatrix id (blockEquiv e) * C.Eᵀ.submatrix (blockEquiv e) id = _
    rw [Matrix.submatrix_mul_equiv, C.E_gram, Matrix.submatrix_id_id]
  F_gram := by
    change C.F.submatrix (blockEquiv (r.trans e)) (Equiv.refl (Fin 12)) *
      C.Fᵀ.submatrix (Equiv.refl (Fin 12)) (blockEquiv (r.trans e)) = _
    rw [Matrix.submatrix_mul_equiv, C.F_gram]
    change (16 : ℤ) • (1 : Matrix (BlockIndex P) (BlockIndex P) ℤ).submatrix
        (blockEquiv (r.trans e)) (blockEquiv (r.trans e)) -
      (4 : ℤ) • (blockOnes P).submatrix
        (blockEquiv (r.trans e)) (blockEquiv (r.trans e)) = _
    rw [Matrix.submatrix_one_equiv, blockOnes_submatrix]
  balanced := by
    change blockOnes Q * C.Eᵀ.submatrix (blockEquiv e) id = 0
    calc
      blockOnes Q * C.Eᵀ.submatrix (blockEquiv e) id =
          (blockOnes P).submatrix (blockEquiv e) (blockEquiv e) *
            C.Eᵀ.submatrix (blockEquiv e) id := by rw [blockOnes_submatrix]
      _ = (blockOnes P * C.Eᵀ).submatrix (blockEquiv e) id :=
        Matrix.submatrix_mul_equiv _ _ _ _ _
      _ = 0 := by
        rw [C.balanced]
        rfl
  cross := by
    change gammaPermutation Γ r * C.Eᵀ.submatrix (blockEquiv e) id +
      C.F.submatrix (blockEquiv (r.trans e)) id * C.Kᵀ = 0
    calc
      gammaPermutation Γ r * C.Eᵀ.submatrix (blockEquiv e) id +
          C.F.submatrix (blockEquiv (r.trans e)) id * C.Kᵀ =
          (gammaPermutation Γ (Equiv.refl P)).submatrix
              (blockEquiv (r.trans e)) (blockEquiv e) *
              C.Eᵀ.submatrix (blockEquiv e) id +
            C.F.submatrix (blockEquiv (r.trans e)) (Equiv.refl (Fin 12)) *
              C.Kᵀ.submatrix (Equiv.refl (Fin 12)) id := by
        rw [gammaPermutation_submatrix]
        rfl
      _ = (gammaPermutation Γ (Equiv.refl P) * C.Eᵀ).submatrix
            (blockEquiv (r.trans e)) id +
          (C.F * C.Kᵀ).submatrix (blockEquiv (r.trans e)) id := by
        rw [Matrix.submatrix_mul_equiv, Matrix.submatrix_mul_equiv]
      _ = (gammaPermutation Γ (Equiv.refl P) * C.Eᵀ + C.F * C.Kᵀ).submatrix
            (blockEquiv (r.trans e)) id := rfl
      _ = 0 := by
        rw [C.cross]
        rfl

@[simp]
theorem transport_K (C : Certificate P Γ (Equiv.refl P))
    (e : Q ≃ P) (r : Equiv.Perm Q) : (C.transport e r).K = C.K := rfl

@[simp]
theorem transport_E_apply (C : Certificate P Γ (Equiv.refl P))
    (e : Q ≃ P) (r : Equiv.Perm Q) (i : Fin 12) (j : Fin 4) (q : Q) :
    (C.transport e r).E i (j, q) = C.E i (j, e q) := rfl

@[simp]
theorem transport_F_apply (C : Certificate P Γ (Equiv.refl P))
    (e : Q ≃ P) (r : Equiv.Perm Q) (j : Fin 4) (q : Q) (i : Fin 12) :
    (C.transport e r).F (j, q) i = C.F (j, e (r q)) i := rfl

end Certificate

/-- Negation as an actual permutation, including for groups of even order. -/
def negPermutation (Q : Type*) [AddGroup Q] : Equiv.Perm Q where
  toFun := Neg.neg
  invFun := Neg.neg
  left_inv := neg_neg
  right_inv := neg_neg

/-- The precise reflected coefficient array in the fixed-border argument. -/
def gammaReflection {Q : Type*} [AddGroup Q] [DecidableEq Q]
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) : Matrix (BlockIndex Q) (BlockIndex Q) ℤ :=
  fun p q => Γ p.1 q.1 * if p.2 = -q.2 then 1 else 0

theorem gammaPermutation_neg {Q : Type*} [AddGroup Q] [DecidableEq Q]
    (Γ : Matrix (Fin 4) (Fin 4) ℤ) :
    gammaPermutation Γ (negPermutation Q) = gammaReflection (Q := Q) Γ := by
  ext ⟨i, x⟩ ⟨j, y⟩
  change Γ i j * (if -x = y then 1 else 0) =
    Γ i j * (if x = -y then 1 else 0)
  simp only [neg_eq_iff_eq_neg]

/-- Reflection gives the required cross term for the actual transported
matrices, from precisely the finite certificate assumptions. -/
theorem reflected_cross {Q : Type*} [Fintype Q] [AddGroup Q] [DecidableEq Q]
    {Γ : Matrix (Fin 4) (Fin 4) ℤ} (C : FiniteCertificate Γ) (e : Q ≃ Fin 4) :
    gammaReflection Γ * (C.transport e (negPermutation Q)).Eᵀ +
      (C.transport e (negPermutation Q)).F * C.Kᵀ = 0 := by
  rw [← gammaPermutation_neg]
  exact (C.transport e (negPermutation Q)).cross

/-- The three sign conditions and all five transported identities. The
constant corner is unchanged, and the other matrices are the explicit
reindexings given by `transport_E_apply` and `transport_F_apply`. -/
theorem border_certificate_transport {Q : Type*} [Fintype Q] [AddGroup Q] [DecidableEq Q]
    {Γ : Matrix (Fin 4) (Fin 4) ℤ} (C : FiniteCertificate Γ) (e : Q ≃ Fin 4) :
    let T := C.transport e (negPermutation Q)
    SignMatrix C.K ∧ SignMatrix T.E ∧ SignMatrix T.F ∧
      C.K * C.Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      T.E * T.Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      T.F * T.Fᵀ =
        (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
          (4 : ℤ) • blockOnes Q ∧
      blockOnes Q * T.Eᵀ = 0 ∧ gammaReflection Γ * T.Eᵀ + T.F * C.Kᵀ = 0 :=
  ⟨C.K_sign, (C.transport e (negPermutation Q)).E_sign,
    (C.transport e (negPermutation Q)).F_sign, C.K_gram,
    (C.transport e (negPermutation Q)).E_gram,
    (C.transport e (negPermutation Q)).F_gram,
    (C.transport e (negPermutation Q)).balanced, reflected_cross C e⟩

end HadamardFixedBorder
