import Conjectures.HadamardBorderCoreAlgebra
import Conjectures.HadamardFixedBorderTransport
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.Ring

/-!
# The actual four-row Goethals--Seidel core

The core entries are the convolution, positive Hankel, and negative Hankel
entries of the four input rows. The sixteen block products are reduced to
the finite-sum identities in CoreAlgebra. Neither its sign property nor its
Gram identity is an assumed matrix certificate.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

variable {G : Type*} [AddCommGroup G]

/-- The coefficient array for the fixed border. -/
def gamma : Matrix (Fin 4) (Fin 4) ℤ :=
  ![![0, 2, 2, 2], ![-2, 0, 2, -2], ![-2, -2, 0, 2], ![-2, 2, -2, 0]]

/-- The literal block table of the core. -/
def coreBlocks (f : Rows G) : Matrix (Fin 4) (Fin 4) (Matrix G G ℤ) :=
  ![![convolution (f 0), positiveHankel (f 1), positiveHankel (f 2),
        positiveHankel (f 3)],
    ![-positiveHankel (f 1), convolution (f 0), negativeHankel (f 3),
        -negativeHankel (f 2)],
    ![-positiveHankel (f 2), -negativeHankel (f 3), convolution (f 0),
        negativeHankel (f 1)],
    ![-positiveHankel (f 3), negativeHankel (f 2), -negativeHankel (f 1),
        convolution (f 0)]]

/-- The actual matrix, indexed by a row label and a group element. -/
def core (f : Rows G) : Matrix (BlockIndex G) (BlockIndex G) ℤ :=
  fun p q => coreBlocks f p.1 q.1 p.2 q.2

private theorem neg_sign {a : ℤ} (ha : a = 1 ∨ a = -1) :
    -a = 1 ∨ -a = -1 := by
  rcases ha with ha | ha
  · right
    rw [ha]
  · left
    rw [ha, neg_neg]

/-- Every actual core entry is a sign whenever the input rows are signs. -/
theorem core_sign (f : Rows G) (hf : ∀ i, SignValued (f i)) :
    SignMatrix (core f) := by
  intro ⟨i, x⟩ ⟨j, y⟩
  fin_cases i <;> fin_cases j <;>
    dsimp [core, coreBlocks, convolution, positiveHankel, negativeHankel]
  all_goals first | exact hf _ _ | exact neg_sign (hf _ _)

section Gram

variable [Fintype G]

/-- A Gram entry is the sum of the four actual block products. -/
theorem core_gram_apply_blocks (f : Rows G) (i j : Fin 4) (x y : G) :
    (core f * (core f)ᵀ) (i, x) (j, y) =
      (coreBlocks f i 0 * (coreBlocks f j 0)ᵀ +
       coreBlocks f i 1 * (coreBlocks f j 1)ᵀ +
       coreBlocks f i 2 * (coreBlocks f j 2)ᵀ +
       coreBlocks f i 3 * (coreBlocks f j 3)ᵀ) x y := by
  simp only [Matrix.mul_apply, Matrix.transpose_apply, core,
    Fintype.sum_prod_type, Fin.sum_univ_four, Matrix.add_apply]

/-- All sixteen block products follow from the convolution identities. -/
theorem core_blocks_gram (f : Rows G) (i j : Fin 4) :
    coreBlocks f i 0 * (coreBlocks f j 0)ᵀ +
      coreBlocks f i 1 * (coreBlocks f j 1)ᵀ +
      coreBlocks f i 2 * (coreBlocks f j 2)ᵀ +
      coreBlocks f i 3 * (coreBlocks f j 3)ᵀ =
    if i = j then
      correlationMatrix (f 0) + correlationMatrix (f 1) +
        correlationMatrix (f 2) + correlationMatrix (f 3)
    else 0 := by
  fin_cases i <;> fin_cases j <;>
    simp [coreBlocks, Matrix.transpose_neg, positiveHankel_transpose,
      negativeHankel_transpose, convolution_mul_positiveHankel,
      convolution_mul_negativeHankel, positiveHankel_mul_positiveHankel,
      convolution_gram, negativeHankel_square,
      positiveHankel_mul_negativeHankel_comm,
      negativeHankel_mul_positiveHankel_comm] <;> abel

/-- The exact Gram formula for arbitrary actual integer rows. -/
theorem core_gram_apply (f : Rows G) (i j : Fin 4) (x y : G) :
    (core f * (core f)ᵀ) (i, x) (j, y) =
      if i = j then combinedCorrelation f (x - y) else 0 := by
  rw [core_gram_apply_blocks, core_blocks_gram]
  by_cases h : i = j <;>
    simp [h, combinedCorrelation, Fin.sum_univ_four, correlationMatrix]

/-- The block diagonal all-ones matrix on the original group. -/
abbrev blockOnesG (G : Type*) : Matrix (BlockIndex G) (BlockIndex G) ℤ :=
  blockOnes G

/-- Two positions are in the same quotient fiber within the same row block. -/
def kernelBlocks {Q : Type*} [AddCommGroup Q] [DecidableEq Q]
    (π : G →+ Q) : Matrix (BlockIndex G) (BlockIndex G) ℤ :=
  fun p q => if p.1 = q.1 ∧ π p.2 = π q.2 then 1 else 0

/-- The two-level correlation formula gives the required core Gram matrix. -/
theorem core_gram_of_correlation_formula
    {Q : Type*} [AddCommGroup Q] [DecidableEq Q] [DecidableEq G]
    (π : G →+ Q) (f : Rows G)
    (hcorrelation : ∀ u, combinedCorrelation f u =
      if u = 0 then 4 * (Fintype.card G : ℤ)
      else if π u = 0 then -12 else 4) :
    core f * (core f)ᵀ =
      (4 * (Fintype.card G : ℤ) + 12) •
        (1 : Matrix (BlockIndex G) (BlockIndex G) ℤ) +
      (4 : ℤ) • blockOnesG G - (16 : ℤ) • kernelBlocks π := by
  ext ⟨i, x⟩ ⟨j, y⟩
  rw [core_gram_apply]
  simp only [Matrix.add_apply, Matrix.sub_apply, Matrix.smul_apply]
  by_cases hi : i = j
  · subst j
    by_cases hxy : x = y
    · subst y
      simp [hcorrelation, blockOnesG, blockOnes, kernelBlocks]
      ring
    · by_cases hp : π x = π y <;>
        simp [hcorrelation, hxy, hp, map_sub, sub_eq_zero,
          blockOnesG, blockOnes, kernelBlocks]
  · simp [hi, blockOnesG, blockOnes, kernelBlocks]

end Gram

end HadamardBorderConstruction
