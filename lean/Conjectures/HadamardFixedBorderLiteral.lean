import Conjectures.HadamardFixedBorderFin16
import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Fintype.Defs

/-!
# The literal integer fixed-border certificate

Generated from the exact K/E/F sign strings in
`results/hadamard-2396/border.json`. Regenerate or check with
`python3 scripts/generate_hadamard_fixed_border_literal.py --check`.
All finite identities below are independently reduced by Lean's kernel.
-/

namespace HadamardFixedBorder.Literal

open Matrix

attribute [local instance 2000] Fintype.decidableForallFintype

def gamma : Matrix (Fin 4) (Fin 4) ℤ :=
  ![![0, 2, 2, 2], ![-2, 0, 2, -2], ![-2, -2, 0, 2], ![-2, 2, -2, 0]]

def K : Matrix (Fin 12) (Fin 12) ℤ :=
  ![
    ![1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ![-1, 1, 1, -1, 1, -1, 1, -1, -1, -1, 1, 1],
    ![-1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1, -1],
    ![1, -1, 1, 1, -1, -1, -1, -1, 1, -1, 1, 1],
    ![-1, -1, 1, 1, 1, -1, 1, -1, 1, 1, -1, -1],
    ![1, -1, -1, -1, 1, 1, 1, -1, 1, -1, 1, -1],
    ![-1, 1, -1, 1, -1, 1, 1, -1, 1, -1, -1, 1],
    ![-1, -1, 1, 1, -1, 1, 1, 1, -1, -1, 1, -1],
    ![-1, 1, 1, -1, -1, 1, -1, -1, 1, 1, 1, -1],
    ![-1, -1, 1, -1, 1, 1, -1, 1, 1, -1, -1, 1],
    ![-1, -1, -1, 1, 1, 1, -1, -1, -1, 1, 1, 1],
    ![-1, -1, -1, -1, -1, -1, 1, 1, 1, 1, 1, 1]
  ]

def E : Matrix (Fin 12) (Fin 16) ℤ :=
  ![
    ![-1, 1, 1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, -1, 1, -1],
    ![-1, 1, 1, -1, -1, -1, 1, 1, -1, 1, -1, 1, -1, 1, 1, -1],
    ![1, 1, -1, -1, -1, 1, -1, 1, 1, -1, -1, 1, 1, 1, -1, -1],
    ![1, -1, 1, -1, -1, 1, 1, -1, -1, -1, 1, 1, 1, -1, 1, -1],
    ![1, -1, 1, -1, 1, 1, -1, -1, -1, 1, -1, 1, -1, 1, -1, 1],
    ![-1, 1, 1, -1, -1, 1, 1, -1, 1, -1, 1, -1, -1, 1, -1, 1],
    ![-1, 1, 1, -1, 1, -1, -1, 1, -1, -1, 1, 1, 1, -1, -1, 1],
    ![1, 1, -1, -1, -1, 1, -1, 1, -1, 1, 1, -1, -1, -1, 1, 1],
    ![-1, 1, -1, 1, 1, 1, -1, -1, -1, -1, 1, 1, -1, 1, 1, -1],
    ![1, 1, -1, -1, 1, -1, 1, -1, -1, 1, 1, -1, 1, 1, -1, -1],
    ![1, -1, 1, -1, 1, -1, -1, 1, 1, -1, 1, -1, -1, 1, 1, -1],
    ![-1, -1, 1, 1, -1, 1, -1, 1, -1, 1, 1, -1, 1, 1, -1, -1]
  ]

def F : Matrix (Fin 16) (Fin 12) ℤ :=
  ![
    ![-1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1],
    ![1, 1, -1, 1, -1, 1, -1, -1, -1, -1, -1, 1],
    ![-1, 1, -1, 1, 1, -1, 1, 1, 1, 1, -1, -1],
    ![1, -1, 1, -1, 1, 1, -1, 1, 1, 1, 1, 1],
    ![-1, -1, 1, 1, -1, -1, -1, 1, 1, -1, -1, 1],
    ![-1, 1, -1, -1, 1, 1, -1, -1, 1, -1, 1, -1],
    ![1, 1, 1, 1, 1, -1, 1, -1, -1, 1, 1, 1],
    ![1, -1, -1, -1, -1, 1, 1, 1, -1, 1, -1, -1],
    ![-1, -1, 1, 1, 1, 1, -1, -1, -1, 1, -1, -1],
    ![1, 1, 1, 1, -1, 1, 1, 1, 1, -1, 1, -1],
    ![1, -1, -1, -1, 1, -1, 1, -1, 1, -1, -1, 1],
    ![-1, 1, -1, -1, -1, -1, -1, 1, -1, 1, 1, 1],
    ![1, -1, -1, 1, 1, -1, -1, 1, -1, -1, 1, -1],
    ![-1, 1, 1, -1, 1, 1, 1, 1, -1, -1, -1, 1],
    ![-1, -1, -1, 1, -1, 1, 1, -1, 1, 1, 1, 1],
    ![1, 1, 1, -1, -1, -1, -1, -1, 1, 1, -1, -1]
  ]

theorem K_sign : SignMatrix K := by
  unfold SignMatrix
  decide +kernel

theorem E_sign : SignMatrix E := by
  unfold SignMatrix
  decide +kernel

theorem F_sign : SignMatrix F := by
  unfold SignMatrix
  decide +kernel

theorem K_gram :
    K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) := by
  apply Matrix.ext
  decide +kernel

