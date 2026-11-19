import Conjectures.HadamardLegendreConstructionAlgebra
import Mathlib.LinearAlgebra.Matrix.HadamardMatrix
import Mathlib.Tactic.FinCases

/-!
# An actual Hadamard matrix from an actual Legendre pair

The two border rows and columns are fixed sign vectors. The remaining
blocks are the convolution matrices of the two normalized input rows.
The full Gram identity is proved block by block, and the final theorem
normalizes the original row sums rather than assuming them.
-/

namespace HadamardLegendre

open scoped BigOperators
open Matrix HadamardBorderNormalizationTransport HadamardBorderConstruction

abbrev TwoRowIndex (G : Type*) := Fin 2 ⊕ (G ⊕ G)

def twoRowCorner : Matrix (Fin 2) (Fin 2) ℤ :=
  ![![-1, -1], ![-1, 1]]

def twoRowTop (G : Type*) : Matrix (Fin 2) (G ⊕ G) ℤ :=
  fun i => Sum.elim (fun _ => 1) (fun _ => if i = 0 then 1 else -1)

def twoRowSide (G : Type*) : Matrix (G ⊕ G) (Fin 2) ℤ :=
  Sum.elim (fun _ _ => 1) (fun _ i => if i = 0 then -1 else 1)

theorem twoRowIndex_card (G : Type*) [Fintype G] :
    Fintype.card (TwoRowIndex G) = 2 * Fintype.card G + 2 := by
  simp only [TwoRowIndex, Fintype.card_sum, Fintype.card_fin]
  omega

variable {G : Type*} [AddCommGroup G]

def twoRowMatrix (f : Rows2 G) : Matrix (TwoRowIndex G) (TwoRowIndex G) ℤ :=
  Matrix.fromBlocks twoRowCorner (twoRowTop G) (twoRowSide G) (twoRowCore f)

theorem twoRowCorner_sign (i j : Fin 2) :
    twoRowCorner i j = 1 ∨ twoRowCorner i j = -1 := by
  fin_cases i <;> fin_cases j <;> norm_num [twoRowCorner]

omit [AddCommGroup G] in
theorem twoRowTop_sign (i : Fin 2) (x : G ⊕ G) :
    twoRowTop G i x = 1 ∨ twoRowTop G i x = -1 := by
  rcases x with x | x <;> fin_cases i <;> norm_num [twoRowTop]

omit [AddCommGroup G] in
theorem twoRowSide_sign (x : G ⊕ G) (i : Fin 2) :
    twoRowSide G x i = 1 ∨ twoRowSide G x i = -1 := by
  rcases x with x | x <;> fin_cases i <;> norm_num [twoRowSide]

theorem twoRowCore_sign (f : Rows2 G) (hf : ∀ i, SignValued (f i))
    (x y : G ⊕ G) : twoRowCore f x y = 1 ∨ twoRowCore f x y = -1 := by
  rcases x with x | x <;> rcases y with y | y
  · exact hf 0 (x - y)
  · exact hf 1 (x - y)
  · change -f 1 (y - x) = 1 ∨ -f 1 (y - x) = -1
    rcases hf 1 (y - x) with h | h <;> norm_num [h]
  · exact hf 0 (y - x)

theorem twoRowMatrix_sign (f : Rows2 G) (hf : ∀ i, SignValued (f i))
    (x y : TwoRowIndex G) :
    twoRowMatrix f x y = 1 ∨ twoRowMatrix f x y = -1 := by
  rcases x with x | x <;> rcases y with y | y
  · exact twoRowCorner_sign x y
  · exact twoRowTop_sign x y
  · exact twoRowSide_sign x y
  · exact twoRowCore_sign f hf x y

