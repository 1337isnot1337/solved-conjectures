import Conjectures.LonelinessRationalLatticeCore
import Conjectures.LonelinessRectangularGramLowerBound

/-!
# The rank-four covolume lower bound in six coordinates

The full integer-point lattice is constructed in `LonelinessRationalLatticeCore`.
A single contained integer vector with nonzero coordinates distinct up to sign
forces its basis rows to be nonzero and distinct up to sign. The actual integer
Gram determinant bound therefore gives squared covolume at least six.
-/

namespace Loneliness.RationalLattice

noncomputable section

/-- The four-dimensional lower bound applies to the full integer-point lattice
of any rational subspace containing one sign-distinct, nonzero-coordinate vector. -/
theorem six_le_covolume_sq (E : Submodule ℚ (Fin 6 → ℚ))
    (hdim : Module.finrank ℚ E = 4) (v : Fin 6 → ℤ)
    (hv : (fun i => (v i : ℚ)) ∈ E)
    (hnonzero : ∀ i, v i ≠ 0)
    (hseparate : ∀ i j, i ≠ j → v i ≠ v j ∧ v i ≠ -v j) :
    6 ≤ ZLattice.covolume (integerPoints E) ^ 2 := by
  classical
  let b : Module.Basis (Fin 4) ℤ (integerPoints E) :=
    (integerBasis E).reindex (finCongr hdim)
  let x : integerPoints E := pointOfInteger E v (integerVector_mem_space E hv)
  have hx : integerCoordinates x = v := integerCoordinates_pointOfInteger E v _
  have hrows := basisMatrix_rows_nonzero E b x (by simpa only [hx] using hnonzero)
  have hsigns := basisMatrix_rows_separate E b x (by simpa only [hx] using hseparate)
  have h := RectangularGramLowerBound.gram_det_ge_six (basisMatrix E b)
    hrows hsigns (basisMatrix_gram_det_pos E b)
  rw [covolume_sq_eq_basisMatrix_gram_det E b]
  exact_mod_cast h

end

end Loneliness.RationalLattice