theorem E_gram :
    E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) := by
  apply Matrix.ext
  decide +kernel

theorem F_gram :
    F * Fᵀ = (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ) -
      (4 : ℤ) • flatBlocks := by
  apply Matrix.ext
  decide +kernel

theorem balanced : flatBlocks * Eᵀ = 0 := by
  apply Matrix.ext
  decide +kernel

theorem cross : flatGamma gamma * Eᵀ + F * Kᵀ = 0 := by
  apply Matrix.ext
  decide +kernel

def certificate : FlatCertificate gamma where
  K := K
  E := E
  F := F
  K_sign := K_sign
  E_sign := E_sign
  F_sign := F_sign
  K_gram := K_gram
  E_gram := E_gram
  F_gram := F_gram
  balanced := balanced
  cross := cross

/-- The published signs and all five matrix identities, with no certificate
hypothesis or external finite computation assumed. -/
theorem literal_certificate_correct :
    SignMatrix K ∧ SignMatrix E ∧ SignMatrix F ∧
      K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
      F * Fᵀ = (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ) -
        (4 : ℤ) • flatBlocks ∧
      flatBlocks * Eᵀ = 0 ∧ flatGamma gamma * Eᵀ + F * Kᵀ = 0 :=
  ⟨K_sign, E_sign, F_sign, K_gram, E_gram, F_gram, balanced, cross⟩

/-- The actual fixed border exists for every additive group of cardinality four.
The literal finite-certificate premise of the general transport is discharged. -/
theorem exists_border_of_card_four {Q : Type*}
    [Fintype Q] [AddGroup Q] [DecidableEq Q] (hQ : Fintype.card Q = 4) :
    ∃ (E : Matrix (Fin 12) (BlockIndex Q) ℤ)
      (F : Matrix (BlockIndex Q) (Fin 12) ℤ),
      SignMatrix K ∧ SignMatrix E ∧ SignMatrix F ∧
        K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
        E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧
        F * Fᵀ = (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
          (4 : ℤ) • blockOnes Q ∧
        blockOnes Q * Eᵀ = 0 ∧ gammaReflection gamma * Eᵀ + F * Kᵀ = 0 :=
  exists_transported_matrices_of_card_four certificate hQ

end HadamardFixedBorder.Literal
