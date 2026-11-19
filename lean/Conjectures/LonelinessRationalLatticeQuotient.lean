import Conjectures.LonelinessRationalLatticeIndex
import Mathlib.LinearAlgebra.FreeModule.Finite.CardQuotient

/-!
# The actual quotient index of an integer column lattice

The quotient is taken inside the full integer-point lattice of a rational
subspace. Its cardinality is the absolute determinant of the integer column
coordinates, and its square gives the exact Gram/covolume factor.
-/

namespace Loneliness.RationalLatticeQuotient

open scoped BigOperators Matrix
open RationalLattice

noncomputable section

variable {ι : Type*} [Fintype ι] {r : ℕ}

/-- The integer matrix columns as points of the full lattice. -/
def columnPoints (E : Submodule ℚ (ι → ℚ)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E) : Fin r → integerPoints E :=
  fun j => pointOfInteger E (fun i => A i j) (integerVector_mem_space E (hmem j))

/-- The integer column lattice, as an actual submodule of the full lattice. -/
def columnSubmodule (E : Submodule ℚ (ι → ℚ)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E) : Submodule ℤ (integerPoints E) :=
  Submodule.span ℤ (Set.range (columnPoints E A hmem))

/-- Integer coordinates of the columns in an integer basis of the full lattice. -/
def coordinateMatrix (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis (Fin r) ℤ (integerPoints E)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E) : Matrix (Fin r) (Fin r) ℤ :=
  b.toMatrix (columnPoints E A hmem)

theorem basisMatrix_mul_coordinateMatrix (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis (Fin r) ℤ (integerPoints E)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E) :
    basisMatrix E b * coordinateMatrix E b A hmem = A := by
  classical
  ext i j
  change (∑ k, basisMatrix E b i k * b.repr (columnPoints E A hmem j) k) = A i j
  calc
    _ = integerCoordinates (columnPoints E A hmem j) i :=
      congrFun (basisMatrix_mulVec_repr E b (columnPoints E A hmem j)) i
    _ = A i j := congrFun (integerCoordinates_pointOfInteger E (fun i => A i j) _) i

theorem gram_det_eq_coordinate_factor (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis (Fin r) ℤ (integerPoints E)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E) :
    (A.transpose * A).det = (coordinateMatrix E b A hmem).det ^ 2 *
      ((basisMatrix E b).transpose * basisMatrix E b).det := by
  let B := basisMatrix E b
  let C := coordinateMatrix E b A hmem
  have hA : B * C = A := basisMatrix_mul_coordinateMatrix E b A hmem
  have hgram : (B * C).transpose * (B * C) =
      C.transpose * (B.transpose * B) * C := by
    rw [Matrix.transpose_mul]
    simp only [Matrix.mul_assoc]
  change (A.transpose * A).det = C.det ^ 2 * (B.transpose * B).det
  rw [← hA, hgram, Matrix.det_mul, Matrix.det_mul, Matrix.det_transpose]
  ring

private theorem coordinate_det_ne_zero (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis (Fin r) ℤ (integerPoints E)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) : (coordinateMatrix E b A hmem).det ≠ 0 := by
  intro hz
  rw [gram_det_eq_coordinate_factor E b A hmem, hz, zero_pow (by decide), zero_mul] at hdet
  exact (lt_irrefl 0) hdet

/-- The determinant factor is the cardinality of the actual lattice quotient. -/
theorem quotient_card_eq_natAbs_det (E : Submodule ℚ (ι → ℚ))
    (b : Module.Basis (Fin r) ℤ (integerPoints E)) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) :
    Nat.card (integerPoints E ⧸ columnSubmodule E A hmem) =
      (coordinateMatrix E b A hmem).det.natAbs := by
  classical
  have hx : LinearIndependent ℤ (columnPoints E A hmem) := by
    apply LinearIndependent.of_comp b.equivFun.toLinearMap
    change LinearIndependent ℤ (coordinateMatrix E b A hmem).col
    exact Matrix.linearIndependent_cols_of_det_ne_zero
      (coordinate_det_ne_zero E b A hmem hdet)
  let bN : Module.Basis (Fin r) ℤ (columnSubmodule E A hmem) := Module.Basis.span hx
  have hfamily : ((↑) ∘ bN : Fin r → integerPoints E) = columnPoints E A hmem := by
    funext i
    exact Module.Basis.coe_span_apply hx i
  have hindex := Submodule.natAbs_det_basis_change b (columnSubmodule E A hmem) bN
  rw [hfamily] at hindex
  simpa only [Module.Basis.det_apply, coordinateMatrix] using hindex.symm

/-- The full-column-rank quotient is finite and has positive natural cardinality. -/
theorem quotient_card_pos (E : Submodule ℚ (ι → ℚ))
    (hdim : Module.finrank ℚ E = r) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) :
    0 < Nat.card (integerPoints E ⧸ columnSubmodule E A hmem) := by
  let b : Module.Basis (Fin r) ℤ (integerPoints E) :=
    (integerBasis E).reindex (finCongr hdim)
  rw [quotient_card_eq_natAbs_det E b A hmem hdet]
  exact Int.natAbs_pos.mpr (coordinate_det_ne_zero E b A hmem hdet)

/-- The exact Gram/covolume identity with the actual quotient index. -/
theorem gram_det_eq_quotient_card_sq_mul_covolume_sq (E : Submodule ℚ (ι → ℚ))
    (hdim : Module.finrank ℚ E = r) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) :
    (((A.transpose * A).det : ℤ) : ℝ) =
      (Nat.card (integerPoints E ⧸ columnSubmodule E A hmem) : ℝ) ^ 2 *
        ZLattice.covolume (integerPoints E) ^ 2 := by
  classical
  let b : Module.Basis (Fin r) ℤ (integerPoints E) :=
    (integerBasis E).reindex (finCongr hdim)
  rw [quotient_card_eq_natAbs_det E b A hmem hdet,
    covolume_sq_eq_basisMatrix_gram_det E b, Nat.cast_natAbs, Int.cast_abs, sq_abs]
  exact_mod_cast gram_det_eq_coordinate_factor E b A hmem

end

end Loneliness.RationalLatticeQuotient
