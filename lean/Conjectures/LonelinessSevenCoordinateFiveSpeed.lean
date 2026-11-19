import Conjectures.LonelinessSevenCoordinateClassification
import Conjectures.LonelinessSevenCoordinateLargeNormFamily
import Conjectures.LonelinessFiveSpeedBound

/-!
# Critical-seven consequences with the proved five-speed bound

These statements supply Renault's formalized five-speed bound to the
existing seven-coordinate theorems. The primitive six-speed classification
remains an explicit hypothesis.
-/

namespace Loneliness.SevenCoordinateCritical

open CoordinateSubspace SubspaceDensity

/-- The critical-plane classification with only the six-speed input remaining. -/
theorem critical_plane_classification_of_six_classification
    (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hlow : spaceValue (realSpan E) ≤ (1 / 7 : ℝ)) : StandardProductPlane E :=
  critical_plane_classification Renault.five_speed_lonelyRunnerBound hsix E hfree hdim hlow

/-- The equality case with the five-speed bound supplied internally. -/
theorem critical_plane_classification_of_value_eq_of_six_classification
    (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hdim : Module.finrank ℚ E = 2)
    (hvalue : spaceValue (realSpan E) = (1 / 7 : ℝ)) : StandardProductPlane E :=
  critical_plane_classification_of_value_eq Renault.five_speed_lonelyRunnerBound
    hsix E hdim hvalue

/-- The critical-plane equivalence with only the six-speed input remaining. -/
theorem critical_plane_iff_of_six_classification
    (hsix : PrimitiveSixClassification)
    (E : Submodule ℚ (Fin 7 → ℚ)) (hdim : Module.finrank ℚ E = 2) :
    spaceValue (realSpan E) = (1 / 7 : ℝ) ↔ StandardProductPlane E :=
  critical_plane_iff Renault.five_speed_lonelyRunnerBound hsix E hdim

namespace Quantitative

/-- The literal large-norm family with the proved five-speed theorem supplied. -/
theorem large_norm_family_classification_of_six_classification
    (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1 / 7 : ℝ))
    (hnorm : (7 * 42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,2,3,4,5,6,7*s] ∧
      value (List.ofFn v) = (s : ℝ) / (7 * (s : ℝ) + 1) :=
  large_norm_family_classification Renault.five_speed_lonelyRunnerBound
    hsix v hpositive hprimitive hbelow hnorm

/-- The large-norm family equivalence with only the six-speed input remaining. -/
theorem large_norm_family_iff_of_six_classification
    (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hnorm : (7 * 42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    value (List.ofFn v) < (1 / 7 : ℝ) ↔
      ∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,2,3,4,5,6,7*s] :=
  large_norm_family_iff Renault.five_speed_lonelyRunnerBound
    hsix v hpositive hprimitive hnorm

/-- The resulting large-norm spectrum with the five-speed bound supplied. -/
theorem large_norm_spectrum_of_six_classification
    (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1 / 7 : ℝ))
    (hnorm : (7 * 42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ s : ℕ, 1 ≤ s ∧ value (List.ofFn v) = (s : ℝ) / (7 * (s : ℝ) + 1) :=
  large_norm_spectrum Renault.five_speed_lonelyRunnerBound
    hsix v hpositive hprimitive hbelow hnorm

end Quantitative

end Loneliness.SevenCoordinateCritical
