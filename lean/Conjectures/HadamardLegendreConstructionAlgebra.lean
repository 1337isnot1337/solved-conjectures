import Conjectures.HadamardLegendreBasic
import Conjectures.HadamardBorderCoreAlgebra
import Mathlib.Data.Matrix.Block

/-!
# Convolution algebra for the actual two-row Hadamard construction

The matrices below are built from the original rows. Their commutation,
normality, row and column sums, and the two-row block Gram identity follow
from finite reindexing and the Legendre-pair correlation equation.
-/

namespace HadamardLegendre

open scoped BigOperators
open Matrix HadamardBorderNormalizationTransport HadamardBorderConstruction

def legendreOnes (G : Type*) : Matrix G G ℤ := fun _ _ => 1

variable {G : Type*} [AddCommGroup G]

def twoRowCore (f : Rows2 G) : Matrix (G ⊕ G) (G ⊕ G) ℤ :=
  Matrix.fromBlocks (convolution (f 0)) (convolution (f 1))
    (-(convolution (f 1))ᵀ) (convolution (f 0))ᵀ

section Finite

variable [Fintype G]

theorem convolution_commute (f g : G → ℤ) :
    convolution f * convolution g = convolution g * convolution f := by
  ext x y
  simp only [Matrix.mul_apply, convolution]
  apply Fintype.sum_equiv (reflectionTranslation (x + y))
  intro z
  change f (x - z) * g (z - y) =
    g (x - ((x + y) - z)) * f (((x + y) - z) - y)
  have h₁ : x - ((x + y) - z) = z - y := by abel
  have h₂ : ((x + y) - z) - y = x - z := by abel
  rw [h₁, h₂, mul_comm]

theorem convolution_normal (f : G → ℤ) :
    (convolution f)ᵀ * convolution f = convolution f * (convolution f)ᵀ := by
  rw [convolution_transpose]
  exact convolution_commute (fun x => f (-x)) f

theorem convolution_row_sum (f : G → ℤ) (x : G) :
    (∑ y, convolution f x y) = rowSum f :=
  Equiv.sum_comp (reflectionTranslation x) f

theorem convolution_column_sum (f : G → ℤ) (y : G) :
    (∑ x, convolution f x y) = rowSum f := by
  have h := Equiv.sum_comp (Equiv.addRight (-y)) f
  change (∑ x, f (x + -y)) = ∑ x, f x at h
  simpa only [convolution, sub_eq_add_neg, rowSum] using h

theorem pair_convolution_gram [DecidableEq G] (f : Rows2 G) (hf : IsLegendrePair f) :
    convolution (f 0) * (convolution (f 0))ᵀ +
      convolution (f 1) * (convolution (f 1))ᵀ =
        (2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix G G ℤ) -
          (2 : ℤ) • legendreOnes G := by
  rw [convolution_gram, convolution_gram]
  ext x y
  change correlation (f 0) (x - y) + correlation (f 1) (x - y) =
    (2 * (Fintype.card G : ℤ) + 2) * (if x = y then 1 else 0) - 2 * 1
  have hpair (u : G) :
      correlation (f 0) u + correlation (f 1) u = pairCorrelation f u := by
    simp only [pairCorrelation, Fin.sum_univ_two]
  rw [hpair]
  by_cases h : x = y
  · subst y
    rw [sub_self, pairCorrelation_zero f hf.1]
    simp only [ite_true, mul_one]
    ring
  · rw [hf.2 (x - y) (sub_ne_zero.mpr h), ite_eq_right h]
    ring

theorem twoRowCore_gram [DecidableEq G] (f : Rows2 G) (hf : IsLegendrePair f) :
    twoRowCore f * (twoRowCore f)ᵀ =
      Matrix.fromBlocks
        ((2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix G G ℤ) -
          (2 : ℤ) • legendreOnes G) 0 0
        ((2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix G G ℤ) -
          (2 : ℤ) • legendreOnes G) := by
  let A := convolution (f 0)
  let B := convolution (f 1)
  let D := (2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix G G ℤ) -
    (2 : ℤ) • legendreOnes G
  have hAB : A * B = B * A := convolution_commute (f 0) (f 1)
  have hBA : Bᵀ * Aᵀ = Aᵀ * Bᵀ := by
    simpa only [Matrix.transpose_mul] using congrArg Matrix.transpose hAB
  have htop : A * Aᵀ + B * Bᵀ = D := pair_convolution_gram f hf
  have hright : A * (-B) + B * A = 0 := by
    rw [mul_neg, hAB, neg_add_cancel]
  have hleft : (-Bᵀ) * Aᵀ + Aᵀ * Bᵀ = 0 := by
    rw [neg_mul, hBA, neg_add_cancel]
  have hbottom : (-Bᵀ) * (-B) + Aᵀ * A = D := by
    rw [neg_mul_neg, convolution_normal (f 1), convolution_normal (f 0), add_comm]
    exact htop
  change Matrix.fromBlocks A B (-Bᵀ) Aᵀ *
    (Matrix.fromBlocks A B (-Bᵀ) Aᵀ)ᵀ = Matrix.fromBlocks D 0 0 D
  rw [Matrix.fromBlocks_transpose, Matrix.fromBlocks_multiply]
  simp only [Matrix.transpose_neg, Matrix.transpose_transpose]
  rw [htop, hright, hleft, hbottom]

end Finite

end HadamardLegendre