theorem twoRowCorner_gram :
    twoRowCorner * twoRowCornerᵀ = (2 : ℤ) • (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  ext i j
  change (∑ k : Fin 2, twoRowCorner i k * twoRowCorner j k) = _
  fin_cases i <;> fin_cases j <;>
    norm_num [twoRowCorner, Fin.sum_univ_two, Matrix.one_apply]

section Finite

variable [Fintype G]

omit [AddCommGroup G] in
theorem twoRowTop_gram :
    twoRowTop G * (twoRowTop G)ᵀ =
      (2 * (Fintype.card G : ℤ)) • (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [twoRowTop, Matrix.mul_apply, Fintype.sum_sum_type] <;> ring

omit [AddCommGroup G] [Fintype G] in
theorem twoRowSide_gram :
    twoRowSide G * (twoRowSide G)ᵀ =
      Matrix.fromBlocks ((2 : ℤ) • legendreOnes G) 0 0 ((2 : ℤ) • legendreOnes G) := by
  ext x y
  change (∑ k : Fin 2, twoRowSide G x k * twoRowSide G y k) = _
  rcases x with x | x <;> rcases y with y | y <;>
    norm_num [twoRowSide, Fin.sum_univ_two,
      Matrix.fromBlocks, legendreOnes]

omit [AddCommGroup G] in
theorem twoRow_top_gram :
    twoRowCorner * twoRowCornerᵀ + twoRowTop G * (twoRowTop G)ᵀ =
      (2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix (Fin 2) (Fin 2) ℤ) := by
  rw [twoRowCorner_gram, twoRowTop_gram, ← add_smul, add_comm]

theorem twoRow_lower_cross (f : Rows2 G) (hsum : ∀ i, rowSum (f i) = 1) :
    twoRowSide G * twoRowCornerᵀ + twoRowCore f * (twoRowTop G)ᵀ = 0 := by
  ext x j
  simp only [Matrix.add_apply, Matrix.mul_apply, Matrix.transpose_apply, Matrix.zero_apply]
  rcases x with x | x <;> fin_cases j <;>
    norm_num [twoRowSide, twoRowCorner, twoRowCore, twoRowTop,
      Matrix.fromBlocks, Fintype.sum_sum_type, Fin.sum_univ_two,
      convolution_row_sum, convolution_column_sum, hsum, Finset.sum_neg_distrib]

theorem twoRow_upper_cross (f : Rows2 G) (hsum : ∀ i, rowSum (f i) = 1) :
    twoRowCorner * (twoRowSide G)ᵀ + twoRowTop G * (twoRowCore f)ᵀ = 0 := by
  have h := congrArg Matrix.transpose (twoRow_lower_cross f hsum)
  simpa only [Matrix.transpose_add, Matrix.transpose_mul,
    Matrix.transpose_transpose, Matrix.transpose_zero] using h

theorem twoRow_bottom_gram [DecidableEq G] (f : Rows2 G) (hf : IsLegendrePair f) :
    twoRowSide G * (twoRowSide G)ᵀ + twoRowCore f * (twoRowCore f)ᵀ =
      (2 * (Fintype.card G : ℤ) + 2) • (1 : Matrix (G ⊕ G) (G ⊕ G) ℤ) := by
  let N : ℤ := 2 * (Fintype.card G : ℤ) + 2
  have hcancel : (2 : ℤ) • legendreOnes G +
      (N • (1 : Matrix G G ℤ) - (2 : ℤ) • legendreOnes G) =
        N • (1 : Matrix G G ℤ) := by abel
  rw [twoRowSide_gram, twoRowCore_gram f hf, Matrix.fromBlocks_add, hcancel]
  simp only [add_zero]
  simpa only [smul_zero, Matrix.fromBlocks_one] using
    (Matrix.fromBlocks_smul N (1 : Matrix G G ℤ) (0 : Matrix G G ℤ)
      (0 : Matrix G G ℤ) (1 : Matrix G G ℤ)).symm

/-- The complete Gram identity for the matrix built from normalized actual rows. -/
theorem twoRowMatrix_gram [DecidableEq G] (f : Rows2 G) (hf : IsLegendrePair f)
    (hsum : ∀ i, rowSum (f i) = 1) :
    twoRowMatrix f * (twoRowMatrix f)ᵀ =
      (2 * (Fintype.card G : ℤ) + 2) •
        (1 : Matrix (TwoRowIndex G) (TwoRowIndex G) ℤ) := by
  unfold twoRowMatrix
  rw [Matrix.fromBlocks_transpose, Matrix.fromBlocks_multiply, twoRow_top_gram,
    twoRow_lower_cross f hsum, twoRow_upper_cross f hsum, twoRow_bottom_gram f hf]
  simpa only [smul_zero, Matrix.fromBlocks_one] using
    (Matrix.fromBlocks_smul (2 * (Fintype.card G : ℤ) + 2)
      (1 : Matrix (Fin 2) (Fin 2) ℤ) (0 : Matrix (Fin 2) (G ⊕ G) ℤ)
      (0 : Matrix (G ⊕ G) (Fin 2) ℤ) (1 : Matrix (G ⊕ G) (G ⊕ G) ℤ)).symm

theorem twoRowMatrix_isHadamard [DecidableEq G] (f : Rows2 G) (hf : IsLegendrePair f)
    (hsum : ∀ i, rowSum (f i) = 1) : (twoRowMatrix f).IsHadamard := by
  classical
  apply Matrix.IsHadamard.of_mul_conjTranspose
  · intro i j
    rcases twoRowMatrix_sign f hf.1 i j with h | h <;> simp [Unitary.mem_iff, h]
  · have hcard : (Fintype.card (TwoRowIndex G) : ℤ) =
        2 * (Fintype.card G : ℤ) + 2 := by
      simp only [twoRowIndex_card, Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat]
    simpa only [Matrix.conjTranspose_eq_transpose_of_trivial, hcard] using
      twoRowMatrix_gram f hf hsum
  · apply isRegular_iff_ne_zero.mpr
    exact_mod_cast (Fintype.card_pos_iff.mpr (inferInstance : Nonempty (TwoRowIndex G))).ne'

/-- Original sign rows and their off-zero correlations alone give the matrix. -/
theorem exists_hadamard_of_legendre_pair (f : Rows2 G) (hf : IsLegendrePair f) :
    ∃ H : Matrix (Fin (2 * Fintype.card G + 2)) (Fin (2 * Fintype.card G + 2)) ℤ,
      H.IsHadamard := by
  classical
  let g := normalizeSigns f
  have hg : IsLegendrePair g := normalizeSigns_isLegendrePair f hf
  have hsum : ∀ i, rowSum (g i) = 1 := normalizeSigns_rowSum f hf
  let e : TwoRowIndex G ≃ Fin (2 * Fintype.card G + 2) :=
    Fintype.equivFinOfCardEq (twoRowIndex_card G)
  exact ⟨Matrix.reindex e e (twoRowMatrix g), (twoRowMatrix_isHadamard g hg hsum).reindex e e⟩

theorem exists_hadamard_2396_of_legendre_pair (f : Rows2 G) (hf : IsLegendrePair f)
    (hcard : Fintype.card G = 1197) :
    ∃ H : Matrix (Fin 2396) (Fin 2396) ℤ, H.IsHadamard := by
  have horder : 2 * Fintype.card G + 2 = 2396 := by rw [hcard]
  rw [← horder]
  exact exists_hadamard_of_legendre_pair f hf

end Finite

end HadamardLegendre
