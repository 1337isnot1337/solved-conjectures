module

public import Mathlib.LinearAlgebra.ExteriorPower.Basis
public import Mathlib.LinearAlgebra.Matrix.Dual

/-!
# Rectangular determinants and integral Gram matrices

The exterior-power basis gives Cauchy–Binet as a sum over subsets of row
indices. Each minor occurs once. Specializing the two matrices to a matrix
and its transpose expresses its Gram determinant as a sum of squared minors.

These are algebraic identities for actual rectangular matrices. They impose
no certificate, norm, loneliness, or lattice-covolume hypothesis.
-/

@[expose] public section

namespace Loneliness.RectangularGram

open scoped BigOperators

noncomputable section

variable {R : Type*} [CommRing R] {m r : ℕ}

/-- The determinant of the square submatrix on a sorted set of rows. -/
def minor (A : Matrix (Fin m) (Fin r) R)
    (s : Set.powersetCard (Fin m) r) : R :=
  (A.submatrix (Set.powersetCard.ofFinEmbEquiv.symm s) id).det

private def column (A : Matrix (Fin m) (Fin r) R) (j : Fin r) : Fin m → R :=
  fun i => A i j

private def rowForm (A : Matrix (Fin r) (Fin m) R) (j : Fin r) :
    Module.Dual R (Fin m → R) :=
  dotProductEquiv R (Fin m) (A j)

private theorem pairing_columns (A : Matrix (Fin r) (Fin m) R)
    (B : Matrix (Fin m) (Fin r) R) :
    exteriorPower.pairingDual R (Fin m → R) r
      (exteriorPower.ιMulti R r (rowForm A))
      (exteriorPower.ιMulti R r (column B)) = (A * B).det := by
  rw [exteriorPower.pairingDual_ιMulti_ιMulti]
  have hmatrix : Matrix.of (fun i j => rowForm A j (column B i)) =
      (A * B).transpose := by
    rfl
  rw [hmatrix, Matrix.det_transpose]

private theorem exterior_coordinate (B : Matrix (Fin m) (Fin r) R)
    (s : Set.powersetCard (Fin m) r) :
    ((Pi.basisFun R (Fin m)).exteriorPower r).repr
      (exteriorPower.ιMulti R r (column B)) s = minor B s := by
  rw [exteriorPower.basis_repr_apply, exteriorPower.ιMultiDual_apply_ιMulti]
  simp only [Module.Basis.coord_apply, Pi.basisFun_repr]
  change (B.submatrix (Set.powersetCard.ofFinEmbEquiv.symm s) id).transpose.det =
    (B.submatrix (Set.powersetCard.ofFinEmbEquiv.symm s) id).det
  exact Matrix.det_transpose _

private theorem pairing_basis (A : Matrix (Fin r) (Fin m) R)
    (s : Set.powersetCard (Fin m) r) :
    exteriorPower.pairingDual R (Fin m → R) r
      (exteriorPower.ιMulti R r (rowForm A))
      ((Pi.basisFun R (Fin m)).exteriorPower r s) =
        (A.submatrix id (Set.powersetCard.ofFinEmbEquiv.symm s)).det := by
  rw [exteriorPower.basis_apply, exteriorPower.ιMulti_family,
    exteriorPower.pairingDual_ιMulti_ιMulti]
  have hmatrix : Matrix.of (fun i j => rowForm A j
      ((Pi.basisFun R (Fin m)) (Set.powersetCard.ofFinEmbEquiv.symm s i))) =
      (A.submatrix id (Set.powersetCard.ofFinEmbEquiv.symm s)).transpose := by
    ext i j
    simp [rowForm, dotProductEquiv]
  rw [hmatrix, Matrix.det_transpose]

/-- Cauchy–Binet for a rectangular product, with one term for each subset. -/
theorem det_mul_eq_sum_minors (A : Matrix (Fin r) (Fin m) R)
    (B : Matrix (Fin m) (Fin r) R) :
    (A * B).det = ∑ s : Set.powersetCard (Fin m) r,
      (A.submatrix id (Set.powersetCard.ofFinEmbEquiv.symm s)).det * minor B s := by
  classical
  let b := Pi.basisFun R (Fin m)
  let v := exteriorPower.ιMulti R r (column B)
  let f := exteriorPower.pairingDual R (Fin m → R) r
    (exteriorPower.ιMulti R r (rowForm A))
  have hexpand := congrArg f ((b.exteriorPower r).sum_repr v)
  simp only [map_sum, map_smul, smul_eq_mul] at hexpand
  calc
    (A * B).det = f v := (pairing_columns A B).symm
    _ = ∑ s : Set.powersetCard (Fin m) r,
        (b.exteriorPower r).repr v s * f (b.exteriorPower r s) := hexpand.symm
    _ = ∑ s : Set.powersetCard (Fin m) r,
        (A.submatrix id (Set.powersetCard.ofFinEmbEquiv.symm s)).det * minor B s := by
      apply Finset.sum_congr rfl
      intro s _
      change ((Pi.basisFun R (Fin m)).exteriorPower r).repr
          (exteriorPower.ιMulti R r (column B)) s *
          exteriorPower.pairingDual R (Fin m → R) r
            (exteriorPower.ιMulti R r (rowForm A))
            ((Pi.basisFun R (Fin m)).exteriorPower r s) = _
      rw [exterior_coordinate, pairing_basis, mul_comm]

/-- The Gram determinant is the sum of the squares of all maximal minors. -/
theorem gram_det_eq_sum_minors_sq (A : Matrix (Fin m) (Fin r) R) :
    (A.transpose * A).det = ∑ s : Set.powersetCard (Fin m) r, minor A s ^ 2 := by
  rw [det_mul_eq_sum_minors]
  apply Finset.sum_congr rfl
  intro s _
  have htranspose :
      A.transpose.submatrix id (Set.powersetCard.ofFinEmbEquiv.symm s) =
        (A.submatrix (Set.powersetCard.ofFinEmbEquiv.symm s) id).transpose := rfl
  rw [htranspose, Matrix.det_transpose]
  change minor A s * minor A s = minor A s ^ 2
  rw [pow_two]

theorem int_gram_det_nonneg (A : Matrix (Fin m) (Fin r) ℤ) :
    0 ≤ (A.transpose * A).det := by
  rw [gram_det_eq_sum_minors_sq]
  exact Finset.sum_nonneg fun _ _ => sq_nonneg _

/-- Each squared integral minor is bounded by the actual Gram determinant. -/
theorem int_minor_sq_le_gram_det (A : Matrix (Fin m) (Fin r) ℤ)
    (s : Set.powersetCard (Fin m) r) :
    minor A s ^ 2 ≤ (A.transpose * A).det := by
  rw [gram_det_eq_sum_minors_sq]
  exact Finset.single_le_sum (fun _ _ => sq_nonneg _) (Finset.mem_univ s)

end

end Loneliness.RectangularGram
