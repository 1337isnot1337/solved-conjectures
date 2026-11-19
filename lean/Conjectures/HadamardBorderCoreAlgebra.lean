import Conjectures.HadamardBorderNormalizationTransportOps
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic.Abel

/-!
# Convolution and the two Hankel matrices

These matrices are defined from the actual integer row values on an arbitrary
finite abelian group. Every product identity is proved by a bijective change
of the summation variable. No matrix Gram relation is a hypothesis.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G : Type*} [AddCommGroup G]

/-- The convolution matrix of an actual row. -/
def convolution (f : G → ℤ) : Matrix G G ℤ :=
  fun x y => f (x - y)

/-- The positive Hankel matrix of an actual row. -/
def positiveHankel (f : G → ℤ) : Matrix G G ℤ :=
  fun x y => f (x + y)

/-- The negative Hankel matrix of an actual row. -/
def negativeHankel (f : G → ℤ) : Matrix G G ℤ :=
  fun x y => f (-x - y)

/-- Reflection about a translate, used only to reindex finite sums. -/
def reflectionTranslation (t : G) : Equiv.Perm G where
  toFun := fun x => t - x
  invFun := fun x => t - x
  left_inv := by intro x; dsimp; abel
  right_inv := by intro x; dsimp; abel

theorem convolution_transpose (f : G → ℤ) :
    (convolution f)ᵀ = convolution (fun x => f (-x)) := by
  ext x y
  change f (y - x) = f (-(x - y))
  congr 1
  abel

theorem positiveHankel_transpose (f : G → ℤ) :
    (positiveHankel f)ᵀ = positiveHankel f := by
  ext x y
  change f (y + x) = f (x + y)
  rw [add_comm]

theorem negativeHankel_transpose (f : G → ℤ) :
    (negativeHankel f)ᵀ = negativeHankel f := by
  ext x y
  change f (-y - x) = f (-x - y)
  congr 1
  abel

section Products

variable [Fintype G]

/-- The row autocorrelation evaluated at the difference of matrix indices. -/
def correlationMatrix (f : G → ℤ) : Matrix G G ℤ :=
  fun x y => correlation f (x - y)

theorem convolution_mul_positiveHankel (f g : G → ℤ) :
    convolution f * positiveHankel g =
      positiveHankel g * (convolution f)ᵀ := by
  ext x y
  simp only [Matrix.mul_apply, Matrix.transpose_apply, convolution, positiveHankel]
  apply Fintype.sum_equiv (Equiv.addRight (y - x))
  intro z
  change f (x - z) * g (z + y) =
    g (x + (z + (y - x))) * f (y - (z + (y - x)))
  have h₁ : x + (z + (y - x)) = z + y := by abel
  have h₂ : y - (z + (y - x)) = x - z := by abel
  rw [h₁, h₂, mul_comm]

theorem convolution_mul_negativeHankel (f g : G → ℤ) :
    convolution f * negativeHankel g =
      negativeHankel g * (convolution f)ᵀ := by
  ext x y
  simp only [Matrix.mul_apply, Matrix.transpose_apply, convolution, negativeHankel]
  apply Fintype.sum_equiv (Equiv.addRight (y - x))
  intro z
  change f (x - z) * g (-z - y) =
    g (-x - (z + (y - x))) * f (y - (z + (y - x)))
  have h₁ : -x - (z + (y - x)) = -z - y := by abel
  have h₂ : y - (z + (y - x)) = x - z := by abel
  rw [h₁, h₂, mul_comm]

theorem positiveHankel_mul_negativeHankel_comm (f g : G → ℤ) :
    positiveHankel f * negativeHankel g =
      positiveHankel g * negativeHankel f := by
  ext x y
  simp only [Matrix.mul_apply, positiveHankel, negativeHankel]
  apply Fintype.sum_equiv (reflectionTranslation (-x - y))
  intro z
  change f (x + z) * g (-z - y) =
    g (x + ((-x - y) - z)) * f (-((-x - y) - z) - y)
  have h₁ : x + ((-x - y) - z) = -z - y := by abel
  have h₂ : -((-x - y) - z) - y = x + z := by abel
  rw [h₁, h₂, mul_comm]

theorem negativeHankel_mul_positiveHankel_comm (f g : G → ℤ) :
    negativeHankel f * positiveHankel g =
      negativeHankel g * positiveHankel f := by
  ext x y
  simp only [Matrix.mul_apply, positiveHankel, negativeHankel]
  apply Fintype.sum_equiv (reflectionTranslation (-x - y))
  intro z
  change f (-x - z) * g (z + y) =
    g (-x - ((-x - y) - z)) * f (((-x - y) - z) + y)
  have h₁ : -x - ((-x - y) - z) = z + y := by abel
  have h₂ : ((-x - y) - z) + y = -x - z := by abel
  rw [h₁, h₂, mul_comm]

theorem positiveHankel_mul_positiveHankel (f g : G → ℤ) :
    positiveHankel f * positiveHankel g =
      negativeHankel g * negativeHankel f := by
  ext x y
  simp only [Matrix.mul_apply, positiveHankel, negativeHankel]
  apply Fintype.sum_equiv (reflectionTranslation (-x - y))
  intro z
  change f (x + z) * g (z + y) =
    g (-x - ((-x - y) - z)) * f (-((-x - y) - z) - y)
  have h₁ : -x - ((-x - y) - z) = z + y := by abel
  have h₂ : -((-x - y) - z) - y = x + z := by abel
  rw [h₁, h₂, mul_comm]

theorem convolution_gram (f : G → ℤ) :
    convolution f * (convolution f)ᵀ = correlationMatrix f := by
  ext x y
  simp only [Matrix.mul_apply, Matrix.transpose_apply, convolution,
    correlationMatrix, correlation]
  apply Fintype.sum_equiv (reflectionTranslation y)
  intro z
  change f (x - z) * f (y - z) =
    f (y - z) * f ((y - z) + (x - y))
  have h : (y - z) + (x - y) = x - z := by abel
  rw [h, mul_comm]

theorem negativeHankel_square (f : G → ℤ) :
    negativeHankel f * negativeHankel f = correlationMatrix f := by
  ext x y
  simp only [Matrix.mul_apply, negativeHankel, correlationMatrix, correlation]
  apply Fintype.sum_equiv (reflectionTranslation (-x))
  intro z
  change f (-x - z) * f (-z - y) =
    f (-x - z) * f ((-x - z) + (x - y))
  have h : (-x - z) + (x - y) = -z - y := by abel
  rw [h]

theorem positiveHankel_square (f : G → ℤ) :
    positiveHankel f * positiveHankel f = correlationMatrix f := by
  rw [positiveHankel_mul_positiveHankel, negativeHankel_square]

end Products

end HadamardBorderConstruction
