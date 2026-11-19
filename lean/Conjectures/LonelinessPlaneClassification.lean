import Conjectures.LonelinessPlaneCertificate
import Conjectures.LonelinessPlaneClassificationCore

/-! Classification of low-value coordinate-free rational planes in five
coordinates. The only external mathematical hypothesis is `FourSpeedGap`.
The finite plane classification itself is fully kernel checked. -/

namespace Loneliness.PlaneCertificate

noncomputable section

open CoordinateSubspace

theorem critical_product_of_low_value (hgap : FourSpeedGap)
    (E : Submodule ℚ (Fin 5 → ℚ)) (hfree : CoordinateFree E)
    (hdim : Module.finrank ℚ E = 2)
    (hbelow : SubspaceDensity.spaceValue (realSpan E) < (2 / 9 : ℝ)) :
    CriticalProductPlane E :=
  critical_product_of_low_value_of_checked all_candidates_checked hgap E hfree hdim hbelow

end

end Loneliness.PlaneCertificate
