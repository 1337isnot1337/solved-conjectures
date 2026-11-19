import Conjectures.LonelinessFiveSpeedLineReduction
import Conjectures.LonelinessMappedPigeonhole

/-! The mapped cutoff uses the exact row bound of each retained map. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem line_twoParameterMap_eq_mulVec (B : Matrix (Fin 5) (Fin 2) ℤ) (w : Fin 2 → ℤ) :
    Pigeonhole.twoParameterMap B w = B *ᵥ w := by
  ext i
  simp [Pigeonhole.twoParameterMap, Matrix.mulVec, dotProduct, Fin.sum_univ_two]

theorem line_representation_parameter_bound (hgap : CoordinateSubspace.FourSpeedGap)
    (v : FiveIntegerVector) (m : Fin 164) (w : Fin 2 → ℤ)
    (hrepresentation : LineRepresentation v m w)
    (hbelow : value (integerSpeeds v) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds v)) :
    ∀ j, (w j).natAbs ≤ 23 * boundedMapL m := by
  apply Pigeonhole.two_parameter_family_cutoff_of_pure_axes hgap (boundedMaps m)
    (boundedMap_axis_rows m) (boundedMapL m) (boundedMapL_pos m)
    (boundedMap_row_bound m) w (Pigeonhole.primitive_pair_of_gcd w hrepresentation.primitive)
  · simpa only [line_twoParameterMap_eq_mulVec] using hrepresentation.nonzero
  · simpa only [line_twoParameterMap_eq_mulVec, hrepresentation.value_eq] using hbelow
  · rw [line_twoParameterMap_eq_mulVec]
    exact fun hc => hnot (hrepresentation.critical_iff.mp hc)

theorem line_representation_parameter_bound_391 (hgap : CoordinateSubspace.FourSpeedGap)
    (v : FiveIntegerVector) (m : Fin 164) (w : Fin 2 → ℤ)
    (hrepresentation : LineRepresentation v m w)
    (hbelow : value (integerSpeeds v) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds v)) :
    ∀ j, (w j).natAbs ≤ 391 := by
  intro j
  exact (line_representation_parameter_bound hgap v m w hrepresentation hbelow hnot j).trans
    (by simpa using Nat.mul_le_mul_left 23 (boundedMapL_le_seventeen m))

theorem parameter_form_to_bounded_parameters (hgap : CoordinateSubspace.FourSpeedGap)
    (k : Fin 9) (h : ThreeIntegerVector) (hmem : h ∈ planeParameterForms k)
    (u : ThreeIntegerVector) (hrelation : h ⬝ᵥ u = 0)
    (hnonzero : ∀ i, (canonicalMaps k *ᵥ u) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((canonicalMaps k *ᵥ u) i).natAbs))
    (hbelow : value (integerSpeeds (canonicalMaps k *ᵥ u)) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (canonicalMaps k *ᵥ u))) :
    ∃ m : Fin 164, ∃ w : Fin 2 → ℤ,
      LineRepresentation (canonicalMaps k *ᵥ u) m w ∧
      ∀ j, (w j).natAbs ≤ 23 * boundedMapL m := by
  obtain ⟨m, w, hrepresentation⟩ :=
    parameter_form_to_bounded_map k h hmem u hrelation hnonzero hdistinct hnot
  exact ⟨m, w, hrepresentation,
    line_representation_parameter_bound hgap _ m w hrepresentation hbelow hnot⟩

end Loneliness.FiveSpeedCertificate
