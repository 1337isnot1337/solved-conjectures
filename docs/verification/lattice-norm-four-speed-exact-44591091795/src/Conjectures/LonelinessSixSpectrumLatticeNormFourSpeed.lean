import Conjectures.LonelinessFourSpeedGap
import Conjectures.LonelinessSixSpectrumLatticeNorm

/-!
# Six-spectrum lattice norm bounds using the proved four-speed bound

These adapters discharge the four-speed runner input in the lattice norm
bounds. The containing-plane gap remains an explicit hypothesis.
-/

namespace Loneliness.SixSpectrumLatticeNorm

open RationalLattice

/-- The rank-four lattice bound with the four-speed runner theorem supplied. -/
theorem norm_lt_rank_four_of_plane_gap (E : Submodule ℚ (Fin 6 → ℚ))
    (hdim : Module.finrank ℚ E = 4)
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hdistinct : Function.Injective v)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v)
    (hmem : (fun i => (v i : ℚ)) ∈ E) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      9075 * ZLattice.covolume (integerPoints E) :=
  norm_lt_rank_four E hdim v hpositive hdistinct hprimitive hvalue
    CoordinateSubspace.four_speed_lonelyRunnerBound hplane hmem

/-- The constant 54450 with the four-speed runner theorem supplied. -/
theorem norm_lt_five_constant_of_plane_gap (E : Submodule ℚ (Fin 6 → ℚ))
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      54450 * ZLattice.covolume (integerPoints E) :=
  norm_lt_five_constant E v hpositive hprimitive hvalue
    CoordinateSubspace.four_speed_lonelyRunnerBound hplane

/-- The constant 163350 with the four-speed runner theorem supplied. -/
theorem norm_lt_six_constant_of_plane_gap (E : Submodule ℚ (Fin 6 → ℚ))
    (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hplane : SixSpectrumNormGeometry.ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ <
      163350 * ZLattice.covolume (integerPoints E) :=
  norm_lt_six_constant E v hpositive hprimitive hvalue
    CoordinateSubspace.four_speed_lonelyRunnerBound hplane

end Loneliness.SixSpectrumLatticeNorm
