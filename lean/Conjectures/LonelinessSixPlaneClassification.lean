import Conjectures.LonelinessSixPlaneClassificationCore
import Conjectures.LonelinessSixPlaneFiveInput
import Conjectures.LonelinessFourSpeedGap

/-! The six-plane gap with the four-speed input discharged by its proved
repository theorem. Finite pair coverage and five-speed sporadic exhaustion
remain explicit inputs; the complete data assembly supplies the first. -/

namespace Loneliness.SixPlane

noncomputable section

open CoordinateSubspace

theorem critical_plane_of_checked_exhaustion (hchecked : CandidatePairsChecked)
    (hexhaustion : FiveSpeedCertificate.SporadicExhaustion)
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 11 : ℝ)) :
    CriticalPlane E :=
  critical_plane_of_low_value_of_checked hchecked four_speed_lonelyRunnerBound
    (fiveSpeedGap_of_sporadicExhaustion hexhaustion) E hfree hdim hbelow

theorem noncritical_value_ge_two_elevenths_of_checked_exhaustion
    (hchecked : CandidatePairsChecked) (hexhaustion : FiveSpeedCertificate.SporadicExhaustion)
    (E : Submodule ℚ (Fin 6 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2) (hnot : ¬CriticalPlane E) :
    (2 / 11 : ℝ) ≤ SubspaceDensity.spaceValue (realSpan E) := by
  by_contra hbelow
  exact hnot (critical_plane_of_checked_exhaustion hchecked hexhaustion E hfree hdim
    (lt_of_not_ge hbelow))

end

end Loneliness.SixPlane
