import Conjectures.HadamardBorderCoreAction

/-!
# Inflating the fixed border along the actual quotient

Surjectivity identifies every quotient fibre with the kernel. Summing over
the fibres multiplies the column-lift Gram matrix by the kernel cardinality.
Lifting rows is a direct pullback of the Gram matrix, with no multiplicity
factor because its summation index is unchanged.
-/

namespace HadamardBorderConstruction

open Matrix
open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

section Generic

variable {X Y I J : Type*}

theorem columns_lift_sign (p : X → Y) (E : Matrix I Y ℤ)
    (hE : SignMatrix E) : SignMatrix (E.submatrix id p) :=
  fun i x => hE i (p x)

theorem rows_lift_sign (p : X → Y) (F : Matrix Y I ℤ)
    (hF : SignMatrix F) : SignMatrix (inflateRows p F) :=
  fun x i => hF (p x) i

/-- Lifting rows commutes with multiplication on the right. -/
theorem inflateRows_mul [Fintype I] (p : X → Y)
    (F : Matrix Y I ℤ) (K : Matrix I J ℤ) :
    inflateRows p F * K = inflateRows p (F * K) := by
  ext x j
  rfl

end Generic

section Fibres

variable {G Q : Type*} [Fintype G] [Fintype Q]
  [AddCommGroup G] [AddCommGroup Q] [DecidableEq Q]

theorem sum_comp_quotient (π : G →+ Q) (hπ : Function.Surjective π)
    (w : Q → ℤ) :
    (∑ x, w (π x)) = (Nat.card π.ker : ℤ) * ∑ q, w q := by
  simpa only [one_mul, compress_one π hπ, ← Finset.mul_sum] using
    sum_mul_eq_sum_compress π (fun _ : G => (1 : ℤ)) w

/-- The actual block projection has the same kernel multiplicity in every block. -/
theorem sum_comp_blockProjection (π : G →+ Q) (hπ : Function.Surjective π)
    (w : BlockIndex Q → ℤ) :
    (∑ x : BlockIndex G, w (blockProjection π x)) =
      (Nat.card π.ker : ℤ) * ∑ q : BlockIndex Q, w q := by
  simp only [Fintype.sum_prod_type, blockProjection]
  simp_rw [sum_comp_quotient π hπ]
  exact (Finset.mul_sum Finset.univ
    (fun i : Fin 4 => ∑ q : Q, w (i, q)) (Nat.card π.ker : ℤ)).symm

/-- Lifting the columns of an actual border repeats each quotient column
exactly as many times as there are elements in the kernel. -/
theorem columns_lift_gram {I : Type*}
    (π : G →+ Q) (hπ : Function.Surjective π)
    (E : Matrix I (BlockIndex Q) ℤ) :
    E.submatrix id (blockProjection π) *
        (E.submatrix id (blockProjection π))ᵀ =
      (Nat.card π.ker : ℤ) • (E * Eᵀ) := by
  ext i j
  change (∑ x : BlockIndex G,
      E i (blockProjection π x) * E j (blockProjection π x)) =
    (Nat.card π.ker : ℤ) • ∑ q : BlockIndex Q, E i q * E j q
  rw [smul_eq_mul]
  exact sum_comp_blockProjection π hπ (fun q => E i q * E j q)

theorem fixed_border_columns_lift_gram {I : Type*} [DecidableEq I]
    (π : G →+ Q) (hπ : Function.Surjective π)
    (E : Matrix I (BlockIndex Q) ℤ)
    (hEgram : E * Eᵀ = (16 : ℤ) • (1 : Matrix I I ℤ)) :
    E.submatrix id (blockProjection π) *
        (E.submatrix id (blockProjection π))ᵀ =
      (16 * (Nat.card π.ker : ℤ)) • (1 : Matrix I I ℤ) := by
  rw [columns_lift_gram π hπ E, hEgram, smul_smul, mul_comm (Nat.card π.ker : ℤ) 16]

end Fibres

section Rows

variable {G Q : Type*} [AddCommGroup G] [AddCommGroup Q]

/-- Row lifting pulls back the two free Gram indices and leaves its inner sum unchanged. -/
theorem rows_lift_gram {I : Type*} [Fintype I]
    (π : G →+ Q) (F : Matrix (BlockIndex Q) I ℤ) :
    inflateRows (blockProjection π) F * (inflateRows (blockProjection π) F)ᵀ =
      (F * Fᵀ).submatrix (blockProjection π) (blockProjection π) := by
  ext x y
  rfl

theorem blockOnes_pullback_blockProjection (π : G →+ Q) :
    (blockOnes Q).submatrix (blockProjection π) (blockProjection π) = blockOnesG G := rfl

variable [DecidableEq Q]

theorem one_pullback_blockProjection (π : G →+ Q) :
    (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ).submatrix
      (blockProjection π) (blockProjection π) = kernelBlocks π := by
  ext ⟨i, x⟩ ⟨j, y⟩
  change (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) (i, π x) (j, π y) =
    if i = j ∧ π x = π y then 1 else 0
  simp only [Matrix.one_apply, Prod.mk.injEq]

/-- The finite border's Gram correction becomes exactly the core's kernel-block correction. -/
theorem fixed_border_rows_lift_gram {I : Type*} [Fintype I]
    (π : G →+ Q) (F : Matrix (BlockIndex Q) I ℤ)
    (hFgram : F * Fᵀ =
      (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -
        (4 : ℤ) • blockOnes Q) :
    inflateRows (blockProjection π) F * (inflateRows (blockProjection π) F)ᵀ =
      (16 : ℤ) • kernelBlocks π - (4 : ℤ) • blockOnesG G := by
  rw [rows_lift_gram π F, hFgram]
  change (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ).submatrix
      (blockProjection π) (blockProjection π) -
    (4 : ℤ) • (blockOnes Q).submatrix (blockProjection π) (blockProjection π) = _
  rw [one_pullback_blockProjection, blockOnes_pullback_blockProjection]

end Rows

end HadamardBorderConstruction
