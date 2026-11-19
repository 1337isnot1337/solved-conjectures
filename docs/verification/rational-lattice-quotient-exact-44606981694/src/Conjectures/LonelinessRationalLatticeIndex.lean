import Conjectures.LonelinessRationalLatticeCore
import Conjectures.LonelinessRectangularLattice

/-!
# Comparing a full integer-point lattice with an integer column lattice

Integer columns lying in a rational subspace have integer coordinates in
an integer basis of the full lattice. Their Gram determinant is the full
lattice Gram determinant times the square of an integer determinant.
When the columns are independent and their number is the dimension, that
integer determinant is nonzero. This proves the stated covolume inequality
without assuming an index or saturation formula.
-/

namespace Loneliness.RationalLatticeIndex

open scoped BigOperators Matrix
open RationalLattice

noncomputable section

variable {ι : Type*} [Fintype ι] {r : ℕ}

/-- Integer coordinates of full-rank columns give an exact square factor
between their Gram determinant and the squared covolume of the full lattice. -/
theorem exists_integer_gram_factor (E : Submodule ℚ (ι → ℚ))
    (hdim : Module.finrank ℚ E = r) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) :
    ∃ d : ℤ, d ≠ 0 ∧
      (((A.transpose * A).det : ℤ) : ℝ) =
        (d : ℝ) ^ 2 * ZLattice.covolume (integerPoints E) ^ 2 := by
  classical
  let b : Module.Basis (Fin r) ℤ (integerPoints E) :=
    (integerBasis E).reindex (finCongr hdim)
  let x : Fin r → integerPoints E := fun j =>
    pointOfInteger E (fun i => A i j) (integerVector_mem_space E (hmem j))
  let B : Matrix ι (Fin r) ℤ := basisMatrix E b
  let C : Matrix (Fin r) (Fin r) ℤ := fun i j => b.repr (x j) i
  have hfactor : B * C = A := by
    ext i j
    change (∑ k, basisMatrix E b i k * b.repr (x j) k) = A i j
    calc
      (∑ k, basisMatrix E b i k * b.repr (x j) k) =
          integerCoordinates (x j) i := congrFun (basisMatrix_mulVec_repr E b (x j)) i
      _ = A i j := congrFun (integerCoordinates_pointOfInteger E (fun i => A i j) _) i
  have hgram : (B * C).transpose * (B * C) =
      C.transpose * (B.transpose * B) * C := by
    rw [Matrix.transpose_mul]
    simp only [Matrix.mul_assoc]
  have hdet_factor : (A.transpose * A).det = C.det ^ 2 * (B.transpose * B).det := by
    rw [← hfactor, hgram, Matrix.det_mul, Matrix.det_mul, Matrix.det_transpose]
    ring
  have hC : C.det ≠ 0 := by
    intro hzero
    rw [hdet_factor, hzero, zero_pow (by decide), zero_mul] at hdet
    exact (lt_irrefl 0) hdet
  refine ⟨C.det, hC, ?_⟩
  rw [covolume_sq_eq_basisMatrix_gram_det E b]
  exact_mod_cast hdet_factor

set_option maxHeartbeats 1000000 in
/-- The full integer-point lattice has no larger squared covolume than
any full-rank integer column lattice in the same rational subspace. -/
theorem covolume_sq_le_gram_det (E : Submodule ℚ (ι → ℚ))
    (hdim : Module.finrank ℚ E = r) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hdet : 0 < (A.transpose * A).det) :
    ZLattice.covolume (integerPoints E) ^ 2 ≤
      (((A.transpose * A).det : ℤ) : ℝ) := by
  obtain ⟨d, hd, hfactor⟩ := exists_integer_gram_factor E hdim A hmem hdet
  have hsq : (1 : ℤ) ≤ d ^ 2 := by
    have hp : (0 : ℤ) < d ^ 2 := sq_pos_of_ne_zero hd
    omega
  have hsqR : (1 : ℝ) ≤ (d : ℝ) ^ 2 := by exact_mod_cast hsq
  calc
    ZLattice.covolume (integerPoints E) ^ 2 =
        1 * ZLattice.covolume (integerPoints E) ^ 2 := (one_mul _).symm
    _ ≤ (d : ℝ) ^ 2 * ZLattice.covolume (integerPoints E) ^ 2 :=
      mul_le_mul_of_nonneg_right hsqR (sq_nonneg _)
    _ = (((A.transpose * A).det : ℤ) : ℝ) := hfactor.symm

/-- The full-column-basis version uses actual real linear independence,
rather than a Gram determinant hypothesis. -/
theorem covolume_sq_le_gram_det_of_independent (E : Submodule ℚ (ι → ℚ))
    (hdim : Module.finrank ℚ E = r) (A : Matrix ι (Fin r) ℤ)
    (hmem : ∀ j, (fun i => (A i j : ℚ)) ∈ E)
    (hind : LinearIndependent ℝ (RectangularLattice.columns A)) :
    ZLattice.covolume (integerPoints E) ^ 2 ≤
      (((A.transpose * A).det : ℤ) : ℝ) := by
  apply covolume_sq_le_gram_det E hdim A hmem
  have hp : (0 : ℝ) < ((A.transpose * A).det : ℝ) := by
    rw [RectangularLattice.gram_det_cast]
    exact (Matrix.posDef_gram_of_linearIndependent hind).det_pos
  exact_mod_cast hp

end

end Loneliness.RationalLatticeIndex
