import Conjectures.LonelinessRationalLattice
import Conjectures.LonelinessSixSpectrumNormGeometry

/-!
# Six-spectrum norm bounds relative to the full integer-point lattice

The existing primitive-vector cutoff is combined with the covolume of the
actual integer-point lattice of a rational subspace. In rank four, nonzero
pairwise distinct positive coordinates give the Gram determinant lower bound
six. In every dimension, integrality gives the lower bound one.

The four-speed runner bound and containing-plane gap remain explicit inputs.
No final spectrum classification or unconditional plane-gap result is claimed.
-/

namespace Loneliness.SixSpectrumLatticeNorm

open RationalLattice

noncomputable section

private theorem scale_four (D : ℝ) (hD : 0 ≤ D) (hsq : 6 ≤ D ^ 2) :
    (21829 : ℝ) < 9075 * D := by
  have hs : (21829 : ℝ) ^ 2 < (9075 * D) ^ 2 := by nlinarith
  nlinarith

private theorem scale_one (D : ℝ) (hD : 0 ≤ D) (hsq : 1 ≤ D ^ 2) :
    (21829 : ℝ) < 54450 * D := by
  have h : 1 ≤ D := by nlinarith
  nlinarith

/-- The rank-four bound uses the covolume of the full intersection with the
integer lattice, with no matrix-parameterization premise. -/
theorem norm_lt_rank_four (E : Submodule ℚ (Fin 6 → ℚ))
    (hdim : Module.finrank ℚ E = 4)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hdistinct : Function.Injective v)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4)
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v)
    (hmem : (fun i => (v i : ℚ)) ∈ E) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      9075 * ZLattice.covolume (integerPoints E) := by
  have hnonzero : ∀ i, (v i : ℤ) ≠ 0 := by
    intro i
    exact_mod_cast (hpositive i).ne'
  have hseparate : ∀ i j, i ≠ j →
      (v i : ℤ) ≠ (v j : ℤ) ∧ (v i : ℤ) ≠ -(v j : ℤ) := by
    intro i j hij
    constructor
    · exact_mod_cast (fun h => hij (hdistinct h))
    · have hi : (0 : ℤ) < (v i : ℤ) := by exact_mod_cast hpositive i
      have hj : (0 : ℤ) < (v j : ℤ) := by exact_mod_cast hpositive j
      omega
  have hs := six_le_covolume_sq E hdim (fun i => (v i : ℤ))
    (by simpa only [Int.cast_natCast] using hmem) hnonzero hseparate
  exact (SixSpectrumNormGeometry.norm_lt v hpositive hprimitive hvalue hfour hplane).trans
    (scale_four _ (ZLattice.covolume_pos (integerPoints E)).le hs)

/-- The sharper ambient cutoff gives the rank-five constant for every
rational subspace, because its full integer-point lattice has covolume at least one. -/
theorem norm_lt_five_constant (E : Submodule ℚ (Fin 6 → ℚ))
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4)
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      54450 * ZLattice.covolume (integerPoints E) :=
  (SixSpectrumNormGeometry.norm_lt v hpositive hprimitive hvalue hfour hplane).trans
    (scale_one _ (ZLattice.covolume_pos (integerPoints E)).le (one_le_covolume_sq E))

/-- The original ambient constant also follows for the actual lattice. -/
theorem norm_lt_six_constant (E : Submodule ℚ (Fin 6 → ℚ))
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4)
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      163350 * ZLattice.covolume (integerPoints E) := by
  have h := norm_lt_five_constant E v hpositive hprimitive hvalue hfour hplane
  have hc := ZLattice.covolume_pos (integerPoints E)
  nlinarith

end

end Loneliness.SixSpectrumLatticeNorm
